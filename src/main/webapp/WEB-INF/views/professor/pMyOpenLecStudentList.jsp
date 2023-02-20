
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.mjLecStudentListTb{
	height: 550px;
	overflow: auto;
}
.mjFixedHeader {
	position: sticky;
	top: 0;
}
.pMyOpenLecStudentList .page-item a{
	background-color: #FFFFFFF !important;
	color : var(--custom-p) !important;
}

.pMyOpenLecStudentList .pagination .active a{
	background-color: var(--custom-p) !important;
	color : #FFFFFF !important;
}
.pMyOpenLecStudentList th:first-child{
	width: 5%;
}

.pMyOpenLecStudentList th:nth-child(4) {
	width: 20%;
}
</style>

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>강좌별수강생</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lad/pMyOpenLecStudentList">강좌별수강생</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

<div class="row pMyOpenLecStudentList">

	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-4">개설 강좌 조회</h5>
				</div>

					<div class="table-responsive text-center">
						<table class="table table-hover table-bordered zero-configuration" id="myOpenLecListTable">
							<thead class="custom-theader">
								<tr>
									<th>번호</th>
									<th>강의번호</th>
									<th>전공</th>
									<th>교과목명</th>
									<th>시간</th>
									<th>이수구분</th>
									<th>학기</th>
									<th>강의실</th>
								</tr>
							</thead>

							<tbody>

							</tbody>
						</table>
					</div>


			</div>
		</div>
	</div>

	<div class="col-md-12" id="lecPlanListBody">
		<div class="card" style="height : 714px;">
			<div class="card-body">
				<div class="card-title">
					<div class="d-flex justify-content-between p-2">
						<h5 class="font-weight-bold mb-4">수강생목록</h5>
						<select class="form-control input-default w-25" id="pSelectLecture" onchange="pSelectLectureFn()">
							<c:choose>
								<c:when test="${lecture eq null }">
									<option value="">등록된 강좌 없음</option>
								</c:when>
								<c:otherwise>
									<option value="" selected="selected">강좌선택</option>
									<c:forEach items="${lecture }" var="lecture">
										<option value="${lecture.LEC_CODE}">${lecture.LOL_NAME}</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>

					</div>
				</div>

				<div class="table-responsive mjLecStudentListTb text-center">
					<table class="table table-hover mjTable2">
						<thead class="mjFixedHeader" style="background-color:#EBEBEB;">
							<tr>
								<th>번호</th>
								<th>단과대학</th>
								<th>소속</th>
								<th>학년</th>
								<th>학번</th>
								<th>이름</th>
								<th>보기</th>
							</tr>
						</thead>

						<tbody id="pLecStudentList">
							<!-- 리스트 출력! -->
						</tbody>
					</table>
				</div>


			</div>
		</div>
	</div>

	<div class="col-md-5" id="lecPlanDetailBody" style="display: none;">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<div>
						<button type="button" class="close" onclick="sDetailClose()">×</button>
						<h5 class="font-weight-bold mb-4">학생정보</h5>
					</div>
					<hr>
					<div class="form-validation">
						<form name="myLecStuForm" class="form-valide" action="#"
							method="post">
							<div class="d-flex">
								<div style="width: 170px; height: 210px; margin: 5%;">
									<img id="myLecStuImg" src=""
										style="position: adsolute; width: 100%; height: 100%;">
								</div>
								<div class="flex-fill" style="margin-right: 3%;">
									<div class="form-group row" style="margin-top: 13%;">
										<label class="col-lg-3 col-form-label" for="myLecStuNo">
											번호 </label>
										<div class="col-lg-8">
											<input type="text" class="form-control input-default" id="myLecStuNo"
												name="myLecStuNo" readonly="readonly" value="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label" for="SMEM_NO">
											학번 </label>
										<div class="col-lg-8">
											<input type="text" class="form-control input-default" id="SMEM_NO"
												name="SMEM_NO" readonly="readonly">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label" for="MEM_NAME">
											이름</label>
										<div class="col-lg-8">
											<input type="text" class="form-control input-default" id="MEM_NAME"
												name="MEM_NAME" readonly="readonly">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row"
								style="margin-left: 3%; , margin-top: 3%;">
								<label class="col-lg-3 col-form-label" for="COL_NAME">소속대학</label>
								<div class="col-lg-8">
									<input type="text" class="form-control input-default" id="COL_NAME"
										name="COL_NAME" readonly="readonly">
								</div>
							</div>
							<div class="form-group row" style="margin-left: 3%;">
								<label class="col-lg-3 col-form-label" for="STU_DEP">전공</label>
								<div class="col-lg-8">
									<input type="text" class="form-control input-default" id="STU_DEP"
										name="STU_DEP" readonly="readonly">
								</div>
							</div>
							<div class="form-group row" style="margin-left: 3%;">
								<label class="col-lg-3 col-form-label"
									for="stu_joinyearnstu_semester">학년/학기</label>
								<div class="col-lg-8">
									<input type="text" class="form-control input-default"
										id="stu_joinyearnstu_semester"
										name="stu_joinyearnstu_semester" readonly="readonly" value="">
								</div>
							</div>
							<div class="form-group row" style="margin-left: 3%;">
								<label class="col-lg-3 col-form-label" for="MEM_TEL">전화번호</label>
								<div class="col-lg-8">
									<input type="text" class="form-control input-default" id="MEM_TEL"
										name="MEM_TEL" readonly="readonly">
								</div>
							</div>
							<div class="form-group row" style="margin-left: 3%;">
								<label class="col-lg-3 col-form-label" for="MEM_EMAIL">이메일</label>
								<div class="col-lg-8">
									<input type="text" class="form-control input-default" id="MEM_EMAIL"
										name="MEM_EMAIL" readonly="readonly">
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>

