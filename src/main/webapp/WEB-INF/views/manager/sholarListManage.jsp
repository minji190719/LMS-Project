<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.scholarListManage tbody{
	height: 450px;
}

.col-form-label {
	font-size: medium;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;장학금 종류 관리<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a
						href="/scholarListManage">장학금 종류 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row justify-content-center scholarListManage">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<!-- 장학금 종류 등록 모달 시작 -->
					<div class="bootstrap-modal custom-right-array" style="display: inline-block;">
						<button type="button" class="btn mb-1 btn-primary custom-btn-m"
							data-toggle="modal" data-target="#exampleModal"
							data-whatever="@getbootstrap">장학금 종류 등록 >></button>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							style="display: none;" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">장학금 종류 등록</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<form id="schloarListInsertForm" class="form-valide" action="#"
										method="post" novalidate="novalidate">
										<div class="modal-body">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label" for="val-email">장학금명
													<span class="text-danger">*</span>
												</label>
												<div class="col-lg-7">
													<input type="text" class="form-control input-default"
														id="schl_name" name="schl_name"
														placeholder="장학금 명칭을 입력하십시오." required="required">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label" for="val-currency">장학금
													지급액 <span class="text-danger">*</span>
												</label>
												<div class="col-lg-7">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">금액</span>
														</div>
														<input type="number" class="form-control input-default"
															id="schl_price" name="schl_price"
															style="text-align: right;" min="100000" max="3000000"
															value="0" required="required">
														
														<div class="input-group-append">
															<span class="input-group-text">원</span>
														</div>
														<div class="button-group custom-right-array" style="margin-left: -5px;">
															<div class="btn-group">
																<button type="button"
																	class="btn mb-1 btn-light"
																	onclick="increasePrice(this)" value="10000">+1만원</button>
																<button type="button"
																	class="btn mb-1 btn-light"
																	onclick="increasePrice(this)" value="100000">+10만원</button>
																<button type="button"
																	class="btn mb-1 btn-light"
																	onclick="increasePrice(this)" value="1000000">+100만원</button>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-lg-5 col-form-label" for="val-website">장학금
													신청 시작일 <span class="text-danger">*</span>
												</label>
												<div class="col-lg-7">
													<input type="date" class="form-control input-default"
														id="schl_start" name="schl_start" required="required">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label" for="val-website">장학금
													신청 종료일 <span class="text-danger">*</span>
												</label>
												<div class="col-lg-7">
													<input type="date" class="form-control input-default"
														id="schl_end" name="schl_end" required="required">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label" for="val-phoneus">장학금
													지급 대상 <span class="text-danger">*</span>
												</label>
												<div class="col-lg-7">
													<input type="text" class="form-control input-default"
														id="schl_target" name="schl_target"
														placeholder="장학금 지급 대상을 입력하십시오." required="required">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label" for="val-digits">장학금
													증빙 서류명 <span class="text-danger">*</span>
												</label>
												<div class="col-lg-7">
													<input type="text" class="form-control input-default"
														id="schl_document" name="schl_document"
														placeholder="장학금 증빙서류 명칭을 입력하십시오." required="required">
												</div>
											</div>
											<div class="alert alert-danger" style="display: none;" id="successMessage">등록에 성공하였습니다. 곧 창이 닫힙니다.</div>
											<div class="alert alert-dark" style="display: none;" id="failMessage">등록에 실패했습니다. 추후에 다시 시도해주십시오. 곧 창이 닫힙니다.</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn mb-1 btn-outline-dark"
												data-dismiss="modal">닫기</button>
											<button type="submit"
												class="btn mb-1 btn-primary custom-btn-m">저장</button>
											<button type="button" onclick="autoValue()"
												class="btn mb-1 btn-outline-dark">자동완성</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- 장학금 종류 등록 모달 끝 -->
					<a href="/scholarManage">
						<button type="button" class="btn mb-1 btn-outline-dark">장학금
							승인 관리>></button>
					</a>
				</div>

				<div class="default-tab">
					<ul class="nav nav-tabs mb-3" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							data-toggle="tab" href="#home">전체</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#profile">진행중</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#message">마감</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="home" role="tabpanel">
							<div class="p-t-15">
								<div class="card-title">
									<h5 class="custom-m custom-bold">[전체] 장학금 종류</h5>
								</div>
								<div class="table-responsive custom-table1">
									<table class="table table-hover">
										<thead class="custom-theader-m">
											<tr>
												<th scope="col" width="5%;">No</th>
												<th scope="col" width="15%;">장학금명</th>
												<th scope="col" width="10%;">장학금액</th>
												<th scope="col" width="10%;">신청시작일</th>
												<th scope="col" width="10%;">신청종료일</th>
												<th scope="col" width="25%;">지급대상</th>
												<th scope="col" width="25%;">증빙서류명</th>
											</tr>
										</thead>
										<tbody id="totalScholarListSpace">
											<!-- 장학금 종류 전체 리스트 출력 위치  -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile">
							<div class="p-t-15">
								<div class="card-title">
									<h5 class="custom-m custom-bold">[진행중] 장학금 종류</h5>
								</div>
								<div class="table-responsive custom-table1">
									<table class="table table-hover">
										<thead class="custom-theader-m">
											<tr>
												<th scope="col" width="5%;">No</th>
												<th scope="col" width="15%;">장학금명</th>
												<th scope="col" width="10%;">장학금액</th>
												<th scope="col" width="10%;">신청시작일</th>
												<th scope="col" width="10%;">신청종료일</th>
												<th scope="col" width="25%;">지급대상</th>
												<th scope="col" width="25%;">증빙서류명</th>
											</tr>
										</thead>
										<tbody id="ongoingScholarListSpace">
											<!-- 장학금 종류 진행중 리스트 출력 위치  -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="message">
							<div class="p-t-15">
								<div class="card-title">
									<h5 class="custom-m custom-bold">[마감] 장학금 종류</h5>
								</div>
								<!-- 장학금 종류 마감 리스트 출력 위치  -->
								<div class="table-responsive custom-table1">
									<table class="table table-hover">
										<thead class="custom-theader-m">
											<tr>
												<th scope="col" width="5%;">No</th>
												<th scope="col" width="15%;">장학금명</th>
												<th scope="col" width="10%;">장학금액</th>
												<th scope="col" width="10%;">신청시작일</th>
												<th scope="col" width="10%;">신청종료일</th>
												<th scope="col" width="25%;">지급대상</th>
												<th scope="col" width="25%;">증빙서류명</th>
											</tr>
										</thead>
										<tbody id="endScholarListSpace">
											<!-- 장학금 종류 마감 리스트 출력 위치  -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


<script type="text/javascript">
	// 장학금 종류 등록 자동 값 채우기
	function autoValue(){
		document.querySelector("#schl_name").value = "봉사장학금";
		document.querySelector("#schl_price").value = 500000;
		document.querySelector("#schl_start").value = "2023-01-31";
		document.querySelector("#schl_end").value = "2023-03-02";
		document.querySelector("#schl_target").value = "학교에서 인정할 수 있는 기관이나 시설에서 학기당 120시간 이상 봉사한 경우";
		document.querySelector("#schl_document").value = "사회봉사증명서";
	}

	// 스프링 인증 토큰
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';

	const schloarListInsertForm = document
			.querySelector("#schloarListInsertForm");
	const schl_name = document.querySelector("#schl_name");
	const schl_price = document.querySelector("#schl_price");
	const schl_start = document.querySelector("#schl_start");
	const schl_end = document.querySelector("#schl_end");
	const schl_target = document.querySelector("#schl_target");
	const schl_document = document.querySelector("#schl_document");

	const totalScholarListSpace = document.querySelector("#totalScholarListSpace");
	const ongoingScholarListSpace = document.querySelector("#ongoingScholarListSpace");
	const endScholarListSpace = document.querySelector("#endScholarListSpace");

	window.addEventListener("DOMContentLoaded", function() {
		getTotalScholarList();
	})

	// 페이지 로딩시 scholar_list 전체 목록을 가져오는 함수
	function getTotalScholarList() {
		let xhr = new XMLHttpRequest();
		xhr.open("get", "/scholarListManage/list", true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let jsonData = JSON.parse(xhr.responseText);
				template_getTotalScholarList(jsonData);
			}
		}
		xhr.send();
	}

	// scholar_list 목록 출력 템플릿
	function template_getTotalScholarList(list) {
		let str = "";
		
		if(list.length == 0){
			str += '<tr><td colspan="7">등록된 장학금 정보가 없습니다.</td></tr>';
		}
		
		for (let i = 0; i < list.length; i++) {
			let schl_number = list[i].schl_number;
			// let schl_code = list[i].schl_code;
			// shl_code = schl_code.replace("SCHL", "");

			let schl_start = list[i].schl_start;
			schl_start = schl_start.substr(0, 10);

			let schl_end = list[i].schl_end;
			schl_end = schl_end.substr(0, 10);

			let endCheck = compareDates(schl_end); // 마감된 신청값인지 체크(진행중/마감)

			str += '<tr>';
			str += '<td scope="col" width="5%;">' + schl_number + '</td>';
			// str += '<td scope="col">' + shl_code + '</td>';
			str += '<td scope="col" width="15%;" style="text-align: left;">';

			if (endCheck == "진행중")
				str += "&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-pill badge-info'>" + endCheck + "</span>";
			else if(endCheck == "마감")
				str += "&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-pill badge-danger'>" + endCheck + "</span>";

			str += '&nbsp;&nbsp;' + list[i].schl_name;
			str += '</td>';
			str += '<td scope="col" width="10%;"><span class="badge badge-success px-2">'
					+ list[i].schl_price.toLocaleString('ko-KR')
					+ '</span>원</td>';
			str += '<td scope="col" width="10%;">' + schl_start + '</td>';
			str += '<td scope="col" width="10%;">' + schl_end + '</td>';
			str += '<td scope="col" width="25%;">' + list[i].schl_target + '</td>';
			str += '<td scope="col" width="25%;">' + list[i].schl_document + '</td>';
			str += '</tr>';
		}
		totalScholarListSpace.innerHTML = str;
		
		
		str = "";
		for (let i = 0; i < list.length; i++) {
			let check = totalScholarListSpace.children[i].children[1].children[0].innerHTML;
			if(check == "진행중"){
				str += "<tr>" + totalScholarListSpace.children[i].innerHTML + "</tr>";
			}
		}
		ongoingScholarListSpace.innerHTML = str;
	
		str = "";
		for (let i = 0; i < list.length; i++) {
			let check = totalScholarListSpace.children[i].children[1].children[0].innerHTML;
			if(check == "마감"){
				str += "<tr>" + totalScholarListSpace.children[i].innerHTML + "</tr>";
			}
		}
		endScholarListSpace.innerHTML = str;
	}

	// 금액 버튼 클릭시 증가되는 (1만원, 10만원) 함수
	function increasePrice(ithis) {
		let newPrice = parseFloat(ithis.value.replace(',', ''));
		let setPrice = parseInt(schl_price.value) + parseInt(newPrice);
		schl_price.value = setPrice;
	}

	// scholar_list에 장학금 종류를 추가하는 함수
	schloarListInsertForm.addEventListener("submit", function() {
		event.preventDefault();
		// 일단 유효성 검사
		/*
		if(!schl_name.value){
			alert("장학금명을 입력하세요.");
			schl_name.focus();
			return;
		}
		if(!schl_price.value){
			alert("장학금액을 입력하세요.");
			schl_price.focus();
			return;
		};
		if(!schl_start.value){
			alert("장학금 신청시작일을 입력하세요.");
			schl_start.focus();
			return;
		};
		if(!schl_end.value){
			alert("장학금 신청종료일 입력하세요.");
			schl_end.focus();
			return;
		};
		if(!schl_target.value){
			alert("장학금 지급대상을 입력하세요.");
			schl_target.focus();
			return;
		};
		if(!schl_document.value){
			alert("장학금 증빙서류를 입력하세요.");
			schl_document.focus();
			return;
		};
		*/
		
		let formData = new FormData(schloarListInsertForm);
		let xhr = new XMLHttpRequest();
		xhr.open("post", "/scholarListManage/register", true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let check = xhr.responseText;
				const successMessage =  document.querySelector("#successMessage");
				const failMessage =  document.querySelector("#failMessage");

				if(check == 0){				
					failMessage.style.display = "block";
					successMessage.style.display = "none";
				}else if(check == 1){
					successMessage.style.display = "block";
					failMessage.style.display = "none";
					
					setTimeout(function() {
						getTotalScholarList();
						schloarListInsertForm.children[1].children[0].click();
						successMessage.style.display = "none";
						schloarListInsertForm.reset();
					}, 2000);
				}

			}
		};
		xhr.send(formData);
	})

	// 오늘 날짜와 마감일을 비교하여 마감/진행 중 여부를 판단하는 함수 
	function compareDates(cDate) {
		let today = new Date(); // 오늘 날짜 가져오기 Wed Jan 11 2023 01:49:07 GMT+0900 (한국 표준시)와 같은 형태
		let tYear = today.getFullYear();
		let tMonth = today.getMonth() + 1;
		let tDay = today.getDate();

		if ((tMonth + "").length < 2) { // 이렇게 비교해야만 진행 가능 tMonth+""
			tMonth = 0 + "" + tMonth;
		}

		if ((tDay + "").length < 2) {
			tDay = 0 + "" + tDay;
		}
		today = tYear + tMonth + tDay; // 비교할 날짜 데이터와 같은 형식으로 만들어준다.

		let endCheckDate = cDate.replaceAll("-", ""); // 비교할 날짜 데이터와 같은 형식으로 만들어준다.

		if (endCheckDate >= today) {
			return "진행중";
		} else {
			return "마감";
		}
	}

</script>