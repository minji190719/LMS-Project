<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
<div class = "backgroundimg"  style="position:absolute; background-size: 100% 80%; opacity: 0.5; left:-10px; top:80px; z-index:-1;" >
	<img src = "../resources/images/도서관.jpg">
</div>
-->
<style>
#not_regi {
	display: none;
}

#notmod {
	display: none;
}

#not_list td{
	text-align: center;
}

#not_list th{
	background-color: #ECF2F3 !important;
}

#not_list .dataTables_length {
	display: none;
}
div.dataTables_filter input { 
	border : 1px solid #CED4DA !important;
	color : var(--custom-s) !important;
	width: 300px !important; 
	height : 20px;
	float: none;
	right:15px;
	border-radius: 10px;
}

#not_list .page-item a{
	background-color: #FFFFFFF !important;
	color : var(--custom-s) !important;
}

#not_list .pagination .active a{
	background-color: var(--custom-s) !important;
	color : white !important;
}
#not_list td:nth-child(2){
	text-align: left;
}

</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;공지사항<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/notice/main">공지사항</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row" id="not_list">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="default-tab">
					<ul class="nav nav-tabs mb-3" role="#home">
						<li class="nav-item" onclick="requestList()"><a
							class="nav-link active show" data-toggle="tab" href="#home">&nbsp;&nbsp;&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

						<li class="nav-item" onclick="selectCategory()"><a
							class="nav-link" data-toggle="tab" href="#home"><input
								type="hidden" id="category" value="일반">&nbsp;&nbsp;&nbsp;&nbsp;일반&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

						<li class="nav-item" onclick="selectb()"><a class="nav-link"
							data-toggle="tab" href="#home"><input type="hidden"
								id="category1" value="학사">&nbsp;&nbsp;&nbsp;&nbsp;학사&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

						<li class="nav-item" onclick="selectc()"><a class="nav-link"
							data-toggle="tab" href="#home"><input type="hidden"
								id="category2" value="장학">&nbsp;&nbsp;&nbsp;&nbsp;장학&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					
					</ul>
					<div class="tab-content" style="height: 650px;">
						<div class="tab-pane fade active show" id="home" role="tabpanel">
							<div class="p-t-15">
								<div class="table-responsive" id="">
									<table class="table table-hover table-bordered"
										id="testable">
										<thead>
											<tr class="text-center">
												<th style="width: 40px;">No.</th>
												<th style="width: 450px;">제목</th>
												<th style="width: 60px;">작성자</th>
												<th style="width: 80px;">작성일</th>
												<th style="width: 70px;">조회수</th>
												<c:if test="${role eq 'ROLE_ADMIN' }">
													<th style="width: 80px;">삭제</th>
												</c:if>
											</tr>
										</thead>
										<tbody class="nor_list" >

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
	<div class="col-lg-12" style="display: flex; justify-content: flex-end;">
		<c:if test="${role eq 'ROLE_ADMIN' }">
			<button type="button" class="btn btn-primary custom-btn-m" id="onotice" onclick="insnot()">등록</button>
		</c:if>	
	</div>
</div>
<c:if test="${role eq 'ROLE_ADMIN' }">
	<div class="col-12" id="not_regi">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold">
						공지사항 등록
					</h5>
				</div>
				<div id="write_notice">
					<form id="notregisterForm" action="notice/notRegister" class="form-valide" method="post" enctype="multipart/form-data"
						target="noticedataList">
						<div class="form-row">
							<div class="form-group col-md-3">	
								<select class="form-control custom-border-m" name="notice_category" style="border-radius: 5px;">
									<option value="일반">일반</option>
									<option value="학사">학사</option>
									<option value="장학">장학</option>
								</select>
							</div>
							<div class="form-group col-md-9">
								<input type="text" class="form-control input-default custom-border-m"
									placeholder="제목작성" id="n_title"
									name="notice_title">
							</div>
						</div>	
						<textarea class="nt" id="notice_content" name="notice_content"></textarea><br/>
						<div>
							<input type="file" class="form-control-file" id="n_file"
								name="n_file" aria-required="true" multiple="multiple">
						</div>
						<div class="custom-right-array">
							<button type="button" class="btn mb-1 btn-outline-dark" id="ncancel"  onclick="noticeinsertFormcancel()">취소</button>&nbsp;&nbsp;
							<button type="button" id="notregist" class="btn mb-1 btn-primary custom-btn-m" onclick="noticeReg()">등록</button>&nbsp;&nbsp;
							<button type="button" class="btn mb-1 btn-outline-dark" onclick="autoValue()">자동완성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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


