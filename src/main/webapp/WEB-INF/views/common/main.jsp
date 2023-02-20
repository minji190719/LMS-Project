<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
body {
    /* height: 100vh; */
    /* width: 100vw; */
    background-color: #ECEFEE;
    background-image: linear-gradient( rgba( 255, 255, 255, 0.1), rgba( 255, 255, 255, 0.9) ), url('/resources/images/main/파일4.jpg');
    /* background-image: url(); */
    background-repeat: no-repeat;
    background-size: 100% 60%;
}
#chartTable th{
	padding-left:7px;
	padding-right:8px;
	border: none;
}

#bookListTable tbody{
	height: 300px;
}

#bookListTable tr{
	line-height: 30px;
}

</style>

<!-- 로딩애니메이션 css,js -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<%
		String userId = (String)request.getSession().getAttribute("userId");
		int userIdLength = userId.length(); 
%>
	<div class="container-fluid">
		<div class="row portlet-container">
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■관리자인 경우 -->
<c:if test="${role eq 'ROLE_ADMIN' }">
		<div class="col-lg-4 col-sm-6">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
						<img src="/resources/images/관리자.png" class="rounded-circle" alt="" width="70" height="70">
						<h5 class="mt-3 mb-1">관리자(${userId })</h5>
						<p class="m-0">한국대학교 홈페이지 총괄관리자</p>
						<button class="btn mb-1 btn-primary custom-btn-m openPortletModalBtn" data-toggle="modal" data-target="#exampleModalpopover">화면 배치 설정</button>
						<div class="bootstrap-modal">
							<div class="modal fade" id="exampleModalpopover">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">화면 배치 설정</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>내가 원하는 순서대로 화면을 조작해보세요</h5>
											<p>왼쪽의 체크박스에서 보고 싶은 메뉴를 선택하고, 오른쪽에서 마우스 끌기로 메뉴 위치를 지정하세요.</p>
											<div class="potletModalContainer">
												<div class="potletModalCheck">
												  	<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck0">일정</label>
												 	<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck1">오늘의 식단</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck2">오늘의 날씨</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck3">나의 도서관</label>
												 	<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck4">차트</label>
												</div>
												<div class="potletModalLayout"></div>
											</div>
											<br/>
											<div class="alert alert-danger" id="successMessage" style="display: none;">변경에 성공하였습니다. 곧 창이 닫힙니다.</div>
											<div class="alert alert-dark" id="failMessage" style="display: none;">변경에 실패했습니다. 추후에 다시 시도해주십시오. 2초 뒤에 창이 닫힙니다.</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn mb-1 btn-outline-dark portletCloseBtn"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="saveSPortlet(this)">설정 정보 저장하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-graduation-cap"></i>&nbsp;학적 변동 신청</p>
								<c:choose>
									<c:when test="${empty admin.a1 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a1 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-person-chalkboard"></i>&nbsp;개설 과목 신청</p>
								<c:choose>
									<c:when test="${empty admin.a2 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a2 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-sharp fa-solid fa-hand-holding-hand"></i>&nbsp;등록금</p>
								<c:choose>
									<c:when test="${admin.a3 eq 0}">
										<h4 class="m-1">CLOSED</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">OPEN</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-sharp fa-solid fa-stamp"></i>&nbsp;등록금 납부 상태</p>
								<c:choose>
									<c:when test="${admin.a3 eq 0}">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:when test="${admin.a4 eq 0}">
										<h4 class="m-1">0/${admin.a3 }</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a4 }/${admin.a3 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-sharp fa-solid fa-comment"></i>&nbsp;자격증 신청</p>
								<c:choose>
									<c:when test="${empty admin.a5 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a5 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-hand-holding-dollar"></i>&nbsp;봉사 신청</p>
								<c:choose>
									<c:when test="${empty admin.a6 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a6 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-circle-check"></i>&nbsp;장학금 신청</p>
								<c:choose>
									<c:when test="${empty admin.a7 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a7 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-comments-dollar"></i>&nbsp;커뮤니티 신고</p>
								<c:choose>
									<c:when test="${empty admin.a8 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${admin.a8 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:if>		
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 학생인 경우 -->
<c:if test="${role eq 'ROLE_STUDENT' }">
		<div class="col-lg-4 col-sm-6">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
						<c:choose>
							<c:when test="${empty student.photo }">
								<img src="/resources/images/관리자.png" class="rounded-circle" alt="" width="70" height="70">
							</c:when>
							<c:otherwise>
								<img src="${student.photo }" class="rounded-circle" alt="" width="70" height="70">
							</c:otherwise>
						</c:choose>
						<h5 class="mt-3 mb-1">${student.name } (${userId })</h5>
						<p class="m-0">${student.college } ${student.department } <!-- *포틀릿 순서: ${student.portlet }--></p>
						<a href="/mypage/List">
							<button type="button" class="btn mb-1 btn-primary custom-btn-s">마이페이지</button>
						</a>
						<button class="btn mb-1 btn-primary custom-btn-s openPortletModalBtn" data-toggle="modal" data-target="#exampleModalpopover">화면 배치 설정</button>
						<div class="bootstrap-modal">
							<div class="modal fade" id="exampleModalpopover">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">화면 배치 설정</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>내가 원하는 순서대로 화면을 조작해보세요</h5>
											<p>왼쪽의 체크박스에서 보고 싶은 메뉴를 선택하고, 오른쪽에서 마우스 끌기로 메뉴 위치를 지정하세요.</p>
											<div class="potletModalContainer">
												<div class="potletModalCheck">
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck0">일정</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck1">나의 시간표</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck2">오늘의 식단</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck3">이수 정보</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck4">커뮤니티</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck5">오늘의 날씨</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck6">나의 도서관</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck7">나의 역량</label>
												</div>
												<div class="potletModalLayout"></div>
											</div>
											<br/>
											<div class="alert alert-danger" id="successMessage" style="display: none;">변경에 성공하였습니다. 곧 창이 닫힙니다.</div>
											<div class="alert alert-dark" id="failMessage" style="display: none;">변경에 실패했습니다. 추후에 다시 시도해주십시오. 2초 뒤에 창이 닫힙니다.</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn mb-1 btn-outline-dark portletCloseBtn"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="saveSPortlet(this)">설정 정보 저장하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-clipboard-user"></i>&nbsp;학적 상태</p>
								<h4 class="m-1">${student.s1 }</h4>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-star"></i>&nbsp;이수학점</p>
								<c:choose>
									<c:when test="${empty student.s2 }">
										<h4 class="m-1 custom-s">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${student.s2 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-brands fa-hire-a-helper"></i>&nbsp;교내 봉사</p>
								<c:choose>
									<c:when test="${empty student.s3 }">
										<h4 class="m-1">0/36</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${student.s3 }/36</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-sharp fa-solid fa-hand-holding-hand"></i>&nbsp;교외 봉사</p>
								<c:choose>
									<c:when test="${empty student.s4 }">
										<h4 class="m-1">0/36</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${student.s4 }/36</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-sharp fa-solid fa-stamp"></i>&nbsp;자격증 승인이력</p>
								<c:choose>
									<c:when test="${empty student.s5 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${student.s5 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-book"></i>&nbsp;도서 대출 반납일</p>
								<c:choose>
									<c:when test="${empty student.s6 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${fn:substring(student.s6, 0, 10)}</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-sharp fa-solid fa-comment"></i>&nbsp;커뮤니티 내 글</p>
								<c:choose>
									<c:when test="${empty student.s7 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${student.s7 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-chalkboard-user"></i>&nbsp;상담 이력</p>
								<c:choose>
									<c:when test="${empty student.s8 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1" style="letter-spacing: -1px;">${fn:substring(student.s8, 0, 10)}</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:if>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■교수인 경우 -->
<c:if test="${role eq 'ROLE_PROFESSOR' }">

		<div class="col-lg-4 col-sm-6">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
						<c:choose>
							<c:when test="${empty professor.photo }">
								<img src="/resources/images/관리자.png" class="rounded-circle" alt="" width="70" height="70">
							</c:when>
							<c:otherwise>
								<img src="${professor.photo }" class="rounded-circle" alt="" width="70" height="70">
							</c:otherwise>
						</c:choose>
						<h5 class="mt-3 mb-1">${professor.name } 교수 (${userId })</h5>
						<p class="m-0">${professor.college } ${professor.department } <!-- *포틀릿 순서: ${professor.portlet }--></p>
						<a href="/mypage/List">
							<button type="button" class="btn mb-1 btn-primary custom-btn-p">마이페이지</button>
						</a>
						<button class="btn mb-1 btn-primary custom-btn-p openPortletModalBtn" data-toggle="modal" data-target="#exampleModalpopover">화면 배치 설정</button>
						<!-- [모달] 포틀릿 설정 시작-->
						<div class="bootstrap-modal">
							<div class="modal fade" id="exampleModalpopover">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">화면 배치 설정</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>내가 원하는 순서대로 화면을 조작해보세요</h5>
											<p>왼쪽의 체크박스에서 보고 싶은 메뉴를 선택하고, 오른쪽에서 마우스 끌기로 메뉴 위치를 지정하세요.</p>
											<div class="potletModalContainer">
												<div class="potletModalCheck">
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck0">일정</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck1">오늘의 식단</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck2">오늘의 날씨</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck3">나의 도서관</label>
													<label><input type="checkbox" class="portletCheck form-check-input" id="portletCheck4">차트</label>
												</div>
												<div class="potletModalLayout"></div>
											</div>
											<br/>
											<div class="alert alert-danger" id="successMessage" style="display: none;">변경에 성공하였습니다. 곧 창이 닫힙니다.</div>
											<div class="alert alert-dark" id="failMessage" style="display: none;">변경에 실패했습니다. 추후에 다시 시도해주십시오. 2초 뒤에 창이 닫힙니다.</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn mb-1 btn-outline-dark portletCloseBtn"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="saveSPortlet(this)">설정 정보 저장하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-id-card-clip"></i>&nbsp;직책</p>
								<h4 class="m-1">${professor.p1 }</h4>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-person-shelter"></i>&nbsp;연구실번호</p>
								<h4 class="m-1">${professor.p2 }</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-right-to-bracket"></i>&nbsp;입사일</p>
								<h4 class="m-1">${fn:substring(professor.p3, 0, 10)}</h4>
							</div>
						</div>
					</div>
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-calendar"></i>&nbsp;재직한 지</p>
								<h4 class="m-1">${professor.p4 }일</h4>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-star"></i>&nbsp;강의총괄평점</p>
								<c:choose>
									<c:when test="${empty professor.p5 }">
										<h4 class="m-1">-</h4>
									</c:when>
									<c:otherwise>
										<h4 class="m-1">${professor.p5 }</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-person-chalkboard"></i>&nbsp;개설강좌</p>
								<h4 class="m-1">${professor.p6 }</h4>
							</div>
						</div>
					</div>
					<div class="col-4 border-right">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-chalkboard-user"></i>&nbsp;상담 대기</p>
								<h4 class="m-1">${professor.p7 }</h4>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="pt-3 pb-3 pl-0 pr-0 text-center" class="mainMyInfo">
							<div style="display: inline-block;">
								<p class="m-0"><i class="fa-solid fa-envelope"></i>&nbsp;안 읽은 메일</p>
								<h4 class="m-1">-</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:if>

		<div class="col-lg-8" style="height: 510px;">
			<div class="card" style="height: 43%;">
				<div class="card-body">
					<div class="card-title" style="display: flex; justify-content: space-between;">
						<div>
							<h4 style="display: inline-block;"><i class="fa-solid fa-newspaper"></i>&nbsp;뉴스 검색</h4>
							<h6 class="text-info" style="display: inline-block;">※ 궁금한 뉴스 주제를 검색해보세요</h6>
						</div>
						<div style="display: flex; justify-content: flex-end; margin-top: -10px;">						
							<input type="text" class="form-control-sm input-default" id="searchNewsWord" oninput="newsCrolling()"> &nbsp;
							<input type="button" value="검색" onclick="newsCrolling()" class="btn mb-1 btn-light">
						</div>
					</div>
					<div id="forNews">
						<div id="divForNews" class="table-responsive custom-table1">
							<table>
								<thead class="custom-theader-s">
									<tr>
										<th width="15%;" style="border: none;">신문사</th>
										<th width="70%;" style="border: none;">기사제목</th>
										<th width="15%;" style="border: none;">발행일</th>
									</tr>
								</thead>			
								<tbody id="tbodyForNews">
								
		<!-- 							뉴스 들어오는 곳 -->

								</tbody>				
							</table>

						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<!-- Nav tabs -->
					<h4 class="card-title">
						<i class="fa-sharp fa-solid fa-flag"></i>&nbsp;공지사항
					</h4>
					<div class="default-tab" style="max-height: 100%;">
						<ul class="nav nav-tabs" role="#home">
							<li class="nav-item" onclick="requestList()"><a
								class="nav-link active show" data-toggle="tab" href="#home">전체공지사항</a></li>

							<li class="nav-item" onclick="selectCategory()"><a
								class="nav-link" data-toggle="tab" href="#home"><input
									type="hidden" id="category" value="일반">일반</a></li>

							<li class="nav-item" onclick="selectb()"><a class="nav-link"
								data-toggle="tab" href="#home"><input type="hidden"
									id="category1" value="학사">학사</a></li>

							<li class="nav-item" onclick="selectc()"><a class="nav-link"
								data-toggle="tab" href="#home"><input type="hidden"
									id="category2" value="장학">장학</a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane fade active show" id="home" role="tabpanel">
								<div>
									<div class="table-responsive" id="" style="overflow: hidden; overflow-x: hidden;">
										<table class="table table-striped table-bordered" id="testable" style="margin-top: -18px !important; margin-left: -30px !important; width: 1016px;">
											<thead>
												<tr class="text-center" style="display: none;">
													<th style="width: 40px;">No.</th>
													<th style="width: 450px;">제목</th>
													<th style="width: 60px;">작성자</th>
													<th style="width: 80px;">작성일</th>
													<th style="width: 70px;">조회수</th>
												</tr>
											</thead>
											<tbody class="nor_list">

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
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■관리자인 경우 -->
<c:if test="${role eq 'ROLE_ADMIN' }">
		<!-- ■■■■■■■■■■■■■■■■■■■■■포틀릿 배열 시작■■■■■■■■■■■■■■■■■■-->		
		<div class="col-lg-12">
			<div style="position: relative; display: flex; flex-direction: column; min-width: 0; word-wrap: break-word;">
			  <div class="grid-stack">
				    <!--아이템 0 시작-->
				    <div class="grid-stack-item portlet0" gs-w="8">
				      <div class="grid-stack-item-content">
						<div class="card portlet-item">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">
									<div>
										<a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
										<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;일정</h4>
									</div>
									<div>
										<a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
									</div>
								</div>
								<h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
							    <div class="hnu_schedule" id="calendar">
							    </div>
							</div>
						</div>
					</div>   
				    </div>
				    <!--아이템 0 종료-->
				    <!--아이템 1 시작-->
				    <div class="grid-stack-item portlet1" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-bowl-food"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;오늘의 식단</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div style="height: 400px;" class="alert alert-info">
										<div class="bootstrap-carousel">
											<div id="carouselExampleControls" class="carousel slide"
												data-ride="carousel">
												<div id="divCarousel" class="carousel-inner">
													<div class="carousel-item" style="height: 300px;"></div>
												</div>
												<a class="carousel-control-prev"
													href="#carouselExampleControls" data-slide="prev"> <span
													class="carousel-control-prev-icon"></span> <span
													class="sr-only">Previous</span>
												</a> <a class="carousel-control-next"
													href="#carouselExampleControls" data-slide="next"> <span
													class="carousel-control-next-icon"></span> <span
													class="sr-only">Next</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 1 종료-->
				    <!--아이템 2 시작-->
				    <div class="grid-stack-item portlet2" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="background-image: url('../resources/images/sky2.JPG'); background-size: cover; border-radius: 10px;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-cloud" style="color: #ffffff;"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; color: #ffffff;">&nbsp;오늘의 날씨</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div>
										<span style="font-size: 2em; color: #ffffff!important; font-family: '양진체'!important;">Weather Information &nbsp;<span class="label label-warning" style="margin-top: -10px;">대전</span></span>
									</div>
									<div
										style="padding: 10px; height: 350px;">
										<div id="weather1"
											style="padding-top: 30px; float: left; width: 220px; text-align: center;">
											날씨아이콘</div>
										<div id="weather2"
											style="float: right; padding: 10px; width: 190px; height: 100px; text-align: center;">
											<div id="weather2_1"
												style="color: white; padding-top: 20px; font-size: 4.0em;">
											</div>
											<div id="weather2_2" style="color: white; font-size: 1.5em;">
											</div>
										</div>
										<div id="weather3"
											style="text-align: center; height: 50px; margin-top: 200px; padding: 15px; color: black; font-size: 1.2em;">
											<div id="weather3_1"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">강수량</span><br>
											</div>
											<div id="weather3_2"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">강수확률</span><br>
											</div>
											<div id="weather3_3"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">풍속</span><br>
											</div>
											<div id="weather3_4"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">파고</span><br>
											</div>
										</div>
										<br/><br/><br/><br/><br/><br/>
										<p>데이터 출처 : 기상청, 공공 데이터 포털</p>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 2 종료-->
				    <!--아이템 3 시작-->
				    <div class="grid-stack-item portlet3" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="background-image: linear-gradient( rgba( 255, 255, 255, 0.9), rgba( 255, 255, 255, 0.7) ), url('/resources/images/도서관.png');
								 border-radius: 10px; background-position: right bottom; background-size: 60%; background-repeat: no-repeat;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-book"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; padding-bottom: 0px;">&nbsp;나의 도서관</h4>
										</div>
									</div>
									<div style="display: flex; justify-content: space-between;">
										<div style="display: inline-block; height: 150px; width: 100%; background-color: #DBE5FF; ">
											<div id="rentBook" style="margin-top: 60px; text-align: center; font-size: 1.5em; font-weight: bold; color: white;"></div>
										</div>
										<div style="display: inline-block; height: 150px; width: 100%; background-color: #FFDFDF; ">
											<div id="overDate" style="margin-top: 60px; text-align: center; font-size: 1.5em; font-weight: bold; color: white;"></div>
										</div>
									</div>
									<div class="table-responsive custom-table1">
										<table id="bookListTable"></table>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 3 종료-->
				    <!--아이템 4 시작-->
				    <div class="grid-stack-item portlet4" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="align-content: center;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#' class="ti-calendar"></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;차트</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>

										</div>
									</div>
									<div style="text-align: center;">
										<div id="chart" style="height: 420px; text-align:center;">
											
										</div>
										<div>
											<!--  
											-->
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 4 종료-->
				  </div>
			</div>
		</div>
		<!-- ■■■■■■■■■■■■■■■■■■■■■포틀릿 배열 종료■■■■■■■■■■■■■■■■■■ -->
</c:if>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 학생인 경우 -->
<c:if test="${role eq 'ROLE_STUDENT' }">

		<!-- ■■■■■■■■■■■■■■■■■■■■■포틀릿 배열 시작■■■■■■■■■■■■■■■■■■-->		
		<div class="col-lg-12">
			<div style="position: relative; display: flex; flex-direction: column; min-width: 0; word-wrap: break-word;">
			  <div class="grid-stack">
				    <!--아이템 0 시작-->
				    <div class="grid-stack-item portlet0" gs-w="8">
				      <div class="grid-stack-item-content">
						<div class="card portlet-item">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">
									<div>
										<a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
										<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;일정</h4>
									</div>
									<div>
										<a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
									</div>
								</div>
								<h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
							    <div class="hnu_schedule" id="calendar">
							    </div>
							</div>
						</div>
					</div>   
				    </div>
				    <!--아이템 0 종료-->
				    <!--아이템 1 시작-->
				    <div class="grid-stack-item portlet1" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item" >
								<div class="card-body">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='/schedule/sHome'><i class="fa-solid fa-clock"></i></a>
											<h4 class="card-title " style="display: inline-block;">&nbsp;나의 시간표</h4>
										</div>
										<div>
											<a href='/schedule/sHome' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div style="text-align:center; height: 100%;">
										<div id="timeTable" style="height:90%;">
											<select id="yearSemester" class="input-default">
												<option value="2022/1">2022년 1학기</option>
												<option value="2021/2">2021년 2학기</option>
												<option value="2021/1">2021년 1학기</option>
												<option value="2020/2">2020년 2학기</option>
												<option value="2020/1">2020년 1학기</option>
											</select> 
											&nbsp; 
											<input type="button" class="btn mb-1 btn-white custom-btn-s btn-sm" value="조회" id="showTimeTableBtn">
											<table class="table-timeTable custom-font-bold text-dark" style="font-size:12px;">  
												<thead>
													<tr>
														<th>시간/요일</th>
														<th>월</th>
														<th>화</th>
														<th>수</th>
														<th>목</th>
														<th>금</th>
													</tr>
												</thead>
												<tbody id="timeTableList" style="overflow: auto; overflow-x: hidden;">
												</tbody>
											</table>										
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 1 종료-->
				    <!--아이템 2 시작-->
				    <div class="grid-stack-item portlet2" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-bowl-food"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;오늘의 식단</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div style="height: 400px;" class="alert alert-info">
										<div class="bootstrap-carousel">
											<div id="carouselExampleControls" class="carousel slide"
												data-ride="carousel">
												<div id="divCarousel" class="carousel-inner">
													<div class="carousel-item" style="height: 300px;"></div>
												</div>
												<a class="carousel-control-prev"
													href="#carouselExampleControls" data-slide="prev"> <span
													class="carousel-control-prev-icon"></span> <span
													class="sr-only">Previous</span>
												</a> <a class="carousel-control-next"
													href="#carouselExampleControls" data-slide="next"> <span
													class="carousel-control-next-icon"></span> <span
													class="sr-only">Next</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 2 종료-->
				    <!--아이템 3 시작-->
				    <div class="grid-stack-item portlet3" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="height: 75px;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-graduation-cap"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;이수 정보</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
								</div>
								<div class="col-12"
									style="height: 80px; background: linear-gradient(to right, rgb(48, 70, 116) 40%, #6a7fad); color: white; font-weight: bold">
									<label class="pt-3 ml-3">이수 학점달성</label><br> <label
										class="custom-font-size ml-4" style="margin-top: -15px;"
										id="processResult">92%</label>
								</div>
								<div class="card-body" style="height: 480px;">
									<div class="col-12 d-flex justify-content-center mt-4">
										<table id="chartTable">
											<thead>
												<tr>
													<th><span class="custom-font-dark" id="totalCredit">130</span>학점</th>
													<th><span class="custom-font-dark" id="mcCredit">79</span>학점</th>
													<th><span class="custom-font-dark" id="mnCredit">21</span>학점</th>
													<th><span class="custom-font-dark" id="ccCredit">15</span>학점</th>
													<th><span class="custom-font-dark" id="cnCredit">15</span>학점</th>
													<th><span class="custom-font-dark">32</span>시간</th>
													<th><span class="custom-font-dark">785</span>점</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="mb-3">
										<canvas id="myChart"></canvas>
									</div>
									<div class="col-12">
										<label>*해당 정보는 시점에 따라 변경될 수 있습니다.</label>
										<label>*최종 정보는 반드시 학사관리팀에 확인해주시기 바랍니다.</label>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 3 종료-->
				    <!--아이템 4 시작-->
				    <div class="grid-stack-item portlet4" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='/community'><i class="fa-sharp fa-solid fa-comments" style="color: #3A1D1D;"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; color: #3A1D1D;">&nbsp;커뮤니티</h4>
										</div>
										<div>
											<a href='/community' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<h5 style="background-image: url('/resources/images/community/커뮤니티.png');">내가 작성한 글</h5>
									<div id="communityPost" class="communityTable"></div>
									<br/>
									<h5>내가 좋아요한 글</h5>
									<div id="communityLike" class="communityTable"></div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 4 종료-->
				    <!--아이템 5 시작-->
				    <div class="grid-stack-item portlet5" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="background-image: url('../resources/images/sky2.JPG'); background-size: cover; border-radius: 10px;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-cloud" style="color: #ffffff;"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; color: #ffffff;">&nbsp;오늘의 날씨</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div>
										<span style="font-size: 2em; color: #ffffff!important; font-family: '양진체'!important;">Weather Information &nbsp;<span class="label label-warning" style="margin-top: -10px;">대전</span></span>
									</div>
									<div
										style="padding: 10px; height: 350px;">
										<div id="weather1"
											style="padding-top: 30px; float: left; width: 220px; text-align: center;">
											날씨아이콘</div>
										<div id="weather2"
											style="float: right; padding: 10px; width: 190px; height: 100px; text-align: center;">
											<div id="weather2_1"
												style="color: white; padding-top: 20px; font-size: 4.0em;">
											</div>
											<div id="weather2_2" style="color: white; font-size: 1.5em;">
											</div>
										</div>
										<div id="weather3"
											style="text-align: center; height: 50px; margin-top: 200px; padding: 15px; color: black; font-size: 1.2em;">
											<div id="weather3_1"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">강수량</span><br>
											</div>
											<div id="weather3_2"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">강수확률</span><br>
											</div>
											<div id="weather3_3"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">풍속</span><br>
											</div>
											<div id="weather3_4"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">파고</span><br>
											</div>
										</div>
										<br/><br/><br/><br/><br/><br/>
										<p>데이터 출처 : 기상청, 공공 데이터 포털</p>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 5 종료-->
				    <!--아이템 6 시작-->
				    <div class="grid-stack-item portlet6" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="background-image: linear-gradient( rgba( 255, 255, 255, 0.9), rgba( 255, 255, 255, 0.7) ), url('/resources/images/도서관.png');
								 border-radius: 10px; background-position: right bottom; background-size: 60%; background-repeat: no-repeat;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-book"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; padding-bottom: 0px;">&nbsp;나의 도서관</h4>
										</div>
									</div>
									<div style="display: flex; justify-content: space-between;">
										<div style="display: inline-block; height: 150px; width: 100%; background-color: #DBE5FF; ">
											<div id="rentBook" style="margin-top: 60px; text-align: center; font-size: 1.5em; font-weight: bold; color: white;"></div>
										</div>
										<div style="display: inline-block; height: 150px; width: 100%; background-color: #FFDFDF; ">
											<div id="overDate" style="margin-top: 60px; text-align: center; font-size: 1.5em; font-weight: bold; color: white;"></div>
										</div>
									</div>
									<div class="table-responsive custom-table1">
										<table id="bookListTable"></table>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 6 종료-->
				    <!--아이템 7 시작-->
				    <div class="grid-stack-item portlet7" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="align-content: center;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href="#"><i class="fa-solid fa-seedling"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;나의 역량</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>

										</div>
									</div>
									<div style="text-align: center;">
										<div id="chart" style="height: 420px; text-align:center;">
											
										</div>
										<div >
											<table class="table" style="width: 100%;">
												<tr> 
													<th class="custom-theader"><i class="fa-solid fa-arrow-up" style="color: red;"></i>&emsp;강점역량</th>
													<td id="eh_maxVal"></td>
													<th class="custom-theader"><i class="fa-solid fa-arrow-down" style="color: blue;"></i>&emsp;취약역량</th>
													<td id="eh_minVal"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 7 종료-->
				  </div>
			</div>
		</div>
		<!-- ■■■■■■■■■■■■■■■■■■■■■포틀릿 배열 종료■■■■■■■■■■■■■■■■■■ -->

</c:if>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교수인 경우 -->
<c:if test="${role eq 'ROLE_PROFESSOR' }">

		<!-- ■■■■■■■■■■■■■■■■■■■■■포틀릿 배열 시작■■■■■■■■■■■■■■■■■■-->		
		<div class="col-lg-12">
			<div style="position: relative; display: flex; flex-direction: column; min-width: 0; word-wrap: break-word;">
			  <div class="grid-stack">
				    <!--아이템 0 시작-->
				    <div class="grid-stack-item portlet0" gs-w="8">
				      <div class="grid-stack-item-content">
						<div class="card portlet-item">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">
									<div>
										<a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
										<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;일정</h4>
									</div>
									<div>
										<a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
									</div>
								</div>
								<h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
							    <div class="hnu_schedule" id="calendar">
							    </div>
							</div>
						</div>
					</div>   
				    </div>
				    <!--아이템 0 종료-->
				    <!--아이템 1 시작-->
				    <div class="grid-stack-item portlet1" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-bowl-food"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;오늘의 식단</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div style="height: 400px;" class="alert alert-info">
										<div class="bootstrap-carousel">
											<div id="carouselExampleControls" class="carousel slide"
												data-ride="carousel">
												<div id="divCarousel" class="carousel-inner">
													<div class="carousel-item" style="height: 300px;"></div>
												</div>
												<a class="carousel-control-prev"
													href="#carouselExampleControls" data-slide="prev"> <span
													class="carousel-control-prev-icon"></span> <span
													class="sr-only">Previous</span>
												</a> <a class="carousel-control-next"
													href="#carouselExampleControls" data-slide="next"> <span
													class="carousel-control-next-icon"></span> <span
													class="sr-only">Next</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 1 종료-->
				    <!--아이템 2 시작-->
				    <div class="grid-stack-item portlet2" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="background-image: url('../resources/images/sky2.JPG'); background-size: cover; border-radius: 10px;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-cloud" style="color: #ffffff;"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; color: #ffffff;">&nbsp;오늘의 날씨</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>&nbsp;&nbsp;
										</div>
									</div>
									<div>
										<span style="font-size: 2em; color: #ffffff!important; font-family: '양진체'!important;">Weather Information &nbsp;<span class="label label-warning" style="margin-top: -10px;">대전</span></span>
									</div>
									<div
										style="padding: 10px; height: 350px;">
										<div id="weather1"
											style="padding-top: 30px; float: left; width: 220px; text-align: center;">
											날씨아이콘</div>
										<div id="weather2"
											style="float: right; padding: 10px; width: 190px; height: 100px; text-align: center;">
											<div id="weather2_1"
												style="color: white; padding-top: 20px; font-size: 4.0em;">
											</div>
											<div id="weather2_2" style="color: white; font-size: 1.5em;">
											</div>
										</div>
										<div id="weather3"
											style="text-align: center; height: 50px; margin-top: 200px; padding: 15px; color: black; font-size: 1.2em;">
											<div id="weather3_1"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">강수량</span><br>
											</div>
											<div id="weather3_2"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">강수확률</span><br>
											</div>
											<div id="weather3_3"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">풍속</span><br>
											</div>
											<div id="weather3_4"
												style="float: left; width: 190px; margin: 5px;">
												<span class="custom-bold">파고</span><br>
											</div>
										</div>
										<br/><br/><br/><br/><br/><br/>
										<p>데이터 출처 : 기상청, 공공 데이터 포털</p>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 2 종료-->
				    <!--아이템 3 시작-->
				    <div class="grid-stack-item portlet3" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="background-image: linear-gradient( rgba( 255, 255, 255, 0.9), rgba( 255, 255, 255, 0.7) ), url('/resources/images/도서관.png');
								 border-radius: 10px; background-position: right bottom; background-size: 60%; background-repeat: no-repeat;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#'><i class="fa-solid fa-book"></i></a>
											<h4 class="card-title mb-5" style="display: inline-block; padding-bottom: 0px;">&nbsp;나의 도서관</h4>
										</div>
									</div>
									<div style="display: flex; justify-content: space-between;">
										<div style="display: inline-block; height: 150px; width: 100%; background-color: #DBE5FF; ">
											<div id="rentBook" style="margin-top: 60px; text-align: center; font-size: 1.5em; font-weight: bold; color: white;"></div>
										</div>
										<div style="display: inline-block; height: 150px; width: 100%; background-color: #FFDFDF; ">
											<div id="overDate" style="margin-top: 60px; text-align: center; font-size: 1.5em; font-weight: bold; color: white;"></div>
										</div>
									</div>
									<div class="table-responsive custom-table1">
										<table id="bookListTable"></table>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 3 종료-->
				    <!--아이템 4 시작-->
				    <div class="grid-stack-item portlet4" gs-w="4">
				      <div class="grid-stack-item-content">
							<div class="card portlet-item">
								<div class="card-body" style="align-content: center;">
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a href='#' class="ti-calendar"></a>
											<h4 class="card-title mb-5" style="display: inline-block;">&nbsp;차트</h4>
										</div>
										<div>
											<a href='#' class="ti-plus"></a>

										</div>
									</div>
									<div style="text-align: center;">
										<div id="chart" style="height: 420px; text-align:center;">
											
										</div>
										<div>
											<!--  
											<table class="table" style="width: 100%;">
												<tr> 
													<th class="custom-theader"><i class="fa-solid fa-arrow-up" style="color: red;"></i>&emsp;강점역량</th>
													<td id="eh_maxVal"></td>
													<th class="custom-theader"><i class="fa-solid fa-arrow-down" style="color: blue;"></i>&emsp;취약역량</th>
													<td id="eh_minVal"></td>
												</tr>
											</table>
											-->
										</div>
									</div>
								</div>
							</div>
						</div>
				    </div>
				    <!--아이템 4 종료-->
				    
				  </div>
			</div>
		</div>
		<!-- ■■■■■■■■■■■■■■■■■■■■■포틀릿 배열 종료■■■■■■■■■■■■■■■■■■ -->

</c:if>
		</div>
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
<script>

let total;
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 팝업시작
	function closeSurvey(){
		closepopSur.close();
	}

	function survRegister(q1, q2, q3){
		var header = $("meta[name='_csrf_header']").attr('content'); 
		var token = $("meta[name='_csrf']").attr('content');
		
		let surv_answer1 = q1;
		let surv_answer2 = q2;
		let surv_answer3 = q3;
		
		console.log(" surv_answer1 : ", surv_answer1);
		console.log(" surv_answer2 : ", surv_answer2);
		console.log(" surv_answer3 : ", surv_answer3);
		
		$.ajax({
			type : "post",
			url : "/common/popupSurveySubmit",
			data : {"surv_answer1" : surv_answer1, "surv_answer2" : surv_answer2, "surv_answer3" : surv_answer3},
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			success : function(res){
				if(res == "OK"){
					console.log("설문조사 완료");
				}
			},
			dataType : "text"
		})	
	}
	
	function pop_sur_change(num){
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		
		let popNum = num;
		
		$.ajax({
			type : "post",
			url : "/common/popupSurveyChange",
			data : {"popNum" : popNum},
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			success : function(res){
				if(res != "NG"){
// 					alert("다시보지 않기 활성화");
				}
			},
			dataType : "text"
		})		
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 나의 포틀릿 시작
	function myPortlet(){		
		  // 메뉴 미리 넣어두기(주체별로 다르게)
		  const potletModalCheck = document.querySelector(".potletModalCheck");
		
		  // 포틀릿 테이블에서 다음과 같은 순서의 데이터베이스를 가져왔다.
		  let databaseData = "";
		  
		<% if(userId.equals("20170003")){ // 관리자인 경우 %> databaseData = "${admin.portlet }";
		<% }else if(userIdLength == 8){ // 학생인 경우 %> databaseData = "${student.portlet }";
		<% }else if(userIdLength == 6){ // 교수인 경우 %> databaseData = "${professor.portlet }"; <%}%>   
		  
		  let myportlets = databaseData.split("");
   		  
		  // 체크박스 class을 읽어온다.
		  let myportletCheckbox = document.querySelectorAll(".portletCheck");

		  // 포틀릿 레이아웃 클래스를 읽어온다.
		  let container = document.querySelector(".potletModalLayout");
		  
		  let str = "";
		  
<% if(userId.equals("20170003") || userIdLength == 6){ // 관리자인 경우 %> 
	  for(let i = 0; i < myportlets.length; i++){
		  switch(myportlets[i]){
		  	case "0": potletModalCheck.children[0].children[0].checked = true; break;
		  	case "1": potletModalCheck.children[1].children[0].checked = true; break;
		  	case "2": potletModalCheck.children[2].children[0].checked = true; break;
		  	case "3": potletModalCheck.children[3].children[0].checked = true; break;
		  	case "4": potletModalCheck.children[4].children[0].checked = true; break;
		  }
	  }
	  
	  // 데이터베이스에 존재하는 번호인 경우 checkbox-checked상태로 만들어준다.
	  for(let i = 0; i < myportlets.length; i++){
	    let myportlet = myportlets[i];
	    myportletCheckbox[0].checked = true;
	    switch(myportlet){
	      case "0": container.innerHTML += "<div class='item item0' draggable='true'>일정</div>"; break;
	      case "1": container.innerHTML += "<div class='item item1' draggable='true'>오늘의 식단</div>"; break;
	      case "2": container.innerHTML += "<div class='item item2' draggable='true'>오늘의 날씨</div>"; break;
	      case "3": container.innerHTML += "<div class='item item3' draggable='true'>나의 도서관</div>"; break;
	      case "4": container.innerHTML += "<div class='item item4' draggable='true'>차트</div>"; break;
	    }
	  } 

	  myportletCheckbox.forEach(function(myportletCheck){
	    myportletCheck.addEventListener("click", function(e){
	      const target = e.target;
	      console.log(target.checked);
	      if(target.checked){          
	        switch(target.id){
	          case "portletCheck0": container.innerHTML += "<div class='item item0' draggable='true'>일정</div>"; break;
	          case "portletCheck1": container.innerHTML += "<div class='item item1' draggable='true'>오늘의 식단</div>"; break;
	          case "portletCheck2": container.innerHTML += "<div class='item item2' draggable='true'>오늘의 날씨</div>"; break;
	          case "portletCheck3": container.innerHTML += "<div class='item item3' draggable='true'>나의 도서관</div>"; break;
	          case "portletCheck4": container.innerHTML += "<div class='item item4' draggable='true'>차트</div>"; break;
	        }
	      }else{
	        switch(target.id){
	          case "portletCheck0": document.querySelector(".item0").remove(); break;
	          case "portletCheck1": document.querySelector(".item1").remove(); break;
	          case "portletCheck2": document.querySelector(".item2").remove(); break;
	          case "portletCheck3": document.querySelector(".item3").remove(); break;
	          case "portletCheck4": document.querySelector(".item4").remove(); break;
	        }          
	      }
	    })
	  })


<% }else if(userIdLength == 8){ // 학생인 경우 %>
	  for(let i = 0; i < myportlets.length; i++){
		  switch(myportlets[i]){
		  	case "0": potletModalCheck.children[0].children[0].checked = true; break;
		  	case "1": potletModalCheck.children[1].children[0].checked = true; break;
		  	case "2": potletModalCheck.children[2].children[0].checked = true; break;
		  	case "3": potletModalCheck.children[3].children[0].checked = true; break;
		  	case "4": potletModalCheck.children[4].children[0].checked = true; break;
		  	case "5": potletModalCheck.children[5].children[0].checked = true; break;
		  	case "6": potletModalCheck.children[6].children[0].checked = true; break;
		  	case "7": potletModalCheck.children[7].children[0].checked = true; break;
		  }
	  }
	  
	  // 데이터베이스에 존재하는 번호인 경우 checkbox-checked상태로 만들어준다.
	  for(let i = 0; i < myportlets.length; i++){
	    let myportlet = myportlets[i];
	    myportletCheckbox[0].checked = true;
	    switch(myportlet){
	      case "0": container.innerHTML += "<div class='item item0' draggable='true'>일정</div>"; break;
	      case "1": container.innerHTML += "<div class='item item1' draggable='true'>나의 시간표</div>"; break;
	      case "2": container.innerHTML += "<div class='item item2' draggable='true'>오늘의 식단</div>"; break;
	      case "3": container.innerHTML += "<div class='item item3' draggable='true'>이수 정보</div>"; break;
	      case "4": container.innerHTML += "<div class='item item4' draggable='true'>커뮤니티</div>"; break;
	      case "5": container.innerHTML += "<div class='item item5' draggable='true'>오늘의 날씨</div>"; break;
	      case "6": container.innerHTML += "<div class='item item6' draggable='true'>나의 도서관</div>"; break;
	      case "7": container.innerHTML += "<div class='item item7' draggable='true'>상담 이력</div>"; break;
	    }
	  } 

	  myportletCheckbox.forEach(function(myportletCheck){
	    myportletCheck.addEventListener("click", function(e){
	      const target = e.target;
	      console.log(target.checked);
	      if(target.checked){          
	        switch(target.id){
	          case "portletCheck0": container.innerHTML += "<div class='item item0' draggable='true'>일정</div>"; break;
	          case "portletCheck1": container.innerHTML += "<div class='item item1' draggable='true'>나의 시간표</div>"; break;
	          case "portletCheck2": container.innerHTML += "<div class='item item2' draggable='true'>오늘의 식단</div>"; break;
	          case "portletCheck3": container.innerHTML += "<div class='item item3' draggable='true'>이수 정보</div>"; break;
	          case "portletCheck4": container.innerHTML += "<div class='item item4' draggable='true'>커뮤니티</div>"; break;
	          case "portletCheck5": container.innerHTML += "<div class='item item5' draggable='true'>오늘의 날씨</div>"; break;
	          case "portletCheck6": container.innerHTML += "<div class='item item6' draggable='true'>나의 도서관</div>"; break;
	          case "portletCheck7": container.innerHTML += "<div class='item item7' draggable='true'>나의 역량</div>"; break;
	        }
	      }else{
	        switch(target.id){
	          case "portletCheck0": document.querySelector(".item0").remove(); break;
	          case "portletCheck1": document.querySelector(".item1").remove(); break;
	          case "portletCheck2": document.querySelector(".item2").remove(); break;
	          case "portletCheck3": document.querySelector(".item3").remove(); break;
	          case "portletCheck4": document.querySelector(".item4").remove(); break;
	          case "portletCheck5": document.querySelector(".item5").remove(); break;
	          case "portletCheck6": document.querySelector(".item6").remove(); break;
	          case "portletCheck7": document.querySelector(".item7").remove(); break;
	        }          
	      }
	    })
	  })
<%}%>		  

		  //------------------------------------------------------
		  
		  let picked = null;
		  let pickedIndex = null;

		  // 드래그 dragstart, dragover, drop
		  container.addEventListener("dragstart", (e)=>{
		    // console.log(e.target);
		    const obj = e.target;
		    picked = obj;
		    pickedIndex = ([...obj.parentNode.children].indexOf(obj));
// 		    console.log(pickedIndex);
		  });

		  container.addEventListener("dragover", (e)=>{
		    e.preventDefault();
		  });

		  container.addEventListener("drop", (e)=>{
		    const obj = e.target;
		    console.log(pickedIndex);
		    const index = ([...obj.parentNode.children].indexOf(obj));
		    console.log("나는 obj");
		    console.log(obj);
		    console.log("나는 index");
		    console.log(index);
		    console.log("나는 pickedIndex");
		    index > pickedIndex ? obj.after(picked): obj.before(picked);

      console.log(index);
		  });
	}
	
	const successMessage =  document.querySelector("#successMessage");
	const failMessage =  document.querySelector("#failMessage");
	
	function saveSPortlet(){
	    let savePortlet = "";
	    let items = document.querySelectorAll(".item");
	    console.log(items);
	    for(let i = 0; i < items.length; i++){
	        let item = items[i].className;
	        item = item.charAt(item.length-1);
	        savePortlet += item;
	    }
	    console.log("최종" + savePortlet);
	    
	    savePortlet = {
	    		"savePortlet" : savePortlet
	    };
	    
    	let xhr = new XMLHttpRequest();
    	xhr.open("post", "/mainPagePortlet/update", true);
    	xhr.setRequestHeader(header, token);
    	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    	xhr.onreadystatechange = function(){
    		if(xhr.readyState == 4 && xhr.status == 200){
    			console.log("성공적으로 업데이트 되었습니다.");
    			console.log(xhr.responseText);
    			let check = xhr.responseText;
    			if(check == "1"){
    				successMessage.style.display = "block";
    				failMessage.style.display = "none";
    			}else{
    				failMessage.style.display = "block";
    				successMessage.style.display = "none";
    			}
    			
    			setTimeout(function() {
    				// document.querySelector(".portletCloseBtn").click();
    				location.href = "/main/home";
    			}, 1000);
    		}
    	}
    	xhr.send(JSON.stringify(savePortlet));
	}
	
	// 포틀릿 설정 저장
	function sortStackItem(){
	 	let myportlets = "";
		<% if(userId.equals("20170003")){ // 관리자인 경우 %> myportlets = "${admin.portlet }";
		<% }else if(userIdLength == 8){ // 학생인 경우 %> myportlets = "${student.portlet }";
		<% }else if(userIdLength == 6){ // 교수인 경우 %> myportlets = "${professor.portlet }"; <%}%>   
	  
	    myportlets = myportlets.split("");

  		let parent = document.querySelector(".grid-stack");
  		let stackItem = document.querySelectorAll(".grid-stack-item");
  		let numbers = "";
  		for(let j = 0; j < myportlets.length; j++){  			
	  		for(let i = 0; i < stackItem.length; i++){
	  			let stack = stackItem[i];
	  		    let stackNumber = stackItem[i].className;
	  		    const regex = /[^0-9]/g;
	  		  	stackNumber = stackNumber.replaceAll(regex, "");
  		    	if(myportlets[j] == stackNumber){
  		    		numbers += stackNumber;
  		    		parent.appendChild(stack);
  		    		break;
  		    	}
	  		}
  		}
  		console.log("내상태");
  		console.log(numbers);
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 로드
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 공지사항■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	function requestList() {

		$.ajax({
					url : "/notice/noticeAllList",
					type : "get",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						testable.clear().draw();
						console.log(data);
						data.forEach(function(obj, idx) {
									if (obj.mmem_no == '20170003') {
										html = "<td style='width: 60px;'>관리자</td>";
									}
									testable.row.add(
						[
								"<td style='width: 40px;'>"
										+ (idx + 1)
										+ "</td>",
								"<td style = 'width:400px;'><a href = '/notice/detail?no="
										+ obj.notice_no
										+ "'>"
										+ obj.notice_title
										+ "</a></td>",
								html,
								"<td style='width: 80px;'>"
										+ obj.notice_date
										+ "</td>",
								"<td style='width: 70px;'>"
										+ obj.notice_count
										+ "</td>"
										])
				.draw(false);

				});
			}
		});

	}
	function responseNotice(xhr, msg) {

		console.log(xhr);
		if (typeof xhr != 'undefined' || xhr != null) {
			console.log(Object.values(xhr.list[0].notice_no));
			console.log(Object.values(xhr.list[0].notice_title));
			for (var i = 0; i < xhr.list.length; i++) {
				html += "<td>" + xhr.list[i].notice_no + "</td>";
				html += "<td>" + xhr.list[i].notice_title + "</td>";
				html += "<td>" + xhr.list[i].mmem_no + "</td>";
				html += "<td>" + xhr.list[i].notice_date + "</td>";
				html += "<td>" + xhr.list[i].notice_count + "</td>";
			}
			document.getElementById('.n_list').innerHTML = html;
		} else {
			console.log("continue");
		}
	}
	function selectCategory(category){
		
		var category = document.querySelector("#category").value;
		$.ajax({
			url : "/notice/selectCategory",
			method : "get",
			data : {"category" : category},
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				var html = "";
				console.log(data);
				testable.clear().draw();
				data.forEach(function(obj, idx) {
				if (obj.mmem_no == '20170003') {
					html = "<td style='width:60px;'>관리자</td>";
				}
				
				
				testable.row.add([
					  "<td style='width:40px;'>"
					+ (idx + 1)
					+ "</td>",
					  "<td style='width:450px;'><a href = '/notice/detail?no="
					+ obj.notice_no
					+ "'>"
					+ obj.notice_title
					+ "</a></td>",
					  html,
					  "<td style='width:80px;'>"
					+ obj.notice_date
					+ "</td>",
					  "<td style='width:70px;'>"
					+ obj.notice_count
					+ "</td>"]).draw(false);
					});
			}
		});
}

	function responseCategory(xhr, msg) {

		console.log(xhr);
		if (typeof xhr != 'undefined' || xhr != null) {
			console.log(Object.values(xhr.list[0].notice_no));
			console.log(Object.values(xhr.list[0].notice_title));
			for (var i = 0; i < xhr.list.length; i++) {
				html += "<td>" + xhr.list[i].notice_no + "</td>";
				html += "<td>" + xhr.list[i].notice_title + "</td>";
				html += "<td>" + xhr.list[i].mmem_no + "</td>";
				html += "<td>" + xhr.list[i].notice_date + "</td>";
				html += "<td>" + xhr.list[i].notice_count + "</td>";
			}
			document.getElementById('.nor_list').innerHTML = html;
		} else {
			console.log("continue");
		}
	}
	
	
	
	
	
	
	function selectb(category){
		var category = document.querySelector("#category1").value;
		console.log(category);

		console.log(category);
		$.ajax({
			url : "/notice/selectCategory",
			method : "get",
			data : {"category" : category},
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				var html = "";
				console.log(data);
				testable.clear().draw();
				data.forEach(function(obj, idx) {
				if (obj.mmem_no == '20170003') {
					html = "<td style='width:60px;'>관리자</td>";
				}
				
				
				testable.row.add([
					  "<td style='width:40px;'>"
					+ (idx + 1)
					+ "</td>",
					  "<td style='width:450px;'><a href = '/notice/detail?no="
					+ obj.notice_no
					+ "'>"
					+ obj.notice_title
					+ "</a></td>",
					  html,
					  "<td style='width:80px;'>"
					+ obj.notice_date
					+ "</td>",
					  "<td style='width:70px;'>"
					+ obj.notice_count
					+ "</td>"
					]).draw(false);
					});
			}
		});
}

	function responseCategory(xhr, msg) {

		console.log(xhr);
		if (typeof xhr != 'undefined' || xhr != null) {
			console.log(Object.values(xhr.list[0].notice_no));
			console.log(Object.values(xhr.list[0].notice_title));
			for (var i = 0; i < xhr.list.length; i++) {
				html += "<td>" + xhr.list[i].notice_no + "</td>";
				html += "<td>" + xhr.list[i].notice_title + "</td>";
				html += "<td>" + xhr.list[i].mmem_no + "</td>";
				html += "<td>" + xhr.list[i].notice_date + "</td>";
				html += "<td>" + xhr.list[i].notice_count + "</td>";
			}
			document.getElementById('.').innerHTML = html;
		} else {
			console.log("continue");
		}
	}
	
	
	
	function selectc(category){
		var category = document.querySelector("#category2").value;
		console.log(category);

		console.log(category);
		$.ajax({
			url : "/notice/selectCategory",
			method : "get",
			data : {"category" : category},
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				var html = "";
				console.log(data);
				testable.clear().draw();
				data.forEach(function(obj, idx) {
				if (obj.mmem_no == '20170003') {
					html = "<td style='width:60px;'>관리자</td>";
				}
				
				
				testable.row.add([
					  "<td style='width:40px;'>"
					+ (idx + 1)
					+ "</td>",
					  "<td style='width:450px;'><a href = '/notice/detail?no="
					+ obj.notice_no
					+ "'>"
					+ obj.notice_title
					+ "</a></td>",
					  html,
					  "<td style='width:80px;'>"
					+ obj.notice_date
					+ "</td>",
					  "<td style='width:70px;'>"
					+ obj.notice_count
					+ "</td>" ]).draw(false);
					});
			}
		});
}

	function responseCategory(xhr, msg) {

		console.log(xhr);
		if (typeof xhr != 'undefined' || xhr != null) {
			console.log(Object.values(xhr.list[0].notice_no));
			console.log(Object.values(xhr.list[0].notice_title));
			for (var i = 0; i < xhr.list.length; i++) {
				html += "<td>" + xhr.list[i].notice_no + "</td>";
				html += "<td>" + xhr.list[i].notice_title + "</td>";
				html += "<td>" + xhr.list[i].mmem_no + "</td>";
				html += "<td>" + xhr.list[i].notice_date + "</td>";
				html += "<td>" + xhr.list[i].notice_count + "</td>";
			}
			document.getElementById('.').innerHTML = html;
		} else {
			console.log("continue");
		}
	}

	
	let testable;
	let showTimeTableBtn = document.querySelector("#showTimeTableBtn");
	
	let grid;
	window.onload = function(){
		
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');

		let eh_userId = <%=userId%> 
		let eh_userIdLength = <%=userIdLength%>
		
		// 헤더 사진 적용
		const headerImage = document.querySelector("#headerImage");
		
		if(eh_userId != "20170003" && eh_userIdLength != 6){ // 학생인 경우
			headerImage.src =decodeURI("${student.photo }");
			capability();			
			showChart(); // 차트
			
			document.querySelector("#yearSemester").value = '2022/1';
			let dd = document.querySelector("#yearSemester").value;
			drawTimeTable(dd); // 시간표
			showTimeTableBtn.addEventListener("click", function(){
				let ddd = document.querySelector("#yearSemester").value;
				drawTimeTable(ddd);
			});
			
			mainMyCommunity(); // 커뮤니티			
		}else if(eh_userIdLength == 6){
			headerImage.src =decodeURI("${professor.photo }");
		}
		
		sortStackItem();

		
		//공지사항
		testable = $("#testable").DataTable({
			displayLength : 3,
			destroy : true,
			ordering : false,
			info : false,
			responsive : true,
			visible : true,
			fixedHeader : true,
			searching : false,
			minHeight: false,
		});
		$("#testable_paginate").remove();		
		requestList();
		
		// 캘린더
		
		showCalendar();
		
		//그리드 스택
	    grid = GridStack.init({
	        cellHeight: 660,
	        acceptWidgets: true
	       /*
	    	cellHeight: 700,
	       acceptWidgets: true,
	       */
	    });
	    
		// 팝업 광고, 팝업설문조사 띄우기 
		window.closepopSur;
		
		myPortlet(); // 포틀릿
		getWeather(); // 날씨
		getFoodList(); // 식단표
// 		drawCalendar(); // 캘린더
		window.closepopSur; // 팝업 광고, 팝업설문조사 띄우기
	//	popUpOn(); // 팝업 광고 
	//	popUpCheck(); // 팝업 광고 체크
	//	popUpSurOn(); // 팝업 설문 조사 
	//	popUpSurCheck(); // 팝업 설문 조사 체크
// 		getCounselApplyList(); // 최근 상담내역
		getBookList();// 도서 내역
		
		// 기사 보기(기본값 검색)
		document.querySelector("#searchNewsWord").value = "대학교";
		document.querySelector("#searchNewsWord").nextElementSibling.click();
			
		
// 		newsCrolling();
	    // ---------------------------------- 메인 페이지 (배경 사진) 적용하기
	    // background-image: url('/resources/images/눈오는대학교.jpg'); background-size: contain; background-repeat: no-repeat
	    /*
	    let content_body = document.querySelector(".content-body");
	    content_body.style.backgroundImage = "url('/resources/images/눈오는대학교.jpg')";
	    content_body.style.backgroundSize = "contain";
	    content_body.style.backgroundRepeat = "no-repeat";
		*/
		
		$.ajax({
			type : "post",
			url : "/common/popupSurveyState",
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			success : function(res){
				console.log(res);
				
				if(res.popup_reject != 1){
					window.open("/common/popUp","","scrollbars=no,menubar=no,top=300px,left=400,width=570,height=610");			
				}
				if(res.surv_reject != 1){	
					closepopSur = window.open("/common/popSur","","scrollbars=no,menubar=no,top=300px,left=1000,width=600,height=610");			
				}
				
			},
			dataType : "json"
		})
		
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■시간표■■■■■■■■■■■■■■■■■■■■■■
	const timeTableList = document.querySelector("#timeTableList");
	function drawTimeTable(str){
		let tmpstr = str.split("/")
		let jsonData = {
				smem_no : '${userId}',
				year: tmpstr[0],
				semester:tmpstr[1]	
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open("post", '/schedule/showList',true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4&& xhr.status == 200){
				console.log(JSON.parse(xhr.responseText))
				
				let timetable = JSON.parse(xhr.responseText);
				
				let dayArray = ['월','화','수','목','금']
				let timeArray = ['9','10','11','12','13','14','15','16','17','18']
				text = '';
				// 타임 테이블 생성
				for(let i=9;i<=18;i++){
					text += '<tr>';				
					text += '<td>'+i+'</td>';				
					text += '<td></td>';				
					text += '<td></td>';				
					text += '<td></td>';				
					text += '<td></td>';				
					text += '<td></td>';				
					text += '</tr>';				
				}
				
				timeTableList.innerHTML = text;
				
				timetable.forEach((time, i)=>{
					text += '<tr>';
					text += '<td>09:00</td>';
					for(let i=1;i<=2;i++){
						let str = "ST_DAY"+i;
						let start = "ST_STARTTIME"+i;
						let end = "ST_ENDTIME"+i;
						let tdPosition = dayArray.indexOf(time[str])+1;
						let startTime = timeArray.indexOf(time[start])+1;
						
						timeTableList.children[startTime].children[tdPosition].innerText = time.LOL_NAME;
						timeTableList.children[startTime].children[tdPosition].style.backgroundColor = "#304674";
						timeTableList.children[startTime].children[tdPosition].style.color = "white";
						if(time[end]*(1) - time[start]*(1) == 2){
							timeTableList.children[startTime].children[tdPosition].setAttribute("rowspan",2);
							timeTableList.children[startTime+1].children[tdPosition].classList.add("delete");
						}
					}
				})
				
				let deleteArray = document.querySelectorAll(".delete");
				deleteArray.forEach((value,i)=>{
					value.remove();
				})
				
				
				
			}
		}
		xhr.setRequestHeader(header,token);
		xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8")
		xhr.send(JSON.stringify(jsonData));
	}
	
	
	// ■■■■■■■■■■■■■■■■■■■■■차트차트차트차트■■■■■■■■■■■■■■■■■■■■■■
	function showChart(){
		
		let xhr = new XMLHttpRequest();
		xhr.open('get','/main/chart', true);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				let jsonData = JSON.parse(xhr.responseText);
				let jsonObject={};
				let total=0;
				jsonData.forEach((value,i)=>{
					jsonObject[value.LG_AREA.replace("/","")]=value.CREDIT
					total+=value.CREDIT;
				})
				
				document.querySelector("#totalCredit").innerText = total;
				document.querySelector("#mcCredit").innerText = jsonObject.전공선택;
				document.querySelector("#mnCredit").innerText = jsonObject.전공필수;
				document.querySelector("#ccCredit").innerText = jsonObject.교양필수;
				document.querySelector("#cnCredit").innerText = jsonObject.교양선택;
				document.querySelector("#processResult").innerHTML = Math.round(total/130*100)+"<span style='font-size:20px;'>%</span>";
				
				const ctx = document.getElementById('myChart');
				
				var data = {
					labels: [['이수학점','130학점'], ['전공/선택','79학점'], ['전공/필수','21학점'], ['교양/선택','15학점'], ['교양/필수','15학점'], ['봉사시간','72시간'], ['어학','850점']],
					datasets: [{
						label: '',
						data: [total/130*100, jsonObject.전공선택/79*100, jsonObject.전공필수/21*100, jsonObject.교양필수/15*100, jsonObject.교양선택/15*100, 32/72*100, 785/850*100],
						borderWidth:1,
						backgroundColor:"#5a6ee5",
					}],
				}
				
				var options = {
					
				    type: 'bar',
				    data: data,
				    options: {
						
				        legend: {//범례 설정
				        	display:false,
				            labels: {
				                fontColor: 'rgb(255, 255, 255)'
				            }
				        },
				        responsive: true,
				        scales: {
				        	//y축 설정
				            yAxes: [{
				            	display:false,
								ticks: {
									suggestedMax:100,    // minimum will be 0, unless there is a lower value.
									suggestedMin:0
								}
				            }],
				            //x축 설정
				            xAxes: [{
//		 		                position:"top",
								maxBarThickness: 20,
								
				                visible: false,
								ticks:{
									fontColor:'black',
								},
				                gridLines: {
				                	display:false,
				                    color: "black",
				                }
				            }]
				        }
				    }
				}		

				new Chart(ctx, options);
			}
		}
		xhr.setRequestHeader(header, token);
		xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
		xhr.send();
		
	}
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 도서목록
	function getBookList(){
		// 도서 목록 & 내가 빌린 도서 목록  
		$.ajax({
			type : "post",
			url : "/mainPageBook/getBookRental ",
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			success : function(res){
				console.log("도서 대출 현황 : ",res);
				$("#rentBook").html("대출 도서: " + res.RENT0);
				$("#overDate").html("연체 도서: " + res.RENT1);
			},
			dataType : "json"
		})
		
		
		const bookListTable = $("#bookListTable");
		$.ajax({
			
			type : "post",
			url : "/mainPageBook/getBookList",
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			success : function(res){
				console.log("도서  리스트 : ",res);
				
				let eHtml = `<thead class="custom-theader-s">
								<tr>
									<th style="width:30px; border: none;">제목</th>
									<th style="width:30px; border: none;">저자</th>
									<th style="width:30px; border: none;">카테고리</th>
								</tr>
							</thead>`;
				
							eHtml += `<tbody>`;
							
				for(let i=0;i<res.length;i++){
					eHtml += `
									<tr style="text-align : center;">
										<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${res[i].book_name}">\${res[i].book_name}</td>
										<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${res[i].book_writer}">&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].book_writer}</td>
										<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${res[i].book_category}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].book_category}</td>
									</tr>
							`;							
				}
				
				eHtml += `</tbody>`;
				
				$(bookListTable).html(eHtml);
				
			},
			
			dataType : "json"
		})
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 최근 상담 내역
// 	function getCounselApplyList(){
// 		const mainPageCounselapplyListObj = $("#mainPageCounselapplyList");
		
// 		$.ajax({
// 			type : "post",
// 			url : "/mainPageCounsel/mainPageCounselapplyList",
// 			beforeSend : function(xhr){
// 	    	    xhr.setRequestHeader(header, token);
// 	     	},
// 			success : function(res){
<%-- 				let userId = <%=userIdLength%>; --%>
// 				console.log("세션값이다  : " + userId);
// 				console.log("상담신청내역 리스트 : ",res);
				
// 				let eHtml = ``;
				
// 				if(userId == 8){
// 					eHtml += `<tr>
// 								<th>교수이름</th>
// 								<th>신청일</th>
// 								<th>상태</th>
// 							  </tr>`;	
// 				}else{
// 					eHtml += `<tr>
// 								<th>학생이름</th>
// 								<th>신청일</th>
// 								<th>상태</th>
// 							  </tr>`;
// 				}
				
// 				if(res.length > 0){
// 					for(let i=0;i<res.length;i++){
// 						eHtml += `<tr>
// 									<td>\${res[i].mem_name}</td>
// 									<td>\${res[i].cnsla_date}</td>
// 								  `;
// 								  if(${res[i].cnsla_state == 0}){
// 									  eHtml += `<td>대기</td>`;  
// 								  }else if(${res[i].cnsla_state == 1}){
// 									  eHtml += `<td>승인</td>`;
// 								  }else if(${res[i].cnsla_state == 2}){
// 									  eHtml += `<td>반려</td>`;
// 								  }else{
// 									  eHtml += `<td>완료</td>`;
// 								  }
// 						eHtml += `</tr>`;							
// 					}
// 				}else{
// 					eHtml += `<tr>
// 									<td colspan="3">상담 내역이 존재하지 않습니다</td>
// 								</tr>
// 							 `;	
// 				}
				
// 				$(mainPageCounselapplyListObj).html(eHtml);
				
// 			},
// 			dataType : "json"
// 		})
// 	}
	
	// keyEvent
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 식단표
    
	function getFoodList(){
	    $.ajax({
	        url : "/mainPageFood/getFoodList",
	        type : "GET",
	        success : function(res){
	           console.log("식단표 result : ",res);
	           
	           var str = '';
	           var divCarousel = $("#divCarousel");
	           
	           for(var i = 0; i < res.length; i++){
	              str += '<div id="car'+i+'" class="carousel-item" style="height: 350px;">'
	              str +=      `<div id="title1" style="margin-top: 10px; font-size:2.0em; text-align: center;  font-family: '양진체';"> 
	                               \${res[i].food_date}
	                             </div>
	                             <div style="font-size:1.5em; text-align: center; font-family: '양진체';">`;
	                             
	                             
	                             let dayofweek = `\${res[i].dayofweek}`;
	                             switch (dayofweek) {
									case "월요일": str += `<img alt="" src="/resources/images/dayofweek/월요일.png">`; break;
									case "화요일": str += `<img alt="" src="/resources/images/dayofweek/화요일.png">`; break;
									case "수요일": str += `<img alt="" src="/resources/images/dayofweek/수요일.png">`; break;
									case "목요일": str += `<img alt="" src="/resources/images/dayofweek/목요일.png">`; break;
									case "금요일": str += `<img alt="" src="/resources/images/dayofweek/금요일.png">`; break;	
									default: str += `\${res[i].dayofweek}`; break;
								}
	                             
	               str +=	  `</div>
	                             <div id="content1">
	                                <div style="padding: 12px;">
	                                   <div class="input-group">
	                                         <div class="input-group-prepend"><span class="input-group-text" style="background-color: var(--custom-s); color: #ffffff;">조식</span>
	                                         </div>
	                                         <textarea class="form-control">\${res[i].breakfast}</textarea>
	                                     </div>
	                                     <br>
	                                   <div class="input-group">
	                                         <div class="input-group-prepend"><span class="input-group-text" style="background-color: var(--custom-s); color: #ffffff;">중식</span>
	                                         </div>
	                                         <textarea class="form-control">\${res[i].lunch}</textarea>
	                                     </div>
	                                     <br>
	                                   <div class="input-group">
	                                         <div class="input-group-prepend"><span class="input-group-text" style="background-color: var(--custom-s); color: #ffffff;">석식</span>
	                                         </div>
	                                         <textarea class="form-control">\${res[i].dinner}</textarea>
	                                     </div>
	                                     <br>
	                                </div>
	                             </div>
	                          </div>`;
	           }
	           	           
	           divCarousel.html(str);
	           $("#car2").attr("class","carousel-item active");
	           
	        }
	     })
    }
	
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 커뮤니티
    // 커뮤니티 게시글 목록 가져오기
	const communityPost = document.querySelector("#communityPost");
	const communityLike = document.querySelector("#communityLike");
    
	//아작스 통신을 위한 csrf 인증 토큰
	let header = '${_csrf.headerName}';
	let token = '${_csrf.token}';
    
    function mainMyCommunity(){
    	let xhr = new XMLHttpRequest();
    	xhr.open("get", "/mainPageCommunity", true);
    	xhr.setRequestHeader(header, token);
    	xhr.onreadystatechange = function(){
    		if(xhr.readyState == 4 && xhr.status == 200){
    			let data = JSON.parse(xhr.responseText);
		    	
    			let myPost = data.myPost;
    			let myLike = data.myLike;

    			let str = "";    			
				str += '<table class="table table-hover">';
				str += '<thead>';
				str += '<tr>';
				str += '<td>카테고리</td><td>느낌</td><td>제목</td>';
				str += '</tr>';
				str += '</thead>';
				str += '<tbody>';
				
    			if(myPost.length == 0){
    				str += "<tr><td colspan='5'>내가 작성한 게시글이 없습니다.</td></tr>";
    			}else{
	    			for(let i = 0; i < myPost.length; i++){
	    				str += '<tr>';
	    				str += '<td><span class="badge badge-dark">'+ myPost[i].cmnt_category +'</span></td>';
	    				str += '<td><span class="badge badge-light">'+ myPost[i].cmnt_feeling +'</span></td>';
	    				str += '<td><a href="/community/detail/'+ myPost[i].cmnt_no +'">'+ myPost[i].cmnt_title +'</a></td>';
						str += '<tr>';
	    			}	
    			}
				str +='</tbody>';
				str +='</table><br/>';
    			
				communityPost.innerHTML = str;
			
				str = '<table class="table table-hover">';
				str += '<thead>';
				str += '<tr>';
				str += '<td>카테고리</td><td>느낌</td><td>제목</td>';
				str += '</tr>';
				str += '</thead>';
				str += '<tbody>';
				
    			if(myLike.length == 0){
    				str += "<tr><td colspan='3'>내가 좋아요한 게시글이 없습니다.</td></tr>";
    			}else{
	    			for(let i = 0; i < myLike.length; i++){
	    				str += '<tr>';
	    				str += '<td><span class="badge badge-dark">'+ myLike[i].cmnt_category +'</span></td>';
	    				str += '<td><span class="badge badge-light">'+ myLike[i].cmnt_feeling +'</span></td>';
	    				str += '<td><a href="/community/detail/'+ myLike[i].cmnt_no +'">'+ myLike[i].cmnt_title +'</a></td>';
						str += '<tr>';
	    			}	
    			}
				str +='</tbody>';
				str +='</table>';

				communityLike.innerHTML = str;	
    		}
    	}
    	xhr.send();
 
    }	
    
    
    
 // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 날씨
    function getWeather(){
 	      //날씨 api 로드하는 부분입니다!
 	      var weather1 = $("#weather1");
 	      var weather2 = $("#weather2");
 	      var weather2_1 = $("#weather2_1");
 	      var weather2_2 = $("#weather2_2");
 	      var weather3 = $("#weather3");
 	      var weather3_1 = $("#weather3_1");
 	      var weather3_2 = $("#weather3_2");
 	      var weather3_3 = $("#weather3_3");
 	      var weather3_4 = $("#weather3_4");
 	      var weather3_5 = $("#weather3_5");
// 	       var weather3_6 = $("#weather3_6");
 	      
 	      
 	      $.ajax({
 	         url : "/api/weather",
 	         type : "get",
 	         contentType : "application/json",
 	         dataType: "json",
 	         success : function(data, status, xhr){
 	            let dataHeader = data.result.response.header.resultCode;
 	            
 	            if(dataHeader == "00"){
 	               console.log("success");
 	               console.log(data);
 	               //기온
 	               var temp = data.result.response.body.items.item[0].fcstValue;
 	               //하늘상태
 	               var skyState = data.result.response.body.items.item[4].fcstValue;
 	               //강수확률
 	               var percentRain = data.result.response.body.items.item[7].fcstValue;
 	               //풍속
 	               var windSpeed = data.result.response.body.items.item[4].fcstValue;
 	               //강수형태
 	               var rainForm = data.result.response.body.items.item[6].fcstValue;
 	               //강수량
 	               var rainAmount = data.result.response.body.items.item[9].fcstValue;
 	               //파고
 	               var wave = data.result.response.body.items.item[8].fcstValue;
 	               
 	               var str = "";
 	               
 	               if(skyState <= 5){
 	                  //맑음
 	                  str += '<img alt="" src="../resources/images/sunny.png" width="65%">';
 	                  weather2_2.html("맑음");
 	               }else if(skyState >= 6 && skyState <= 8){
 	                  //구름많음
 	                  if(rainForm == 3){
 	                     //눈
 	                     str += '<img alt="" src="../resources/images/snow.png">';
 	                     weather2_2.html("구름많고 눈");
 	                  }else if(rainForm == 0){
 	                     //흐림
 	                     str += '<img alt="" src="../resources/images/littleSun.png">';
 	                     weather2_2.html("구름많음");
 	                  }else{
 	                     str += '<img alt="" src="../resources/images/rain.png">';
 	                     weather2_2.html("구름많고 비");
 	                  }
 	                  
 	               }else{
 	                  //흐림
 	                  if(rainForm == 3){
 	                     //눈
 	                     str += '<img alt="" src="../resources/images/snow.png">';
 	                     weather2_2.html("흐리고 눈");
 	                  }else if(rainForm == 0){
 	                     //흐림
 	                     str += '<img alt="" src="../resources/images/cloud.png">';
 	                     weather2_2.html("흐림");
 	                  }else{
 	                     str += '<img alt="" src="../resources/images/rain.png">';
 	                     weather2_2.html("흐리고 비");
 	                  }
 	               }
 	               
 	               weather1.html(str); 
 	               weather2_1.html(temp+" ℃");                  
 	               weather3_1.append(rainAmount + " mm")                  
 	               weather3_2.append(percentRain + " %")                  
 	               weather3_3.append(windSpeed + " m/s")                  
 	               weather3_4.append(wave + " m")                  
 	                           
 	            }else{     
 	               console.log("fail");
 	               console.log(data);
 	            }
 	         },
 	         error : function(e, status, xhr, data){
 	               console.log("error~~~~~~~~~~~~");
 	               console.log(data);
 	         }
 	      })  
 	  }

    let miniCal;
 // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 캘린더
    function drawCalendar(){

    	class MiniCalendar{
    	    constructor(el, data){
    	        if(typeof(el) != 'object'){
    	            return;
    	        }
    	        this.date = new Date();   // 현재 캘린더 날짜(주단위로 뽑기용)
    	        this.el = el;             // 미니캘린더 element
    	        this.tagDraw(data)
    	        new Promise((resolve, reject)=>{
    	        	this.init(resolve, reject);
    	        }).then((data)=>{
    	        	this.event = data;    // event Data
	    	        this.drawCal(this.el,this.date);
    	        })
    	        el.style.fontWeight = "bold";
    	        el.style.color = "black";
    	        
    	        return this;
    	    }
    	    
    	    tagDraw(data){
    	    	let text ='';
    	    	text += '<div class="col-2 prevBtn text-center" style="cursor:pointer;height:50px;">';
    	    	text += '&lt;';
    	    	text += '</div>';
    	    	text += '<div class="col-8">';
    	    	text += '<div class="col-12 text-center" style="font-size:40px;"><img src="/resources/images/icon/주간일정.png"> &nbsp;주간 일정</div>';
    	    	text += '    <div class="col-12 text-center mb-3" style="font-size:25px;"><span class="yearField">2023</span>.<span class="monthField">2</span></div>';
    	    	text += '    <div class="col-12">';
    	    	text += '        <div class="row pt-3" style="font-size: 25px;">';
    	    	text += '            <div class="col cal-day">일</div>';
    	    	text += '            <div class="col cal-day">월</div>';
    	    	text += '            <div class="col cal-day">화</div>';
    	    	text += '            <div class="col cal-day">수</div>';
    	    	text += '            <div class="col cal-day">목</div>';
    	    	text += '            <div class="col cal-day">금</div>';
    	    	text += '            <div class="col cal-day">토</div>';
    	    	text += '        </div>';
    	    	text += '        <div class="row weekField pt-3 mb-5" style="font-size: 25px;">';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '        </div>';
    	    	text += '        <div class="row">';
    	    	text += '        	<div class="calInfo col"></div>';
    	    	text += '        </div>';
    	    	text += '    </div>';
    	    	text += '</div>';
    	    	text += '<div class="col-2 nextBtn text-center" style="cursor:pointer;height:50px;">';
    	    	text += '    &gt;';
    	    	text += '</div>';
    	    	this.el.innerHTML = text;
    	    }
    	    
    	    init(resolve, reject){
    			let calJson = {
    					CLDR_CATEGORY:'0',
    					CLDR_START:null
    			}
    			$.ajax({
	  				  url: "/calendar/showList",
	  				  type: "POST",
	  				  data:JSON.stringify(calJson),
	  				  dataType: "JSON",
	  				  contentType:"application/json;charset=utf-8",
	  				  beforeSend : function(xhr){
	  			        xhr.setRequestHeader(header, token);
	  			      },
	  				  success : function(data){
	  					  resolve(data);
	  				  },
	  				  error : function(request,status,error){
	  				  }
  				});
    	       }
    	    dateFormat(date, state){
    	    	let str='';
    	    	let year='';
    	    	let month='';
    	    	let day='';
    	    	if(state == 0){
	    	    	year = date.getYear() + 1900;
	    	    	month = date.getMonth()+1;
	    	    	day = date.getDate();
	    	    	str = year + "-" + month + "-" + day;
    	    	}else if(state == 1){
    	    		day = date.getDate();
    	    		str = day;
    	    	}
    	    	
    	    	return str;
    	    }
    	    
    	    toDayDraw(){
    	    	let field = this.el.querySelector(".calInfo");
    			field.innerHTML = "";
    			let text='';
    			let tag='';
    			
    	    	this.event.forEach((value,i)=>{
    	    		let today = this.dateFormat(new Date(this.today));
    	    		
    	    		// 주 시작
    	    		
    	    		// 주 끝
    	    		if(this.start < value.start && this.end > value.start){
    	    			console.log(new Date(value.start).getDay())
    	    			
    	    			tag='<div class="circleDiv"></div>';
    	    			
	    	    		text+='<div class="mb-3" style="font-size:20px;">';
						text+='<span class="text-black">'+this.dateFormat(new Date(value.start),1)+'일. '+value.title+'</span>';
	    	    		text+='</div>';
	    	    		
	    	    		this.el.querySelector(".weekField").children[new Date(value.start).getDay()].innerHTML+=tag;
    	    		}
    	    	})
    	    	field.innerHTML = text;
    	    	console.log("event3333 : ",this.event)
    	    }
    	    
    	    drawCal(el,date){
    	        this.day = date.getDay();        // 현재 요일
    	        this.today = new Date(date);     // 오늘 날짜
    	        this.month = date.getMonth()+1;  // 현재 달
    	        this.year = date.getYear()+1900; // 현재 년도

    	        let tmpDate = new Date(date);
    	        this.start = new Date(tmpDate.setDate(tmpDate.getDate()-this.day));
    	        tmpDate = new Date(this.start);
    	        this.end = new Date(tmpDate.setDate(this.start.getDate()+6));

    	        let tmpStart;
    	        let text=''; 
    	        for(let i=0; i<=6; i++){
    	            text='';
    	            let tmpTag = el.querySelector(".weekField").children[i]; // for문 현재 태그
    	            
    	            tmpStart = new Date(this.start);
    	            let nowDate = new Date(tmpStart.setDate(tmpStart.getDate() + i));
    	            let toDayCheck = new Date();
    	            
    	            if(this.dateFormat(nowDate,0) == this.dateFormat(toDayCheck,0)){
    	                text="class='cal-today'";
    	            }
    	            if(nowDate.getMonth() != date.getMonth()){
    	                text = "class = 'fontAnotherMonth'";
    	            }
    	            if(nowDate.getDay() == this.start.getDay()){
    	            	let sun = el.querySelectorAll(".cal-day");
    	            	sun[0].classList.add("cal-sun");
    	            	console.log("tmpTag : ", tmpTag)
    	            	tmpTag.classList.add("cal-sun");
    	            }
    	            
    	            
    	            console.log("i , this.end.getDay(),  nowDate()", i, this.end.getDay(), nowDate.getDay())
    	            
    	            if(nowDate.getDay() == this.end.getDay()){
    	            	let sun = el.querySelectorAll(".cal-day");
    	            	sun[6].classList.add("cal-sat");
    	            	console.log("i : " , i)
    	            	console.log("tmpTag : ", tmpTag)
    	            	tmpTag.classList.add("cal-sat")
    	            }
    	            
    	            tmpTag.innerHTML='<div '+text+'><span>'+nowDate.getDate()+'</span></div>';
    	        }
    	        el.querySelector(".monthField").innerText = this.month;
    	        el.querySelector(".yearField").innerText = this.year;
    	        
    	        this.toDayDraw();

    	        console.log("day : " + this.day)
    	        console.log("today : " + this.today)
    	        console.log("month : " + this.month)
    	        console.log("start : " + this.start)
    	        console.log("end : " + this.end)
    	    }

    	    prev(){
    	        this.date = new Date(this.date.setDate(this.date.getDate()-7));
    	        console.log("prev: ", this.date)
    	        this.drawCal(this.el, this.date);
    	        console.log("prev")
    	    }
    	    
    	    next(){
    	        this.date = new Date(this.date.setDate(this.date.getDate()+7));
    	        console.log("next: ", this.date)
    	        this.drawCal(this.el, this.date);
    	        console.log("next")
    	    }
    	}
    	
    	let miniCalEl = document.querySelector("#calendar");
    	let data = "test";
    	let calendar =  new MiniCalendar(miniCalEl);
    	
    	miniCalEl.querySelector(".prevBtn").addEventListener('click', calendar.prev.bind(calendar));
    	miniCalEl.querySelector(".nextBtn").addEventListener("click", calendar.next.bind(calendar));
    	
     };     
     
     
     function showCalendar(){
 		let calJson = {
				CLDR_CATEGORY:'0',
				CLDR_START:null
		}
    	 
			$.ajax({
				  url: "/calendar/showList",
				  type: "POST",
				  data:JSON.stringify(calJson),
				  dataType: "JSON",
				  contentType:"application/json;charset=utf-8",
				  beforeSend : function(xhr){
			        xhr.setRequestHeader(header, token);
			      },
				  success : function(data){
					  
			    		var calendarEl = document.getElementById("calendar");
			    		calendarEl.innerHTML = createInBox();
			    		
			    		console.log("data", data)
			    		let date = new Date();
			    		let month = date.getMonth()+1;
			    		let year = date.getYear()+1900;
			    		
			    		let ac = new Array;
			    		data.forEach((value, i)=>{
			    			let start = new Date(value.start);
			    			
			    			if(start.getYear()+1900 === year){
				    			if(start.getMonth()+1 === month){
				    				ac.push(value);
				    			}
			    			}
			    		})
			    		
			    		console.log("ac : ", ac)
			    		
			    		let dayArray = ['일','월','화','수','목','금','토'];
			    		let text = '';
			    		text +='<div class="in-box">';
			    		text +='<h4 class="title-h4">주요 학사일정</h4>';
			    		text +='<ul>';
			    		
			    		ac.forEach((value, i)=>{
			    			let date = new Date(value.start);
			    			text +='<li>';
			    			text +='<div class="row" ><strong class="ml-2">'+date.getDate()+'일('+dayArray[date.getDay()]+')</strong><div>: ' + value.title;
			    			text +='</div></div></li>';
			    		})
			    		text +='</ul>';
			    		text +='</div>';
			    		
			    		calendarEl.innerHTML += text;
				  },
				  error : function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				  }
			});
     }

 
     
     // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 역량차트
 
     
     function capability(){
    	 
    	 var eh_maxVal = $("#eh_maxVal");
    	 var eh_minVal = $("#eh_minVal");
    	 
    	 $.ajax({
    		 url : "/capability/getData",
    		 type : "get",
    		 success : function(data){
    			 console.log(data);
    			 chart(data);
    			 findHighOrLow(data);
    			
    		 }
    	 	 
    	 })
     }
     
     
     
     
     
     
     
     
     function chart(res){
     
      var options = {
	    		 
	          series: [{
		          name: '내 점수',
		          data: res.resultList,
	          },
	          { 
	        	  name: '대학평균',
	              data: [50, 50, 50, 45, 72],
	          }],
	          chart: {
		          width:460,
		          height: 400,
	    	      type: 'radar',
	        	  dropShadow: {
	            	enabled: true,
	            	blur: 1,
	            	left: 1,
	            	top: 1
	          		}
	          },
	          title: {
	          	text: '나의 핵심역량 현황'
	          },
	          stroke: {
	          	width: 2
	          },
	          fill: {
	          	opacity: 0.1
	          },
	          markers: {
	          	size: 5
	          },
	          xaxis: {
	          	categories: ['실용/전문', '나눔/윤리', '성실/창의', '지식역량', '의사소통']
	          }
       	  
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
        
      
     }
     
     function findHighOrLow(data){
    	 
    	 switch(data.maxIndex){
		 	case 0 :
		 		eh_maxVal.innerText = "실용/전문";
		 		break;
		 	case 1 :
		 		eh_maxVal.innerText = "나눔/윤리";
		 		break;
		 	case 2 :
		 		eh_maxVal.innerText = "성실/창의";
		 		break;
		 	case 3 :
		 		eh_maxVal.innerText = "지식역량";
		 		break;
		 	case 4 :
		 		eh_maxVal.innerText = "의사소통";
		 		break;
		 	default:
		 		eh_maxVal.innerText = "없음";
		 		
		 }
		 switch(data.minIndex){
		 	case 0 :
		 		eh_minVal.innerText = "실용/전문";
		 		break;
		 	case 1 :
		 		eh_minVal.innerText = "나눔/윤리";
		 		break;
		 	case 2 :
		 		eh_minVal.innerText = "성실/창의";
		 		break;
		 	case 3 :
		 		eh_minVal.innerText = "지식역량";
		 		break;
		 	case 4 :
		 		eh_minVal.innerText = "의사소통";
		 		break;
		 	default:
		 		eh_minVal.innerText = "없음";
		 }
     }
     
     
     //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■뉴스크롤링
     
     //div 넣을 곳
     var divForNews = document.querySelector("#divForNews");
     //input값 받아오기
     var searchNewsWord = document.querySelector("#searchNewsWord");
     
     //tbody에 넣을 것임
     var tbodyForNews = document.querySelector("#tbodyForNews");
     
     //뉴스 크롤링
     function newsCrolling(){
    	
    	 var searchWord = {
    		"searchWord" : searchNewsWord.value 
    	 }
    	 
    	 $.ajax({
    		 type : "GET",
    		 url : "/news/crolling",
    		 data : searchWord,
    		 success : function(res){
    			 var str = "";
    			 // x2js 을 쓰면 xml문자열을 json 형식으로 바꿀 수 있음
                 var x2js = new X2JS();
                 var jsonObj = x2js.xml_str2json(res);
                 
                 var resNews = jsonObj.rss.channel.item; //뉴스만 추출
                 
                 for(var i = 0; i<10;i++){
                	 //div에 생성될 요소
                	 let text = `\${resNews[i].source.__text}`;
                	 text = text.substring(0,10);
                	 
                	 let title = `\${resNews[i].title}`;
                	 title = title.substring(0,title.indexOf(" - ", 0));
                	 if(title.length > 50){
                		 title = title.substring(0, 49);
                	 }
		                	 
                	 let pubDate = `\${resNews[i].pubDate}`;
                	 pubDate = pubDate.substring(0, 16);                	 
                	 
                	 str += `<tr>`;
                	 str += `	<td><span class="badge badge-light">\${text}</span></td>`;
                	 str += `	<td><a href="\${resNews[i].link}" target="_blank">\${title}</a></td>`;
                	 str += `	<td>\${pubDate}</td>`;
                	 str += `</tr>`;
                 }
                 
                 //0번째 기사
                 console.log(resNews[0])
                 //신문사 이름
                 console.log(resNews[0].source.__text)
                 //기사제목
                 console.log(resNews[0].title)
                 //기사링크
                 console.log(resNews[0].link)
                 //일자
                 console.log(resNews[0].pubDate)
                 
                 
                 tbodyForNews.innerHTML = str;
    		 }
    	 })
    	 
     }

     function popUpCheck(){
    		let time1970 = new Date().getTime();

    		let str_val = localStorage.getItem("pop_cur_time");

    		if(time1970 >= str_val){
    			window.open("/common/popUp","","scrollbars=no,menubar=no,top=300px,left=400,width=570,height=610");
    		}
    	}

    	function popUpOn(){
    		
    		let time1970 = new Date().getTime();

    		if(localStorage.getItem("pop_cur_time") == null){
    			localStorage.setItem("pop_cur_time", time1970);
//    	 		alert("로컬스토리지 저장완료");
    		}
    		

    	}

    	function popUpSurCheck(){
    		let time1970 = new Date().getTime();

    		let str_val = localStorage.getItem("pop_sur_cur_time");

    		if(time1970 >= str_val){
    			closepopSur = window.open("/common/popSur","","scrollbars=no,menubar=no,top=300px,left=1000,width=600,height=610");
    		}
    	}

    	function popUpSurOn(){
    		
    		let time1970 = new Date().getTime();

    		if(localStorage.getItem("pop_sur_cur_time") == null){
    			localStorage.setItem("pop_sur_cur_time", time1970);
//    	 		alert("로컬스토리지 저장완료");
    		}
    	}
    	
    	
    	
    	
 // 캘린더 만들어보기  	
    	
    	function  createInBox(){
	 		
	 		let text= '';
	 		text += '<div class="in-box">';
	 		text += '	<div class="schedule_table">';
	 		text += '		<table>';
	 		text += '			<colgroup>';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '				<col style="width:12.5%; ">';
	 		text += '			</colgroup>';
	 		text += '			<thead>';
	 		text += '				<tr>';
	 		text += '					<th class="day_sun" scope="col">일</th>';
	 		text += '					<th scope="col">월</th>';
	 		text += '					<th scope="col">화</th>';
	 		text += '					<th scope="col">수</th>';
	 		text += '					<th scope="col">목</th>';
	 		text += '					<th scope="col">금</th>';
	 		text += '					<th class="day_sat" scope="col">토</th>';
	 		text += '					<th class="week">주차</th>';
	 		text += '				</tr>';
	 		text += '			</thead>';
	 		text += '			<tbody>';
	 		text += drawMonth();
	 		text += '			</tbody>';
	 		text += '		</table>';
	 		text += '	</div>';
	 		text += '</div>';
	 		
	 		return text;
	 
 		}
    	
    	function drawMonth(){
    		let date = new Date();
    		let year = date.getYear()+1900;
    		let month = date.getMonth()+1;
    		
    		let start = new Date(year, month-1, 1);
    		let end = new Date(year, month, 0);
    		
    		let week = parseInt((start.getDay() + end.getDate())/7) + 1;
    		
    		let text ='';
    		let dayNum = start.getDay();
    		let count = 1;
    		for(let i=1;i<=week;i++){
	    		text+='<tr>';
	    		for(let j=0; j<7;j++){
	    			let dayClass='';
	    			if(j == 0){
	    				dayClass= 'class="day_sun"';
	    			}else if(j == 6){
	    				dayClass= 'class="day_sat"';
	    			}
	    			
	    			if(j == dayNum){
			    		text+='	<td '+dayClass+'><span class="item-day">'+(count++)+'</span></td>';
			    		dayNum++;
	    			}else{
			    		text+='	<td></td>';
	    			}
	    			
		    		if(count == end.getDate()+1){
		    			dayNum=100;
		    		}
	    		}
	    		dayNum > 6?dayNum=0:dayNum;
	    		text+='	<td class="week"><span class="item-day">'+i+'</span></td>';
	    		text+='</tr>';
    		}
    		
    		return text;
    	}
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
     
</script>