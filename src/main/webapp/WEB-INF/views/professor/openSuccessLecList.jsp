<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	// 시큐리티용 토큰
	let header = '${_csrf.headerName}';
	 let token =  '${_csrf.token}';
</script>

<style>
.mjUl ul li{
 list-style-type : disc;
 line-height : 200%;
}

/* .lecListTableBorder{ */
/* 	border : 1px solid #eeeeee; */
/* 	padding: 20px; */
	
/*  	background-clip: padding-box; 원하는 영역에만 컬러 지정 가능*/  
	
/* } */


</style>

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>내 강좌 등록</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lol/openSuccessLecList">내 강좌 등록</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>



<!-- 승인완료된 신청 목록 중에서 강의 개설하기 -->


	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-body">
					 <div class="card-title">
                                    <h5 class="font-weight-bold mb-4">미개설 강좌 목록</h5>
                                </div>
                                <div class="lecListTableBorder flex-fill"> <!-- 여기 안에 패딩주고 컬러줄 것 -->
                                
                                <div class="table-responsive text-center" style="height:250px; overflow:auto">
                                    <table class="table table-hover">
                                        <thead class="custom-theader"  style="background-color:#EBEBEB;">
                                            <tr>
                                                <th>번호</th>
                                                <th>전공</th>			<!-- 교수 전공 -->
                                                <th>과목번호</th>
                                                <th>교과목명</th>
                                                <th>이수구분</th>
                                                <th>강의개설</th>
                                            </tr>
                                        </thead>
                               
                                        <tbody id="lecSuccessRegisterList">
                                            <!-- 리스트 뽑기. 교수 전공 가져와야함.. -->
                                            
                                        </tbody>
                                    </table>
                                </div>
                                </div>
					
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<div class="card-body">
					 <div class="card-title">
                                    <h5 class="font-weight-bold mb-4">개설 강좌 목록</h5>
                                </div>
                                 <div class="lecListTableBorder flex-fill"> <!-- 여기 안에 패딩주고 컬러줄 것 -->
                                 
                                <div class="table-responsive text-center" style="height:250px; overflow:auto">
                                    <table class="table table-hover">
                                        <thead class="custom-theader"  style="background-color:#EBEBEB;">
                                            <tr>
                                                <th>번호</th>
                                                <th>전공</th>
                                                <th>강의번호</th>
                                                <th>교과목명</th>
                                                <th>이수구분</th>
                                                <th>강의개설</th>
                                            </tr>
                                        </thead>
                                        <tbody id="lecSuccessMyOpenList">

                                        </tbody>
                                    </table>
                                </div>
                                
                                 </div>
                                 
					
				</div>
			</div>
		</div>

		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h5 class="font-weight-bold">유의사항</h5>
						<hr>
					</div>
					<div style="border: 1">
						<div class="mjUl pl-4 pr-4 pt-0">
						<ul>
							<li>교수 1인당 한 학기 4과목에 한해 개설 가능</li>
							<li>교과과정(승인 교과목)에 등록되어있는 강좌만 개설 가능</li>
							<li>강의개설 완료 후 개설 여부 / 강의 세부 정보 (이수구분/학점 등) 필수 확인</li>
							<li>수강 신청 후 강의별 최소 설강인원 기준을 충족한 강의만 운영 가능, 미충족시 폐강</li>
							<li>학기 시작 후 강의 정보 변경 불가</li>
							<li>학생 수강신청 기간 완료 후, 개설한 강좌의 폐강 여부 / 수강생 목록 필수 확인</li>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


<script>

window.onload = function() {
	getlolList();
}

