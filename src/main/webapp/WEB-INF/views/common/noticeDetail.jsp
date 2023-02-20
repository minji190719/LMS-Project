<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#notmod {
	display: none;
}

</style>

<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>공지사항</strong><br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/notice/main">공지사항</a></li>
					<li class="breadcrumb-item active">상세 보기</li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row" id = "not_detail">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<c:set value="${noticeMap }" var="notice"></c:set>
				<br/>
				<div class="col-md-12">
					
					<h2>[${notice.noticeVO.notice_category }] ${notice.noticeVO.notice_title }</h2>
				<br/>
				<hr/>
					<h6 style="float: right;">
						조회수 : ${notice.noticeVO.notice_count } ㅣ<!-- ${notice.noticeVO.mmem_no } ㅣ-->  등록일 :
						<fmt:formatDate value="${notice.noticeVO.notice_date}" pattern="yyyy-MM-dd" />
					</h6>
				</div>
				<br/>
				<div class="comment-message">
					<c:forEach items="${noticeMap.noticeFileVO}" var="noticefile">
						<c:forTokens var="token" items="${noticefile.file_name }"
							delims="." varStatus="status">
							<c:if test="${status.last }">
								<c:choose>
									<c:when test="${token eq 'jpg' || token eq 'png' }">
										<img alt="${noticefile.file_name }"
											src="${noticefile.file_path}">
									</c:when>
								</c:choose>
								<br />
							</c:if>
						</c:forTokens>
					</c:forEach>
					<pre style="padding-left: 40px; height: 550px; overflow: auto; overflow-x : hidden; width: 100%;">${notice.noticeVO.notice_content}</pre>
				</div>
				<br/>
				<div class="col-md-12">
					<c:if test="${fn:length(noticeMap.noticeFileVO) > 0}">
						<blockquote>
							<c:forEach items="${noticeMap.noticeFileVO}" var="noticefile">
								<b>${noticefile.file_originnm }&nbsp;&nbsp;</b>
								<p style="display: inline-block;">&nbsp;&nbsp;</p>
								<a href="${noticefile.file_path }"
									download="${noticefile.file_originnm }"
									style="text-align: right;">
									<button type="button" class="btn mb-1 btn-rounded btn-warning">
										<span class="btn-icon-left"> <i
											class="fa fa-download color-warning"></i>
										</span>다운로드
									</button>
								</a>
							</c:forEach>
						</blockquote>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-12 mt-3" style="display: flex; justify-content: flex-end;">
		<a href="/notice/main" style="margin-right: 10px;">
			<button type="button" class="btn btn-primary custom-btn-s" style="float: right;">목록으로 돌아가기</button>
		</a>
	<c:if test="${role eq 'ROLE_ADMIN' }">
	<button type="button" class="badge custom-btn-m" id = "dnotice" style="width: 100%; width: 50px; font-size: 1em;" onclick = "denotice(${notice.noticeVO.notice_no})">수정</button>
	</c:if>
	</div>
	
</div>

<c:if test="${role eq 'ROLE_ADMIN' }">
	
	<div class="col-12" id="notmod">
		<div class="card">
			<form class="card-body" action="/modinotice" method="post" id="modform">
				<div class="card-title">
					<h5 class="custom-m custom-bold">
						공지사항 수정
					</h5>
				</div>
				<div id="modify_notice">
					<div class="form-row">
						<input type="hidden" name="notice_no" id="notice_no" value="">
						<div class="form-group col-md-3">
							<select class="form-control custom-border-m" name="notice_category" style="border-radius: 5px;">
								<option value="일반">일반</option>
								<option value="학사">학사</option>
								<option value="장학">장학</option>
							</select>
						</div>
						<div class="form-group col-md-9">						
							<input type="text" class="form-control input-default custom-border-m"
								placeholder="제목" id="notice_title" name="notice_title">
						</div>
					</div>
					<textarea class="nt" name="notice_content" id="notice_content1"></textarea><br/>
					<div>
						<input type="file" class="form-control-file" id="notice_file"
							name="n_file" aria-required="true" multiple="multiple">
						<!--                                 	<div id="fileFlag"></div> -->
					</div>
					<div class="custom-right-array">
						<button type="button" class="btn mb-1 btn-outline-dark" id="ncancel" onclick="noticemodifyFormcancel()">취소</button>&nbsp;&nbsp;
						<button type="button" id="notmodify" class="btn mb-1 btn-primary custom-btn-m" onclick="noticemodify()">수정</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</c:if>

