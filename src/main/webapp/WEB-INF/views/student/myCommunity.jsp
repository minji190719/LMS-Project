<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
.myCommunity .custom-table1 tbody{
	height : 200px;
}
</style>
<div class="row">
	<div class="col-lg-3">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;나의 커뮤니티 정보<br/>
		</h4>	
	</div>
	<div class="col-lg-9">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/community/my">나의 커뮤니티 정보</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row myCommunity">
	<!-- 상단 메뉴 시작 -->
	<div class="col-lg-12 col-sm-6">
		<div class="card">
			<div class="social-graph-wrapper custom-btn-s">
				<span class="s-icon">
					<i class="fa-solid fa-circle-info">&nbsp;&nbsp;MY INFO&nbsp;&nbsp;</i>
				</span>
				<a href="/community" class="custom-s"><button type="button" class="btn mb-1 btn-light" style="margin-top: 10px;">커뮤니티 게시판 보기</button></a>
			</div>
			<div class="row">
				<div class="col-4 border-right">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1">
							${myPostCnt }
						</h4>
						<p class="m-0" id="myPost">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">총 게시물</font></font>
						</p>
					</div>
				</div>
				<div class="col-4 border-right">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1">
							${myReplyCnt }
						</h4>
						<p class="m-0" id="myReply">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">총 댓글</font></font>
						</p>
					</div>
				</div>
				<div class="col-4">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1">
							${myLikeCnt }
						</h4>
						<p class="m-0" id="myLike">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">총 좋아요</font></font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 메뉴 종료 -->	

	<!-- 내가 쓴 글 보기 시작-->
	<div class="col-md-12" id="myPost">
		<div class="pt-3 pb-3 pl-0 pr-0 text-center">
			<h4 class="m-1">
				<i class="fa-solid fa-clipboard"></i>
			</h4>
			<p class="m-0" id="myPost">
				<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">내가 쓴 글 보기</font></font>
			</p>
		</div>
		<div class="card">
			<div class="card-body">
				<div class="table-responsive custom-table1">
					<table class="table table table-hover" >
						<thead>
							<tr>
								<td colspan="7" style="text-align: left;">
									<button type="button" class="btn mb-1 btn-outline-dark" onclick="selectCmntAll(this)"><i class="fa-solid fa-check"></i>전체 선택</button>
									<button type="button" class="btn mb-1 btn-primary custom-btn-s" onclick="delMyCmntPost(this)" id="aaaa">삭제</button>
								</td>
							</tr>
							<tr>
								<td width="5%;"></td>
								<td width="5%;">No</td>
								<td width="5%;">카테고리</td>
								<td width="5%;">느낌</td>
								<td width="40%;">제목</td>
								<td width="20%;">작성일</td>
								<td width="5%;">조회수</td>
								<td width="10%;">좋아요</td>
								<td width="5%;">익명여부</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty myPost }">
								<tr>
									<td class="custom-s" colspan="7" style="text-align: center;">내가 쓴 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${myPost }" var="post" varStatus="index">
								<tr>
									<td width="5%;"><input type="checkbox" value="${post.cmnt_no }"/></td>
									<td width="5%;">${index.count }</td>
									<td width="5%;"><span class="badge badge-dark">${post.cmnt_category }</span></td>
									<td width="5%;"><span class="badge badge-light">${post.cmnt_feeling }</span></td>
									<td width="40%;"><a href="/community/detail/${post.cmnt_no }">${post.cmnt_title }</a></td>
									<td width="20%;">${fn:substring(post.cmnt_date, 0, 16)}</td>
									<td width="5%;">${post.cmnt_count }</td>
									<td width="10%;">${post.cmnt_like }</td>
									<c:choose>
										<c:when test="${post.cmnt_anony eq 1}">										
											<td width="5%;"><i class="fa-solid fa-mask"></i></td>
										</c:when>
										<c:otherwise>
											<td width="5%;"><i class="fa-solid fa-xmark"></i></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 내가 쓴 글 보기 종료 -->
	<!-- 내가 쓴 댓글 보기 시작-->
	<div class="col-md-12" id="myReply">
		<div class="pt-3 pb-3 pl-0 pr-0 text-center">
			<h4 class="m-1">
				<i class="fa-solid fa-comment-dots"></i>
			</h4>
			<p class="m-0" id="myReply">
				<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">내가 쓴 댓글 보기</font></font>
			</p>
		</div>
		<div class="card">
			<div class="card-body">
				<div class="table-responsive custom-table1">
					<table class="table table table-hover">
						<thead>
							<tr>
								<td colspan="10" style="text-align: left;">
									<button type="button" class="btn mb-1 btn-outline-dark" onclick="selectCmntAll(this)"><i class="fa-solid fa-check"></i>전체 선택</button>
									<button type="button" class="btn mb-1 btn-primary custom-btn-s" onclick="delMyCmntReply(this)">삭제</button>
								</td>
							</tr>
							<tr>
								<td width="5%"></td>
								<td width="5%">No</td>
								<td width="5%">카테고리</td>
								<td width="5%">느낌</td>
								<td width="30%">제목</td>
								<td width="10%">작성일</td>
								<td width="5%">조회수</td>
								<td width="5%">좋아요</td>
								<td width="20%">댓글 내용</td>
								<td width="10%">댓글 작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty myReply }">
								<tr>
									<td class="custom-s" colspan="8" style="text-align: center;">내가 쓴 댓글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${myReply }" var="reply" varStatus="index">
								<tr>
									<td width="5%"><input type="checkbox" value="${reply.REPLY_NO }"/></td>
									<td width="5%">${index.count }</td>
									<td width="5%"><span class="badge badge-dark">${reply.CMNT_CATEGORY }</span></td>
									<td width="5%"><span class="badge badge-light">${reply.CMNT_FEELING }</span></td>
									<td width="30%"><a href="/community/detail/${reply.CMNT_NO }">${reply.CMNT_TITLE }</a></td>
									<td width="10%">${fn:substring(reply.CMNT_DATE, 0, 16)}</td>
									<td width="5%">${reply.CMNT_COUNT }</td>
									<td width="5%">${reply.CMNT_LIKE }</td>
									<td width="20%">${reply.REPLY_CONTENT }</td>
									<td width="10%">${fn:substring(reply.REPLY_DATE, 0, 16)}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 내가 쓴 댓글 보기 종료 -->
	<!-- 내가 좋아요한 게시글 보기 시작-->
	<div class="col-md-12" id="myLike">
		<div class="pt-3 pb-3 pl-0 pr-0 text-center">
			<h4 class="m-1">
				<i class="fa-solid fa-heart"></i>
			</h4>
			<p class="m-0" id="myLike">
				<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">내가 좋아요한 게시글 보기</font></font>
			</p>
		</div>

		<div class="card">
			<div class="card-body">
				<div class="table-responsive custom-table1">
					<table class="table table-hover">
						<thead>
							<tr>
								<td colspan="7" style="text-align: left;">
									<button type="button" class="btn mb-1 btn-outline-dark" onclick="selectCmntAll(this)"><i class="fa-solid fa-check"></i>전체 선택</button>
									<button type="button" class="btn mb-1 btn-primary custom-btn-s" onclick="clearCmntLike(this)">해제</button>
								</td>
							</tr>
							<tr>
								<td width="5%;"></td>
								<td width="5%;">No</td>
								<td width="5%;">카테고리</td>
								<td width="5%;">느낌</td>
								<td width="45%;">제목</td>
								<td width="20%;">작성일</td>
								<td width="5%;">조회수</td>
								<td width="10%;">좋아요</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty myLike }">
								<tr>
									<td class="custom-s" colspan="7" style="text-align: center;">내가 좋아요한 게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${myLike }" var="like" varStatus="index">
								<tr>
									<td width="5%;"><input type="checkbox" value="${like.cmnt_no }"/></td>
									<td width="5%;">${index.count }</td>
									<td width="5%;"><span class="badge badge-dark">${like.cmnt_category }</span></td>
									<td width="5%;"><span class="badge badge-light">${like.cmnt_feeling }</span></td>
									<td width="45%;"><a href="/community/detail/${like.cmnt_no }">${like.cmnt_title }</a></td>
									<td width="20%;">${fn:substring(like.cmnt_date, 0, 16)}</td>
									<td width="5%;">${like.cmnt_count }</td>
									<td width="10%;">${like.cmnt_like }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 내가 좋아요한 게시글 보기 종료 -->
