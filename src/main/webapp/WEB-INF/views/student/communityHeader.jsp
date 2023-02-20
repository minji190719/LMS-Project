<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
#myInfo:link, #myInfo:visited, #myInfo:active, #myInfo:hover{
	color : white;
}

</style>


<div class="row custom-pr100">
	<!-- 상단 메뉴 시작 -->
	<c:if test="${not empty popular}">
	<div class="col-lg-8">
		<div class="card">
			<div class="card-body">
				<!-- 슬라이더 시작 -->
				<div class="card-title" style="display: inline-block;">
					<h5 class="custom-s custom-bold">인기글 보기</h5>							
				</div>
				<span class="text-muted" style="text-align: right">
					(집계 기준일 : ${popular[0].criteria_date } ~ 
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />)
				</span>
					<div class="mainSlide">
						<c:forEach items="${popular }" var="popular" varStatus="status">
							<table>
								<tr>
									<!-- <td rowspan="3" class="imgContainer"><img src="${file.file_path }"></td>-->
									<c:set var="loop_check" value="false"/>
									<c:forEach items="${pFile}" var="file">									
										<c:if test="${loop_check eq false && file.cmnt_no eq popular.cmnt_no}">
											<td rowspan="3" class="imgContainer"><img src="${file.file_path }"></td>
											<c:set var="loop_check" value="true"/>
										</c:if>
									</c:forEach>
									<c:if test="${loop_check eq false }">									
										<td rowspan="3" class="imgContainer"><img src="/resources/images/community/community_default.jpg"></td>
									</c:if>
									<td>&nbsp;<a href='${pageContext.request.contextPath}/community/detail/${popular.cmnt_no }'><b>${status.count}. </b>${popular.cmnt_title }</a></td>
								</tr>
								<tr><td>&nbsp;${popular.smem_no }</td></tr>
								<tr><td>&nbsp;<span class='badge badge-dark'>${popular.cmnt_category }</span><span class='badge badge-light'>${popular.cmnt_feeling }</span></td></tr>
							</table>
						</c:forEach>
					</div>
					<div class="operationKey custom-right-array">
						<span class="prevArrow">&lt; 이전</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="nextArrow">다음 &gt;</span>
					</div>
				<!-- 슬라이더 종료 -->
			</div>
		</div>
	</div>
	</c:if>
	<div class="col-lg-4">
		<div class="card">
			<div class="social-graph-wrapper custom-btn-s">
				<a href="/community/my" id="myInfo">
					<span class="s-icon">
						<i class="fa-solid fa-circle-info">&nbsp;&nbsp;MY INFO</i>&nbsp;&nbsp;
					</span>
				</a>
			</div>
			<div class="row">
				<div class="col-4 border-right">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1">
							<i class="fa-solid fa-clipboard custom-s">&nbsp;&nbsp;${myPostCnt }</i>
						</h4>
						<p class="m-0">
							<a href="/community/my">							
								<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">내가 쓴 글 보기</font></font>
							</a>
						</p>
					</div>
				</div>
				<div class="col-4 border-right">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1">
							<i class="fa-solid fa-comment-dots custom-s">&nbsp;&nbsp;${myReplyCnt }</i>
						</h4>
						<p class="m-0">
							<a href="/community/my">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">내가 쓴 댓글 보기</font></font>
							</a>
						</p>
					</div>
				</div>
				<div class="col-4">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1">
							<i class="fa-solid fa-heart color-danger custom-s">&nbsp;&nbsp;${myLikeCnt }</i>
						</h4>
						<p class="m-0">
							<a href="/community/my">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">좋아요한 게시글 보기</font></font>
							</a>
						</p>
					</div>
				</div>
				<div class="col-12 border-top">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1 custom-s">
							말은 마음의 초상이다 - J.레이
						</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 메뉴 종료 -->
</div>

<script type="text/javascript">

</script>