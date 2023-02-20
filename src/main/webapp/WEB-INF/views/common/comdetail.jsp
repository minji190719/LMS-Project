<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#bodmod{
	display:none;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;학과 공지사항
			<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item"><a href="/board/commain?dep_code=DEP4">&nbsp;학과 공지사항</a></li>
					<li class="breadcrumb-item ">상세 보기</li>
					<li class="breadcrumb-item active">상세 보기</li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body" id="bod_detail">
				<h4 class="card-title">${BoardeMap.boardVO.DEP_NAME }</h4>
				<hr>
				<div class="col-md-12">
					<h2>${BoardeMap.boardVO.BOARD_TITLE}</h2>
					<br>
					<h6 style="float: right;">
						조회수 : ${BoardeMap.boardVO.BOARD_COUNT} ㅣ 교수 ㅣ 등록일 :
						<fmt:formatDate value="${BoardeMap.boardVO.BOARD_DATE}"
							pattern="yyyy-MM-dd" />
					</h6>
				</div>
				<br> <br>
				<div class="comment-message">
					<c:forEach items="${BoardeMap.boardFileVO}" var="boardfile">
						<c:forTokens var="token" items="${boardfile.file_name }"
							delims="." varStatus="status">
							<c:if test="${status.last }">
								<c:choose>
									<c:when test="${token eq 'jpg' || token eq 'png' }">
										<img alt="${boardfile.file_name }"
											src="${boardfile.file_path}">
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
								<br />
							</c:if>
						</c:forTokens>
					</c:forEach>
					<pre
						style="padding-left: 40px; height: 500px; overflow: auto; overflow-x: hidden; width: 100%;">${BoardeMap.boardVO.BOARD_CONTENT}</pre>


				</div>
				<br> <br> <br>
				<div class="col-md-12">
					<c:if test="${not empty BoardeMap.boardFileVO}">
						<blockquote>
							<c:forEach items="${BoardeMap.boardFileVO}" var="boardfile"
								varStatus="i">
								<b>${boardfile.file_originnm }&nbsp;&nbsp;</b>
								<p style="display: inline-block;">${boardfile.file_type }&nbsp;&nbsp;</p>
								<a href=<c:out value = "${boardfile.file_path }"/>
									download="${boardfile.file_originnm }"
									style="text-align: right;">
									<button type="button" class="btn mb-1 btn-rounded btn-warning">
										<span class="btn-icon-left"> <i
											class="fa fa-download color-warning"></i>
										</span> 다운로드
									</button>
								</a>
							</c:forEach>
						</blockquote>

					</c:if>
				</div>
				<c:if test="${role eq 'ROLE_PROFESSOR' }">
					<button type="button" style="float: right;"
						class="btn mb-1 btn-primary custom-btn-p" id="dboard"
						onclick='deboard(${BoardeMap.boardVO.BOARD_NO})'>수정</button>
				</c:if>
				<a href="/board/commain?dep_code=DEP4">
					<button type="button" class="btn mb-1 btn-outline-dark"
						style="float: right;">목록으로 돌아가기</button>
				</a>
			</div>
		</div>
	</div>
</div>
<c:if test="${role eq 'ROLE_PROFESSOR' }">
	<div class="col-12" id="bodmod">
		<div class="card">
			<form class="card-body" action="/modiboard" method="post"
				id="boardmodiform">
				<h5 class="custom-p custom-bold">학사 공지사항 수정</h5>
				<div id="modify_board">
					<div class="form-group">
						<input type="hidden" name="board_no" id="board_no" value="">
						<input type="text" class="form-control input-default" placeholder="제목" id="board_title" name="board_title">
					</div>
					<textarea class="bt" name="board_content" id="board_content1"></textarea>
					<br/>
					<div>
						<input type="file" class="form-control-file" id="board_file"
							name="c_file" aria-required="true" multiple="multiple">
					</div>
					<button type="button" class="btn mb-1 btn-outline-danger"
						id="ncancel" style="margin-top: 10px; float: right; margin: 10px;"
						onclick="boardmodFormcancel()">취소</button>
					<button type="button" id="bodmodify"
						class="btn mb-1 btn-primary custom-btn-p"
						style="margin-top: 10px; float: right;" onclick="boardmodify()">수정</button>
				</div>
			</form>
		</div>
	</div>
</c:if>
<script>
summernote1 = $("#board_content1");

function boardmodFormcancel(){
	$("#bodmod").hide();
	$("#bod_detail").show();
}

function deboard(no){
	console.log(no);
 	$("#bodmod").show();
	$("#bod_detail").hide();
	window.scrollTo(0, 0);
	$.ajax({
		url: "/board/getBoard?no=" + no,
		type: "get",
		contentType:"application/json",
		dataType: "text",
		success: function(data){
			var test = JSON.parse(data);
			
	//			목록에서 수정버튼을 클릭했을때, 넘겨받은 no값을 수정 폼 안에 input type='hidden'에 바인딩한다.
			var board_no = document.querySelector("#board_no");
			var board_title = document.querySelector("#board_title");
			var board_content1 = document.querySelector("#board_content1");
			var fileFlag = document.querySelector("#fileFlag");
			
			board_no.value = test.boardMap.board_no;
			board_title.value = test.boardMap.board_title;
			board_content1.value = test.boardMap.board_content;
			summernote1.summernote('editor.pasteHTML', board_content1.value);
			if(fileFlag = test.boardMap.boardFileList[0].file_name == null){
				fileFlag.innerHTML = "<p>파일이 존재하지 않습니다.</p>";
			}else{
				fileFlag.innerHTML = "<p>test.boardMap.boardFileList[0].file_name</p>";
			}
			
		}
	});
}

function boardmodify(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var board_no = document.querySelector("#board_no");
	var bo_file = document.querySelector("#board_file");
	

	var formData = new FormData();
	formData.append("board_no", document.querySelector("#board_no").value);
	formData.append("board_title", document.querySelector("#board_title").value);
	formData.append("board_content", document.querySelector("#board_content1").value);
		formData.append("c_file", document.querySelector("#board_file").files[0]);
	
	 $.ajax({
		url : "/board/modiboard",
		method : "post",
		data : formData,
		processData : false,
		contentType : false,
     	beforeSend : function(xhr){
        xhr.setRequestHeader(header, token);
      	},
		success : function(data){
			swal({
				  text: "학과 공지사항이 성공적으로 수정되었습니다.",
				  icon: "success",
				  button: "확인",
				})
				.then((value) =>{
					location.href="/board/detail?no="+${BoardeMap.boardVO.BOARD_NO}					
				});
		
		}
	}) 
}
$("#board_content1").summernote({
    height: 500,        // 에디터 높이
    minHeight: 500,    // 최소 높이
    maxHeight: null,    // 최대 높이(null 제한없음)
    focus: false,        // 에디터 로딩후 포커스를 맞출지 여부
    lang: "ko-KR",      // 한글 설정
    isNotSplitEdgePoint : true,
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
      // 추가한 글꼴
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
     // 추가한 폰트사이즈
    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

}).on("summernote.enter", function(we, e) {
    $(this).summernote('pasteHTML', '<br>&VeryThinSpace;');
    e.preventDefault();
});
</script>	  
       
