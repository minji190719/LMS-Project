<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div id="firstLoadPage" ></div>
<script type="text/javascript">
	window.onload = function() {
		loadPage();
		
		window.detailToggle = false;
		
		const icon_menu = document.querySelector(".icon-menu");
		
		icon_menu.addEventListener("click", function(){
			
			if(detailToggle){
				detailToggle = false;
				console.log("addEventListener 안 if문 현재 detailToggle값 : ", detailToggle);
			}
			
			if(!detailToggle){
				detailToggle = true;
				console.log("addEventListener 현재 detailToggle값 : ", detailToggle);
				detailClose();
			}
			
		})
		
	}
	
function autoValue(btn){
	document.getElementById("rejectContent").value = "반려 사유"
}
	
function drawHTML(res){
	let str = ``;
	
	str += `
			<div class="row">
			<div class="col-lg-6">
				<h4 class="card-title custom-m mt-3 custom-bold">
					<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;자격증 신청 관리<br />
				</h4>
			</div>
			<div class="col-lg-6">
				<div class="row page-titles" style="background: none !important;">
					<div class="col p-md-0">
						<ol class="breadcrumb custom-bold">
							<li class="breadcrumb-item"><a href="/main/home"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="breadcrumb-item active"><a
								href="/manager/licenseEnroll">자격증 신청 관리</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
		   <div class="col-lg-12" id="width">
		      <div class="card">
		         <div class="card-body">
		             <div class="table-responsive custom-table1">
		                 <table class="table table-hover" style="cursor:pointer;" id="tableTest">
		                     <thead class="custom-theader-m">
		                         <tr style="text-align: center;">
		                             <th width="5%;">No.</th>
		                             <th width="12%;">학번</th>
		                             <th width="15%;">자격증이름</th>
		                             <th width="18%;">발급기관</th>
		                             <th width="15%;">취득일</th>
		                             <th width="15%;">발급번호</th>
		                             <th width="5%;">상태</th>
		                             <th width="15%;">종류</th>
		                         </tr>
		                     </thead>
		                     <tbody style="height: 670px;">`;
		                         
		                         for (let i = 0; i < res.length; i++) {
									str += `<tr style="text-align: center;" onclick="detail(\${res[i].licen_code},this)">
					                             <td width="6%;">\${i+1}</td>
					                             <td width="13%;">\${res[i].smem_no}</td>
					                             <td width="16%;">\${res[i].licen_name}</td>
					                             <td width="19%;">\${res[i].licen_company}</td>
					                             <td width="16%;">&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].licen_date}</td>
					                             <td width="16%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].licen_num}</td>`;
					                             
					                if(res[i].enroll_state == 0){
					                	str += `<td width="6%;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-dark">대기</sapn></td>`;
					                }else if(res[i].enroll_state == 1){
					                	str += `<td width="6%;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-success">승인</sapn></td>`;
					                }else{
					                	str += `<td width="6%;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-danger">반려</sapn></td>`;
					                }          
					                             
					                str += `	<td width="16%;">&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].licen_kind}</td> 
					                         </tr>`; 
								 }
		                         
	str += `
		                     
		                     
		                     </tbody>
		                 </table>
		             </div>
		         </div>
		      </div>
		   </div>
		   <div id="detailPage"></div>`;
		   
		return str;
}

function detailClose(){
	
// 	alert("aaaa");
	const detailPage = document.querySelector("#detailPage");
	const length = document.querySelector("#width");
	
	$(detailPage).empty();
	
	$(length).attr("class", "col-lg-12");
}

function detail(licen_code,e){
	
	let clickBg = document.querySelector(".clickBg");
	if(clickBg){
		clickBg.classList.remove("clickBg");
	}
	e.classList.add('clickBg');
	
	console.log("detail 메소드 현재 detailToggle값 : ", detailToggle);
	
	if(!detailToggle){
			const detailPage = document.querySelector("#detailPage");
			
			const length = document.querySelector("#width");
		
			
			$(length).attr("class", "col-lg-8");	
			
			console.log(licen_code);
			
			let header = $("meta[name='_csrf_header']").attr('content');
			let token = $("meta[name='_csrf']").attr('content');
			
			
			$.ajax({
				url : "/manager/licenseEnrollDetail",
				type : "post",
				data : {"licen_code" : licen_code},
				beforeSend : function(xhr){
		    	    xhr.setRequestHeader(header, token);
		     	},
				success : (res) => {
					console.log(res);
						$(detailPage).html(drawDetailHTML(res));			
				},
				dataType : "json"
			})
			
	}
	
}

