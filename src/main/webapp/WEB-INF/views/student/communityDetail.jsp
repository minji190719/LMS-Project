<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
#likeCountSpace:active, #replyCountSpace:active{
  box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  position: relative;
  top:2px;
}

#replyEmotion span, #prePost:active, #nextPost:active{
	cursor: pointer;
}

</style>
<div class="row justify-content-center">
	<div class="col-lg-2">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;커뮤니티<br/>
		</h4>	
	</div>
	<div class="col-lg-8">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/community">커뮤니티</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row justify-content-center">
	<div class="col-lg-1 ">
		<br/><br/><br/><br/>
		<div class="card">
			<div class="card-body">
				<span><i class="fa-solid fa-chevron-left fa-5x custom-s" id="prePost"></i></span>
			</div>
		</div>
	</div> 
	<div class="col-lg-10">
		<div class="card">
			<div class="card-body">
				<div id="cmntDetailForm">
					<span class="badge badge-dark">${communityMap.cmntVO.cmnt_category}</span>
					<span class="badge badge-light">${communityMap.cmntVO.cmnt_feeling}</span><br/><br/>
					<div style="display: flex; justify-content: space-between;">
						<h2 style="display: inline-block;">${communityMap.cmntVO.cmnt_title}</h2>
						<div style="display: inline-block;">
							<c:if test="${communityMap.cmntVO.smem_no eq userId }">
		 						<a href="/community/update/${communityMap.cmntVO.cmnt_no}" onclick="OpenUpdateScreen(this)">
		 							<button type="button" class="btn mb-1 btn-flat btn-outline-secondary">수정</button>
		 						</a>
		 						<a href="/community/delete/${communityMap.cmntVO.cmnt_no}" onclick="deleteCmntPost(this)">
		 							<button type="button" class="btn mb-1 btn-flat btn-outline-danger">삭제</button>
		 						</a>
		 						<a href="/community">
									<button type="button" class="btn mb-1 btn-flat btn-outline-info">목록</button>
								</a>
							</c:if>
							<c:if test="${communityMap.cmntVO.smem_no ne userId }">
								<!-- 신고 모달 시작 -->
		 						<div class="bootstrap-modal">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalpopover">신고</button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModalpopover" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">신고하기</h5>
                                                    <button type="button" class="close" data-dismiss="modal"><span>×</span>
                                                    </button>
                                                </div>
												<form id="cmntReportForm">
	                                                <div class="modal-body">
	                                                    <h5>신고 사유를 선택해주십시오</h5>
															<div class="form-group" style="display: grid; grid-template-columns: repeat(3, 1fr);">
																<input type="hidden" name="cmnt_no" value="${communityMap.cmntVO.cmnt_no}"/>
																<label class="radio-inline mr-3">
																	<input type="radio" name="cmnt_report" value="욕설/비방"> 욕설/비방
																</label>
																<label class="radio-inline mr-3">
																	<input type="radio" name="cmnt_report" value="홍보/영리목적"> 홍보/영리목적
																</label>
																<label class="radio-inline">
																	<input type="radio" name="cmnt_report" value="청소년 유해/학대"> 청소년 유해/학대
																</label>
																<label class="radio-inline">
																	<input type="radio" name="cmnt_report" value="개인 정보 노출/침해"> 개인 정보 노출/침해
																</label>
																<label class="radio-inline">
																	<input type="radio" name="cmnt_report" value="도배/스팸"> 도배/스팸
																</label>
																<label class="radio-inline">
																	<input type="radio" name="cmnt_report" value="욕설/비방"> 욕설/비방
																</label>
															</div>
	
															<p>게시글 <b>${communityMap.cmntVO.cmnt_title}</b>에 대한 신고를 진행합니다. </p>
															<p>※ 허위 신고일 경우 커뮤니티 이용에 제한이 있을 수 있으므로 신중하게 신고해주십시오. </p>	
	                                                </div>
	                                                <div class="modal-footer">
	                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                                                    <input type="button" class="btn btn-primary" value="신고" onclick="reportCmntPost(this)"/>
	                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>		
                                <!-- 신고 모달 종료 -->									
							</c:if>
							
						</div>
					</div>
					<blockquote style="display: flex; justify-content: space-between;">
						<div>
						<c:choose>
							<c:when test="${communityMap.cmntVO.cmnt_anony eq 0}">
								<b>${communityMap.cmntVO.smem_no}</b>
							</c:when>
							<c:otherwise>
								<b>익명의 한국대생</b>&nbsp;&nbsp;&nbsp;
							</c:otherwise>											
						</c:choose>
							<i class='fa-regular fa-heart color-danger'></i>&nbsp; ${communityMap.cmntVO.cmnt_like} &nbsp;
							<i class='fa-regular fa-comment color-info'></i>&nbsp; ${communityMap.cmntVO.reply_count} &nbsp;
							<i class="fa-regular fa-eye"></i> &nbsp; ${communityMap.cmntVO.cmnt_count} &nbsp;
						</div>
						<div>${fn:substring(communityMap.cmntVO.cmnt_date, 0, 16)}</div>
					</blockquote>
	
					<h5 class="mt-3 mb-1" style="text-align: left;">${communityMap.cmntVO.cmnt_content}</h5>
					<c:forEach items="${communityMap.cmntFileVOList}" var="cmntFileVOList">		
							<img alt="${cmntFileVOList.file_originnm }" src="${cmntFileVOList.file_path }" style="max-width: 80%;"><br/>
					</c:forEach>
					
					<c:if test="${fn:length(communityMap.cmntFileVOList) > 0}">				
						<blockquote>
							<c:forEach items="${communityMap.cmntFileVOList}" var="cmntFileVOList">	
								<b>${cmntFileVOList.file_originnm }&nbsp;&nbsp;</b> 
								<p style="display: inline-block;">${cmntFileVOList.file_type }&nbsp;&nbsp;</p>
								<a href="${cmntFileVOList.file_path }" download="${cmntFileVOList.file_originnm }" style="text-align: right;">
									<button type="button" class="btn mb-1 btn-rounded btn-warning">
										<span class="btn-icon-left">
										<i class="fa fa-download color-warning"></i>
										</span>
										다운로드
									</button>
								</a><br/>	
							</c:forEach>	
						</blockquote>
					</c:if>
					<br/>
		 			<span class="label label-primary">
		 				댓글
		 				<i class='fa-regular fa-comment color-info'></i>
		 				<b id="replyCountSpace" >${communityMap.cmntVO.reply_count}</b>
		 				개
		 			</span>
	 				<a class="label label-danger" href="" onclick="pressLike(this)">좋아요 
	 					<input type="hidden" name="cmnt_no" value="${communityMap.cmntVO.cmnt_no}"/>
						<input type="hidden" name="smem_no" value="${userId}"/>
						<input type="hidden" name="like_code" value="${communityMap.like_code }"/>
		 				<span>
			 				<b>
				 				<c:choose>
					 				<c:when test="${empty communityMap.like_code }">
						 				<i class='fa-regular fa-heart color-danger'></i>
					 				</c:when>
					 				<c:when test="${not empty communityMap.like_code }">
					 					<i class="fa-solid fa-heart"></i>
					 				</c:when>
				 				</c:choose>
			 				</b>
		 				</span>
		 				<b id="likeCountSpace">${communityMap.cmntVO.cmnt_like}</b>개
	 				</a>
	 				<hr/>
 				</div>			
 				
 				<div>
	 				<form class="form-valide" action="#" method="post" id="cmntUpdateForm" name="cmntUpdateForm" novalidate="novalidate" style="display: none;">
	 					<input type="hidden" name="cmnt_no" value="${communityMap.cmntVO.cmnt_no}"/>
						<input type="hidden" name="smem_no" value="${userId}"/>
						<span class="badge badge-dark">
							<select class="form-control" id="cmnt_category" name="cmnt_category" required="required">
								<option value="토론" ${communityMap.cmntVO.cmnt_category == '토론' ? 'selected="selected"' : ''}>토론</option>
								<option value="정보" ${communityMap.cmntVO.cmnt_category == '정보' ? 'selected="selected"' : ''}>정보</option>
								<option value="마켓" ${communityMap.cmntVO.cmnt_category == '마켓' ? 'selected="selected"' : ''}>마켓</option>
								<option value="잡담" ${communityMap.cmntVO.cmnt_category == '잡담' ? 'selected="selected"' : ''}>잡담</option>
								<option value="기타" ${communityMap.cmntVO.cmnt_category == '기타' ? 'selected="selected"' : ''}>기타</option>
							</select>
						</span>
						<span class="badge badge-light">
							<select class="form-control" id="cmnt_feeling" name="cmnt_feeling" required="required">
								<option value="기쁨" ${communityMap.cmntVO.cmnt_feeling == '기쁨' ? 'selected="selected"' : ''}>기쁨</option>
								<option value="분노" ${communityMap.cmntVO.cmnt_feeling == '분노' ? 'selected="selected"' : ''}>분노</option>
								<option value="슬픔" ${communityMap.cmntVO.cmnt_feeling == '슬픔' ? 'selected="selected"' : ''}>슬픔</option>
								<option value="즐거움" ${communityMap.cmntVO.cmnt_feeling == '즐거움' ? 'selected="selected"' : ''}>즐거움</option>
								<option value="사랑" ${communityMap.cmntVO.cmnt_feeling == '사랑' ? 'selected="selected"' : ''}>사랑</option>
								<option value="희망" ${communityMap.cmntVO.cmnt_feeling == '희망' ? 'selected="selected"' : ''}>희망</option>
							</select>
						</span><br/><br/>
						<div>
							<h2>
								<input type="text" value="${communityMap.cmntVO.cmnt_title}" name="cmnt_title" id="cmnt_title" placeholder="제목을 입력하세요"
								style="border-left: none; border-right: none; border-top: none; width: 100%;" required="required" tabindex="1">
							</h2>
						</div>
						<blockquote style="display: flex; justify-content: space-between;">
							<div>
							<c:choose>
								<c:when test="${communityMap.cmntVO.cmnt_anony eq 0}">
									<b>${communityMap.cmntVO.smem_no}</b>
								</c:when>
								<c:otherwise>
									<b>익명의 한국대생</b>&nbsp;&nbsp;&nbsp;
								</c:otherwise>											
							</c:choose>
								<i class='fa-regular fa-heart color-danger'></i>&nbsp; ${communityMap.cmntVO.cmnt_like} &nbsp;
								<i class='fa-regular fa-comment color-info'></i>&nbsp; ${communityMap.cmntVO.reply_count} &nbsp;
								<i class="fa-regular fa-eye"></i> &nbsp; ${communityMap.cmntVO.cmnt_count} &nbsp;
							</div>
							<div>${fn:substring(communityMap.cmntVO.cmnt_date, 0, 16)}</div>
						</blockquote>
						
						<h5 class="mt-3 mb-1" style="text-align: left;">
							<textarea class="form-control h-150px" rows="6"
								name="cmnt_content" id="cmnt_content" style="height: 114px;"required="required">${communityMap.cmntVO.cmnt_content}</textarea>
							<!-- 
							<textarea class="form-control h-150px" rows="6"
								name="cmnt_content" id="cmnt_content" style="height: 114px;"required="required" placeholder="${communityMap.cmntVO.cmnt_content}" tabindex=2>${fn:replace(communityMap.cmntVO.cmnt_content, '<br>', '&#10;')}</textarea>							
							 -->
							<!-- 
							<textarea class="form-control" name="cmnt_content" id="cmnt_content" style="height: 114px;" required="required"><c:out value="${communityMap.cmntVO.cmnt_content}" escapeXml="true" /> </textarea>
							-->
						</h5>
	
						<div class="form-group">
							<input type="file" id="cmntFiles" name="cmntFiles"
								multiple="multiple" accept=".jpg,.gif,.png">
							<code>*이미지 파일만 가능</code>
						</div>
						
						<div class="alert alert-info" id="fileDragArea"
							style="height: 100px; text-align: center; align-items: center;">
							<font style="vertical-align: inherit;">추가할 사진 파일을 이곳으로 끌어오세요</font>
						</div>
						
						<div id="fileShowArea" style="display: grid; grid-template-columns: repeat(5, 1fr); overflow: scroll; overflow-x: hidden; overflow-y: hidden;">
							<c:forEach items="${communityMap.cmntFileVOList}" var="cmntFileVOList">		
								<div class="alert alert-primary alert-dismissible fade show" style="display:inline-block;">
									<button type="button" class="close" data-dismiss="alert" aria-label="close">
									<span class="closeSpan">x</span></button>
									<img alt="${cmntFileVOList.file_originnm }" src="${cmntFileVOList.file_path }" style="max-width: 80%;">
									<p>${cmntFileVOList.file_originnm }</p>
									<input type="hidden" name="cmntf_codes" value="${cmntFileVOList.cmntf_code }"/>
								</div>
							</c:forEach>
						</div>
						<br/>
						<div class="custom-right-array">
							<c:if test="${communityMap.cmntVO.smem_no eq userId }">
								<a href="" onclick="OpenUpdateScreen(this)"><button type="button" class="btn mb-1 btn-flat btn-outline-dark">뒤로가기</button></a>
								<button type="submit" class="btn mb-1 btn-primary custom-btn-s">수정</button>
								<button type="button" class="btn mb-1 btn-outline-dark" onclick="updateContentAutoValue()">자동완성</button>
								<a href="/community"><button type="button" class="btn mb-1 btn-outline-dark">목록</button></a>
							</c:if>
						</div>
					</form>
 				</div>

				<!-- 댓글 등록 폼 시작 -->
				<div id="replyContainer">
					<c:forEach items="${communityMap.replyVOList}" var="replyVO">				
						<div class="bootstrap-media">
							<div class="media" style="display: flex; justify-content: space-between;">
								<div>
									<img class="mr-3 img-fluid" src="${pageContext.request.contextPath }/resources/images/community/community_default.jpg"
									alt="" width="50px;" height="50px;" style="border-radius: 50%;">
									<div class="media-body" style="display: inline-block;">
										<c:if test="${replyVO.smem_no eq communityMap.cmntVO.smem_no }">
											<span class="badge badge-dark">작성자</span>
										</c:if>
										<c:choose>
											<c:when test="${replyVO.reply_anony eq 0}">
												<b>${replyVO.smem_no}</b>&nbsp;&nbsp;&nbsp;
											</c:when>
											<c:otherwise>
												<b>익명의 한국대생</b>&nbsp;&nbsp;&nbsp;
											</c:otherwise>											
										</c:choose>
										${fn:substring(replyVO.reply_date, 0, 16)}<br/>
										${replyVO.reply_content}	
									</div>							
								</div>
								<div>
									<c:if test="${replyVO.smem_no eq userId }">
										<input type="hidden" value="${replyVO.reply_no }" name="reply_no"/>
				 						<button type="button" class="btn mb-1 btn-flat btn-outline-danger" onclick="delListReply(this)">삭제</button>						
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
					<div id="replyAddSpace"></div>
					<br/>
					
					<div class="form-validation">
						<form class="form-valide" action="#" method="post" novalidate="novalidate" id="replyForm">
							<div class="alert alert-secondary" id="replyEmotion" style="text-align: center;">
								<span onclick="insertReplyEmotion(this)">😀</span>
								<span onclick="insertReplyEmotion(this)">😆</span>
								<span onclick="insertReplyEmotion(this)">😂</span>
								<span onclick="insertReplyEmotion(this)">🙃</span>
								<span onclick="insertReplyEmotion(this)">🥰</span>
								<span onclick="insertReplyEmotion(this)">🙄</span>
								<span onclick="insertReplyEmotion(this)">🤥</span>
								<span onclick="insertReplyEmotion(this)">🤕</span>
								<span onclick="insertReplyEmotion(this)">🥳</span>
								<span onclick="insertReplyEmotion(this)">😎</span>
								<span onclick="insertReplyEmotion(this)">🧐</span>
								<span onclick="insertReplyEmotion(this)">😤</span>
								<span onclick="insertReplyEmotion(this)">🖐️</span>
								<span onclick="insertReplyEmotion(this)">🤞</span>
								<span onclick="insertReplyEmotion(this)">👍</span>
								<span onclick="insertReplyEmotion(this)">🙏</span>
								<span onclick="insertReplyEmotion(this)">🍀</span>
								<span onclick="insertReplyEmotion(this)">🧡</span>
								<span onclick="insertReplyEmotion(this)">💛</span>
								<span onclick="insertReplyEmotion(this)">💚</span>
								<span onclick="insertReplyEmotion(this)">💙</span>
								<span onclick="insertReplyEmotion(this)">💜</span>
							</div>
							
							<input type="hidden" name="cmnt_no" value="${communityMap.cmntVO.cmnt_no}"/>
							<input type="hidden" name="smem_no" value="${userId}"/>
							<div class="input-group">
								<input type="text" class="form-control" name="reply_content" required="required" placeholder="성숙한 댓글 문화를 만들어갑시다.">
								<div class="input-group-append">
									<div class="btn btn-outline-info" >
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="reply_anony" value="1">
											<label class="form-check-label">익명으로 작성</label>
										</div>
									</div>
									<input type="submit" class="btn mb-1 btn-primary custom-btn-s" value="등록하기"/>
									<input type="button" onclick="autoValue(this)" class="btn mb-1 btn-outline-danger" value="자동완성"/>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 댓글 등록 폼 종료 -->
			</div>
		</div>
	</div>
	<hr/> 
	<div class="col-lg-1">
		<br/><br/><br/><br/>
		<div class="card">
			<div class="card-body">
				<span><i class="fa-solid fa-chevron-right fa-5x custom-s" id="nextPost"></i></span>
			</div>
		</div>
	</div> 	
	
