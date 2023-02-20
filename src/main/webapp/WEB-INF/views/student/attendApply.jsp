<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.mjUl ul li{
 list-style-type : disc;
 line-height : 200%;
}
</style>

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>공결원 신청</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/attend/attendApplyPage">공결원 신청</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

<div class="row">

	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">공결원 신청 목록</h5>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>년도</th>
								<th>학기</th>
								<th>학번</th>
								<th>성명</th>
								<th>결석일자</th>
								<th>첨부서류</th>
								<th>접수승인</th>
								<th>반려사유</th>
							</tr>
						</thead>
						<tbody id="stuMyAttendApplyTb">
							<!-- 여기 출력 -->
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="col-8">
		<div class="card h-100">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">공결원 신청</h5>
				<hr>
				<br>
				<div class="table-responsive col-lg-12">
					<form name="attendApplyForm" id="attendApplyForm">
					<table class="table" border="1" style="width:100%;">
						<tr>
							<td>신청년도</td>
							<td><input type="text" id="applyYear" style="border:none; box-sizing : border-box;  width: 100%;" readonly="readonly"></td>
							<td>신청학기</td>
							<td><input type="text" id="applySemester" style="border:none; box-sizing : border-box;  width: 100%;" readonly="readonly"></td>
							<td>결석일자</td>
							<td>
								<select class="form-control input-default" id="selAttendApplyLecture" onchange="changeYearSemesterFn(this)" style="box-sizing : border-box;  width: 100%;" >
									<c:choose>
										<c:when test="${list eq null}">
											<option>공결 신청 가능 강좌 없음</option>
										</c:when>
										<c:otherwise>
											<option>선택</option>
											<c:forEach items="${list }" var="list">
												<option data-year=${list.ST_YEAR } data-semester=${list.ST_SEMESTER } value="${list.ATTEND_CODE }">${list.LOL_NAME } :
													<c:choose>
														<c:when test="${list.ATTEND_DAY eq 1}">
															${list.ST_DAY1}(${list.ST_STARTTIME1}~${list.ST_ENDTIME1})
														</c:when>
														<c:otherwise>
															${list.ST_DAY2}(${list.ST_STARTTIME2}~${list.ST_ENDTIME2})
														</c:otherwise>
													</c:choose>
													&nbsp;/&nbsp;${list.ATTEND_WEEK }주&nbsp;${list.ATTEND_DAY }회차</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</select>
								
							</td>
						</tr>
						<tr>
							<td>신청구분</td>
							<td colspan="5"   style="padding : 10px;">
								 <table class="table-hover">
							        <tr onclick="radioChkFn(this)"><td><input type="radio" name="aa_reason" value="교육과정에 의한 현장실습/대외활동">&nbsp;&nbsp;교육과정으로 운영하는 현장실습과 현장견학, 학교대표로 참가하는 경우 및 홍보대사로서 학교 행사를 지원하는 경우</td></tr>
							        <tr onclick="radioChkFn(this)"><td><input type="radio" name="aa_reason" value="법령에 의한 의무이행">&nbsp;&nbsp;법령에 의한 의무이행을 위하여 소집되거나 행사에 참가하는 경우</td></tr>
							        <tr onclick="radioChkFn(this)"><td><input type="radio" name="aa_reason" value="상해/질병">&nbsp;&nbsp;본인의 상해나 질병으로 입원하여 출석할 수 없는 경우</td></tr>
							        <tr onclick="radioChkFn(this)"><td><input type="radio" name="aa_reason" value="법정 전염병/백신">&nbsp;&nbsp;법정전염병의 의심 또는 확진으로 격리 조치가 필요한 경우 등 (백신 공결 포함)</td></tr>
							        <tr onclick="radioChkFn(this)"><td><input type="radio" name="aa_reason" value="장례(가족)">&nbsp;&nbsp;가족(「민법, 제 799조에 따른 가족을 말한다」)이 사망한 경우 공휴일포함 5일이내</td></tr>
							      </table>
							</td>
						</tr>
						<tr>
							<td>신청상세사유</td>
							<td colspan="5"><textarea rows="" cols="" id="aa_detail" name="aa_detail" placeholder="사유를 입력하세요."  style="box-sizing : border-box; border: none; resize: none;  width: 100%;" ></textarea></td>
						</tr>
						<tr>
							<td>증명서류</td>
							<td colspan="5"><input type="file" id="applyPdfFile" accept=".pdf" style="box-sizing : border-box;  width: 100%;"></td>
						</tr>
					</table>
					</form>
					<div class="d-flex justify-content-end">
					<button type="button" class="btn mb-1 btn-primary custom-btn-s" onclick="attendApplyRegister()">등록</button>
					<button type="button" class="btn mb-1 btn-light" onclick="autoCompleteAaBtn()">자동완성</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-4">
		<div class="card h-100">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">[필독] 유의사항</h5>
				<hr>