function drawDetailHTML(res){
	let str = ``;
	
	console.log(res);
	
	str += `<div class="col">
        <div class="card"  id="lecPlanDetailBody" style="height: 790px; width:520px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;"><br><br>
        <h4 class="card-title" onclick="detailClose()" style="cursor: pointer; margin-left:10%; font-weight: bold;">상세 정보</h4>
         <div class="card-body">
            <div class="basic-form" style="padding-left: 6%;">
                <form id="updateForm">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>학번</label>
                            <input type="text" id="stuNumber" value="\${res.smem_no}" class="form-control input-default" disabled="disabled">
                            <input type="hidden" id="volo_code">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>자격증이름</label>
                            <input type="text" id="registerDate" value="\${res.licen_name}" class="form-control input-default" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>발급기관</label>
                            <input type="text" id="startDate" value="\${res.licen_company}" class="form-control input-default" disabled="disabled">
                        </div>
                        <div class="form-group col-md-6">
                            <label>취득일</label>
                            <input type="text" id="endDate" value="\${res.licen_date}" class="form-control input-default" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>발급번호</label>
                            <input type="text" id="comName" value="\${res.licen_num}" class="form-control input-default" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <span type="button" id="fileLocation" class="label label-pill label-dark" style="cursor:pointer;" onclick="prevFile0(\${res.licen_code})">파일보기</span>
                    </div>
                    <div class="form-group">
                        <label style="color: red;">반려사유</label>
                        <input type="text" id="rejectContent" class="form-control input-default" >
                    </div>
                 </form>
                   <div style="float: right;">
                    <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="licenseEnrollValidation(\${res.licen_code})">승인</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn mb-1 btn-outline-danger btn-m" id="\${res.licen_code}" onclick="licenseEnrollReturn(this)" >반려</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn mb-1 btn-outline-dark" onclick="autoValue(this)">자동완성</button>
                   </div>   
            </div>
         </div>
     </div>
  </div>
</div>`; 

	return str;

}

function prevFile0(licenCode){
// 	alert("cccccccccc");
	let header = $("meta[name='_csrf_header']").attr('content');
	let token = $("meta[name='_csrf']").attr('content');
	
	const pop = window.open("about:blank","content","menubar=no, width=920,height=400");
	
	console.log(licenCode);
	
	let licen_code = licenCode; 
	
	$.ajax({
		url : "/manager/prevFileInfo",
		type : "post",
		data : {"licen_code" : licen_code},
		beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
     	},
		success : (res) => {
			console.log("미리보기는 왜안나와?", res);
			console.log("미리보기", res.licen_filepath);
			
			let fileName = res.licen_filepath.substring(res.licen_filepath.lastIndexOf("/") + 1);
			
			console.log("썸네일 파일이름", fileName);
			
			pop.location.href = "/manager/prevFile?fileName=" + fileName; 
// 			window.open("/manager/prevFile?fileName=" + fileName, "content","menubar=no, width=920,height=400"); 
			
			
		},
		dataType : "json"
	})
	
}

function licenseEnrollReturn(btn){
	let header = $("meta[name='_csrf_header']").attr('content');
	let token = $("meta[name='_csrf']").attr('content');
	
	let license_code = $(btn).attr("id");
	let rejectContent = $(btn).parent().parent().find("#rejectContent").val();
	
	console.log("자격등 코드 : ", license_code);
	console.log("반려 사유 : ", rejectContent);
	
	  swal("반려하시겠습니까?",{
          buttons:{
             select:"확인",
             cancel:"취소"
          }
       }).then((value)=>{
          console.log(value)
          
          switch(value){
          case "select":
        	  $.ajax({
      			url : "/manager/licenseEnrollReturn",
      			type : "post",
      			data : {"license_code" : license_code, "rejectContent" : rejectContent},
      			beforeSend : function(xhr){
      	    	    xhr.setRequestHeader(header, token);
      	     	},
      			success : (res) => {
      				if(res == "OK"){
//       					alert("반려되었습니다");
      					

      					swal({
      					  title: "반려되었습니다",   //큰 글씨
      					  icon: "success",   //info, success등 종류
      					});
      					
      					loadPage();
      				}
      			},
      			dataType : "text"
      		})
             break;
          default:
             break;
          }
       })
	
// 	if(confirm("반려하시겠습니까?")){
		
// 	}
	
}

function loadPage(){
	const firstLoadPage = document.querySelector("#firstLoadPage");
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	$.ajax({
		url : "/manager/licenseEnrollList",
		type : "post",
		beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
     	},
		success : (res) => {
			console.log("페이지 로드 리턴값  : ", res);
			if(res.length > 0){
				$(firstLoadPage).html(drawHTML(res));
			}
							
		},
		dataType : "json"
	})
}

function licenseEnrollValidation(licenCode){
	let header = $("meta[name='_csrf_header']").attr('content');
	let token = $("meta[name='_csrf']").attr('content');
	
	let licen_code = licenCode;
	
	console.log("승인 증명서 코드 : ", licen_code);
	
	  swal("승인하시겠습니까?",{
          buttons:{
             select:"확인",
             cancel:"취소"
          }
       }).then((value)=>{
          console.log(value)
          
          switch(value){
          case "select":
        	  $.ajax({
      			url : "/manager/licenseEnrollValidation",
      			type : "post",
      			data : {"licen_code" : licen_code},
      			beforeSend : function(xhr){
      	    	    xhr.setRequestHeader(header, token);
      	     	},
      			success : (res) => {
      				if(res == "OK"){
//       					alert("승인되었습니다");
      					
      					swal({
      					  title: "승인되었습니다",   //큰 글씨
      					  icon: "success",   //info, success등 종류
      					});
      					
      					loadPage();
      				}
      			},
      			dataType : "text"
      		})
             break;
          default:
             break;
          }
       })
	
// 	if(confirm("승인하시겠습니까?")){
		
// 	}
	
}

</script>
</body>
</html>