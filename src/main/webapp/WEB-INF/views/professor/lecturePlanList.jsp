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
</style>

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>강의계획서</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lol/lecturePlanList">강의계획서</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>


	<div class="row">

		<div class="col-12">
			<div id="lpCardFlex">
			<div class="card"   id="lecPlanListBody">
				<div class="card-body" style="height: 400px;">
					<div class="card-title">
						<h5 class="font-weight-bold mb-4">강의계획서 목록</h5>
					</div>


						<div class="table-responsive text-center">
							<table class="table table-hover">
								<thead  style="background-color:#EBEBEB;">
									<tr>
										<th>번호</th>
										<th>계획서번호</th>
										<!-- 교수 전공 -->
										<th>전공</th>
										<th>교과목명</th>
										<th>내용</th>

									</tr>
								</thead>

								<tbody id="lecPlanList">
									<!-- 리스트 뽑기. 교수 전공 가져와야함.. -->

								</tbody>
							</table>
						</div>


				</div>
			</div>
		

		
			<div class="card"  id="lecPlanDetailBody">
				<div class="card-body overflow-auto" style="height:800px;">
					<div class="card-title">
						<div class="d-flex justify-content-between">
						<h5 class="font-weight-bold mb-4">강의계획서</h5>
						<div>
						<button type="button" class="btn mb-1 btn-primary custom-btn-p" onclick="lecPlanDetailUpdate()">수정하기</button>
						<button type="button" class="btn mb-1 btn-outline-dark" onclick="lecPlanDetailClose()">닫기</button>
						</div>
						</div>
						<hr>
						<div class="form-validation">
							<form name="lecPlanForm" class="form-valide" action="#" method="post"
								novalidate="novalidate">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lol_code">개설코드
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lol_code"
											name="lol_code" disabled="disabled">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_content">강의개요
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<textarea class="form-control input-default" id="lp_content"
											name="lp_content" rows="5"
											></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_book">교재 및 참고문헌
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_book"
											name="lp_book">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"
										for="lp_attend_ref">출석 반영 비율<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default"
											id="lp_attend_ref" name="lp_attend_ref"
											>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"
										for="lp_test_ref">시험 반영 비율<span
										class="text-danger"></span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default"
											id="lp_test_ref" name="lp_test_ref"
											>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"
										for="lp_task_ref">과제 반영 비율<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default"
											id="lp_task_ref" name="lp_task_ref"
											>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"
										for="lp_note">비고<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default"
											id="lp_note" name="lp_note"
											>
									</div>
								</div>
								<br>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">주차별 강의 계획</label>
								</div>

								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week1">1주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week1"
											name="lp_week1">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week2">2주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week2"
											name="lp_week2">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week3">3주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week3"
											name="lp_week3">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week4">4주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week4"
											name="lp_week4" >
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week5">5주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week5"
											name="lp_week5">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week6">6주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week6"
											name="lp_week6">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week7">7주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week7"
											name="lp_week7">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week8">8주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week8"
											name="lp_week8">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week9">9주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week9"
											name="lp_week9">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week10">10주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week10"
											name="lp_week10">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week11">11주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week11"
											name="lp_week11">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week12">12주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week12"
											name="lp_week12">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week13">13주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week13"
											name="lp_week13">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week14">14주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week14"
											name="lp_week14">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="lp_week15">15주차
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control input-default" id="lp_week15"
											name="lp_week15">
									</div>
								</div>
					
							</form>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h5 class="font-weight-bold">강의계획서 수정 및 작성시 유의사항</h5>
						<hr>
					</div>
					<div style="border: 1">
						<div class="mjUl pl-4 pr-4 pt-0">
						<ul>
							<li>강의 계획서 각 항목별 미기재 항목이 없도록 작성</li>
							<li>학습과제 반영률 작성시 평가방법 과제점수 반영률과 일치 요망</li>
							<li>강의 계획서의 평가방법 항목은 성적단표 입력 시스템과 연동됨에 따라 평가유형과 반영률을 정확하게 입력 및 수정 요망</li>
							<li>수업 교재 입력시 교재명 출판사명 저자명에 혼동 가능성이 없도록 정확히 기재</li>
							<li>강의 계획서에서 특히 중요한 총 15주차에 대한 수업내용은 구체적으로 작성 요망</li>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>





