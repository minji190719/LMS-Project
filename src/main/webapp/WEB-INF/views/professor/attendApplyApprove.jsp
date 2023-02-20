<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.mjUl ul li{
 list-style-type : disc;
 line-height : 200%;
}
.mjAttendApplyList .page-item a{
	background-color: #FFFFFFF !important;
	color : var(--custom-p) !important;
}

.mjAttendApplyList .pagination .active a{
	background-color: var(--custom-p) !important;
	color : #FFFFFF !important;
}
.mjAttendApplyList th:first-child{
	width: 5%;
}

.mjAttendApplyList th:nth-child(4) {
	width: 20%;
}
</style>


<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>공결처리</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lad/attendApplyList">공결처리</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

<div class="row mjAttendApplyList">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-4">공결 신청 목록</h5>
				</div>
				<div class="table-responsive">
					<table class="table table-hover" id="pAttendApplyListTb">
						<thead class="custom-theader" style="background-color:#EBEBEB;">
							<tr>
								<th>번호</th>
								<th>강의명</th>
								<th>신청번호</th>
								<th>공결유형</th>
								<th>이름</th>
								<th>학번</th>
								<th>승인구분</th>
								<th>상세</th>
							</tr>
						</thead>
						<tbody >
							<!-- 여기에 목록 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	<div id="aALcard1">
		<div class="card" id="aALcard2" style="display:none;">
			<div class="card-body">
				<div class="card-title">
					<div>
						<button type="button" class="close" onclick="aaDetailClose()">×</button>
						<h5 class="font-weight-bold mb-4">상세보기</h5>
					</div>
					<hr>
				</div>
				<div class="table-responsive">
					<input type="hidden" id="aa_code">
					<table border="1" class="table">
						<tr>
							<td>학번</td>
							<td><input type="text" id="smem_no" style="border:none;" readonly="readonly"></td>
							<td>이름</td>
							<td><input type="text" id="mem_name" style="border:none;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>년도</td>
							<td><input type="text" id="st_year" style="border:none;" readonly="readonly"></td>
							<td>학기</td>
							<td><input type="text" id="st_semester" style="border:none;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>결석일시</td>
							<td colspan="3"><input type="text" id="aa_lectureday" readonly="readonly" style="border:none; box-sizing : border-box;  width: 100%;"></td>
						</tr>
						<tr>
							<td>결석유형</td>
							<td colspan="3"><input type="text" id="aa_reason" readonly="readonly" style="border:none; box-sizing : border-box;  width: 100%;"></td>
						</tr>
						<tr>
							<td>상세사유</td>
							<td colspan="3"><textarea rows="5" id="aa_detail" cols="" name="aa_detail" readonly="readonly" style="border:none; box-sizing : border-box; border: none; resize: none; width: 100%;" ></textarea></td>
						</tr>
						<tr>
							<td colspan="4" id="fileDownnView">
							<!-- 여기에 다운로드 버튼이랑 미리보기 버튼 생성-->
							</td>
						</tr>
					</table>
					<div class="d-flex justify-content-end"  id="attendBtnAll">
<!-- 						<button type="button" onclick="approveAttend()">승인</button> -->
<!-- 						<button type="button" onclick="rejectAttend()">반려</button> -->
					</div>
				</div>
			</div>
		</div>

		<div class="card" id="aALcard3">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-4">유의사항</h5>
					<hr>
				</div>
				<div style="border: 1;">
					<div class="mjUl pl-4 pr-4 pt-0">
						<ul>
							<li>공결 승인 처리 후 승인 번복은 불가능함.</li>
							<li>상해나 질병으로 인한 공결은 첨부서류에 질병명이 명시되어있는지 확인.</li>
							<li>모든 사유를 합하여 출석 인정 기간은 수업일수의 1/3 이내만 가능함.</li>
							<li>승인 완료된 공결신청서는 파일 출력 후 필서명.</li>
							<li>원격강좌 및 야간수업은 출석인정 대상 과목이 아니므로 학생이 수강하여야 함(공결처리 되지 않음).</li>
							<li>출석인정은 수업의 출석에 관한 사항을 인정하는 것이며, 성적에 관한 사항은 담당교수의 평가기준을 적용받는 것이므로 성적평가에 관한
								사항은 담당교수의 기준에 따라야 함.</li>
							<li>대외활동 목록 등은 과사무실에 문의 요망.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
