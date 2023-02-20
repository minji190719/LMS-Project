<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>	
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>

<script>
   // 시큐리티용 토큰
   let header = '${_csrf.headerName}';
    let token =  '${_csrf.token}';
</script>


<c:choose>
	<c:when test="${formName eq 'update' }">
		<c:set var="update" value="formName"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="insert" value="formName"></c:set>
	</c:otherwise>
</c:choose>



<style>

.inputSize {
   width: 100%;
   height: 100%;
   margin: 0;
   padding: 0;
}

.lecOpenApplyHeader {
	display: flex;
	justify-content: space-between;
}

.lecOpenHeaderMenu {
	display: flex;
	justify-content: space-between;
	text-align: center;
}

#basicRegister {
	background-color: black;
	color: white;
}
</style>
<div class="container-fluid">



<div class="row justify-content-center">
	<div class="col-lg-11">
		<div class="card">
			<div class="card-body">
				<div class="lecOpenApplyHeader">
					<h4 class="card-title">${formName }</h4>
					<div>
						<c:choose>
					         <c:when test = "${formName eq 'insert' }">
					          	<button type="button" class="btn mb-1 btn-flat btn-light" onclick="lolTempStorage()">임시저장</button>
					          	<button type="button" class="btn mb-1 btn-flat btn-light" onclick="lolUseStorage()">불러오기</button>
								<button type="button" class="btn mb-1 btn-flat btn-outline-dark" id="lecOpenApply"> 개설신청</button>
					         </c:when>
					         <c:otherwise>
					            <button type="button" class="btn mb-1 btn-flat btn-outline-dark" id="lecOpenModify"> 수정</button>
					         </c:otherwise>
				      	</c:choose>
					</div>
				</div>
				<br>


				<div class="default-tab">
					<ul class="nav nav-tabs mb-3" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							data-toggle="tab" href="#home">기본사항 작성</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#profile">강의계획서 작성</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade active show" id="home" role="tabpanel">
							<div class="p-t-15">
								<div class="row align-items-center">

									<form method="post" id="basicRegiForm">
										<c:if  test="${formName eq 'update' }">
											<input type="hidden" name="lol_code"  value="${dataMap.lecOpenListVO.lol_code }">
										</c:if>
										<div class="basic-form">
											<div class="form-row">
												<div class="form-group col-md-6">
													<label>강의명</label> <input type="text" class="lolInfo form-control"
														id="lol_name" name="lol_name" placeholder="강의명입력"
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_name }"</c:if> >
												</div>
												<div class="form-group col-md-2">
													<label>년도</label> <input type="text" class="lolInfo form-control"
														id="lol_year" name="lol_year" 
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_year }"</c:if> 
														<c:if test="${formName eq 'insert' }">value="2023"</c:if> >
												</div>
												<div class="form-group col-md-2">
													<label>학기</label> <select id="lol_semester"
														name="lol_semester" class="lolInfo form-control">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_semester == 1 }">selected="selected"</c:if>>1</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_semester == 2 }">selected="selected"</c:if>>2</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>정원</label> <input type="text" class="lolInfo form-control"
														id="lol_limit" name="lol_limit" placeholder="정원입력"
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_limit }"</c:if>>
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-2">
													<label>학점</label> <select class="lolInfo form-control"
														id="lol_credit" name="lol_credit">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_credit == 1 }">selected="selected"</c:if>>1</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_credit == 2 }">selected="selected"</c:if> 
								//인서트 작성시 임시데이터		 <c:if test="${formName eq 'insert' }">selected="selected"</c:if>>2</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_credit == 3 }">selected="selected"</c:if>>3</option>
													</select>
												</div>
												<div class="form-group col-md-3">
													<label>학년</label> <select class="lolInfo form-control"
														name="lol_schyear" id="lol_schyear">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 1 }">selected="selected"</c:if>>1</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 2 }">selected="selected"</c:if>>2</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 3 }">selected="selected"</c:if>>3</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 4 }">selected="selected"</c:if>>4</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>전공과목/교양과목</label> <select class="lolInfo form-control"
														name="major_cultural" id="major_cultural">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.major_cultural eq '전공' }">selected="selected"</c:if>>전공</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.major_cultural eq '교양' }">selected="selected"</c:if>>교양</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>필수과목/선택과목</label> <select class="lolInfo form-control"
														name="choice_require" id="choice_require">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.choice_require eq '필수' }">selected="selected"</c:if>>필수</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.choice_require eq '선택' }">selected="selected"</c:if>>선택</option>
													</select>
												</div>
												<div class="form-group col-md-3">
													<label>수업일수</label> <input type="text" class="lolInfo form-control" name="lol_daycount" id="lol_daycount"
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_daycount }"</c:if>>
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-2">
													<label>요일1</label> <select class="lolInfo form-control"
														name="lol_day1" id="lol_day1">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '월' }">selected="selected"</c:if>>월</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '화' }">selected="selected"</c:if>>화</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '수' }">selected="selected"</c:if>>수</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '목' }">selected="selected"</c:if>>목</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '금' }">selected="selected"</c:if>>금</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>수업 시작 시간</label> <select class="lolInfo form-control"
														name="lol_startime1" id="lol_startime1">
														<option>9</option>
														<option>10</option>
														<option>11</option>
														<option>12</option>
														<option>13</option>
														<option>14</option>
														<option>15</option>
														<option>16</option>
														<option>17</option>
														<option>18</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>수업 종료 시간</label> <select class="lolInfo form-control"
														name="lol_endtime1" id="lol_endtime1">
														<option>10</option>
														<option>11</option>
														<option>12</option>
														<option>13</option>
														<option>14</option>
														<option>15</option>
														<option>16</option>
														<option>17</option>
														<option>18</option>
														<option>19</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>요일2</label> <select class="lolInfo form-control"
														name="lol_day2" id="lol_day2">
														<option value="">해당없음</option>
														<option>월</option>
														<option>화</option>
														<option>수</option>
														<option>목</option>
														<option>금</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>수업 시작 시간</label> <select class="lolInfo form-control"
														name="lol_startime2" id="lol_startime2">
														<option value="">해당없음</option>
														<option>9</option>
														<option>10</option>
														<option>11</option>
														<option>12</option>
														<option>13</option>
														<option>14</option>
														<option>15</option>
														<option>16</option>
														<option>17</option>
														<option>18</option>
														<option>19</option>
														<option>20</option>
														<option>21</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label>수업 종료 시간</label> <select class="lolInfo form-control"
														name="lol_endtime2" id="lol_endtime2">
														<option value="">해당없음</option>
														<option>10</option>
														<option>11</option>
														<option>12</option>
														<option>13</option>
														<option>14</option>
														<option>15</option>
														<option>16</option>
														<option>17</option>
														<option>18</option>
														<option>19</option>
													</select>
												</div>
											</div>
										</div>

									</form>

								</div>
							</div>
						</div>



						<div class="tab-pane fade" id="profile">
							<div class="p-t-15">
								<div class="row align-items-center">

									<form method="post" class="hide" id="lecPlanRegiForm">
										<div class="basic-form">
											<div class="form-row">
												<div class="form-group col-md-12">
													<label>강의 개요</label> 
