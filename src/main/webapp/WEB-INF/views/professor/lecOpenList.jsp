<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.lecOpenProBox{
	display: flex;

}

</style>
<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>교과목 등록 신청</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lol/lecOpenList">교과목 등록 신청</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

<div class="row justify-content-center">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">강의개설신청</h5>
					<div class="table-responsive" id="lecOpenProBox">
						<table border="1" class="table" style="text-align: center;" >
							<tr>
								<td>교번</td>
								<td><input type="text" class="form-control input-default" style="border:none;" id="pmem_no" readonly="readonly"></td>
								<td>성명</td>
								<td><input type="text" class="form-control input-default" style="border:none;" id="mem_name"  readonly="readonly"></td>
								<td>소속</td>
								<td><input type="text" class="form-control input-default" style="border:none;" id="prof_major"  readonly="readonly"></td>
							</tr>
						</table>
					</div>
			</div>
			</div>

			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h5 class="font-weight-bold mb-4">개설 신청 목록</h5>
						<button type="button" class="btn mb-1 btn-primary custom-btn-p" id="registerLecPopup">개설
							신청서 작성</button>
					</div>
					<div class="table-responsive text-center">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>년도/학기</th>
									<th>대상 학년</th>
									<th>개설코드</th>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>신청일시</th>
									<th>승인여부</th>
									<th>반려사유</th>
								</tr>
							</thead>
							<tbody id="lecOpenAppyList">

								<!-- 여기에 Ajax로 리스트 뽑을 것 -->

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

</div>

<script>
window.onload=function(){
	
	getProfessorInfo();
	
	getList(); 
	
	var registerLecPopup = $("#registerLecPopup");
	
	registerLecPopup.on("click",function(){
		var url = "/lol/lectureOpenRegister/insert/none";
        var name = "popup test";
        var option = "width = 820, height = 700, top = 100, left = 200, location = no"
        window.open(url, name, option);
	})
	
	

	
	
// $(document).on('click', '.lecOpenDelete', function(e){
//     e.preventDefault();  
//     console.log("찍어볼게용",$(this).closest("tr")[0]);
//     var lolCode = $(this).parents("tr").children('td:eq(2)').text();
//     console.log("클릭버튼 lolCode : ", lolCode);
	
//     var header = $("meta[name='_csrf_header']").attr('content');
// 	var token = $("meta[name='_csrf']").attr('content');
   
// 	var data = {
// 			lol_code : lolCode
// 	}
	
// 	$.ajax({
// 		method: "POST",
// 		url: "/lol/deleteLectureOpen",
// 		data : JSON.stringify(data),  
// 		contentType:"application/json;charset=utf-8",
// 		dataType:"text",
// 		beforeSend : function(xhr){
// 		        xhr.setRequestHeader(header, token);
// 		   },
// 		success: function(result){
// 			if(result == "OK"){          
// 			console.log("삭제 성공! : ", result);
// 			getList();
// 			}
// 		},
// 		error: function(){
// 			console.log("삭제 실패");
// 		}


// 	})
    	

// })

}

	
//리스트 문자열 맹글어주는 템플릿
 const lolTemplate = lolList => {
		let code = "";
		if(lolList.length == 0 ){
			code = "<tr><td colspan='9'>개설 신청 목록이 존재하지 않습니다.<td></tr>";
		}else{
			for(var i = 0; i < lolList.length; i++){				
			  code +=`
				  <tr>
				  <td>\${lolList[i].lol_year}/\${lolList[i].lol_semester}학기</td>
				  <td>\${lolList[i].lol_schyear}</td>
				  <td>\${lolList[i].lol_code}</td>
				  <td>\${lolList[i].lol_name}</td>
				  <td>\${lolList[i].major_cultural}/\${lolList[i].choice_require}</td>
				  <td>\${lolList[i].lol_credit}</td>
				  <td>\${lolList[i].lol_date.substring(0,10) }</td>
			  `;
			  if(lolList[i].lol_state == 0 && lolList[i].lol_reject == null){
					code += `<td id="lolstate"><span class="badge badge-dark px-2">대기</span></td>`;
					code += `<td><button type="button" class="lecOpenDelete btn mb-1 btn-outline-dark btn-sm" onclick="lolMod(this)">수정</button>`;
					code += `<button type="button" class="lecOpenDelete btn mb-1 btn-outline-dark btn-sm" onclick="lolDel(this)">삭제</button></td>`;
			  }else if(lolList[i].lol_state == 1 && lolList[i].lol_reject == null){
					code += `<td><span class="badge badge-success px-2">승인</span></td>`;
					code += `<td></td>`;
			  }else{
					code += `<td><span class="badge badge-danger px-2">반려</span></td>`;
					code += `<td>\${lolList[i].lol_reject}</td>`;
			  }
			  code += `<tr>`;
			}
		}
// 		console.log("디버깅:",code);
		return code;		  
 }
 
//리스트 뿌리는 함수 (내부 비동기 AJAX 사용)
 function getList(){
	 
	$.ajax({   // 리스트 가져오기
			method:"get",
			url: "/lol/lecOpenSelectList",
			dataType:"json",
			success: function(rslt){
				console.log("성공? :  ", rslt)					
					$("#lecOpenAppyList").html(lolTemplate(rslt));				
			},
			error : function(request,status,error){
				console.log('실패 ')
			}
		})
}


 
 function lolDel(pthis){
    
    console.log("찍어볼게용",$(pthis).closest("tr")[0]);
    console.log("찍어볼게용",$(pthis).closest("tr").children());
 	var lolCode = $(pthis).closest("tr").children('td:eq(2)').text();
 	console.log("클릭버튼 lolCode11 : ", lolCode);

 	var header = '${_csrf.headerName}';
 	var token =  '${_csrf.token}';

 	var data = {
 			lol_code : lolCode
 	}

 	$.ajax({
 		method: "POST",
 		url: "/lol/deleteLectureOpen",
 		data : JSON.stringify(data),  
 		contentType:"application/json;charset=utf-8",
 		dataType:"text",
 		beforeSend : function(xhr){
 		        xhr.setRequestHeader(header, token);
 		   },
 		success: function(result){
 			if(result == "OK"){          
	 			console.log("삭제 성공! : ", result);
	 			getList();
// 	 			alert("삭제가 완료 되었습니다.");
	 			swal({
	 				  title: "삭제가 완료되었습니다.",
	 				  icon: "success",
	 			});
	 			
 			}
 		},
 		error: function(){
 			console.log("삭제 실패");
 		}


 	});		// ajax 끝
 	   
 }		// lolDel 끝
 
 function lolMod(lthis){

	 	var lolCode = $(lthis).closest("tr").children('td:eq(2)').text();
		
	   var url = "/lol/lectureOpenRegister/update/" + lolCode;
       var name = "popup test";
       var option = "width = 820, height = 700, top = 100, left = 200, location = no"
       window.open(url, name, option);
	 
	 
 }		// lolMod 끝

 function getProfessorInfo(){
	 
	 $.ajax({
		 method: "GET",
		 url: "/lol/getProfessorMyInfo",
		 dataType: "json",
		 success: function(result){       
	 		console.log("가져오기 성공! : ", result);
	 		proInfoView(result);
	 	},
	 	error: function(){
	 		console.log("가져오기 실패");
	 	}
	 })
 }
 
const proInfoView = (data) =>{
	let profMajor = `\${data.COL_NAME} \${data.DEP_NAME}`;
	
 	$("#pmem_no").val(data.PMEM_NO);
	$("#mem_name").val(data.MEM_NAME);
	$("#prof_major").val(profMajor);
	
}
</script>