</div>

<script type="text/javascript">
	

	// 자동 값 채우기 
	function autoValue(btn){
		$(btn).parent().parent().find("input[type='text']").val("새로운 댓글");
	}

	//아작스 통신을 위한 csrf 인증 토큰
	let header = '${_csrf.headerName}';
	let token = '${_csrf.token}';

	// 폼
	const replyForm = document.querySelector("#replyForm");
	
	// 댓글 동적 추가할 공간
	const replyAddSpace = document.querySelector("#replyAddSpace");

	// 댓글의 개수
	let reply_count = "${communityMap.cmntVO.reply_count}";
	
	// 댓글/좋아요 개수 출력되는 공간
	const replyCountSpace = document.querySelector("#replyCountSpace");
	const likeCountSpace = document.querySelector("#likeCountSpace");
	
	// 이전/이후 게시글 가져오는 아이콘 id
	const prePost = document.querySelector("#prePost");
	const nextPost = document.querySelector("#nextPost");
	
	// detailForm, updateForm, reportForm의 id
	const cmntDetailForm =  document.querySelector("#cmntDetailForm");
	const cmntUpdateForm =  document.querySelector("#cmntUpdateForm");
	const cmntReportForm =  document.querySelector("#cmntReportForm");
	
	// 글 번호
	let cmnt_no =  "${communityMap.cmntVO.cmnt_no}";
	cmnt_no = {
			"cmnt_no" : cmnt_no 
	};
	
	let reply_anonyVal ="0";
	
	// 댓글 컨테이너
	const replyContainer = document.querySelector("#replyContainer");
	
	
	// [학생] 글 좋아요
	function pressLike(pThis){
		event.preventDefault();
		console.log(pThis);
	    let cmnt_no = pThis.children[0].value;
	    let smem_no = pThis.children[1].value;
	    let like_code = pThis.children[2].value;
	    
	
		let xhr = new XMLHttpRequest();
		let url = "/community/my/like/" + smem_no + "/" + cmnt_no + "/" + like_code;
		xhr.open("get", url, true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let result = xhr.responseText;
				
				if(result == "삭제성공"){
					pThis.children[2].value = "";
					pThis.children[3].children[0].innerHTML = "<i class='fa-regular fa-heart color-danger'></i>";
					likeCountSpace.textContent = parseInt(likeCountSpace.textContent) - 1;
					
				}else if(result == "삭제실패"){
					   swal({
						   title: "실패",
						   text: "좋아요 삭제에 실패했습니다. \n추후에 다시 시도해주십시오.",
						   icon: "warning",
				           buttons:{
				              select:"확인",
				           }
				        });
					
				}else{
					pThis.children[2].value = "LIKE" + result;
					
					pThis.children[3].children[0].innerHTML = "<i class='fa-solid fa-heart'></i>";
					likeCountSpace.textContent = parseInt(likeCountSpace.textContent) + 1;
				}
			}
		}
		xhr.send();
	
	}
	
	// [학생] 댓글 등록
	replyForm.addEventListener("submit", function(event){
		event.preventDefault();
		reply_anonyVal = "0";
		
		if(replyForm.reply_anony.checked){
			reply_anonyVal = "1";
		}

		let replyVO = {
				cmnt_no: replyForm.cmnt_no.value,
			    smem_no: replyForm.smem_no.value,
			    reply_content: replyForm.reply_content.value,
			    reply_anony:reply_anonyVal	
		};

		console.log("check:",replyVO);
		let xhr = new XMLHttpRequest();
		xhr.open("post", "/community/reply/register", true);
		xhr.setRequestHeader(header, token);
		xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let reply_no = xhr.responseText;
				console.log(reply_no);
				if(reply_no == ""){
					   swal({
						   title: "실패",
						   text: "댓글 등록에 실패했습니다.\n추후에 다시 시도해주십시오.",
						   icon: "warning",
				           buttons:{
				              select:"확인"
				           }
				        }).then((value)=>{				        	
							return false;
				        })
				}
				template_registerReply(reply_no, replyVO);
				replyForm.reset();
				replyForm.reply_content.value = "";
				replyForm.reply_anony.checked = false;
				// document.getElementsByName("reply_anony")[0].checked = false;
				
				// 본인게시글이 아니면 알람을 보냅니다.
				let jsonObject = {
						 state:"1",
				         sender:"${userId}",
				         purpose:"2",
				         url:"/community/detail/"+replyVO.cmnt_no,
				         cmnt_no:replyVO.cmnt_no
				}
				
				sendMessage(JSON.stringify(jsonObject));
				
			}
		}
		xhr.send(JSON.stringify(replyVO));
	})
	
	
	
	// [학생] 댓글 등록 템플릿
	function template_registerReply(reply_no, replyVO){
		console.log("템플릿에도 잘 왔어요" + reply_no);
		let userId = "${userId}";
		let csmem_no = "${communityMap.cmntVO.smem_no}";
		
		let str = "";
		str +='<div class="bootstrap-media">';
		str +='<div class="media" style="display: flex; justify-content: space-between;">';
		str +=	'<div>';
		str +=		'<img class="mr-3 img-fluid" src="${pageContext.request.contextPath }/resources/images/community/community_default.jpg"';
		str +=		'alt="" width="50px;" height="50px;" style="border-radius: 50%;">';
		str +=		'<div class="media-body" style="display: inline-block;">';
				
				if(userId == replyVO.smem_no && csmem_no == replyVO.smem_no){
		str +=					'<span class="badge badge-dark">작성자</span>&nbsp;';
				}
				
				if(replyVO.reply_anony == 0){
		str +=					'<b>' + replyVO.smem_no + '</b>&nbsp;&nbsp;&nbsp;';
				}else{
		str +=					'<b>익명의 한국대생</b>&nbsp;&nbsp;&nbsp;';
				}

		str +=		'방금 전<br/>';
		str +=		replyVO.reply_content;
		str +=		'</div>';							
		str +=	'</div>';
		str +=	'<div>';
			
				if(replyVO.smem_no == userId){
		str +=          '<input type="hidden" value="'+ reply_no +'" name="reply_no"/>';
		str +=			'<button type="button" class="btn mb-1 btn-flat btn-outline-danger" onclick="delNewReply(this)">삭제</button>';	
				}
		str +=	'</div>';
		str += '</div>';
		str += '</div>';
		
		
		replyAddSpace.innerHTML += str;
		replyCountSpace.innerHTML = parseInt(replyCountSpace.textContent) + 1;
	}
	// 커뮤니티 게시글 수정
	function OpenUpdateScreen(uThis){
		event.preventDefault();
		
		if(cmntUpdateForm.style.display == "none"){
			cmntUpdateForm.style.display = "block";
			cmntDetailForm.style.display = "none";
			replyContainer.style.display = "none";
		}else if(cmntUpdateForm.style.display == "block"){
			cmntUpdateForm.style.display = "none";
			cmntDetailForm.style.display = "block";
			replyContainer.style.display = "block";
		}
	}
	
	// 커뮤니티 게시글 삭제
	function deleteCmntPost(dThis){
		event.preventDefault();
		console.log(dThis);

	   swal({
		   title: "삭제",
		   text: "정말 게시글을 삭제하시겠습니까?\n삭제 시 되돌릴 수 없습니다.",
		   icon: "warning",
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
        	switch (value) {
			case "select":
				let xhr = new XMLHttpRequest();
				xhr.open("delete", "/community/delete", true);
				xhr.setRequestHeader(header, token);
				xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200){
						let check = xhr.responseText;
						if(check == 0){
							   swal({
								   title: "실패",
								   text: "삭제에 실패하였습니다.\n추후에 다시 시도해주십시오.",
								   icon: "warning",
						           buttons:{
						              select:"확인",
						           }
						        }).then((value)=>{				        	
									return false;
						        })
						}else{
							   swal({
								   title: "성공",
								   text: "성공적으로 커뮤니티 게시글이 삭제되었습니다.",
								   icon: "success",
						           buttons:{
						              select:"확인"
						           }
						        }).then((value)=>{				        	
									location.href= '/community';
						        });
						}
					}
				}
				xhr.send(JSON.stringify(cmnt_no));				
				break;
			default:
				break;
			}
        });
		
	}
	
	// 댓글 이모티콘 등록
	function insertReplyEmotion(ithis){
	    replyForm.reply_content.value += ithis.textContent;
	} 
	
	// 이전 게시글 가져오기
	prePost.addEventListener("click", function(){
	    console.log(event.target);
	    console.log(cmnt_no);

			let xhr = new XMLHttpRequest();
			xhr.open("post", "/community/getPrePost", true);
			xhr.setRequestHeader(header, token);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let no = xhr.responseText;
					if(no == ""){
						   swal({
							   text: "현재 보고 있는 글이 첫 번째 글입니다.",
							   icon: "info",
					           buttons:{
					              select:"확인",
					           }
					        }).then((value)=>{					        	
								return false;
					        })
					}else{						
						location.href = "/community/detail/" + no;
					}
				}
			}
			xhr.send(JSON.stringify(cmnt_no));
	})
	
	// 다음 게시글 가져오기
	nextPost.addEventListener("click", function(){
	    console.log(event.target);
	    console.log(cmnt_no);

			let xhr = new XMLHttpRequest();
			xhr.open("post", "/community/getNextPost", true);
			xhr.setRequestHeader(header, token);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let no = xhr.responseText;
					if(no == ""){
						   swal({
							   text: "현재 보고 있는 글이 마지막 글입니다.",
							   icon: "info",
					           buttons:{
					              select:"확인",
					           }
					        }).then((value)=>{					        	
								return false;
					        })
					}else{						
						location.href = "/community/detail/" +  no;
					}
				}
			}
			xhr.send(JSON.stringify(cmnt_no));
	})
	
	// 신고하기 cmntReportForm
	function reportCmntPost(){
		
		let cmnt_no = cmntReportForm.cmnt_no.value;
		let cmnt_report = cmntReportForm.cmnt_report.value;
		let jsonData = {
			cmnt_no : cmnt_no,
			cmnt_report : cmnt_report
		};

	   swal({
		   text: "신고하신 후에는 취소하실 수 없습니다. 정말 신고하시겠습니까?",
		   icon: "warning",
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
        	switch (value) {
			case "select":
				// 신고 전에 이전 신고 내역이 있는지 확인
				let xhrR = new XMLHttpRequest();
				let url = "/community/report/check/" + cmnt_no; 
				xhrR.open("get", url, true);
				xhrR.setRequestHeader(header, token);
				xhrR.onreadystatechange = function(){
					if(xhrR.readyState == 4 && xhrR.status == 200){
						console.log(xhrR.responseText);
						let check = xhrR.responseText;
						if(check == 1){
							   swal({
								   text: "이미 해당 게시글에 접수된 신고내역이 존재합니다.\n확인 후 처리 예정입니다.",
								   icon: "info",
						           buttons:{
						              select:"확인"
						           }
						        }).then((value)=>{						        	
									cmntReportForm.children[cmntReportForm.children.length-1].children[0].click();
									cmntReportForm.reset();
									return false;
						        });
						}else{
							reportPost(jsonData);
						}
					}
				}
				xhrR.send();	
				break;

			default:
				cmntReportForm.children[cmntReportForm.children.length-1].children[0].click();
				cmntReportForm.reset();
				return false;
				break;
			}
        })	
	}
	
	// 게시글 신고하기
	function reportPost(jsonData){
		let xhr = new XMLHttpRequest();
		xhr.open("post", "/community/report", true);
		xhr.setRequestHeader(header, token);
		xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
			   swal({
				   title: "신고 성공",
				   text: "신고가 접수되었습니다.",
				   icon: "success",
		           buttons:{
		              select:"확인"
		           }
		        })
				cmntReportForm.children[cmntReportForm.children.length-1].children[0].click();
				cmntReportForm.reset();
			}
		}
		xhr.send(JSON.stringify(jsonData));	
	}

	// 댓글 삭제(새로 생성된 댓글)
	function delNewReply(dthis){
	    console.log("새로 생성된 댓글을 삭제하려구");
	    let reply_no = dthis.parentElement.children[0].value;
	    console.log(reply_no);
	    deleteReply(reply_no);
	    console.log(dthis.parentElement.parentElement.parentElement);
	    dthis.parentElement.parentElement.parentElement.style.display = "none";
		replyCountSpace.innerHTML = parseInt(replyCountSpace.textContent) - 1;
	}
	
	// 댓글 삭제(목록에서 가져온 댓글)
	function delListReply(dthis){
		console.log("목록에서 가져온 댓글을 삭제하려구");
	    let reply_no = dthis.parentElement.children[0].value;
	    console.log(reply_no);
	    deleteReply(reply_no);
	    console.log(dthis.parentElement.parentElement.parentElement);
	    dthis.parentElement.parentElement.parentElement.style.display = "none";
	    replyCountSpace.innerHTML = parseInt(replyCountSpace.textContent) - 1;
	}

	function deleteReply(reply_no){
		let url = "/community/reply/delete/" + reply_no;
		let xhr = new XMLHttpRequest();
		xhr.open("get", url, true);
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let successCnt = xhr.responseText;	
				
				if(successCnt > 0){
					return 	swal({
							   title: "성공",
							   text: "댓글이 성공적으로 삭제되었습니다.",
							   icon: "success",
					           buttons:{
					              select:"확인"
					           }
				           });
				}else{
					return swal({
						   title: "실패",
						   text: "댓글 삭제에 실패했습니다. \n 추후에 다시 시도해주십시오.",
						   icon: "danger",
				           buttons:{
				              select:"확인"
				           }
			           });
				}
			}
		}
		xhr.send();
	}
	
	//--------------------------------------------------------------- 썸머노트
