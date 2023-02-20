<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
#unannounTuiListSpace input[type="checkbox"]:after {
	border: 1px solid #191919;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;등록금 관리<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a
						href="/tuition/manage">등록금 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-6 col-sm-12">
		<div class="card gradient-4">
			<div class="card-body">
				<h3 class="card-title text-white" id="firstTuiTitle">년 학기</h3>
				<div style="display: flex;">				
					<div>
						<div style="display: inline-block; justify-content:space-between;">
							<h2 class="text-white" style="display: inline-block;">등록금 납부현황</h2>
							<!-- 버튼 트리거 모달 시작 -->
							<div class="bootstrap-modal">
								<!-- 버튼 트리거 모달 -->
								<button type="button" class="btn mb-1 custom-btn-m" data-toggle="modal" data-target="#exampleModalCenter" id="firstTuiBtn" disabled="disabled">등록금 납부기간이 아닙니다.</button>
								<div class="modal fade" id="exampleModalCenter"
									style="display: none;" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">등록금 일괄 고지</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span>×</span>
												</button>
											</div>
											<div class="modal-body">
												<h4 class="card-title m-b-40" style="display: inline-block;">최초 등록금 메뉴 오픈 시 등록금을 일괄 고지합니다.</h4>
												<ul class="list-icons">
													<li class="text-muted"><i class="fa fa-check text-dark"></i> 일괄 등록금 고지 후에는 &lt;등록금 미고지 학생명단&gt;에서 개별 학생을 선택하여 등록금을 고지할 수 있습니다.<br/></li>
													<li class="text-muted"><i class="fa fa-check text-dark"></i> 등록금 고지서 발송시 개별 학생의 계정에 알림을 보내며, 개별 학생은 본인의 등록금 메뉴에서 등록금 고지서를 출력할 수 있습니다.<br/></li>
													<li class="text-muted"><i class="fa fa-check text-dark"></i> 고지 후에도 등록금 고지 학생명단에서 납부유무를 확인하여 알림을 보낼 수 있습니다.<br/></li>
												</ul>
												<div class="alert alert-info" id="alertOneSeme" style="display: none;"></div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn mb-1 btn-outline-dark"
													data-dismiss="modal">닫기</button>
												<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="notifyTuiEnrolled(1)">등록금 일괄 고지하기>></button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 버튼 트리거 모달 종료 -->
						</div>
						<p class="text-white mb-0">납부인원 / 고지인원</p>
					</div>
				</div>
				<c:choose>
					<c:when test="${semester eq 1}">
						<h5 class="text-white mb-0" id="paymentRate2">
							<span>${paidCnt }</span>&nbsp;/
							<span>${totalCnt }</span>
							<c:choose>
								<c:when test="${paidCnt eq 0 || totalCnt eq 0 }">
									<span class="float-right">0%</span>
								</c:when>
								<c:otherwise>
									<span class="float-right">${Math.floor(paidCnt/totalCnt*100) }%</span>
								</c:otherwise>
							</c:choose>
						</h5>
						<div class="progress" style="height: 9px">
							<div class="progress-bar bg-danger wow  progress-"
								style="width: ${paidCnt/totalCnt*100 }%;" role="progressbar">
							<span class="sr-only">${paidCnt/totalCnt*100 }% Complete</span>
						</div>
						</div>
					</c:when>
					<c:otherwise>
						<h5 class="text-white mb-0" id="paymentRate1">
							<span>0</span>&nbsp;/ <span>0</span> <span class="float-right">0%</span>
						</h5>
						<div class="progress" style="height: 9px">
							<div class="progress-bar bg-success wow  progress-"
								style="width: 0%;" role="progressbar">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-sm-12">
		<div class="card gradient-3">
			<div class="card-body">
				<h3 class="card-title text-white" id="secondTuiTitle">년 학기</h3>
				<div style="display: flex;">				
					<div>
						<div style="display: inline-block; justify-content:space-between;">
							<h2 class="text-white" style="display: inline-block;">등록금 납부현황</h2>
							<!-- 버튼 트리거 모달 시작 -->
							<div class="bootstrap-modal">
								<!-- 버튼 트리거 모달 -->
								<button type="button" class="btn mb-1 custom-btn-m" data-toggle="modal" data-target="#exampleModalCenter2" id="secondTuiBtn" disabled="disabled">등록금 납부기간이 아닙니다</button>
								<div class="modal fade" id="exampleModalCenter2"
									style="display: none;" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">등록금 일괄 고지</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span>×</span>
												</button>
											</div>
											<div class="modal-body">
												<h4 class="card-title m-b-40" style="display: inline-block;">최초 등록금 메뉴 오픈 시 등록금을 일괄 고지합니다.</h4>
												<ul class="list-icons">
													<li class="text-muted"><i class="fa fa-check text-success"></i> 일괄 등록금 고지 후에는 &lt;등록금 미고지 학생명단&gt;에서 개별 학생을 선택하여 등록금을 고지할 수 있습니다.</li>
													<li class="text-muted"><i class="fa fa-check text-success"></i> 등록금 고지서 발송시 개별 학생의 계정에 알림을 보내며, 개별 학생은 본인의 등록금 메뉴에서 등록금 고지서를 출력할 수 있습니다.</li>
													<li class="text-muted"><i class="fa fa-check text-success"></i> 고지 후에도 등록금 고지 학생명단에서 납부유무를 확인하여 알림을 보낼 수 있습니다.</li>
												</ul>
												<div class="alert alert-info" id="alertTwoSeme" style="display: none;"></div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn mb-1 btn-outline-dark"
													data-dismiss="modal">닫기</button>
												<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="notifyTuiEnrolled(2)">등록금 일괄 고지하기>></button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 버튼 트리거 모달 종료 -->							
						</div>
						<p class="text-white mb-0">납부인원 / 고지인원</p>
					</div>
				</div>
				<c:choose>
					<c:when test="${semester eq 2}">
						<h5 class="text-white mb-0" id="paymentRate2">
							<span>${paidCnt }</span>&nbsp;/
							<span>${totalCnt }</span>
							<span class="float-right">${Math.floor(paidCnt/totalCnt*100) }%</span>
						</h5>
						<div class="progress" style="height: 9px">
							<div class="progress-bar bg-danger wow  progress-"
								style="width: ${paidCnt/totalCnt*100 }%;" role="progressbar">
							<span class="sr-only">${paidCnt/totalCnt*100 }% Complete</span>
						</div>
						</div>
					</c:when>
					<c:otherwise>
						<h5 class="text-white mb-0" id="paymentRate1">
							<span>0</span>&nbsp;/ <span>0</span> <span class="float-right">0%</span>
						</h5>
						<div class="progress" style="height: 9px">
							<div class="progress-bar bg-success wow  progress-"
								style="width: 0%;" role="progressbar">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<ul class="nav nav-pills mb-3">
					<li class="nav-item">
						<a href="#navpills-1" class="nav-link" data-toggle="tab" aria-expanded="false" id="unanountuiListBtn" onclick="getUnannouncedTui()">등록금 미고지 학생 명단</a>
					</li>
					<li class="nav-item">
						<a href="#navpills-2" class="nav-link active show" data-toggle="tab" aria-expanded="false" id="anountuiListBtn">등록금 고지 학생 명단</a>
					</li>
				</ul>
				<div class="tab-content br-n pn" class="unannounTuiList">
					<div id="navpills-1" class="tab-pane">
						<div class="row align-items-center">
							<div class="col-lg-12">
								<div class="table-responsive custom-table1">
									<table class="table table-hover">
										<thead class="custom-theader-m">
											<tr>
												<td colspan="7" style="text-align: left;">
													<button type="button" class="btn mb-1 btn-outline-dark" onclick="selectEnrollAll(this)">
														<i class="fa-solid fa-check"></i>전체 선택
													</button>
													<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="totalEnroll(this)">일괄 고지하기</button>
												</td>
											</tr>
											<tr>
												<th></th>
												<th>No</th>
												<th>년도/학기</th>
												<th>학번</th>
												<th>수업료</th>
												<th>장학금</th>
												<th>납부총액</th>
												<th>고지하기</th>
											</tr>
										</thead>
										<tbody id="unannounTuiListSpace" style="height: 380px;">
										<!-- 등록금 미고지 학생 명단  -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div id="navpills-2" class="tab-pane active show">
						<div class="row align-items-center">
							<div class="col-lg-12">
								<div class="ag-theme-alpine" id="announTuiListSpace" style="height:400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	// 스프링 인증 토큰
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';

	// year, month
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth() + 1;
	let semester = (month == 1 || month == 2) ? 1 : (month == 7 || month == 8) ? 2 : null;

	// 1학기/2학기 대제목
	const firstTuiTitle = document.querySelector("#firstTuiTitle");
	const secondTuiTitle = document.querySelector("#secondTuiTitle");

	// 1학기/2학기 등록금 납부기간 오픈 버튼
	const firstTuiBtn = document.querySelector("#firstTuiBtn");
	const secondTuiBtn = document.querySelector("#secondTuiBtn");
	
	// 1학기/2학기 등록 알림창
	const alertOneSeme = document.querySelector("#alertOneSeme");
	const alertTwoSeme = document.querySelector("#alertTwoSeme");
	
	// 등록금 미고지/고지 명단 출력 버튼
	const unanountuiListBtn = document.querySelector("#unanountuiListBtn");
	const anountuiListBtn = document.querySelector("#anountuiListBtn");
	
	// 등록금 미고지 명단/등록금 고지명단 출력할 div
	const unannounTuiListSpace = document.querySelector("#unannounTuiListSpace");
	const announTuiListSpace = document.querySelector("#announTuiListSpace");
	
	// 납부율을 나타내는 클래스
	const paymentRate1 = document.querySelector("#paymentRate1");
	const paymentRate2 = document.querySelector("#paymentRate2");
	
	// 전체 선택 체크박스, 자식 체크박스
	const chkAll = document.querySelector(".chkAll");
	const chkbox = document.querySelectorAll(".chkbox");
	
	
	// onload 시 올해 년도 데이터를 가져와 title명을 변경
	window.onload = function() {

		firstTuiTitle.textContent = year + "년 1학기";
		secondTuiTitle.textContent = year + "년 2학기";

		checkTuiOpen();
		
		getAnnouncedTui();
	}

	// 등록금 오픈 가능 여부를 판단하여 버튼의 활성화/비활성화를 결정하는 함수
	// - 1~2월인 경우 1학기 등록금 오픈 가능, 7~8월인 경우 2학기 등록금 오픈 가능
	function checkTuiOpen() {
		const enrl_year = year; // 2022 (4자리 년도)
		const enrl_semester = semester; // 1 혹은 2 (1학기/2학기)

		let xhr = new XMLHttpRequest();
		let url = "/tuition/manage/check/" + enrl_year + "/" + enrl_semester;
		xhr.open("get", url, true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let cnt = xhr.responseText;
				if (cnt == 0 && semester == 1) {
					firstTuiBtn.disabled = false;
					firstTuiBtn.textContent = "1학기 등록금 납부 관리를 시작하세요";
				}else if(cnt > 0 && semester == 1){
					firstTuiBtn.textContent = "1학기 등록금 납부 관리가 이미 시작되었습니다.";
					/*
					paymentRate1.children[1].innerHTML = cnt; 
					console.log("paymentRate1.children[1].innerHTML값은");
					console.log(cnt);
					let paymentRate = Math.floor((parseInt(paymentRate1.children[0].textContent) / parseInt(cnt))* 100);
					console.log("paymentRate의 값은");
					console.log(paymentRate);
					paymentRate1.children[2].textContent = paymentRate + "%";
					paymentRate1.nextElementSibling.children[0].style.width = paymentRate + "%";
					*/
				}
				if (cnt == 0 && semester == 2) {
					secondTuiBtn.disabled = false;
					secondTuiBtn.textContent = "2학기 등록금 납부 관리를 시작하세요";
				}else if(cnt > 0 && semester == 2){
					secondTuiBtn.textContent = "2학기 등록금 납부 관리가 이미 시작되었습니다.";
					
					/*
					paymentRate2.children[1].innerHTML = cnt; 
					let paymentRate = Math.floor((parseInt(paymentRate2.children[0].textContent) / parseInt(cnt))* 100);
					paymentRate2.children[2].textContent = paymentRate + "%";
					paymentRate2.nextElementSibling.children[0].style.width = paymentRate +  "%";
					*/
				}
				
			}
		}
		xhr.send();
	}
	
	// 최초 오픈시 모든 재학생들에게 등록금을 고지하는 함수(매개변수 학기)
	function notifyTuiEnrolled(semester){
		let enrl_year = year;
		let enrl_semester = semester;
		
		let xhr = new XMLHttpRequest();
		let url = "/tuition/manage/notifyTuiEnrolled/" + enrl_year + "/" + enrl_semester;
		xhr.open("get", url, true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let successCnt = xhr.responseText;
				if(enrl_semester == 1){
					alertOneSeme.innerHTML= "재학생 " + successCnt + "명에게 " + enrl_year + "년 " +  enrl_semester +"학기 장학금을 일괄 고지하였습니다."
					                        + "2초 뒤에 화면이 새로고침됩니다.";
					alertOneSeme.style.display = "block";
					setTimeout(function() {
						location.href = location.href;
					}, 2000);
				}else{
					alertTwoSeme.innerHTML= "재학생 " + successCnt + "명에게 " + enrl_year + "년 " +  enrl_semester +"학기 장학금을 일괄 고지하였습니다."
											+ "2초 뒤에 화면이 새로고침됩니다.";
					alertTwoSeme.style.display = "block";	
					setTimeout(function() {
						location.href = location.href;
					}, 2000);
				}
			}
		}
		xhr.send();
	}

	// 등록금 미고지 학생명단을 조회하는 함수
	function getUnannouncedTui(){
		let enrl_year = year;
		let enrl_semester = semester;

		let xhr = new XMLHttpRequest();
		let url = "/tuition/manage/getUnannouncedTui/" + enrl_year + "/" +  enrl_semester;
		xhr.open("get", url, true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let jsonData = JSON.parse(xhr.responseText);
				template_getUnannouncedTui(jsonData);
			}
		}
		xhr.send();
	}
	
	function template_getUnannouncedTui(data){
		console.log(data);
		let str ="";
		if(data.length == 0){
			str += "<tr><td colspan='8' style='text-align:center;'>등록금 미고지 학생이 없습니다.</td></tr>";
		}
		
		for(let i = 0; i < data.length; i++){
			
			let enrl_fee = `\${data[i].enrl_fee}`;
			enrl_fee =enrl_fee.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			let scholarship = `\${data[i].scholarship}`;
			scholarship = scholarship.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			(scholarship == 0) ? scholarship = "" : scholarship;
			
			let enrl_total = `\${data[i].enrl_total}`;
			enrl_total = enrl_total.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			str += `<tr>`;
			
			str += "<form>";
			str += "<input type='hidden' name='enrl_year' value='"+ data[i].enrl_year +"'/>";
			str += "<input type='hidden' name='enrl_semester' value='"+ data[i].enrl_semester +"'/>";
			str += "<input type='hidden' name='enrl_fee' value='"+ data[i].enrl_fee +"'/>";
			str += "<input type='hidden' name='enrl_admiss' value='"+ data[i].enrl_admiss +"'/>";
			str += "<input type='hidden' name='scholarship' value='"+ data[i].scholarship +"'/>";
			str += "<input type='hidden' name='enrl_total' value='"+ data[i].enrl_total +"'/>";
			str += "<input type='hidden' name='smem_no' value='"+ data[i].smem_no +"'/>";
			
			str += `<td><input type="checkbox"/></td>`;
			str += `<td>\${data.length - (data.length -(i+1))}</td>`;
			str += `<td>\${year}-0\${semester}</td>`;
			str += `<td>\${data[i].smem_no}</td>`;
			str += `<td>\${enrl_fee}</td>`;
			str += `<td>\${scholarship}</td>`;
			str += `<td>\${enrl_total}</td>`;
			str += "<td><button type='button' class='btn mb-1 btn-primary custom-btn-m' onclick='informTheRestStu(this)'>고지하기</button></td>";
			str += `</tr>`;
			str += "</form>";
		}
		unannounTuiListSpace.innerHTML = str;	
	}
	
	// 등록금 미고지 상태인 개별 학생에게 등록금을 고지하는 함수
	function informTheRestStu(ithis){
        let data = ithis.parentElement.parentElement;
        
        let enrl_year = data.children[1].value;
        let enrl_semester = data.children[2].value;
        let enrl_fee = data.children[3].value;
        let enrl_admiss = data.children[4].value;
        let scholarship = data.children[5].value;
        let enrl_total = data.children[6].value;
        let smem_no = data.children[7].value;
        
       //  console.log(enrl_year + enrl_semester + enrl_fee + enrl_admiss + scholarship + enrl_total);
        
        let map = {
        		enrl_year : enrl_year,
        		enrl_semester : enrl_semester,
        		enrl_fee : enrl_fee,
        		enrl_admiss : enrl_admiss,
        		scholarship : scholarship,
        		enrl_total : enrl_total,
        		smem_no : smem_no
        };
        
    	let xhr = new XMLHttpRequest();
    	xhr.open("post", "/tuition/manage/informTheRestStu", true);
    	xhr.setRequestHeader(header, token);
    	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    	xhr.onreadystatechange = function(){
    		if(xhr.readyState == 4 && xhr.status == 200){
    			let check = xhr.responseText;
    			if(check == 1){
					swal({
						   title: "성공",
						   text: "성공적으로 등록금을 고지하였습니다.",
						   icon: "success",
				           buttons:{
				              select:"확인"
				           }
				        }).then((value) => { 
		    				getUnannouncedTui();
				        });
    			}else{
					swal({
						   title: "실패",
						   text: "등록금 고지에 실패했습니다. 추후에 다시 시도해주십시오.",
						   icon: "danger",
				           buttons:{
				              select:"확인"
				           }
				        });
    			}
    		}
    	}
    	xhr.send(JSON.stringify(map));
        
	}
	
	// 등록금 미고지상태인 학생을 일괄 선택하거나 일괄 해제하는 함수
	function selectEnrollAll(sthis){   		
   		let unannounTui = unannounTuiListSpace.children;
   		
   		for(let i = 0; i < unannounTui.length; i++){
   			let check = unannounTui[i].children[8].children[0].checked;
   			if(check){   				
	   			unannounTui[i].children[8].children[0].checked = false;   			
   			}else{
   				unannounTui[i].children[8].children[0].checked = true;   	
   			}
   		}
	}
	
	

	// 등록금 고지 학생명단을 조회하는 함수
	function getAnnouncedTui(){
		let enrl_year = year;
		let enrl_semester = semester;

		let url = "/tuition/manage/getAnnouncedTui/" + enrl_year + "/" + enrl_semester;
		let xhr = new XMLHttpRequest();
		xhr.open("get", url, true);
    	xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let jsonData = JSON.parse(xhr.responseText);
				console.log(jsonData);
				template_getAnnouncedTui(jsonData);
			}
		}
		xhr.send();
	}

	//등록금 고지 학생명단을 조회하는 함수의 템플릿
	function template_getAnnouncedTui(data){
		
		data.map((item) => {
			// console.log(item);
			item.enrl_year = item.enrl_year + "-0" + item.enrl_semester;
			if(item.enrl_date!=null){
				item.enrl_date = item.enrl_date.substring(0, 11);
			}
			item.enrl_fee = item.enrl_fee.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			item.scholarship = item.scholarship.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			(item.scholarship == 0) ? item.scholarship = "" : item;
			item.enrl_total = item.enrl_total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");	
			// item.enrl_date = item.enrl_date.substring(0, 11);
		});

		const columnDefs = [
			  { headerName:"No", field: "enrl_row_number" },
			  { headerName:"년도/학기", field: "enrl_year"},
			  { headerName:"학번", field: "smem_no" },
			  { headerName:"이름", field: "mem_name" },
			  { headerName:"수업료", field: "enrl_fee" },
			  { headerName:"장학금", field: "scholarship" },
			  { headerName:"납부총액", field: "enrl_total" },
			  { headerName:"납부일자", field: "enrl_date"}
			];
		
		const gridOptions = {
		  columnDefs: columnDefs,
		  rowData: data,
		  onGridReady: function (event) {
	            event.api.sizeColumnsToFit();
	      },
		  defaultColDef: {   // 기본적으로 컬럼에 적용할 옵션 선택
		    sortable:true,
		    filter:true,
		    resizable:true,
		    editable:false // 보통 grid처럼 한번에 많은 데이타를 보여주는 경우
		                     //view로만 사용하고 수정/삭제는 별도로 처리함
		  },
		  localeText: {noRowsToShow: '등록금 고지내역이 존재하지 않습니다.'},
		  pagination:true,
		  paginationAutoPageSize:true,
		  // paginationPageSize:8,
		  onCellClicked: param => {
		    // alert(param.value);
		  }
		};	
		
		new agGrid.Grid(announTuiListSpace, gridOptions);		
	}
	
	// 등록금 미고지 명단에서 체크박스 선택 후 선택 고지하는 함수
	function totalEnroll(tthis){
		if(unannounTuiListSpace.children.length == 0){
			swal({
				  title: "등록금을 고지할 학생이 없습니다.", 
				  icon: "info" 
				})
			return false;
		}
		
    	console.log(tthis);
    	let data = unannounTuiListSpace.children;
    	for(let i = 0; i < data.length; i++){
    		let check = unannounTuiListSpace.children[i].children[8].children[0].checked;
    		if(check){
    			informTheRestStu(unannounTuiListSpace.children[i].lastChild.children[0]);
    		}
    	}
	}
</script>