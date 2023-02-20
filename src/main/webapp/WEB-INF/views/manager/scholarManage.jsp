<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<style>
#scholarTotalListSpace td{
	text-align: center;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;장학 관리<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a
						href="/scholarManage">장학 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-8">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold" style="display: inline-block;">장학금 승인 관리</h5>&nbsp;&nbsp;&nbsp;
					<a href="/scholarListManage">
						<button type="button" class="btn mb-1 btn-outline-dark">장학금 종류 관리>></button>
					</a>
				</div>
				<div class="table-responsive scholarManage custom-table1" id="scholarTotalListSpace">
					<!--
						동적 table insert 위치
					-->
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-4">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold">장학금 신청 상세 내역</h5>
				</div>
				<p class="text-muted">
					※ 장학금별
					<code>증빙서류</code>
					확인 후 상태값을 변경해주십시오.
				</p>
				<hr />
				<form id="scholarApprovalForm" class="form-valide" novalidate="novalidate">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">신청번호</label>
						<div class="col-sm-8">
							<input type="text" class="form-control input-default" placeholder="신청번호"
								readonly="readonly" id="scha_no" name="scha_no">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">학번 </label>
						<div class="col-sm-8">
							<input type="text" class="form-control input-default" placeholder="신청 학생의 학번"
								readonly="readonly" id="smem_no">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">신청장학금명</label>
						<div class="col-sm-8">
							<input type="text" class="form-control input-default" placeholder="신청 장학금 명칭"
								disabled="disabled" id="schl_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">신청일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control input-default" placeholder="신청 날짜"
								disabled="disabled" id="scha_date">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">첨부파일</label>
						<div class="col-sm-8" id="scha_file"></div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">상태</label>
						<div class="col-sm-8">
							<div class="form-group">
								<label class="radio-inline mr-3">
									<input type="radio" name="scha_state" value="0" onchange="getSchaState(this)"> <span class="badge badge-dark">대기</span>
								</label>
								<label class="radio-inline mr-3">
									<input type="radio" name="scha_state" value="1" onchange="getSchaState(this)"> <span class="badge badge-success">승인</span>
								</label>
								<label class="radio-inline">
									<input type="radio" name="scha_state" value="2" onchange="getSchaState(this)"> <span class="badge badge-danger">반려</span>
								</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-form-label">반려 사유</label>
					</div>
					<div class="form-group row is-invalid">
						<div class="col-lg-12">
							<textarea class="form-control" id="scha_reject" name="scha_reject"
								name="val-suggestions" rows="5"
								placeholder="반려 시에는 반려 사유를 상세히 입력해주십시오." style="height: 129px;"
								aria-required="true" aria-describedby="val-suggestions-error"
								aria-invalid="true" readonly="readonly"></textarea>
							<div id="val-suggestions-error"
								class="invalid-feedback animated fadeInDown"
								style="display: block;">반려 시에는 반려 사유를 상세히 입력해주십시오</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-4 col-form-label">상태 결정일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control input-default" placeholder="상태 결정일"
								disabled="disabled" id="scha_cdate" name="scha_cdate">
						</div>
					</div>

					<div class="form-group row">
						<div class="col-lg-8 ml-auto">
							<input type="submit" class="btn mb-1 btn-primary custom-btn-m" value="결정" id="scholarApprovalBtn">
							<input type="button" class="btn mb-1 btn-outline-dark" onclick="autoValue()" value="반려자동완성">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	// 반려사유 자동 값 채우기
	function autoValue(){
		let frm = document.querySelector("#scholarApprovalForm");
		frm.scha_state.value = "2";
		document.querySelector("#scha_reject").value = "증빙 서류 보완이 필요합니다.";
	}

	// 스프링 인증 토큰
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';

	// TotalList를 뿌릴 id
	const scholarTotalListSpace = document
			.querySelector("#scholarTotalListSpace");

	// 값을 적절한 위치에 출력하기 위한 id 혹은 name
	// scha_no, smem_no, schl_name, scha_date, scha_file, scha_state
	let scha_no = document.querySelector("#scha_no");
	let smem_no = document.querySelector("#smem_no");
	let schl_name = document.querySelector("#schl_name");
	let schl_code = document.querySelector("#schl_code");
	let scha_date = document.querySelector("#scha_date");
	let scha_file = document.querySelector("#scha_file");
	let scha_state = document.getElementsByName("scha_state");
	let scha_reject = document.querySelector("#scha_reject");
	let scha_cdate = document.querySelector("#scha_cdate");

	// 결정 폼
	const scholarApprovalForm = document.querySelector("#scholarApprovalForm");

	// 반려 사유 작성 양식
	const reasonForReturns = document.querySelectorAll(".reasonForReturn");
	
	// 결정 submit 버튼
	const scholarApprovalBtn = document.querySelector("#scholarApprovalBtn");

	// DOMContentLoaded시 scholarTotalList() 호출
	window.addEventListener("DOMContentLoaded", function() {
		scholarTotalList();
	});


	//let fileArr = [];
	//let pathArr = [];
	function scholarTotalList() {
		let xhr = new XMLHttpRequest();
		xhr.open("get", "/scholarManage/totalList", true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				let data = JSON.parse(xhr.responseText);
				let tblStr = "<table class='table table-hover' id='scholarTotalTable'>";
				tblStr += "<thead class='custom-theader-m'>";
				tblStr += "<tr draggable='false'>";
				tblStr += "<th width='5%;'>No.</th><th>신청번호</th><th>학번</th><th>신청장학금명</th><th>신청일</th><th>첨부파일</th><th>상태</th><th>결정일</th></tr></thead>";
				tblStr += "<tbody style='height:710px;'>";
	
				
				if(data.length == 0){
					tblStr += "<tr><td colspan='7' style='text-align:center;'>장학금 신청 건이 존재하지 않습니다.</td></tr>";
				}

				for (let i = 0; i < data.length; i++) {
					for (let j = 0; j < data[i].scholarApplyList.length; j++) {
						let no = data[i].scholarApplyList[j].scha_number; // 장학금신청번호
						let vscha_no = data[i].scholarApplyList[j].scha_no; // 장학금신청번호
						let vsmem_no = data[i].scholarApplyList[j].smem_no; // 신청학생학번
						let vschl_name = data[i].schl_name; // 신청장학금명
						let vschl_code = data[i].schl_code; // 신청장학금코드
						let vscha_date = data[i].scholarApplyList[j].scha_date.substring(0, 10); // 신청일
						let vscha_state = data[i].scholarApplyList[j].scha_state; // 상태

						let vscha_cdate = data[i].scholarApplyList[j].scha_cdate;
						if (vscha_cdate == null) {
							vscha_cdate = "-";
						} else {
							vscha_cdate = vscha_cdate.substring(0, 10);
						}

						let vscha_reject = data[i].scholarApplyList[j].scha_reject;

						// console.log("파일리스트:",data[i].scholarApplyList[j].schaFileList);

						// let files = {};
						// let paths = {};
						let file_path_arr = [];
						let file_originnm_arr = [];

						for (let k = 0; k < data[i].scholarApplyList[j].schaFileList.length; k++) {
							file_originnm_arr[k] = data[i].scholarApplyList[j].schaFileList[k].file_originnm;
							file_path_arr[k] = data[i].scholarApplyList[j].schaFileList[k].file_path;
						}
						// fileArr.push(files)
						// pathArr.push(paths)

						// console.log("체크1:",file_originnm_arr);
						// console.log("체크2:",file_path_arr);

						tblStr += `<tr>`;
						tblStr += `<td width='5%;'>\${no}</td>`;
						tblStr += `<td>\${vscha_no}</td>`;
						tblStr += `<td>\${vsmem_no}</td>`;
						tblStr += `<td>\${vschl_name}</td>`;
						tblStr += `<td>\${vscha_date}</td>`;

						tblStr += "<td>";

						for (let s = 0; s < file_path_arr.length; s++) {
							tblStr += "<a href='" + file_path_arr[s]
						       +    "' download='" + file_originnm_arr[s] + "'>"
									+ file_originnm_arr[s] + "</a><br/>";
						}
						tblStr += "</td>";

						switch (vscha_state) {
						case 0:
							tblStr += '<td><span class="badge badge-dark">대기</span></td>';
							break;
						case 1:
							tblStr += '<td><span class="badge badge-success">승인</span></td>';
							break;
						case 2:
							tblStr += "<td><span class='badge badge-danger'>반려</span></td>";
							break;
						default:
							tblStr += "<td>-</td>";
							break;
						}
						;

						tblStr += `<td>\${vscha_cdate}</td>`;
					}
					;
				}
				;

				tblStr += `</tbody>`;
				scholarTotalListSpace.innerHTML = tblStr;

				getScholarDetails();

			}
			;
		}
		xhr.send();
	}


	function getScholarDetails() {
		// 리스트에서 tr클릭시 상세내역 테이블에서 동적으로 조회 
		const trTags = document.querySelectorAll("#scholarTotalTable tbody tr");
		const scholarDetailSpace = document.querySelector("#scholarDetailSpace");

		trTags.forEach(function(trTag) {
			trTag.addEventListener("click", function(event) {
				
				let clickBg = document.querySelector(".clickBg");
				if(clickBg){
					clickBg.classList.remove("clickBg");
				}
				this.classList.add('clickBg');

				
				
				let tdText = event.target.parentElement.innerHTML;
				tdText = tdText.replace(/<td>/g, '').replace(/<\/td>/g, '?'); // ,는 파일명에 들어갈 수 있으므로 파일명으로 안 들어가는 문자인 ?로 대체
				// scholarDetailSpace.innerHTML = tdText;
				let tdArr = tdText.split('?');
				
				console.log(tdArr);

				// tdArr[5]는 상태
				console.log()
				if (tdArr[6].includes("대기")) {
					tdArr[6] = 0;
				} else if (tdArr[6].includes("승인")) {
					tdArr[6] = 1;
				} else if (tdArr[6].includes("반려")) {
					tdArr[6] = 2;
				}

				// 값을 적절한 위치에 출력하기 위해 id 혹은 name을 상단에 변수로 선언해두었다.
				if (event.target.parentElement !== event.currentTarget)
					return; // 자식 요소(a태그, 버튼)의 이벤트 발생 방지

				scha_no.value = tdArr[1];
				smem_no.value = tdArr[2];
				schl_name.value = tdArr[3];
				scha_date.value = tdArr[4];
				scha_file.innerHTML = tdArr[5];

				// 체크박스 반영하기
				for (let i = 0; i < scha_state.length; i++) {
					if (scha_state[i].getAttribute("value") == tdArr[6]) {
						scha_state[i].checked = true;
						
						if(scha_state[1].checked || scha_state[2].checked){ // 이미 승인되거나 반려 처리된 경우 내용 변경 불가하도록 변경
							scha_state[0].disabled = true;
							scha_state[1].disabled = true;
							scha_state[2].disabled = true;
							scholarApprovalBtn.disabled = true;
						}else{
							scha_state[0].disabled = false;
							scha_state[1].disabled = false;
							scha_state[2].disabled = false;
							scholarApprovalBtn.disabled = false;
						}	
					}
				}

				scha_cdate.value = tdArr[7];
				
				if(tdArr[8] == ''){
					scha_reject.value = "작성된 반려 사유가 없습니다.";
				}else{
					scha_reject.value = tdArr[8];
				}

			});

		});
	}

	// radio에서 반려 선택시 반려 사유 textarea를 활성화
	function getSchaState(radio){
		let vscha_state = radio.value;
		if(vscha_state == 2){ 
			scha_reject.readOnly = false;
		}else{
			console.log(scha_reject.readOnly);
			scha_reject.readOnly = true;
		}
	}

	// approval 결정 폼 전송
	scholarApprovalForm.addEventListener("submit", function(){
		event.preventDefault();
		const scha_no_value = scha_no.value; // 장학금 신청 번호
		const scha_state_value = document
				.querySelector("input[type=radio][name=scha_state]:checked").value; // 체크된 값 가져오기
		const scha_reject_value = scha_reject.value;
				
		// 체크된 값이 0(대기)일 경우 폼 전송 진행 안함
		if(scha_state_value == 0){
			swal({
			   text: "변경된 내용이 없습니다. 상태를 선택 후 결정해주십시오.",
			   icon: "info",
	           buttons:{
	              select:"확인"
	           }
	        })
			return false;
		}
		
		let formData = new FormData(scholarApprovalForm);

		let xhr = new XMLHttpRequest();
		xhr.open("post", "/scholarManage/approveScholarship", true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(JSON.parse(xhr.responseText));
   				swal({
					  title: "결정 성공", 
					  text : "성공적으로 결정되었습니다",
					  icon: "success",
			          buttons:{
				              select:"확인"
				      }
					}).then((value) => { 							
						scholarTotalList();
						scholarApprovalForm.reset();
						scha_file.innerHTML = "";
					})				
			}
		}
		xhr.send(formData);	
	})

</script>