<script>

window.onload = function() {
	document.getElementById("lecPlanDetailBody").style.display = "none";

	 
	getLecPlanList();
}


function getLecPlanList() {
	
	let lecPlanList = $("#lecPlanList");
	$.ajax({
		method : "GET",
		url : "/lol/getLecturePlanList",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("민지 강의계획서 리스트 뿌리기..!", result);
			lecPlanList.html(lecturePlanListTemplate(result));
		},
		error : function(){
			console.log("실패")
		}
	})
}

function lectureDetail(lolCode){
	
	let lecPlanListBody = document.getElementById("lecPlanListBody");
	let lecPlanDetailBody = document.getElementById("lecPlanDetailBody");
	let lpCardFlex = document.getElementById("lpCardFlex");

	lpCardFlex.style.display = "flex";
	lecPlanDetailBody.style.display = "";
	lecPlanListBody.style.width = "50%";
	lecPlanListBody.style.marginRight = "1%";
	lecPlanDetailBody.style.width = "49%";
	
	console.log(lolCode);
 	var data = {
 		lolCode : lolCode		
 	}

	$.ajax({
		type: "POST",
		url: "/lol/getLecturePlan",
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("디테일 뽑기 ", result);
			document.getElementById("lecPlanDetailBody").style.display = "";
			
		 	console.log(document.lecPlanForm.elements[0].name);
		 	
		 	lecPlanDetailTemplate(result);

		},
		error : function(){
			console.log("디테일 실패...");
		}

	})
	
}





const lecturePlanListTemplate = function(lpList) {
	
	let code = "";
	
	let cnt = 1;

	if(lpList.length == 0) {
		code = "<tr><td colspan='5'>강의계획서 목록이 없습니다.</td></tr>";
	}
	for(var i=0; i<lpList.length; i++){
		code += `
				<tr>
					<th>\${cnt}</th>	
					<td>\${lpList[i].LP_CODE}</td>	
					<td>\${lpList[i].DEP_NAME}</td>	
					<td>\${lpList[i].LOL_NAME}</td>	
					<td><button type="button"  class="btn mb-1 btn-rounded btn-primary btn-sm custom-btn-p" onclick="lectureDetail('\${lpList[i].LOL_CODE}')">보기</button></td>	
				</tr>
		`; 
		cnt++;
	}
	return code;
}

const lecPlanDetailTemplate = lpDetail =>{

	const form = document.lecPlanForm;
	const elems = form.elements
	
	for(let i = 0; i < elems.length; i++) {
		elems[i].value = lpDetail[0][elems[i].name];
	}
		console.log("lpDetail : ",lpDetail[0][elems[1].name]);
		console.log("name : ",elems[0].name);
		console.log("value : ",elems[0].value);

}

function lecPlanDetailUpdate(){
	$("#lol_code").attr("disabled", false); // 수정버튼 누르면 disabled해제
	
	var data = $('form').serialize();
	
	$.ajax({
		method : "post",
		url : "/lol/updateLecturePlan",
		data : data,
		dataType : "text",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("민지짱짱 수정 성공!!!",result);
			$("#lol_code").attr("disabled", true);
// 			alert("수정 성공!");
			swal({
			  title: "수정 성공!",
			  icon: "success",
			});
			
			let lecPlanListBody = document.getElementById("lecPlanListBody");
			let lecPlanDetailBody = document.getElementById("lecPlanDetailBody");
			let lpCardFlex = document.getElementById("lpCardFlex");

			lpCardFlex.style.display = "";
			lecPlanDetailBody.style.display = "none";
			lecPlanListBody.style.width = "100%";

		},
		error : function(){
			console.log("수정 실패ㅠㅠㅠ");
		}


	})
	
}

// 상세 닫기 버튼
function lecPlanDetailClose(){
	
	let lecPlanListBody = document.getElementById("lecPlanListBody");
	let lecPlanDetailBody = document.getElementById("lecPlanDetailBody");
	let lpCardFlex = document.getElementById("lpCardFlex");

	lpCardFlex.style.display = "";
	lecPlanDetailBody.style.display = "none";
	lecPlanListBody.style.width = "100%";
}


</script>