<%-- 													<c:out value="${dataMap }"></c:out> --%>
															<input type="text" class="lolInfo" id="lp_content" name="lp_content" 
															<c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_content }"</c:if>>
												</div>
												<div class="form-group col-md-12">
												<label>교재 및 참고문헌</label>
														<input type="text"  class="lolInfo" id="lp_book"	name="lp_book" 
														<c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_book }"</c:if>
														<c:if test="${formName eq 'insert' }">value="자바의 정석"</c:if>>
												</div>
												<div class="form-group col-md-4">
													<label>출석반영비율</label> <input type="text"  class="lolInfo" id="lp_attend_ref"
														name="lp_attend_ref"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_attend_ref }"</c:if>  style="width: 80px;">%
												</div>
												<div class="form-group col-md-4">
													<label>시험반영비율</label> <input type="text"  class="lolInfo" id="lp_test_ref"
														name="lp_test_ref" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_test_ref }"</c:if> style="width: 80px;">%
												</div>
												<div class="form-group col-md-4">
													<label>과제반영비율</label> <input type="text"  class="lolInfo" id="lp_task_ref"
														name="lp_task_ref"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_task_ref }"</c:if> style="width: 80px;">%
												</div>
												<div class="form-group col-md-12">
													<label>비고</label> <input type="text"  class="lolInfo" id="lp_note"
														name="lp_note" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_note }"</c:if>>
												</div>

												<h5>주차별 강의 계획</h5>
												<div class="form-group col-md-12">
													<label>1주차</label> <input type="text"  class="lolInfo" id="lp_week1"
														name="lp_week1" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week1 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>2주차</label> <input type="text"  class="lolInfo" id="lp_week2"
														name="lp_week2" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week2 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>3주차</label> <input type="text"  class="lolInfo" id="lp_week3"
														name="lp_week3" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week3 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>4주차</label> <input type="text"  class="lolInfo" id="lp_week4"
														name="lp_week4" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week4 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>5주차</label> <input type="text"  class="lolInfo" id="lp_week5"
														name="lp_week5" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week5 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>6주차</label> <input type="text"  class="lolInfo" id="lp_week6"
														name="lp_week6" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week6 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>7주차</label> <input type="text"  class="lolInfo" id="lp_week7"
														name="lp_week7" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week7 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>8주차</label> <input type="text"  class="lolInfo" id="lp_week8"
														name="lp_week8"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week8 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>9주차</label> <input type="text"  class="lolInfo" id="lp_week9"
														name="lp_week9" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week9 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>10주차</label> <input type="text"  class="lolInfo" id="lp_week10"
														name="lp_week10" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week10 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>11주차</label> <input type="text"  class="lolInfo" id="lp_week11"
														name="lp_week11"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week11 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>12주차</label> <input type="text"  class="lolInfo" id="lp_week12"
														name="lp_week12" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week12 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>13주차</label> <input type="text"  class="lolInfo" id="lp_week13"
														name="lp_week13" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week13 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>14주차</label> <input type="text"  class="lolInfo" id="lp_week14"
														name="lp_week14" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week14 }"</c:if>>
												</div>
												<div class="form-group col-md-12">
													<label>15주차</label> <input type="text"  class="lolInfo" id="lp_week15"
														name="lp_week15" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week15 }"</c:if>>
												</div>

											</div>


										</div>
									</form>

								</div>
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
window.onload = function() {

		var lecOpenApply = $('#lecOpenApply');

		lecOpenApply.on("click", function() {
			
			var data = $('form').serialize();

			// console.log("클릭이 먹히나? ",data)

			$.ajax({
				type : "POST",
				url : "/lol/insertLectureOpen",
				data : data,
				dataType : "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					console.log('민지insert : ', result);
					localStorage.removeItem('data');	//로컬스토리지 임시저장 데이터 비우기
					opener.getList();
					window.close();

				},
				error : function(request, status, error) {
					console.log('실패 : ', status, " , ", error)
				}

			}) // ajax 끝


		})
		
		
		let lecOpenModify = $("#lecOpenModify");

		lecOpenModify.on("click",function(){
			var data = $('form').serialize();

			console.log("수정 데이터", data);

			$.ajax({
				type : "POST",
				url : "/lol/updateLectureOpen",
				data : data,
				dataType : "text",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					console.log("수정 성공! : ", result);
					opener.getList();
					window.close();
				},
				error : function(){
					console.log("수정 실패!");
				}

			})	// ajax 끝

		})	//	lecOpenModify onclick 끝


}	// window.onload() 끝