<script>

summernote1 = $("#notice_content1");




function noticemodifyFormcancel(){
	$("#notmod").hide();
	$("#not_detail").show();
}


function denotice(no) {
	$("#notmod").show();
	$("#not_detail").hide();
	window.scrollTo(0, 0);

	// 목록에서 수정버튼을 클릭했을때, 넘겨받은 no값을 수정 폼 안에 input yype='hidden'에 바인딩한다.
	$.ajax({
				url : "/notice/getNotice?no=" + no,
				type : "get",
				contentType : "application/json",
				dataType : "text",
				success : function(data) {
					var test = JSON.parse(data);

					//목록에서 수정버튼을 클릭했을때, 넘겨받은 no값을 수정 폼 안에 input type='hidden'에 바인딩한다.
					var notice_no = document.querySelector("#notice_no");
					console.log(notice_no);
					var notice_title = document.querySelector("#notice_title");
					console.log(notice_title);
					var notice_content = document.querySelector("#notice_content1");
					console.log(notice_content);
					var fileFlag = document.querySelector("#fileFlag");
					notice_no.value = test.noticeMap.notice_no;
					notice_title.value = test.noticeMap.notice_title;
					notice_content.value = test.noticeMap.notice_content;
					summernote1.summernote('editor.pasteHTML',
							notice_content.value);

					if (fileFlag = test.noticeMap.noticeFileList[0].file_name == null) {
						fileFlag.innerHTML = "<p>파일이 존재하지 않습니다.</p>";
					} else {
						fileFlag.innerHTML = "<p>test.noticeMap.noticeFileList[0].file_name</p>";
					}
				}
			});
}

function noticemodify() {
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var notice_no = document.querySelector("#notice_no");
	var no_file = document.querySelector("#notice_file");

	console.log(notice_no);

	var formData = new FormData();
	formData
			.append("notice_no", document.querySelector("#notice_no").value);
	formData.append("notice_title",
			document.querySelector("#notice_title").value);
	formData.append("notice_content", document
			.querySelector("#notice_content1").value);
	formData.append("mn_file",
			document.querySelector("#notice_file").files[0]);

	$.ajax({
		url : "/notice/modinotice",
		method : "post",
		data : formData,
		processData : false,
		contentType : false,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			
			swal({
				  text: "수정되었습니다.",
				  icon: "success",
				  button: "확인",
				})
				.then((value) =>{
					$("#notmod").hide();
// 					$("#not_detail").reload();
					$("#not_detail").show();
				})
		}
	})
}


// var $editor = $form.find('#notice_content1')
// $editor.summernote({
//   callbacks: {
//     onChange: function (content) {
//     	$("p").each(function(){
//     	    if (!$(this).text().trim().length) {
//     	        $(this).remove();
//     	    }
//     	});
//     }
//   }
// })



$("#notice_content1")
.summernote(
		{
			height : 500, // 에디터 높이
			minHeight : 500, // 최소 높이
			maxHeight : null, // 최대 높이(null 제한없음)
			focus : false, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			toolbar : [
					[ 'fontname', [ 'fontname' ] ], // 글꼴 설정
					[ 'fontsize', [ 'fontsize' ] ], // 글자 크기 설정
					[
							'style',
							[ 'bold', 'italic', 'underline',
									'strikethrough', 'clear' ] ], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
					[ 'color', [ 'forecolor', 'color' ] ], // 글자색
					[ 'table', [ 'table' ] ], // 표만들기
					[ 'para', [ 'ul', 'ol', 'paragraph' ] ], // 글머리 기호, 번호매기기, 문단정렬
					[ 'height', [ 'height' ] ], // 줄간격
					[ 'insert', [ 'picture', 'link', 'video' ] ], // 그림첨부, 링크만들기, 동영상첨부
					[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] // 코드보기, 확대해서보기, 도움말
			],
			// 추가한 글꼴
			fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
					'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
					'돋음체', '바탕체' ],
			// 추가한 폰트사이즈
			fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
					'18', '20', '22', '24', '28', '30', '36', '50',
					'72' ]

		}).on("summernote.enter", function(we, e) {
	        $(this).summernote("pasteHTML", "<br><br>");
	        e.preventDefault();
	    });


</script>