function getlolList(){
	
	$.ajax({
		  
        method : "GET",
        url: "/lol/selectMySuccessLecuture",
        dataType : "json",
        success: function(result){
           console.log("승인 리스트 성공!");
           console.log("결과확인:",result);
           
//            for(let i = 0; i< result.length; i++){
//         	   console.log(result[i].LOL_CODE, result[i].DEP_NAME, result[i].LOL_NAME)
//            }

            $("#lecSuccessRegisterList").html(lecTemplate(result));
            $("#lecSuccessMyOpenList").html(lecMyOpenTemplate(result));
        },error: function(){
           console.log("실패");
        }
        
    })
}

//개강상태가 0인걸 가져와야해
const lecTemplate = function(lolList){
    let code = "";
    
	let cnt = 1;

    if(lolList.length == 0){
        code = "<tr><td colspan='5'>승인완료 목록이 없습니다.</td><tr>"
    }else{
	    for(let i = 0; i< lolList.length; i++){
	    	if(lolList[i].LEC_STATE == 0){
	        	code += `
	        			<tr>
	        				<th>\${cnt}</th> //수정해야함
	        				<td>\${lolList[i].DEP_NAME}</td>
	        				<td>\${lolList[i].LOL_CODE}</td>
	        				<td>\${lolList[i].LOL_NAME}</td>
	        				<td>\${lolList[i].MAJOR_CULTURAL}/\${lolList[i].CHOICE_REQUIRE}</td>
	        				<td><button type="button" class="btn mb-1 btn-primary btn-sm custom-btn-p" onclick="lecUpdate('\${lolList[i].LEC_CODE}')">개설</button></td>
	        			</tr>`  
	    		cnt++;
	    	}
        }
    	
    }
      
    return code;  
}

// 개강 상태가 1인걸 가져와야해
const lecMyOpenTemplate = lolList => {
	console.log("일단 찍히는지 확인")
	let code = "";
	
	let cnt = 1;
	    if(lolList.length == 0){
	        code = "<tr><td colspan='5'>승인완료 목록이 없습니다.</td><tr>";
	    }else{
		    for(let i = 0; i< lolList.length; i++){
		    	if(lolList[i].LEC_STATE == 1){
		    		code += `
	        			<tr">
	        				<th>\${cnt}</th> 
	        				<td>\${lolList[i].DEP_NAME}</td>
	        				<td>\${lolList[i].LEC_CODE}</td>
	        				<td>\${lolList[i].LOL_NAME}</td>
	        				<td>\${lolList[i].MAJOR_CULTURAL}/\${lolList[i].CHOICE_REQUIRE}</td>
	        				<td><button type="button" class="btn mb-1 btn-dark btn-sm" onclick="lecUpdateZero('\${lolList[i].LEC_CODE}')">취소</button></td>
	        			</tr>
	        			`;
	        	 cnt++;
		    	}
		    }

	    }
	    
	    return code;

}

function lecUpdate(lecCode){
	console.log(lecCode);

	let data = {
		lec_code : lecCode
	}
	
	$.ajax({
		method : "post",
		url : "/lol/professorlecUpdate",
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		dataType : "text",
		beforeSend : function(xhr){
 		        xhr.setRequestHeader(header, token);
 		   },
		success : function(result){
			console.log("성공!", result);
// 			alert("강좌 개설 완료");
			swal({
			  title: "강좌가 개설되었습니다.",
			  icon: "success",
			});
			getlolList();
		}, error : function(){
			console.log("실패!");
		}
		
	})
	
	
}

function lecUpdateZero(lecCode){
	console.log(lecCode);
	
	let data = {
			lec_code : lecCode
	}
	
	$.ajax({
		method : "post",
		url : "/lol/professorlecUpdateZero",
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		dataType : "text",
		beforeSend : function(xhr){
 		        xhr.setRequestHeader(header, token);
 		   },
		success : function(result){
			console.log("성공!", result);
// 			alert("개설 취소되었습니다.");
			swal({
			  title: "개설 취소되었습니다.",
			  icon: "success",
			});
			getlolList();
		}, error : function(){
			console.log("실패!");
		}
		
	})
	
}

</script>