let summernote;	

summernote = $("#cmnt_content");

$("#cmnt_content").summernote({
		    height: 200,        // 에디터 높이
		    minHeight: 200,    // 최소 높이
		    maxHeight: 300,    // 최대 높이(null 제한없음)
		    focus: false,        // 에디터 로딩후 포커스를 맞출지 여부
		    lang: "ko-KR",      // 한글 설정
		    toolbar: [
		                ['fontname', ['fontname']],     // 글꼴 설정
		                ['fontsize', ['fontsize']],    // 글자 크기 설정
		                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		                ['color', ['forecolor','color']],    // 글자색
		                ['table', ['table']],    // 표만들기
		                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
		                ['height', ['height']],    // 줄간격
		                ['insert',['picture','link','video']],    // 그림첨부, 링크만들기, 동영상첨부
		                ['view', ['fullscreen', 'codeview', 'help']]    // 코드보기, 확대해서보기, 도움말
		    ],
		    placeholder : "내용을 입력해주십시오. 이미지를 첨부할 수도 있습니다.",
		      // 추가한 글꼴
		    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		     // 추가한 폰트사이즈
		    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});

// 수정 내용 자동 값 채우기
 function updateContentAutoValue(){
 	document.querySelector("#cmnt_category").children[3].selected = true; // 잡담
 	document.querySelector("#cmnt_feeling").children[3].selected = true; // 즐거움
 	document.querySelector("#cmnt_title").value = "커뮤니티 게시글 제목을 수정합니다.";
 	// document.querySelector("#cmnt_content").value = "커뮤니티 게시글 내용을 수정합니다.";
 	// document.querySelector("#cmnt_content").summernote('editor.insertText', '커뮤니티 게시글 내용을 수정합니다.');
 	summernote.summernote('reset');
 	summernote.summernote('editor.insertText', '커뮤니티 게시글 내용을 수정합니다.');
 }

</script>
<script src="${pageContext.request.contextPath }/resources/js/community.js"></script>