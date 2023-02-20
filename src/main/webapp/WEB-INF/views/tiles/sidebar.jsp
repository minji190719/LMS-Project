<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.nk-sidebar .metismenu > li a > i {
	font-size : 1.2em !important;
	width : 35px !important;
}
</style>

<!-- 학생 사이드바 -->
<c:if test="${role eq 'ROLE_STUDENT' }">
<div class="nk-sidebar">
	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
			<li class="nav-label font-weight-bold" style="font-size: 1.7em;">학생</li>
			
			<li ><a class="has-arrow"
				href="javascript:void()" aria-expanded="false"><img src="/resources/images/icon/학적관리.png">
				<span class="nav-text font-weight-bold">&nbsp;학적관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/recordapply/applylist">휴/복학신청</a></li>
				</ul></li>
			
			<li><a class="has-arrow" href="javascript:void()"aria-expanded="false"><img src="/resources/images/icon/일정.png">
				<span class="nav-text font-weight-bold">&nbsp;일정</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/calendar/main">학교일정</a></li>
				</ul></li>
			

				
			<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"> 
				<img src="/resources/images/icon/등록금.png">
			<span class="nav-text font-weight-bold">&nbsp;등록금/장학금 관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/scholar">장학금 신청</a></li>
					<li><a href="/tuition">등록금 납부 / 내역 조회</a></li>
				</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"> <img src="/resources/images/icon/수강신청.png"> <span
					class="nav-text font-weight-bold">&nbsp;수강신청</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/prelecture/home">예비수강신청</a></li>
					<li><a href="/lecture/home">수강신청</a></li>
				</ul></li>	
				
				
			<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"> 
				<img src="/resources/images/icon/상담.png">
			<span class="nav-text font-weight-bold">&nbsp;상담</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/student/counselApply.do">상담신청</a></li>
					<li><a href="/student/counselList.do">상담신청내역</a></li>
				</ul></li>
				
			<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"> 
				<img src="/resources/images/icon/봉사.png">
			<span class="nav-text font-weight-bold">&nbsp;봉사</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/volunteer/outList">교외 봉사</a></li>
					<li><a href="/volunteer/showList">교내 봉사</a></li>
				</ul></li>
				
				
			<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"> 
				<img src="/resources/images/icon/취업.png">
			<span class="nav-text font-weight-bold">&nbsp;취업</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/employEducation/employEducationPage">취업교육</a></li>
					<li><a href="/employ/company">취업훈련기관</a></li>
				</ul></li>
				
			<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"> 
				<img src="/resources/images/icon/수업관리.png">
			<span class="nav-text font-weight-bold">&nbsp;수업관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/student/myLecGradeNow">현재학기성적조회</a></li>
					<li><a href="/student/myLecGrade">전체성적조회</a></li>
					<li><a href="/attend/attendApplyPage">공결원신청</a></li>
					<li><a href="/evaluation/home">강의평가</a></li>
					<li><a href="/schedule/sHome">시간표</a></li>
				</ul></li>
				
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"> <img src="/resources/images/icon/스케쥴링.png"> <span
					class="nav-text font-weight-bold">&nbsp;스케쥴링</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/scheduling/group">스터디그룹만들기</a></li>
				</ul></li>
				
			<li><a class="has-arrow" href="/community"
				aria-expanded="false"> <img src="/resources/images/icon/커뮤니티.png"> <span
					class="nav-text font-weight-bold">&nbsp;커뮤니티</span>
			</a></li>
			
			<li><a class="has-arrow" href="/student/licenseEnroll"
				aria-expanded="false"> <img src="/resources/images/icon/자격증.png"> <span
					class="nav-text font-weight-bold">&nbsp;자격증 등록</span>
			</a></li>
			<li><a class="has-arrow" href="/board/main"
				aria-expanded="false"> <img src="/resources/images/icon/학사공지사항.png"> <span
					class="nav-text font-weight-bold">&nbsp;학과공지사항</span>
			</a></li>
				</ul>
	</div>