</div>

<!-- 반려사유 입력 모달 -->
<div class="modal fade" id="rejectAttendModal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">반려</h4>
				<button type="button" class="close updateRejectModalClose" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<form id="attendRejectModalForm">
					<div class="form-group">
						<label for="rejectAttendText" class="col-form-label">반려사유작성</label>
						<textarea class="form-control" id="rejectAttendText"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light" onclick="autoCompleteRejectBtn()">자동완성</button>
				<button type="button" class="btn btn-dark attendRejectModalClose" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary custom-btn-p" id="rejectAttendBtn">등록</button>
			</div>
		</div>

	</div>
</div>

<script>
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}';

window.onload = function() {
	mjgetList();
}

function mjgetList(){
	console.log("실행");

	$.ajax({
		method: "GET",
		url: "/lad/getAttendApplyList",
		dataType: "json",
		success: function(result){
			console.log("성공! : ",result);
			aaDataTableDraw(result);
		},
		error: function(){

		}
	});	// ajax 끝
}

const aaDataTableDraw = data =>{
	console.log("찍기 ",data)
	
		let tableOption = {
			blengthMenu : false,
			displayLength : 5,
			destroy : true,
			ordering : false,
			info : false,
			responsive : true,
			visible : true,
			fixedHeader : true,
		    "language": {
		        "emptyTable": "등록된 내용이 없습니다.",
		        "lengthMenu": "한 페이지당 _MENU_ 개씩 보기",
		        "info": "현재 _START_ - _END_ / _TOTAL_건",
		        "infoEmpty": "데이터가 존재하지 않습니다.",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링되었습니다. )",
		        "search": "",
		        "zeroRecords": "일치하는 데이터가 존재하지 않습니다.",
		        "loadingRecords": "로딩 중입니다.",
		        "processing":     "잠시만 기다려 주십시오.",
		        "paginate": {
		            "next": "다음",
		            "previous": "이전"
		        }
		    }
		};
	
	let table = $("#pAttendApplyListTb").DataTable(tableOption);
	let cnt = 1;
	for(let i = 0; i < data.length; i++){
		
		if(data[i].AA_STATE == 0){
			table.row.add([
				`<td>\${cnt}</td>`,
				`<td>\${data[i].LOL_NAME}</td>`,
				`<td>\${data[i].AA_CODE}</td>`,
				`<td>\${data[i].AA_REASON}</td>`,
				`<td>\${data[i].MEM_NAME}</td>`,
				`<td>\${data[i].SMEM_NO}</td>`,
				`<td><span class="badge badge-dark px-2">대기</span></td>`,
				`<td><button type="button" class="btn mb-1 btn-primary btn-sm custom-btn-p" onclick="attendApplyInfo('\${data[i].AA_CODE}','\${data[i].SMEM_NO}', '\${data[i].ATTEND_CODE}')">상세보기</button></td>`
			]).draw(false);
		}
		if(data[i].AA_STATE == 1){
			table.row.add([
				`<td>\${cnt}</td>`,
				`<td>\${data[i].LOL_NAME}</td>`,
				`<td>\${data[i].AA_CODE}</td>`,
				`<td>\${data[i].AA_REASON}</td>`,
				`<td>\${data[i].MEM_NAME}</td>`,
				`<td>\${data[i].SMEM_NO}</td>`,
				`<td><span class="badge badge-success px-2">승인</span></td>`,
				`<td><button type="button" class="btn mb-1 btn-primary btn-sm custom-btn-p" onclick="attendApplyInfo('\${data[i].AA_CODE}','\${data[i].SMEM_NO}', '\${data[i].ATTEND_CODE}')">상세보기</button></td>`
			]).draw(false);
		}
		if(data[i].AA_STATE == 2){
			table.row.add([
				`<td>\${cnt}</td>`,
				`<td>\${data[i].LOL_NAME}</td>`,
				`<td>\${data[i].AA_CODE}</td>`,
				`<td>\${data[i].AA_REASON}</td>`,
				`<td>\${data[i].MEM_NAME}</td>`,
				`<td>\${data[i].SMEM_NO}</td>`,
				`<td><span class="badge badge-danger px-2">반려</span></td>`,
				`<td><button type="button" class="btn mb-1 btn-primary btn-sm custom-btn-p" onclick="attendApplyInfo('\${data[i].AA_CODE}','\${data[i].SMEM_NO}', '\${data[i].ATTEND_CODE}')">상세보기</button></td>`
			]).draw(false);
		}
		cnt++;
	}
}

