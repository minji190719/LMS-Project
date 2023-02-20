<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>자격증 등록</strong><br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/student/licenseEnroll">자격증 등록</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-8">
		<div class="card">
			<div class="card-body" style="height: 750px;">
				<div class="card-title">
					<h5 class="custom-s"><strong>자격증 등록 신청내역</strong></h5>							
				</div>
				<div class="table-responsive custom-table1">
					<table class="table table-hover" id="tableTest">
						<thead class="custom-theader custom-s">
							<tr style="text-align: center;">
								<th style="width: 50px;">No.</th>
								<th>자격증이름</th>
								<th>종류</th>
								<th>시행기관</th>
								<th>승인상태</th>
								<th>반려사유</th>
							</tr>
						</thead>
						<tbody class="n_list" id="ajaxRegiLicenseEnroll" style="height: 620px;">
							<!--                        ajax part -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="card">
			<div class="card-body" style="height: 750px;">
				<div class="card-title">
					<h5 class="custom-s"><strong>자격증 등록 신청</strong></h5>							
				</div>
				<div class="alert alert-warning">
					<span style="font-weight: bold;">유의사항</span> <br> <span>*
						발급받은 자격증 발급번호를 정확히 기재해주세요 <br> * 등록 신청일 부터 심사기간 7일 정도 소요됩니다
					</span>
				</div>
				<br/>
				<div class="basic-form">
					<form id="frm" name="frm">
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>자격증이름</label><br> <select id="licen_name"
									class="form-control input-default" name="licen_name">
									<option selected="selected" value="정보처리기사">정보처리기사</option>
									<option value="사회복지사1급">사회복지사1급</option>
									<option value="건축설계기사">건축설계기사</option>
									<option value="기상감정기사">기상감정기사</option>
									<option value="방사선관리기술사">방사선관리기술사</option>
									<option value="원자력발전기술사">원자력발전기술사</option>
									<option value="원자력기사">원자력기사</option>
									<option value="정보보안기사">정보보안기사</option>
									<option value="정보보안산업기사">정보보안산업기사</option>
									<option value="빅데이터분석기사">빅데이터분석기사</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label>자격증 종류</label><br> <select id="licen_kind"
									class="form-control input-default" name="licen_kind">
									<option selected="selected" value="국가기술자격">국가기술자격</option>
									<option value="국가전문자격">국가전문자격</option>
									<option value="등록민간지격">등록민간지격</option>
									<option value="공인민간자격">공인민간자격</option>
									<option value="사업내자격">사업내자격</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>시행기관</label><br> <select id="licen_company"
									class="form-control input-default" name="licen_company">
									<option selected="selected" value="한국산업인력공단">한국산업인력공단</option>
									<option value="한국사회복지사협회">한국사회복지사협회</option>
									<option value="한국원자력안전기술원">한국원자력안전기술원</option>
									<option value="한국인터넷진흥원">한국인터넷진흥원</option>
									<option value="한국데이터산업진흥원">한국데이터산업진흥원</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label>취득일</label> <input type="date" id="licen_date"
									name="licen_date" class="form-control input-default">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>발급번호</label> <input type="text" id="licen_num"
									name="licen_num" class="form-control input-default">
							</div>
							<div class="form-group col-md-6">
								<label>자격증 취득 점수</label> <input type="text" id="licen_score"
									name="licen_score" class="form-control input-default">
							</div>
						</div>
						<div></div>
						<br> <br>
						<div class="form-group">
							<label>파일</label> <input type="file" multiple="multiple"
								id="licenseEnrollFile" name="licenseEnrollFile"
								class="form-control-file">
						</div>
					</form>
					<br/><br/><br/><br/>
					<div style="display: flex; justify-content: flex-end;">
						<button type="button" id="licenseEnrollBtn"
							onclick="licenseEnrollBtn()"
							class="btn mb-1 btn-primary custom-btn-s">등록신청</button>
						<button type="button" onclick="autoValue()"
							class="btn mb-1 btn-outline-dark">자동완성</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

   window.onload = function(){
      var table = $("#tableTest");
      getRegiLicenseEnroll();
   }
   
   function autoValue(){
// 	   alert("aaa");
	   document.querySelector("#licen_name").value = "정보보안기사";
	   document.querySelector("#licen_kind").value = "국가기술자격";
	   document.querySelector("#licen_company").value = "한국인터넷진흥원";
	   document.querySelector("#licen_num").value = "A15-7423561";
	   document.querySelector("#licen_score").value = "86";
	   document.querySelector("#licen_date").value = "2023-01-11";
   }
   
   
   function getRegiLicenseEnroll(){
      
      var ajaxRegiLicenseEnroll = $("#ajaxRegiLicenseEnroll");

      $.ajax({
         method : "GET",
         url : "/student/licenseEnrollList",
         dataType : "json",
         success : function(resList){
            console.log(resList);   
            
            ajaxRegiLicenseEnroll.html(getList(resList));
         }
         
      })
      
   }

   const getList = resList => {
      let str = "";
      
      if(resList.length == 0) {
         str += "<tr><td colspan='6'>신청내역이 존재하지 않습니다</td></tr>";
         console.log("체크해봅시다1")
         
      }else{
         
         console.log("체크해봅시다2")
      
         for(var i = 0; i < resList.length; i++){
         
            str += `<tr style="text-align: center;">`;
            str += `<td style="width: 50px;">\${i+1}</td>`;
            str += `<td title="\${resList[i].licen_name}">&nbsp;\${resList[i].licen_name}</td>`;
            str += `<td title="\${resList[i].licen_kind}">&nbsp;&nbsp;&nbsp;\${resList[i].licen_kind}</td>`;
            str += `<td title="\${resList[i].licen_company}">&nbsp;&nbsp;&nbsp;&nbsp;\${resList[i].licen_company}</td>`;
            
            if(resList[i].enroll_state == 0){
               str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-dark">대기</span></td>`;
            }else if(resList[i].enroll_state == 1){
               str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-success">승인</span></td>`;
            }else{
               str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-danger">반려</span></td>`;
            }
            
            if(resList[i].licen_reject == null && resList[i].enroll_state == 0){
            	str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="reject(\${resList[i].licen_code})" class="btn mb-1 btn-outline-danger btn-sm">취소</button></td>`;
            }else if(resList[i].licen_reject == null || resList[i].licen_reject == ""){
            	str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>`;	
            }else{
            	str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${resList[i].licen_reject}</td>`;
            }
            
            str += "</tr>";
         }
      }
      return str;
   }
   
//    const frm = document.querySelector("#frm");

//    frm.addEventListener("submit", () => {
//       event.preventDefault();
//       console.log("aaaascascascascasdwwwwwwwwwwwww");
//    })

function reject(lic_code){
	console.log("자격증 등록 취소 번호", lic_code);
	
	let licen_code = lic_code;
	
	  swal("취소하시겠습니까?",{
          buttons:{
             select:"확인",
             cancel:"취소"
          }
       }).then((value)=>{
          console.log(value)
          
          switch(value){
          case "select":

      		var header = $("meta[name='_csrf_header']").attr('content');
      		var token = $("meta[name='_csrf']").attr('content');
      		
      		$.ajax({
      	        method : "post",
      	        url : "/student/licenseEnrollReject",
      	        data : {"licen_code" : licen_code},
      	        dataType : "text",
      	        success : function(res){
      	           console.log("자격증 취소후 콜백 함수 파라미터 : ", res);   
      	           if(res != "NG"){
      	        	 swal("취소되었습니다","","success",{buttons:"확인"})
    					.then((value)=>{
    						getRegiLicenseEnroll();	
    					})
      	           }
      	           
      	        },
      	        beforeSend : function(xhr){
       	    	    xhr.setRequestHeader(header, token);
       	     	}
      	        
      	     })
      	
      	
             
       	   
       	   break;
          
          default:
             break;
          }
       })
	
	
	
}

function licenseEnrollBtn(){
	
	console.log("버튼이벤트");
	
	let frm = document.querySelector("#frm");
	let fileData = document.querySelector("#licenseEnrollFile");
	
	   swal("자격증 등록 신청을 하시겠습니까?",{
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
           console.log(value)
           
           switch(value){
           case "select":

       		var header = $("meta[name='_csrf_header']").attr('content');
       		var token = $("meta[name='_csrf']").attr('content');
       		
       		let files = fileData.files;
       		
       		let form = new FormData(frm);
       		
       		for (let i = 0; i < files.length; i++) {
       			form.append("licenseEnrollFile", files[i]);
       		}
       		
       		$.ajax({
       			url : "/student/licenseEnrollApply",
       			method : "post",
       			data : form,
       			cache : false,
       			contentType : false,
       			processData : false,
       			success : function(res){
       				if(res != "NG"){
//        					alert("자격증 등록 신청이 완료되었습니다");
//       	 				$(frm).find("#licen_num").val("");		
//       	 				$(frm).find("#licen_score").val("");		
//       	 				$(frm).find("#licenseEnrollFile").val("");
       				
       					
       					swal("신청이 완료되었습니다","","success",{buttons:"확인"})
       					.then((value)=>{
       						frm.reset();
       						getRegiLicenseEnroll();	
       					})
       				}
       			},
       			beforeSend : function(xhr){
       	    	    xhr.setRequestHeader(header, token);
       	     	},
       			dataType : "text"
       		})
       	
       	
       	frm.reset();
              
        	   
        	   break;
           
           default:
              break;
           }
        })
	
	
	
}
   
</script>
</html>
















