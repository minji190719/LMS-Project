<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
#bod_regi{
	 display:none; 
} 
#bodmod{
	display:none;
}
.dataTables_length {
	display: none;
}

table.dataTable tr.odd {
	background-color: white;
}

th {
	font-size: 15px;
	text-align: center;
}

td {
	font-size: 15px;
	text-align: center;
}
#bod_list td:nth-child(2){
	text-align: left;
}

.pagination .active a{
	background-color: var(--custom-p) !important;
	color : white !important;
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

.cn_list>tr>td {
	width: 60px;
}

.cn_list>tr>td:first-child{
	width: 40px;
}

.cn_list>tr>td:nth-child(2){
	width: 400px;
}
</style>

<div class="backgroundimg"
	style="position: absolute; background-size: 50% 20%; opacity: 0.5; left: -10px; top: 80px; z-index: -1;">
	<img src="../resources/images/js.jpg">
</div>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold"
			style="color: #ffffff;">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;
			<c:out value="${allinfomap[0].DEP_NAME } 공지사항"></c:out>
			<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item"><a href="/main/home">&nbsp;공지사항</a></li>
					<li class="breadcrumb-item active"><a
						href="/Mstudent/studentAllList"><c:out value="${allinfomap[0].DEP_NAME } 공지사항"></c:out></a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
		<div class="p-t-15">
			<div class="">
				<div class="row" id="bod_list">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="default-tab">
									<ul class="nav nav-tabs mb-3">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="/board/commain?dep_code=DEP4">학과 공지사항</a></li>
									</ul>
									<div class="table-responsive custom-table1" id="" style="height: 660px;">
										<table class="table table-bordered" id="testable">
											<thead class="custom-theader-p">
												<tr class="text-center">
													<th style="width: 40px;">No.</th>
													<th style="width: 400px;">제목</th>
													<th style="width: 60px;">작성자</th>
													<th style="width: 60px;">작성일</th>
													<th style="width: 60px;">조회수</th>
													<c:if test="${role eq 'ROLE_PROFESSOR' }">
														<th style="width: 60px;">삭제</th>
													</c:if>
												</tr>
											</thead>
											<tbody class="cn_list">

											</tbody>
										</table>
									</div>
									<div class="buttongroup">
										<c:if test="${role eq 'ROLE_PROFESSOR' }">
											<button type="button"
												class="btn mb-1 btn-primary custom-btn-p" id="c_insert"
												style="margin-top: 10px; float: right;" onclick="insert()">등록</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 공지사항 작성폼 -->
				<c:if test="${role eq 'ROLE_PROFESSOR' }">
					<div class="col-12" id="bod_regi">
						<div class="card">
							<div class="card-body">
								<h5 class="custom-p custom-bold">학사 공지사항 등록</h5>
								<div id="write_board">
									<form id="boardRegister" action="board/boardRegister" class="form-valide" method="post" enctype="multipart/form-data" target="boarddataList">
										<div class="form-group">
											<input type="text" class="form-control input-default"
												placeholder="제목을 작성하세요"
												id="board_title" name="board_title">
											<input type="hidden" class="form-control input-flat" name="dep_name">
										</div>
										<textarea class="board_content" id="board_content" name="board_content"></textarea>
										<br/>
										<div>
											<input type="file" class="form-control-file" id="c_file" name="c_file" aria-required="true" multiple="multiple">
										</div>
										<button type="button" class="btn mb-1 btn-outline-danger" id="ncancel" style="margin-top: 10px; float: right; margin: 10px;" onclick="boardFormcancel()">취소</button>
										<button type="button"
											class="btn mb-1 btn-primary custom-btn-p" id="bodregist"
											style="margin-top: 10px; float: right;" onclick="boardReg()">등록</button>
										<button type="button" class="btn mb-1 btn-outline-dark"
											style="margin-top: 10px; float: right;" onclick="autoValue()">자동완성</button>

									</form>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>


<script>
let summernote;
summernote = $("#board_content");
	function insert() {
		$("#bod_regi").show();
		$("#bod_list").hide();
		window.scrollTo(0, 0);
	}

	function boardFormcancel() {
		$("#bod_regi").hide();
		$("#bod_list").show();
		window.scrollTo(0, 0);
	}
	function boardmodFormcancel() {
		$("#bodmod").hide();
		$("#bod_list").show();
		window.scrollTo(0, 0);
	}
	function deboard(no) {
		$("#bodmod").show();
		$("#bod_list").hide();
		window.scrollTo(0, 0);
		$
				.ajax({
					url : "/board/getBoard?no=" + no,
					type : "get",
					contentType : "application/json",
					dataType : "text",
					success : function(data) {
						var test = JSON.parse(data);

						//				목록에서 수정버튼을 클릭했을때, 넘겨받은 no값을 수정 폼 안에 input type='hidden'에 바인딩한다.
						var board_no = document.querySelector("#board_no");
						var board_title = document
								.querySelector("#board_title");
						var board_content = document
								.querySelector("#board_content");
						var fileFlag = document.querySelector("#fileFlag");

						board_no.value = test.boardMap.board_no;
						board_title.value = test.boardMap.board_title;
						board_content.value = test.boardMap.board_content;
						$("#board_content").summernote('editor.pasteHTML',
								board_content.value);
						if (fileFlag = test.boardMap.boardFileList[0].file_name == null) {
							fileFlag.innerHTML = "<p>파일이 존재하지 않습니다.</p>";
						} else {
							fileFlag.innerHTML = "<p>test.boardMap.boardFileList[0].file_name</p>";
						}
					}
				});
	}
	//  리스트뽑아오기
	function requestList() {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		$
				.ajax({
					url : "/board/boardAllList",
					type : "POST",
					data : {
						dep_code : "${dep_code}"
					},
					dataType : "json",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {
						var html = "";
						table.clear().draw();
						data
								.forEach(function(obj, idx) {
									console.log(obj)
									if (obj.pmem_no == '201101') {
										html = "<td>컴교수</td>";
									} else if (obj.pmem_no == '201105') {
										html = "<td>정교수</td>";
									} else {
										html = "<td>교수</td>"
									}
									table.row
											.add(
													[
															"<td width='40px;'>" + (idx + 1)
																	+ "</td>",
															"<td><a href = '/board/detail?no="
																	+ obj.board_no
																	+ "'>"
																	+ obj.board_title
																	+ "</a></td>",
															html,
															"<td>"
																	+ obj.board_date
																	+ "</td>",
															"<td>"
																	+ obj.board_count
																	+ "</td>",
															"<td><button type='button' class='badge badge-danger' id = 'delboard' onclick = 'deleboard("
																	+ obj.board_no
																	+ ")'>삭제</button></td>" ])
											.draw(false);

								});
					}
				});

	}
	function responseBoard(xhr, msg) {

		console.log(xhr);
		if (typeof xhr != 'undefined' || xhr != null) {
			console.log(Object.values(xhr.list[0].board_no));
			console.log(Object.values(xhr.list[0].board_title));
			for (var i = 0; i < xhr.list.length; i++) {
				html += "<td>" + xhr.list[i].board_no + "</td>";
				html += "<td>" + xhr.list[i].board_title + "</td>";
				html += "<td>" + xhr.list[i].pmem_no + "</td>";
				html += "<td>" + xhr.list[i].board_date + "</td>";
				html += "<td>" + xhr.list[i].board_count + "</td>";
			}
			document.getElementById('.cn_list').innerHTML = html;
		} else {
			console.log("continue");
		}
	}
	let table;
	window.onload = function() {

		table = $("#testable").DataTable({
			displayLength : 10,
			destroy : true,
			ordering : false,
			info : false,
			responsive : true,
			visible : true,
			fixedHeader : true,
			
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
		
		const search = document.querySelector("div.dataTables_filter input");
		search.placeholder = "검색어를 입력하세요";

		requestList();
	}

	const boardRegister = document.querySelector("#boardRegister");
	const c_file = document.querySelector("#c_file");
	const bodregist = document.querySelector("#bodregist");

	function boardReg() {
		let files = c_file.files;

		var formData = new FormData(boardRegister);
		for (let i = 0; i < files.length; i++) {
			formData.append("c_file", files[i]);
			console.log(files[i])
		}

		var token = $("meta[name='_csrf']").attr('content');

		$.ajax({
			type : "POST",
			url : "/board/boardRegister",
			data : formData,
			contentType : false,
			processData : false,
			headers : {
				"X-CSRF-TOKEN" : token
			},
			success : function(data) {
				swal({
					  text: "학과 공지사항이 성공적으로 등록되었습니다.",
					  icon: "success",
					  button: "확인",
					})
					.then((value) =>{
						table.clear().draw();
						$("#bod_regi").hide();
						boardRegister.reset();
						requestList();
						$("#bod_list").show();						
					});

			}
		})
	}
	function boardmodify() {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		var board_no = document.querySelector("#board_no");
		var bo_file = document.querySelector("#board_file");

		var formData = new FormData();
		formData.append("board_no", document.querySelector("#board_no").value);
		formData.append("board_title",
				document.querySelector("#board_title").value);
		formData.append("board_content", document
				.querySelector("#board_content1").value);
		formData.append("c_file",
				document.querySelector("#board_file").files[0]);

		$.ajax({
			url : "/board/modiboard",
			method : "post",
			data : formData,
			processData : false,
			contentType : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				swal({
					  text: "학과 공지사항이 성공적으로 수정되었습니다.",
					  icon: "success",
					  button: "확인",
					})
					.then((value) =>{
						table.clear().draw();
						$("#bodmod").hide();
						requestList();
						boardmodiform.reset();
						$("#bod_list").show();						
					});

			}
		})
	}

	function deleboard(no) {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		var board_no = document.querySelector("#board_no");
		
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
				
				$.ajax({
					url : "/board/deleteboard",
					method : "get",
					data : {
						"board_no" : no
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {
						swal({
							  text: "학과 공지사항이 성공적으로 삭제되었습니다.",
							  icon: "success",
							  button: "확인",
							})
							.then((value) =>{
								table.clear().draw();
								$("#bod_regi").hide();
								requestList();						
							});
					}
				})				
				break;
			default :
				return false;
				break;
			}
        });
	}
	$("#board_content")
			.summernote(
					{
						height : 400, // 에디터 높이
						minHeight : 400, // 최소 높이
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

					});

	$("#board_content1")
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

					});
	
	function autoValue() {
		let frm = document.querySelector("#boardRegister");
		frm.board_title.value = "2023 한국대학교 컴퓨터공학과 졸업생 안내";
		summernote.summernote('editor.insertText',
		'2023 컴퓨터공학과 졸업생 리스트 입니다. 자세한 내용은 파일 참고 부탁드립니다.');
	}

</script> 