function attendApplyInfo(aaCode, smemNo, attendCode){
	console.log("aaCode : ", aaCode ," smemNo : ", smemNo);
	
	let aALcard1 = document.getElementById("aALcard1");
	let aALcard2 = document.getElementById("aALcard2");
	let aALcard3 = document.getElementById("aALcard3");

	aALcard1.style.display = "flex";
	aALcard2.style.display = "";
	aALcard2.style.width = "50%";
	aALcard2.style.marginRight = "1%";
	aALcard3.style.width = "49%";

	let data = {
			aaCode : aaCode
	}

	$.ajax({
		method: "POST",
		url: "/lad/getAttendApplyStudent",
		data: JSON.stringify(data),
		contentType: "application/json; charset=UTF-8",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		dataType: "json",
		success: function(result){
			console.log("썸원콜더닥터~~",result);
			datailViewTemplate(result, attendCode);
		},
		error: function(){

		}

	});	

}

const datailViewTemplate = (data, attendCode) =>{
	
	let aaLectureday = "";
	
	
	if(data.ATTEND_DAY == 1){
		aaLectureday = `\${data.LOL_NAME} : \${data.ST_DAY1}(\${data.ST_STARTTIME1}~\${data.ST_ENDTIME1})/\${data.ATTEND_WEEK}주차\${data.ATTEND_DAY}회차`;
	}else{
		aaLectureday = `\${data.LOL_NAME} : \${data.ST_DAY2}(\${data.ST_STARTTIME2}~\${data.ST_ENDTIME2})/\${data.ATTEND_WEEK}주차\${data.ATTEND_DAY}회차`; 
	}
	
	$("#smem_no").val(data.SMEM_NO);
	$("#mem_name").val(data.MEM_NAME);
	$("#st_year").val(data.ST_YEAR);
	$("#st_semester").val(data.ST_SEMESTER);
	$("#aa_lectureday").val(aaLectureday);
	$("#aa_reason").val(data.AA_REASON);
	$("#aa_detail").val(data.AA_DETAIL);
	$("#aa_code").val(data.AA_CODE);
	
	let filePath = data.FILE_PATH;
	let fileOriginnm = data.FILE_ORIGINNM;
	let apCode = data.AP_CODE;
	
	
	fileDownload(filePath, fileOriginnm, apCode);
	
	//승인상태가 0(대기)일때만 버튼을 출력
	
	console.log(data)
	let code = "";
	if(data.AA_STATE == 0){
		code += `<button type="button" class="btn mb-1 btn-primary custom-btn-p" onclick="approveAttend('\${attendCode}')">승인</button>`;
		code += `<button type="button" class="btn mb-1 btn-outline-danger" onclick="rejectAttend('\${attendCode}')">반려</button>`;
		$("#attendBtnAll").html(code);
	}else if(data.AA_STATE == 1 || data.AA_STATE == 2){
		document.querySelector("#attendBtnAll").innerHTML = "";
	}
	
}


function fileDownload(filePath, fileOriginnm, apCode){
	
	let code = "";
	
	code += `<a class="btn mb-1 btn-rounded btn-warning" href="\${filePath}" download >
		 	 <span class="btn-icon-left">
		 	<i class="fa fa-download color-warning"></i>
		 	</span>다운로드</a>
		 	<span class="badge badge-light" style="cursor:pointer" onclick="fileViewPopup('\${filePath}')">미리보기</span>
	`;
	
	$("#fileDownnView").html(code);
	
}

