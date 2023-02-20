<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;봉사 신청 관리<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a
						href="/volunteer/manage/inVolPage">봉사 신청 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-7" >
		<div class="card">
			<div class="card-body">
				 <div class="alert alert-danger">※ 개인정보를 제공받은 목적 외의 용도로 이용하거나 이를 제3자에게 제공하는 경우 처벌을 받을 수 있습니다.</div>
				 <div class="table-responsive custom-table1" id="tableWrapper">
				     <table class="table table-hover" >
				         <thead class="custom-theader-m">
				             <tr>
				                 <th width="80">No</th>
				                 <th>신청연도</th>
				                 <th width="80">학기</th>
				                 <th>신청일자</th>
				                 <th width="100">학번</th>
				                 <th>성명</th>
				                 <th>구분</th>
				                 <th></th>
				             </tr>
				         </thead>
				         <tbody id="ajaxRegiVolList" style="height: 657px;">
				         
<!-- 				           ajax part -->

				         </tbody>
				     </table>
				 </div>
			</div>
		</div>
	</div>
   <div class="col-lg-5">
        <div class="card" style="height: 840px;">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold">봉사 신청 내용 상세 보기</h5>
				</div>
				<br/>
                <div class="basic-form" style="">
                   <form id="updateForm">
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>학번</label>
                               <input type="text" id="stuNumber" class="form-control input-default" disabled="disabled">
                               <input type="hidden" id="volo_code">
                           </div>
                           <div class="form-group col-md-6">
                               <label>성명</label>
                               <input type="text" id="stuName" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>학과</label>
                               <input type="text" id="stuDep" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>신청일자</label>
                               <input type="text" id="registerDate" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>시작일자</label>
                               <input type="text" id="startDate" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>종료일자</label>
                               <input type="text" id="endDate" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>기관명</label>
                               <input type="text" id="comName" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>봉사시간</label>
                               <input type="text" id="volTime" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div>
                           <label>활동내용</label>
                           <textarea class="form-control input-default" style="width: 100%;" rows="4" id="volContent" disabled="disabled"></textarea>
                       </div><br>
                       <div class="form-group">
                           <label>파일</label>
                           <div id="fileLocation">
                           
<!--                            파일 리스트 들어올 곳 -->

                           </div>
                       </div>
                       <div class="form-group">
                           <label style="color: red;">반려사유</label>
                           <input type="text" id="rejectReason" class="form-control input-default" >
                       </div>
                    </form>
                   	<div style="float: right;">
                       <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="btnSubmit()">승인</button>&nbsp;
                       <button type="button" class="btn mb-1 btn-outline-danger" onclick="btnDenied()" >반려</button>&nbsp;
                       <button type="button" class="btn mb-1 btn-outline-dark" onclick="eh_autoValue()">자동완성</button>
                   	</div>	
               </div>
            </div>
        </div>
     </div>
</div>	