<script>
// 시큐리티용 토큰
let header = '${_csrf.headerName}';
 let token =  '${_csrf.token}';
 
 window.onload = function() {

		getLoadList();
		
	}

function getLoadList() {
			
	$.ajax({
		type : "GET",
		url : "/lad/getMyOpenLecList",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("리스트 결과 받아오기~~ ",result);
			tableTemplate(result);
			
		},
		error : function(){
			console.log("Error");
		}
	})	// ajax 끝
}

const tableTemplate = resultList => {
		
	let table = $("#myOpenLecListTable").DataTable();
	let cnt = 1;
	
	console.log("왜 안찍혀 ",resultList[0].LEC_CODE);
		
// 	$("label[for='myOpenLecListTable_filter']").text('검색 : ');
// 	let tbLabel = $("#myOpenLecListTable_filter").children();
	// let tbFilter = $("#myOpenLecListTable_filter").children('label:eq(0)');
	// let tbLength = $("#myOpenLecListTable_length").children('label:eq(0)');
	
//  tbLabel.text('검색 : '); 이렇게 냅다 넣으면 input 박스가 사라지는 불상사
// 	let txt = `검색 : <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="myOpenLecListTable">`;
	// tbFilter.text("");
	// tbLength.text("");

	$("#myOpenLecListTable_filter").remove();
	$("#myOpenLecListTable_length").remove();
	
	
	for(let i = 0; i < resultList.length; i++){
		if(resultList.length == 0){
			table.row.add([
				"<td colspan='6'>등록된 강좌가 없습니다.</td>"
			]).draw(false);
		}else{
			table.row.add([
				
				`<td>\${cnt}</td>`,
				`<td>\${resultList[i].LEC_CODE}</td>`,
				`<td>\${resultList[i].DEP_NAME}</td>`,
				`<td>\${resultList[i].LOL_NAME}</td>`,
				`<td>\${resultList[i].LOL_DAY1} (\${resultList[i].LOL_STARTIME1}~\${resultList[i].LOL_ENDTIME1})/\${resultList[i].LOL_DAY2} (\${resultList[i].LOL_STARTIME2}~\${resultList[i].LOL_ENDTIME2})</td>`,
				`<td>\${resultList[i].MAJOR_CULTURAL}/\${resultList[i].CHOICE_REQUIRE}</td>`,				
				`<td>\${resultList[i].LOL_YEAR}/\${resultList[i].LOL_SEMESTER}</td>`,	
				`<td>\${resultList[i].COL_NAME}/\${resultList[i].ROOM_NUM}</td>`		
			]).draw(false);
			cnt++;
		} 
	}

	let byText = $("#myOpenLecListTable_info");
	console.log(byText);
	byText.remove();
		
} 