<!-- 				<div style="border:1;"> -->
<!-- 					<p>가. 출석인정요청시 신청구분에 맞는 사유 작성.</p> -->
<!-- 					<p>나. 공결사유에 관계없이 공결신청 및 서류제출은 공결사유 종료일 포함 10일 이내(단, 성적열람 기간 전까지) 제출완료해야 함.</p> -->
<!-- 					<p>다. 진행상황이 대기 중일 때에는 본인 취소가 가능하나 승인 처리된 공결은 수정 및 취소 불가능.</p> -->
<!-- 					<p>라. 상해나 질병으로 인한 공결은 첨부서류에 질병명 명시(필수).</p> -->
<!-- 					<p>마. 중간고사 및 기말고사기간에는 공결신청이 불가함.</p> -->
<!-- 					<p>바. 공결신청시 서류제출 필수. 원본 pdf파일 첨부만 가능.</p> -->
<!-- 				</div> -->
				<div class="mjUl pl-4 pr-4 pt-0">
				<ul>
					<li>출석인정요청시 신청구분에 맞는 사유 작성.</li>
					<li>공결사유에 관계없이 공결신청 및 서류제출은 공결사유 종료일 포함 10일 이내(단, 성적열람 기간 전까지) 제출완료해야 함.</li>
					<li>진행상황이 대기 중일 때에는 본인 취소가 가능하나 승인 처리된 공결은 수정 및 취소 불가능.</li>
					<li>상해나 질병으로 인한 공결은 첨부서류에 질병명 명시(필수).</li>
					<li>중간고사 및 기말고사기간에는 공결신청이 불가함.</li>
					<li>공결신청시 서류제출 필수. 원본 pdf파일 첨부만 가능.</li>
				</ul>
				</div>
			</div>
		</div>
	</div>

</div>


<script>

const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';

window.onload=function(){
	
	getAttendApplyList();
}

function getAttendApplyList(){
	console.log("일단 찍어보겠습니다.");
	
	$.ajax({
		method: "GET",
		url : "/attend/getMyAttendApplyList",
		dataType: "json",
		success: function(result){
			console.log("리스트 뿌리기 : " , result);
			$("#stuMyAttendApplyTb").html(attendApplyListTemplate(result));
		},
		error : function(){
			
		}

	})
	
	
	
}

function changeYearSemesterFn(cthis){
	
// 	console.log("요기!", cthis.selectedIndex);
	console.log("요기!", cthis.options[cthis.selectedIndex].dataset.year);
	console.log("요기22", cthis.options[cthis.selectedIndex].dataset.semester);
	
	$("#applyYear").val(cthis.options[cthis.selectedIndex].dataset.year);
	$("#applySemester").val(cthis.options[cthis.selectedIndex].dataset.semester);
	
}

function radioChkFn(rthis){
	console.log("민지~~",rthis)
	let radioBtn = $(rthis).find('td:first-child :radio');
	radioBtn.prop('checked',true);
	
}