<script type="text/javascript">

	window.onload = function(){
// 		var table = $("#EH_tableTest");
		getRegiVolList();
	
	}
	
	//신청자 및 등록자 리스트 불러오는 메소드
	function getRegiVolList(){
		
		var ajaxRegiVolList = $("#ajaxRegiVolList");

		$.ajax({
			method : "GET",
			url : "/volunteer/manage/registerList",
			dataType : "json",
			success : function(resList){
				console.log(resList);	
				
				ajaxRegiVolList.html(getList(resList));
			}
			
		})
		
	}

	const getList = resList => {
		let str = "";
		
		if(resList.length == 0) {
			str += "<tr><td colspan='6' style='text-align:center;'>신청내역이 존재하지 않습니다</td></tr>";
			console.log("체크해봅시다1")
			
		}else{
			console.log("체크해봅시다2")
			
			for(var i = 0; i < resList.length; i++){
					str += "<tr>";
					str += `<td width="80">\${i+1}</td>`;
					str += `<td>\${resList[i].VOLO_YEAR}</td>`;
					str += `<td width="80">\${resList[i].VOLO_SEMESTER}</td>`;
					str += `<td>\${resList[i].VOLO_REGIDATE}</td>`;
					str += `<td width="110">&nbsp;&nbsp;&nbsp;&nbsp;\${resList[i].SMEM_NO}</td>`;
					str += `<td>\${resList[i].MEM_NAME}</td>`;
					if(resList[i].VOLO_STATE == 0){
						str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-dark">대기</span></td>`;
					}else if(resList[i].VOLO_STATE == 2){
						str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-danger">반려</span></td>`;
					}else{
						str += `<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-success">승인</span></td>`;
					}
					str += '<td><span id="'+resList[i].VOLO_CODE+'" name="spanBtn" class="label label-pill label-dark" style="cursor: pointer;" onclick="btnDetail('+resList[i].VOLO_CODE+',this)" >보기</span></td>';
					str += "</tr>";
			}
		}
		return str;
	}
	
	
	//개개인의 신청 및 개인정보를 볼 수 있는 function
	function btnDetail(code,e){
		
		let clickBg = document.querySelector(".clickBg");
		if(clickBg){
			clickBg.classList.remove("clickBg");
		}
		e.parentElement.parentElement.classList.add("clickBg");
		
		
		var volo_code = {
			"volo_code" : code
		}
		
		getVolFile(volo_code);
		
		var voloCode = $("#volo_code");
		var stuNumber = $("#stuNumber");
		var stuName = $("#stuName");
		var stuDep = $("#stuDep");
		var registerDate = $("#registerDate");
		var startDate = $("#startDate");
		var endDate = $("#endDate");
		var comName = $("#comName");
		var volTime = $("#volTime");
		var volContent = $("#volContent");
		var volTime = $("#volTime");
		var rejectReason = $("#rejectReason");
		
		
		
// 		console.log(volo_code);

		$.ajax({
			url : "/volunteer/manage/getDetail",
			method : "get",
			data : volo_code,
			dataType : "json",
			success : function(data){
				console.log(data);
				voloCode.val(data.VOLO_CODE)
				stuNumber.val(data.SMEM_NO);
				stuName.val(data.MEM_NAME);
				stuDep.val(data.STU_DEP);
				registerDate.val(data.VOLO_REGIDATE);
				startDate.val(data.VOLO_START);
				endDate.val(data.VOLO_END);
				comName.val(data.VOLO_COMPANY);
				volTime.val(data.VOLO_TIME);
				volContent.val(data.VOLO_CONTENT);
				volTime.val(data.VOLO_TIME);
				rejectReason.val(data.VOLO_REJECT);
			}
		})
	}
	
	//신청 승인 메서드
	function btnSubmit(){
		var fileLocation = document.getElementById("fileLocation");
		var volo_code = document.getElementById("volo_code").value;
		var updateForm = document.getElementById("updateForm");
		console.log(volo_code);
		
		if(confirm("승인하시겠습니까?")){
			
			$.ajax({
				url:"/volunteer/manage/updateVolState",
				method:"GET",
				data : {"volo_code" : volo_code },
				success : function(res){
					alert(res);
					updateForm.reset();
					fileLocation.innerHTML = "";
					getRegiVolList();
				}
			})
		
		}else{
			return false;
		}
		
	}
	
	
	function btnDenied(){
		var volo_reject = document.getElementById("rejectReason").value;
		var volo_code = document.getElementById("volo_code").value;
		var updateForm = document.getElementById("updateForm");
		var fileLocation = document.getElementById("fileLocation");
		
		if(confirm("반려 처리하시겠습니까?")){
			
			$.ajax({
				url:"/volunteer/manage/updateVolDenied",
				method:"GET",
				data : {"volo_code" : volo_code ,
						"volo_reject" : volo_reject},
				success : function(res){
					alert(res);
					updateForm.reset();
					fileLocation.innerHTML = "";
					getRegiVolList();
				}
			})
		
		}else{
			return false;
		}
	}
	
	
	function getVolFile(code){
		
		console.log(code);
		
		var str = "";
		var divFileLocation = document.getElementById("fileLocation");
		$.ajax({
			url : "/volunteer/manage/getFileInfo",
			method : "GET",
			data : code,
			success : function(data){
				console.log("파일값확인",data);
				
				for(var i = 0; i< data.length; i++){
				
					str += '<a class="btn mb-1 btn-rounded btn-warning" href="/resources/uploads/'+data[i].file_originnm+'" download >';
	            	str += '    <span class="btn-icon-left">                      ';
		            str += '    	<i class="fa fa-download color-warning"></i>  ';
		            str += '    </span>'+data[i].file_originnm+'</a>&nbsp;&nbsp;';
		            str += '	<span class="badge badge-light" onclick="beforeDownload(\''+data[i].file_originnm +'\')">미리보기</span>&nbsp;&nbsp;&nbsp;';
				}
				
				divFileLocation.innerHTML = str;
			}
			
		})
	}
	
	
	function beforeDownload(data){
		var pop = window.open("about:blank","content","menubar=no,top=100,left=400, width=920,height=800");
		
		console.log(pop);
		console.log(data);
		
		pop.location.href = "/volunteer/manage/popUpImgPage?fileName="+data;
		
	}
	
	
	function eh_autoValue(){
		
		var rejectReason = $("#rejectReason");
	
		rejectReason.val("파일 누락");
	}
	
</script>