function pSelectLectureFn(){
	let lecCode = document.getElementById("pSelectLecture").value;
	
	let pLecStudentList = document.getElementById("pLecStudentList");
	console.log("leccode" , lecCode)
	
	let data = {
		lec_code : lecCode,
	}

	$.ajax({
		method: "POST",
		url: "/lad/myLecStudentList",
		data : JSON.stringify(data),
		contentType: "application/json; charset=UTF-8",
		dataType: "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(result){
			console.log("찍어봅시다~!", result);
			pLecStudentList.innerHTML = stuListTemplate(result);
			
		},
		error: function(){

		}
		
	}) // ajax 끝
		
}

const stuListTemplate = stuList => {
	let code = "";
	let cnt = 1;
	
	for(let i = 0; i < stuList.length; i++){
		code += `
				<tr>
					<td>\${cnt}</td>
					<td>\${stuList[i].COL_NAME}</td>
					<td>\${stuList[i].STU_DEP}</td>
					<td>\${stuList[i].STU_SCHYEAR}</td>
					<td>\${stuList[i].SMEM_NO}</td>
					<td>\${stuList[i].MEM_NAME}</td>
					<td><button type="button"  class="btn mb-1 btn-rounded btn-primary btn-sm custom-btn-p" onclick="myLecStudentInfo('\${stuList[i].SMEM_NO}', \${cnt})">보기</button></td>
				</tr>
		`;
	 cnt++;
	}
	
	return code;
}

function myLecStudentInfo(smemNo, no){
	console.log("smemNo : ", smemNo);
	console.log("cnt : ", no);

	let data = {
		smem_no : smemNo
	}
	
	$.ajax({
		method: "POST",
		url: "/lad/getMyLecStudentInfo",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);	
		},
		success : function(result){
			console.log("학생정보result : ", result);
			console.log("cnt : ", no);
			$("#lecPlanListBody").attr('class', 'col-md-7')
			$("#lecPlanDetailBody").css("display","");
			formTemplate(result, no);
		},
		error : function(){

		}

	})
}

const formTemplate = (stuInfo, no)=>{
	console.log("값 " , no)
	
	const form = document.myLecStuForm;
	const elems = form.elements
	
	for(let i = 0; i < elems.length; i++){
		elems[i].value = stuInfo[elems[i].name]
	}
	
	// 번호 넣기
	let myLecStuNo = document.getElementById("myLecStuNo");
	myLecStuNo.value = no;
	
	// 프로필 사진 넣기
	let myLecStuImg = document.getElementById("myLecStuImg");
	myLecStuImg.src = stuInfo.MEM_PHOTOPATH;
	
	// 학년/학기 넣기
	let code = "";
	code = `\${stuInfo.STU_SCHYEAR}학년 / \${stuInfo.STU_SEMESTER}학기`;
	let stuYearNSemester = document.getElementById("stu_joinyearnstu_semester");
	stuYearNSemester.value = code;
	
}

function sDetailClose(){
	$("#lecPlanListBody").attr('class', 'col-md-12')
	$("#lecPlanDetailBody").css("display","none");
}

</script>