function fileViewPopup(filePath){
	
		let url = filePath;
        let name = "fileviewPopup";
        let option = "width = 900, height = 800, top = 100, left = 200, location = no"
        window.open(url, name, option);

}

function approveAttend(attendCode){
	let aaCode = document.getElementById("aa_code").value;

	console.log(aaCode);
	console.log(attendCode);
	
	let data = {
			aa_code : aaCode,
			attend_code : attendCode
	}

	$.ajax({
		method: "POST",
		url: "/lad/updateAttendApproval",
		data: JSON.stringify(data),
		contentType: "application/json; charset=UTF-8",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		dataType: "text",
		success: function(result){
			console.log("성공! ", result);
// 			alert("승인완료!");
			swal({
			  title: "승인되었습니다.",
			  icon: "success",
			});
			 $('#pAttendApplyListTb').dataTable().fnClearTable(); 
			mjgetList();
			
			let aALcard1 = document.getElementById("aALcard1");
			let aALcard2 = document.getElementById("aALcard2");
			let aALcard3 = document.getElementById("aALcard3");

			aALcard1.style.display = "";
			aALcard2.style.display = "none";
			aALcard2.style.width = "100%";
			aALcard2.style.marginRight = "";
			aALcard3.style.width = "100%";
			
			document.querySelector("#attendBtnAll").innerHTML = "";
			
			
		},
		error: function(){

		}
	})// ajax 끝
	
}

function rejectAttend(){
	
	$("#rejectAttendModal").modal("show");
	
	// 모달 닫기버튼 리셋
	let attendRejectModalClose = $(".attendRejectModalClose");
	attendRejectModalClose.on("click",function(){
			 $("#attendRejectModalForm")[0].reset()
			 $('#rejectAttendModal').modal('hide');
	})
	
	
	// 모달 반려사유 등록시 ajax 실행
	rejectAttendBtn.onclick = function(event) {
		
		event.preventDefault();
			
		let aaReject = $("#rejectAttendText").val();
		let aaCode = $("#aa_code").val();
		
		console.log("aaReject : ", aaReject, "aaCode : ", aaCode);

		let data = {
				aa_code : aaCode,
				aa_reject : aaReject
			}
		

	    $.ajax({
	        method : "POST",
	        url : "/lad/updateAttentReject",
	        data : JSON.stringify(data),
	        contentType : "application/json;charset=utf-8",
	        dataType : "text",
	        beforeSend : function(xhr){
			        xhr.setRequestHeader(header, token);
			},
	        success : function(result){
	            console.log("성공!", result)
// 	        	alert("반려되었습니다.");
	            swal({
	  			  title: "반려되었습니다.",
	  			  icon: "success",
	  			});
	            $('#pAttendApplyListTb').dataTable().fnClearTable(); 
	            mjgetList();
	            let aALcard1 = document.getElementById("aALcard1");
				let aALcard2 = document.getElementById("aALcard2");
				let aALcard3 = document.getElementById("aALcard3");

				aALcard1.style.display = "";
				aALcard2.style.display = "none";
				aALcard2.style.width = "100%";
				aALcard2.style.marginRight = "";
				aALcard3.style.width = "100%";
				
				document.querySelector("#attendBtnAll").innerHTML = "";
	        },
	        error : function(){
	
	        }
	        
	    })
	    
	    $("#attendRejectModalForm")[0].reset();
  	  	$('#rejectAttendModal').modal('hide'); 
	}
}

function aaDetailClose(){
	let aALcard1 = document.getElementById("aALcard1");
	let aALcard2 = document.getElementById("aALcard2");
	let aALcard3 = document.getElementById("aALcard3");

	aALcard1.style.display = "";
	aALcard2.style.display = "none";
	aALcard2.style.width = "100%";
	aALcard2.style.marginRight = "";
	aALcard3.style.width = "100%";
}

// 반려사유 모달 자동완성
function autoCompleteRejectBtn(){
	$("#rejectAttendText").val("교내에서 승인되지 아니한 개인 대외활동 사유는 인정하지 않음")
}
</script>