</div>
</c:if>
<!-- 학생사이드바 끝-->
<!-- 교수 사이드바 시작-->
<c:if test="${role eq 'ROLE_PROFESSOR' }">
<div class="nk-sidebar">
	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
			<li class="nav-label font-weight-bold" style="font-size: 1.7em;">교원</li>
			
			
			<li class="mega-menu mega-menu-sm"><a class="has-arrow"
				href="javascript:void()" aria-expanded="false"> <img src="/resources/images/icon/수업관리.png">
				<span class="nav-text font-weight-bold" style="margin-left:5px;">&nbsp;수업관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/lol/lecOpenList">교과목등록신청</a></li>
					<li><a href="/lol/openSuccessLecList">내강좌등록</a></li>
					<li><a href="/lol/lecturePlanList">강의계획서</a></li>
					<li><a href="/lad/pMyOpenLecStudentList">강좌별수강생</a></li>
					<li><a href="/lad/myLecStuentAttend">출석부관리</a></li>
					<li><a href="/lad/attendApplyList">공결처리</a></li>
					<li><a href="/professor/lecGrade">성적입력</a></li>
				</ul></li>
			
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"><img src="/resources/images/icon/시간표.png"> <span
					class="nav-text font-weight-bold">&nbsp;시간표</span>
			</a>
			
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"><img src="/resources/images/icon/상담.png"> <span
					class="nav-text font-weight-bold">&nbsp;상담</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/professor/counselList">상담일정관리</a></li>
				</ul></li>
			<li><a class="has-arrow" href="/board/main"
				aria-expanded="false"><img src="/resources/images/icon/학사공지사항.png"> <span
					class="nav-text font-weight-bold">&nbsp;학과공지사항</span>
			</a></li>
			</ul>
	</div>
</div>
</c:if>
<!--교수 사이드바 끝-->
<!-- 관리자 사이드바 시작 -->
<c:if test="${role eq 'ROLE_ADMIN' }">
<div class="nk-sidebar">
	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
			<li class="nav-label font-weight-bold" style="font-size: 1.7em">관리자</li>
			
			
			<li class="mega-menu mega-menu-sm"><a class="has-arrow"
				href="javascript:void()" aria-expanded="false">
				<img src="/resources/images/icon/학생.png">
				<span class="nav-text font-weight-bold">&nbsp;학생관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/enroll/register">학생등록</a></li>
					<li><a href="/Mstudent/studentAllList">학생조회</a></li>
					<li><a href="/recordapproval/Mrecordmain">휴/복학관리</a></li>
				</ul></li>
			
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"> <img src="/resources/images/icon/교수.png"> <span
					class="nav-text font-weight-bold">&nbsp;교수관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/Mprofessor/professorAllList">교수조회</a></li>
				</ul></li>
			
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"> <img src="/resources/images/icon/수업관리.png"> <span
					class="nav-text font-weight-bold">&nbsp;수업관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/loMng/lecOpenManagementList">개설과목 관리</a></li>
				</ul></li>
			
						
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"> <img src="/resources/images/icon/등록금.png"> <span
					class="nav-text font-weight-bold">&nbsp;등록금/장학금 관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/tuition/manage">등록금 관리</a></li>
					<li><a href="/scholarListManage">장학금 종류 관리</a></li>
					<li><a href="/scholarManage">장학금 신청 관리</a></li>
				</ul></li>
			
			
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"> <img src="/resources/images/icon/시스템.png"> <span
					class="nav-text font-weight-bold">&nbsp;시스템관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/volunteer/manage/inVolPage">봉사신청 관리</a></li>
					<li><a href="/community/manage">커뮤니티 관리</a></li>
					<li><a href="/manager/licenseEnroll">자격등 등록 신청 관리</a></li>
					<li><a href="/notice/main">공지사항 관리</a></li>
				</ul></li>
			
			<li><a class="has-arrow" href="javascript:void()"
				aria-expanded="false"><img src="/resources/images/icon/차트.png"><span
					class="nav-text font-weight-bold">&nbsp;통계관리</span>
			</a>
				<ul aria-expanded="false">
					<li><a href="/chartManage/chartPage">카테고리별 통계</a></li>
				</ul></li>
			</ul>
	</div>
</div>
</c:if>

<!-- 관리자 사이드바  끝-->