function lolTempStorage(){
	console.log("일단 클릭 확인");

<%-- 	var userId = '<%=(String)session.getAttribute("userId")%>'; // 암튼 숨겨! --%>

	let formArr = [];
	let forms = document.forms; 
	for(let i=0; i< forms.length; i++){
		
		let formNmVal = {};
		let elems = forms[i].elements;  // 폼안의 사용자 입력 태그 
		for(let j=0; j < elems.length; j++){
			formNmVal[elems[j].name] = elems[j].value;
		}
// 		formNmVal.userId = userId; 
		formArr.push(formNmVal);
	}

	console.log("민지!formArr확인! :", formArr);
	console.log(JSON.stringify(formArr));

	localStorage.setItem("data",JSON.stringify(formArr));
	
	
}	// onclick='lolTempStorage()' 끝

function lolUseStorage(){

	let localData = JSON.parse(localStorage.getItem("data"));

// 	console.log("localData : ", localData);
// 	console.log("lp_content : ", localData[1].lp_content);

	let localDataArr = [];
	// 하나씩 출력하기
	for(let i = 0; i<localData.length; i++){
		for(let jsonArr in localData[i]){
			console.log(localData[i][jsonArr]);
			
			localDataArr.push(localData[i][jsonArr]);
		}
	}
	
	console.log("localDataArr값 테스트 : ", localDataArr);

	let classVal = document.getElementsByClassName("lolInfo");

	for(let i = 0; i < classVal.length; i++){
// 		console.log("얘는 ? 폼 값인데??? : ", classVal[i].value);
		classVal[i].value =	localDataArr[i];
	}






}

</script>