</div>

<script type="text/javascript">
//아작스 통신을 위한 csrf 인증 토큰
let header = '${_csrf.headerName}';
let token = '${_csrf.token}';

function selectCmntAll(sthis){
    let trs = sthis.parentElement.parentElement.parentElement.parentElement.children[1].children;
    
    for(let i = 0; i < trs.length; i++){
        let check = trs[i].children[0].children[0].checked;
        console.log(check);
        if(check == false){
            trs[i].children[0].children[0].checked = true;
        }else{
            trs[i].children[0].children[0].checked = false;
        }
    }
}

function makeArr(myTarget){
	let trs = myTarget.parentElement.parentElement.parentElement.nextElementSibling.children;
	let arr = [];
	for(let i = 0; i < trs.length; i++){
		if(trs[i].children[0].children[0].checked == true){
			arr.push(trs[i].children[0].children[0].value);
		}
	}
	console.log(arr);
	console.log("길이는? " + arr.length);
	return arr;
}

// 선택 게시글 삭제
function delMyCmntPost(myTarget){
	console.log("post 삭제");
	let arr = makeArr(myTarget);
	if(arr.length == 0){
		swal({
		  title: "선택한 게시글이 없습니다", 
		  text : "삭제할 게시글을 선택해주십시오",
		  icon: "info" 
		})
		return false;
	}

	let xhr = new XMLHttpRequest();
	xhr.open("post", "/community/my/delMyCmntPost", true);
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let checkCnt = xhr.responseText
			swal({
				  title: "삭제 성공", 
				  text : checkCnt + "개의 커뮤니티 게시글을 삭제하였습니다.",
				  icon: "success" 
			}).then((value) => { 	
				location.href = location.href;
			})
		}
	}
	xhr.send(JSON.stringify(arr));	
}