function attendApplyRegister(){
	const attendCode = document.getElementById("selAttendApplyLecture").value;
	console.log("출석코드 : ", attendCode);
	
	let applyForm = document.attendApplyForm
	let applyFile = document.getElementById("applyPdfFile");
	console.log("applyForm : ", applyForm);
	console.log("applyFile : ", applyFile);
	console.log("applyFiles.files : ", applyFile.files);
	console.log("applyFiles.files : ", applyFile.files[0]);

	let formData = new FormData(applyForm);
	
	formData.append("attend_code", attendCode);
	formData.append("applyfile", applyFile.files[0]);


	$.ajax({
		method: "POST",
		url: "/attend/attendApplyRegister",
		data : formData,
		contentType : false,
		processData: false,
		dataType : "text",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(result){
			console.log("성공!", result);
// 			alert("신청완료!");
			swal({
	 			title: "공결신청이 완료되었습니다.",
	 			icon: "success",
	 		});
			applyForm.reset();
			getAttendApplyList();
			$("input:radio[name='aa_reason']:checked")[0].checked = false;
		},
		error : function(){

		}
		
	});
	
}

const attendApplyListTemplate = data =>{
	let code = "";
	let cnt = 1;
	
	if(data.length == 0){
		code = `<tr class="text-center"><td colspan="9">공결신청 목록이 없습니다.</td></tr>`;
	}
	
	for(let i = 0; i < data.length; i++){
		code += `
			<tr>
				<td>\${cnt}</td>
				<td>\${data[i].ST_YEAR}</td>
				<td>\${data[i].ST_SEMESTER}</td>
				<td>\${data[i].SMEM_NO}</td>
				<td>\${data[i].MEM_NAME}</td>
				<td>\${data[i].LOL_NAME} : 
				`;
				if(data[i].ATTEND_DAY == 1){
					code += `\${data[i].ST_DAY1}(\${data[i].ST_STARTTIME1}~\${data[i].ST_ENDTIME1})`;
				}else{
					code += `\${data[i].ST_DAY2}(\${data[i].ST_STARTTIME2}~\${data[i].ST_ENDTIME2})`;
				}

		code +=	` / \${data[i].ATTEND_WEEK }주 \${data[i].ATTEND_DAY }회차
				</td>
				<td>\${data[i].FILE_ORIGINNM}</td>
				`;
				 if(data[i].AA_STATE == 0){
					code += `<td><span class="badge px-2" style="background-color: gray; color:white;">대기</span></td>
							 <td><button type="button" class="btn mb-1 btn-outline-dark btn-sm" onclick="attendApplyDel('\${data[i].AA_CODE}')">취소</button></td>
							`;
				 }else if(data[i].AA_STATE == 1){
					code += `<td><span class="badge badge-success px-2">승인</span></td>
							<td></td>`;
				 }else{
					code += `<td><span class="badge badge-danger px-2">반려</span></td>
							 <td>\${data[i].AA_REJECT}</td>`;
				 }
		code += `</tr>`;
		
		cnt++;
	}
	
	return code;
}

function attendApplyDel(aaCode){
	console.log(event.currentTarget);
	console.log(event.target);
	event.stopPropagation();
	console.log("apCode : ", aaCode);
	
	let data = {
			aaCode : aaCode
	}
//     let token1 = $("meta[name='_csrf']").attr("content");
//     let header1 = $("meta[name='_csrf_header']").attr("content");
    
//     console.log("token1 : ", token1);
//     console.log("header1 : ", header1);
	
	$.ajax({
		method: "POST",
		url: "/attend/deleteAttendApply",
		data: JSON.stringify(data),
		contentType: "application/json;charset=UTF-8",
		dataType: "text",
		beforeSend: function(xhr){
			console.log("ppp");
			xhr.setRequestHeader(header, token);
		},
		success: function(result){
			console.log("민지 성공 ",result);
// 			alert("취소완료");
			swal({
	 			title: "공결신청이 취소되었습니다.",
	 			icon: "success",
	 		});
			getAttendApplyList();
		},
		error: function(){

		}
	});
	
}

// 자동완성 버튼
function autoCompleteAaBtn(){
	$(":radio[name='aa_reason'][value='교육과정에 의한 현장실습/대외활동']").attr('checked', true);
	$("#aa_detail").val("취업 준비를 위한 대외활동에 참여하여 수업에 참여하지 못했습니다. 공결 승인 부탁드립니다.");
}

</script>

