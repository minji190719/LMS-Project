<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>	
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/toastr/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/toastr/js/toastr.init.js"></script>
<link href="${pageContext.request.contextPath }/resources/bootstrap/plugins/toastr/css/toastr.min.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

.swal-button--confirm{
	background-color: #8e304d;
}

.swal-title {
	color: #000000;
}
</style>
<div class="container-fluid">



<div class="row justify-content-center">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="lecOpenApplyHeader">
					<h4 class="card-title">
					<c:choose>
					         <c:when test = "${formName eq 'insert' }">
					         	<b>교과목 신청서 작성</b>
					         </c:when>
					         <c:otherwise>
					         	<b>교과목 신청서 수정</b>
					         </c:otherwise>
					</c:choose>
					</h4>
					<div>
						<c:choose>
					         <c:when test = "${formName eq 'insert' }">
					          	<button type="button" class="btn mb-1 btn-flat btn-light" onclick="autoCompleteBtn()">자동완성</button>
					          	<button type="button" class="btn mb-1 btn-flat btn-light" onclick="lolTempStorage()">임시저장</button>
					          	<button type="button" class="btn mb-1 btn-flat btn-light" onclick="lolUseStorage()">불러오기</button>
								<button type="button" class="btn mb-1 btn-flat text-white" style="background-color:#8e304d;" id="lecOpenApply"> 개설신청</button>
					         </c:when>
					         <c:otherwise>
					            <button type="button" class="btn mb-1 btn-flat text-white" style="background-color:#8e304d;" id="lecOpenModify"> 수정</button>
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
										<div class="table-responsive">
											<table border="1" class="table">
												<tr>
													<td>강의명</td><td colspan="5"> <input type="text" class="lolInfo form-control"
														id="lol_name" name="lol_name" placeholder="강의명입력"
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_name }"</c:if> >
													</td>
												</tr>
												<tr>
													<td>년도</td> <td><input type="text" class="lolInfo form-control"
														id="lol_year" name="lol_year" 
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_year }"</c:if> 
														<c:if test="${formName eq 'insert' }">value="2023"</c:if> ></td>
												
												
													<td>학기</td> <td><select id="lol_semester"
														name="lol_semester" class="lolInfo form-control">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_semester == 1 }">selected="selected"</c:if>>1</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_semester == 2 }">selected="selected"</c:if>>2</option>
													</select>
													</td>
											
													<td>정원</td> <td><input type="text" class="lolInfo form-control"
														id="lol_limit" name="lol_limit" placeholder="정원입력"
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_limit }"</c:if>>
													</td>
												</tr>
											
											<tr>
													<td>학점</td> <td colspan="2"><select class="lolInfo form-control"
														id="lol_credit" name="lol_credit">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_credit == 1 }">selected="selected"</c:if>>1</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_credit == 2 }">selected="selected"</c:if>>2</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_credit == 3 }">selected="selected"</c:if>
														<c:if test="${formName eq 'insert' }">selected="selected"</c:if>>3</option>