// 선택 댓글 삭제
function delMyCmntReply(myTarget){
	console.log("reply 삭제");
	let arr = makeArr(myTarget);
	if(arr.length == 0){
		swal({
			  title: "선택한 댓글이 없습니다", 
			  text : "삭제할 댓글을 선택해주십시오",
			  icon: "info" 
			})
		return false;
	}
	
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/community/my/delMyCmntReply", true);
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let checkCnt = xhr.responseText;
			swal({
				  title: "삭제 성공", 
				  text : checkCnt + "개의 커뮤니티 댓글을 삭제하였습니다.",
				  icon: "success" 
			}).then((value) => { 
				location.href = location.href;
			})
		}
	}
	xhr.send(JSON.stringify(arr));	
}

// 선택 좋아요 해제
function clearCmntLike(myTarget){
	console.log("like 클리어");
	let arr = makeArr(myTarget);
	if(arr.length == 0){
		swal({
			  title: "선택한 게시글이 없습니다", 
			  text : "좋아요를 해제할 게시글을 선택해주십시오",
			  icon: "info" 
			})
		return false;
	}
	
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/community/my/clearCmntLike", true);
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("좋아요 잘 해제했습니다.");
			let checkCnt = xhr.responseText;
			swal({
				  title: "해제 성공", 
				  text : checkCnt + "개의 게시글에 대해 좋아요를 해제하였습니다",
				  icon: "success" 
			}).then((value) => { 
				location.href = location.href;
			})
		}
	}
	xhr.send(JSON.stringify(arr));	
	
}
</script>