<script type="text/javascript">
	let summernote;
	summernote = $("#notice_content");
	summernote1 = $("#notice_content1");

	function noticeinsertFormcancel() {
		$("#not_regi").hide();
		$("#not_list").show();
		window.scrollTo(0, 0);
	}
	function noticemodifyFormcancel() {
		$("#notmod").hide();
		$("#not_list").show();
		window.scrollTo(0, 0);
	}
	function insnot() {
		$("#not_regi").show();
		$("#not_list").hide();
		window.scrollTo(0, 0);
	}

	function denotice(no) {
		$("#notmod").show();
		$("#not_list").hide();
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
						var notice_title = document.querySelector("#notice_title");
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

	function requestList() {

		$.ajax({
					url : "/notice/noticeAllList",
					type : "get",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						table.clear().draw();
						console.log(data);
						data.forEach(function(obj, idx) {
									if (obj.mmem_no == '20170003') {
										html = "<td style='width: 60px;'>관리자</td>";
									}
									table.row
											.add(
													[
															"<td style='width: 40px;'>"
																	+ (idx + 1)
																	+ "</td>",
															"<td style = 'width:450px;'><a href = '/notice/detail?no="
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
																	+ "</td>",
															"<button type='button' class='badge badge-danger' id = 'delnotice' style = 'position : relative;' onclick = 'delenotice("
																	+ obj.notice_no
																	+ ")'>삭제</button>" ])
											.draw(false);

								});
						const search = document.querySelector("div.dataTables_filter input");
						search.placeholder = "검색어를 입력하세요";
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
	let table;
	window.onload = function() {

		table = $("#testable").DataTable({
			lengthMenu : false,
			displayLength : 10,
			destroy : true,
			ordering : false,
			info : false,
			responsive : true,
			visible : true,
			fixedHeader : true,
//			dom: 't<"col-sm-12"p>b<"col-sm-7"f>',
// 		    dom: '<"col-sm-6"i><"col-sm-6"p>t<"col-sm-6"f><"col-sm-6"l>',
// 		    dom: "<'row'<'col-xs-6 col-sm-4'lB>>t"+ "<'row'<'col-sm-3'i><'col-sm-9'p>>",
			
		    "language": {
		        "emptyTable": "등록된 공지사항이 없습니다.",
		        "lengthMenu": "한 페이지당 _MENU_ 개씩 보기",
		        "info": "현재 _START_ - _END_ / _TOTAL_건",
		        "infoEmpty": "데이터가 존재하지 않습니다.",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링되었습니다. )",
		        "search": "",
		        "zeroRecords": "일치하는 데이터가 존재하지 않습니다.",
		        "loadingRecords": "로딩 중입니다.",
		        "processing":     "잠시만 기다려 주십시오.",
		        "paginate": {
		            "next": "다음",
		            "previous": "이전"
		        }

		    }
		});

		requestList();
	}

	const notregisterForm = document.querySelector("#notregisterForm");
	const n_file = document.querySelector("#n_file");
	const notregist = document.querySelector("#notregist");

	function noticeReg() {
		let files = n_file.files;

		var formData = new FormData(notregisterForm);
		for (let i = 0; i < files.length; i++) {
			formData.append("n_file", files[i]);
			console.log(files[i])
		}

		var token = $("meta[name='_csrf']").attr('content');

		$.ajax({
			type : "POST",
			url : "/notice/notRegister",
			data : formData,
			contentType : false,
			processData : false,
			headers : {
				"X-CSRF-TOKEN" : token
			},
			success : function(data) {
				swal({
					  text: "등록되었습니다.",
					  icon: "success",
					  button: "확인",
					})
					.then((value) =>{
						table.clear().draw();
						notregisterForm.reset();
						$("#not_regi").hide();
						requestList();
						$("#not_list").show();
					})
			}
		})
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
						table.clear().draw();
						$("#notmod").hide();
						requestList();
						modform.reset();
						$("#not_list").show();
					})
			}
		})
	}

	function delenotice(no) {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		var notice_no = document.querySelector("#notice_no");

		   swal("삭제 후에는 복구할 수 없습니다. 정말 삭제하시겠습니까?",{
	            buttons:{
	               select:"확인",
	               cancel:"취소"
	            }
	         }).then((value)=>{
	            console.log(value)
	            
	            switch(value){
	            case "select":
	            	$.ajax({
	        			url : "/notice/deletenotice",
	        			method : "get",
	        			data : {
	        				"notice_no" : no
	        			},
	        			beforeSend : function(xhr) {
	        				xhr.setRequestHeader(header, token);
	        			},
	        			success : function(data) {
	        				table.clear().draw();
	        				$("#not_regi").hide();
	        				requestList();
	        				swal({
	      					  text: "삭제되었습니다.",
	      					  icon: "success",
	      					  button: "확인",
	      					})
	        			}
	        		})
	               break;
	            default:
	               break;
	            }
	         })
		
		

		
	}
	function notidetail(no) {
		/* var notice_no = document.querySelector("#notice_no");
		console.log(no); */
		console.log("asdasd");
	}

	function selectCategory(category) {

		var category = document.querySelector("#category").value;
		$
				.ajax({
					url : "/notice/selectCategory",
					method : "get",
					data : {
						"category" : category
					},
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						console.log(data);
						table.clear().draw();
						data
								.forEach(function(obj, idx) {
									if (obj.mmem_no == '20170003') {
										html = "<td style='width:60px;'>관리자</td>";
									}

									table.row
											.add(
													[
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
																	+ "</td>",
															"<button type='button' class='badge badge-danger' id = 'delnotice' style = 'position : relative;' onclick = 'delenotice("
																	+ obj.notice_no
																	+ ")'>삭제</button>" ])
											.draw(false);
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

	function selectb(category) {
		var category = document.querySelector("#category1").value;
		console.log(category);

		console.log(category);
		$
				.ajax({
					url : "/notice/selectCategory",
					method : "get",
					data : {
						"category" : category
					},
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						console.log(data);
						table.clear().draw();
						data
								.forEach(function(obj, idx) {
									if (obj.mmem_no == '20170003') {
										html = "<td style='width:60px;'>관리자</td>";
									}

									table.row
											.add(
													[
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
																	+ "</td>",
															"<button type='button' class='badge badge-danger' id = 'delnotice' style = 'position : relative;' onclick = 'delenotice("
																	+ obj.notice_no
																	+ ")'>삭제</button>" ])
											.draw(false);
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
			document.getElementById('.bachelortable_list').innerHTML = html;
		} else {
			console.log("continue");
		}
	}

	function selectc(category) {
		var category = document.querySelector("#category2").value;
		console.log(category);

		console.log(category);
		$
				.ajax({
					url : "/notice/selectCategory",
					method : "get",
					data : {
						"category" : category
					},
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						console.log(data);
						table.clear().draw();
						data
								.forEach(function(obj, idx) {
									if (obj.mmem_no == '20170003') {
										html = "<td style='width:60px;'>관리자</td>";
									}

									table.row
											.add(
													[
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
																	+ "</td>",
															"<button type='button' class='badge badge-danger' id = 'delnotice' style = 'position : relative;' onclick = 'delenotice("
																	+ obj.notice_no
																	+ ")'>삭제</button>" ])
											.draw(false);
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

	summernote.summernote({
		height : 500, // 에디터 높이
		minHeight : 500, // 최소 높이
		maxHeight : null, // 최대 높이(null 제한없음)
		focus : false, // 에디터 로딩후 포커스를 맞출지 여부
		lang : "ko-KR", // 한글 설정
		codeviewFilter: false,
		codeviewIframeFilter: false,
		toolbar : [
				[ 'fontname', [ 'fontname' ] ], // 글꼴 설정
				[ 'fontsize', [ 'fontsize' ] ], // 글자 크기 설정
				[
						'style',
						[ 'bold', 'italic', 'underline', 'strikethrough',
								'clear' ] ], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				[ 'color', [ 'forecolor', 'color' ] ], // 글자색
				[ 'table', [ 'table' ] ], // 표만들기
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ], // 글머리 기호, 번호매기기, 문단정렬
				[ 'height', [ 'height' ] ], // 줄간격
				[ 'insert', [ 'picture', 'link', 'video' ] ], // 그림첨부, 링크만들기, 동영상첨부
				[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] // 코드보기, 확대해서보기, 도움말
		],
		// 추가한 글꼴
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',
				'맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체' ],
		// 추가한 폰트사이즈
		fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22',
				'24', '28', '30', '36', '50', '72' ]

	});
	$("#notice_content1")
			.summernote(
					{
						height : 500, // 에디터 높이
						minHeight : 500, // 최소 높이
						maxHeight : null, // 최대 높이(null 제한없음)
						focus : false, // 에디터 로딩후 포커스를 맞출지 여부
						lang : "ko-KR", // 한글 설정
						codeviewFilter: false,
						codeviewIframeFilter: false,
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

					});
	function autoValue() {
		let frm = document.querySelector("#notregisterForm");
		frm.notice_title.value = "2023 학국대학교 졸업생 안내";
		frm.notice_category.value = "일반";
		summernote.summernote('editor.insertText',
				'2023 한국대학교 졸업생 리스트 입니다. 자세한 내용은 파일 참고 부탁드립니다.');
	}
</script>