<!-- 																			인서트 작성시 임시데이터														 -->
													</select>
													</td>
												
												
													<td style="width:20%;">학년</td> <td colspan="2"><select class="lolInfo form-control"
														name="lol_schyear" id="lol_schyear">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 1 }">selected="selected"</c:if>>1</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 2 }">selected="selected"</c:if>>2</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 3 }">selected="selected"</c:if>>3</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_schyear == 4 }">selected="selected"</c:if>>4</option>
													</select>
													</td>
												</tr>
												<tr>
											
													<td>전공과목/교양과목</td><td><select class="lolInfo form-control"
														name="major_cultural" id="major_cultural">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.major_cultural eq '전공' }">selected="selected"</c:if>>전공</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.major_cultural eq '교양' }">selected="selected"</c:if>>교양</option>
													</select>
													</td>
											
													<td>필수과목 / 선택과목</td><td> <select class="lolInfo form-control"
														name="choice_require" id="choice_require">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.choice_require eq '필수' }">selected="selected"</c:if>>필수</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.choice_require eq '선택' }">selected="selected"</c:if>>선택</option>
													</select>
												</td>
												
													<td style="width:18%;">수업일수</td> <td><input type="text" class="lolInfo form-control" name="lol_daycount" id="lol_daycount"
														<c:if test="${formName eq 'update' }">value="${dataMap.lecOpenListVO.lol_daycount }"</c:if>>
													</td>
											</tr>
											
												<tr>
													<td>요일1</td> <td> <select class="lolInfo form-control"
														name="lol_day1" id="lol_day1">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '월' }">selected="selected"</c:if>>월</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '화' }">selected="selected"</c:if>>화</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '수' }">selected="selected"</c:if>>수</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day1 eq '목' }">selected="selected"</c:if>>목</option>
													</select>
													</td>
												
													<td>수업 시작 시간</td><td><select class="lolInfo form-control"
														name="lol_startime1" id="lol_startime1">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '9' }">selected="selected"</c:if>>9</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '10' }">selected="selected"</c:if>>10</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '11' }">selected="selected"</c:if>>11</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '12' }">selected="selected"</c:if>>12</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '13' }">selected="selected"</c:if>>13</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '14' }">selected="selected"</c:if>>14</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '15' }">selected="selected"</c:if>>15</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '16' }">selected="selected"</c:if>>16</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '17' }">selected="selected"</c:if>>17</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime1 eq '18' }">selected="selected"</c:if>>18</option>
													</select>
													</td>
												
													<td>수업 종료 시간</td><td> <select class="lolInfo form-control"
														name="lol_endtime1" id="lol_endtime1">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '10' }">selected="selected"</c:if>>10</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '11' }">selected="selected"</c:if>>11</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '12' }">selected="selected"</c:if>>12</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '13' }">selected="selected"</c:if>>13</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '14' }">selected="selected"</c:if>>14</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '15' }">selected="selected"</c:if>>15</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '16' }">selected="selected"</c:if>>16</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '17' }">selected="selected"</c:if>>17</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '18' }">selected="selected"</c:if>>18</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime1 eq '19' }">selected="selected"</c:if>>19</option>
													</select>
												</td>
												</tr>
												<tr>
													<td>요일2</td> <td><select class="lolInfo form-control"
														name="lol_day2" id="lol_day2">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day2 eq '화' }">selected="selected"</c:if>>화</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day2 eq '수' }">selected="selected"</c:if>>수</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day2 eq '목' }">selected="selected"</c:if>>목</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_day2 eq '금' }">selected="selected"</c:if>>금</option>
													</select>
													</td>
												
													<td>수업 시작 시간</td> <td><select class="lolInfo form-control"
														name="lol_startime2" id="lol_startime2">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '9' }">selected="selected"</c:if>>9</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '10' }">selected="selected"</c:if>>10</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '11' }">selected="selected"</c:if>>11</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '12' }">selected="selected"</c:if>>12</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '13' }">selected="selected"</c:if>>13</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '14' }">selected="selected"</c:if>>14</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '15' }">selected="selected"</c:if>>15</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '16' }">selected="selected"</c:if>>16</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '17' }">selected="selected"</c:if>>17</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_startime2 eq '18' }">selected="selected"</c:if>>18</option>
													</select>
												</td>
												
													<td>수업 종료 시간</td> <td><select class="lolInfo form-control"
														name="lol_endtime2" id="lol_endtime2">
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '10' }">selected="selected"</c:if>>10</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '11' }">selected="selected"</c:if>>11</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '12' }">selected="selected"</c:if>>12</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '13' }">selected="selected"</c:if>>13</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '14' }">selected="selected"</c:if>>14</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '15' }">selected="selected"</c:if>>15</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '16' }">selected="selected"</c:if>>16</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '17' }">selected="selected"</c:if>>17</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '18' }">selected="selected"</c:if>>18</option>
														<option <c:if test="${formName eq 'update'  && dataMap.lecOpenListVO.lol_endtime2 eq '19' }">selected="selected"</c:if>>19</option>
													</select>
												</td>
											</tr>
											</table>
										</div>

									</form>

								</div>
							</div>
						</div>



						<div class="tab-pane fade" id="profile">
							<div class="p-t-15">
								<div class="row align-items-center">

									<form method="post" class="hide" id="lecPlanRegiForm">
										<div class="table-responsive">
										  <table border="1" class="table">
											<tr>
													<td>강의 개요</td> 
<%-- 													<c:out value="${dataMap }"></c:out> --%>
														<td colspan="5">	<input type="text" class="lolInfo form-control" id="lp_content" name="lp_content" 
															<c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_content }"</c:if>>
														</td>
											</tr>
											<tr>
												<td>교재 및 참고문헌</td>
													<td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_book"	name="lp_book" 
														<c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_book }"</c:if>
														<c:if test="${formName eq 'insert' }">value="자바의 정석"</c:if>>
												</td>
											</tr>	
											<tr>
													<td>출석반영비율</td><td> <input type="text"  class="lolInfo" id="lp_attend_ref"
														name="lp_attend_ref"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_attend_ref }"</c:if>  style="width: 80px;">%
													</td>
												
													<td>시험반영비율</td> <td><input type="text"  class="lolInfo" id="lp_test_ref"
														name="lp_test_ref" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_test_ref }"</c:if> style="width: 80px;">%
													</td>
												
													<td>과제반영비율</td><td> <input type="text"  class="lolInfo" id="lp_task_ref"
														name="lp_task_ref"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_task_ref }"</c:if> style="width: 80px;">%
													</td>
												</tr>
												<tr>
													<td>비고</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_note"
														name="lp_note" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_note }"</c:if>>
													</td>
												</tr>
												<tr>
													<td colspan="6">
													<h5>주차별 강의 계획</h5>
													</td>
												</tr>
												<tr>
													<td>1주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week1"
														name="lp_week1" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week1 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>2주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week2"
														name="lp_week2" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week2 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>3주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week3"
														name="lp_week3" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week3 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>4주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week4"
														name="lp_week4" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week4 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>5주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week5"
														name="lp_week5" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week5 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>6주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week6"
														name="lp_week6" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week6 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>7주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week7"
														name="lp_week7" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week7 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>8주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week8"
														name="lp_week8"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week8 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>9주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week9"
														name="lp_week9" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week9 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>10주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week10"
														name="lp_week10" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week10 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>11주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week11"
														name="lp_week11"  <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week11 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>12주차</td> <td colspan="5"><input type="text"  class="lolInfo form-control" id="lp_week12"
														name="lp_week12" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week12 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>13주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week13"
														name="lp_week13" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week13 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>14주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week14"
														name="lp_week14" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week14 }"</c:if>>
													</td>
												</tr>
												<tr>
													<td>15주차</td><td colspan="5"> <input type="text"  class="lolInfo form-control" id="lp_week15"
														name="lp_week15" <c:if test="${formName eq 'update' }">value="${dataMap.lecturePlanVO.lp_week15 }"</c:if>>
													</td>
												</tr>

											

											</table>
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
// 					alert("개설신청이 완료되었습니다.")
					swal({
						  title: "개설신청이 완료되었습니다.",
						  icon: "success",
						  closeOnClickOutside : false
					}).then(function(){
						// 이벤트
						opener.getList();
						window.close();
					});

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
// 					alert("수정되었습니다.");
					swal({
						  title: "수정되었습니다.",
						  icon: "success",
						  closeOnClickOutside : false
					}).then(function(){
						// 이벤트
						opener.getList();
						window.close();
					});
					
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
	
	toastr.options = {
			  "closeButton": true,
			  "positionClass": "toast-top-center",
			  "progressBar": false,
              "showMethod": 'slideDown',
              "timeOut": 500
	}
	
	toastr.info('임시저장 완료');
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

// 자동완성 버튼
function autoCompleteBtn(){
	$("#lol_name").val("컴퓨터프로그래밍의 이해");  // 강의명
	$("#lol_limit").val("35");		//정원
	$("#lol_schyear").val("4")		//학년
	$("#choice_require").val("선택")		//선택 필수
	$("#lol_daycount").val("30")	//수업일수
	
	$("#lp_content").val("인문과 IOT의 융합기술에 도전하거나 IT를 복수전공(부전공)하려는 학생들에게 컴퓨터 프로그래밍의 원리와 개발 과정을 이해시킨다.")		//강의개요
	$("#lp_book").val("Do it! 점프 투 파이썬, 박응용 저, 이지퍼블리싱")			//교재
	$("#lp_attend_ref").val("20")	//출석반영비율
	$("#lp_test_ref").val("60")		//시험반영비율
	$("#lp_task_ref").val("20")		//과제반영비율
	$("#lp_note").val("실습을 수행할 수 있는 PC또는 노트북을 이용할 수 있어야 합니다.")			//비고
	$("#lp_week1").val("컴퓨터 프로그래밍의 이해")	//1주차 강의계획
	$("#lp_week2").val("파이썬 시작하기")	//2주차
	$("#lp_week3").val("파이썬 자료형")	//3주차
	$("#lp_week4").val("터틀 그래픽 실습")	//4주차
	$("#lp_week5").val("조건문")	//5주차
	$("#lp_week6").val("반복문")	//6주차
	$("#lp_week7").val("터틀 그래픽 실습2")	//7주차
	$("#lp_week8").val("중간평가")	//8주차
	$("#lp_week9").val("리스트와 딕셔너리")	//9주차
	$("#lp_week10").val("함수와 모듈")	//10주차
	$("#lp_week11").val("파일입출력")	//11주차
	$("#lp_week12").val("터틀 그래픽 실습3")	//12주차
	$("#lp_week13").val("객체와 클래스")	//13주차
	$("#lp_week14").val("리스트 딕셔너리 문제풀이")	//14주차
	$("#lp_week15").val("기말평가")	//15주차
	

}

</script>