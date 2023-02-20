<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;커뮤니티 게시판 관리<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/community/manage">커뮤니티 게시판 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<!-- 상단 메뉴 시작 -->
	<div class="col-lg-12 col-sm-6">
		<div class="card">
			<div class="social-graph-wrapper widget-twitter custom-btn-m" style="opacity: 0.8;">
				<span class="s-icon">
					<i class="fa-solid fa-circle-info">&nbsp;&nbsp;MANAGING COMMUNITY</i>
				</span>
			</div>
			<div class="row">
				<div class="col-4 border-right">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1" style="color: #5e5f5f;">${uCnt }
						</h4>
						<p class="m-0">
							<a href="#cmntUnhandled">							
								<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">신고 미처리 접수건수</font></font>
							</a>
						</p>
					</div>
				</div>
				<div class="col-4 border-right">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1" style="color: #5e5f5f;">${dCnt }
						</h4>
						<p class="m-0">
							<a href="#cmntDisposed">							
								<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">신고 승인건수</font></font>
							</a>
						</p>
					</div>
				</div>
				<div class="col-4">
					<div class="pt-3 pb-3 pl-0 pr-0 text-center">
						<h4 class="m-1" style="color: #5e5f5f;">${rCnt }
						</h4>
						<p class="m-0">
							<a href="#cmntReturned">								
								<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">신고 반려 건수</font></font>
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 메뉴 종료 -->	

	<!-- 신고 미처리 접수건 시작-->
	<div class="col-md-12" id="cmntUnhandled">
		<div class="pt-3 pb-3 pl-0 pr-0 text-center">
			<h4 class="m-1">
				<i class="fa-solid fa-clipboard"></i>
			</h4>
			<p class="m-0">
				<a href="#cmntUnhandled" class="custom-m custom-bold"> <font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">신고 미처리 접수건</font></font>
				</a>
			</p>
		</div>
		<div class="card">
			<div class="card-body" style="height: 300px; overflow: auto; overflow-x: hidden;">
				<div class="table-responsive">
					<table id="cmntUnhandledTable" class="table table-bordered">  
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고 미처리 접수건 종료 -->
	<!-- 신고 처리 접수건 시작-->
	<div class="col-md-12" id="cmntDisposed">
		<div class="pt-3 pb-3 pl-0 pr-0 text-center">
			<h4 class="m-1">
				<i class="fa-solid fa-clipboard"></i>
			</h4>
			<p class="m-0">
				<a href="#cmntDisposed" class="custom-m custom-bold"> <font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">신고 승인건</font></font>
				</a>
			</p>
		</div>
		<div class="card">
			<div class="card-body" style="height: 300px; overflow: auto; overflow-x: hidden;">
				<div class="table-responsive">
					<table id="cmntDisposedTable" class="table table-bordered">  
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고 처리 접수건 종료 -->
	<!-- 신고 반려건 시작-->
	<div class="col-md-12" id="cmntReturned">
		<div class="pt-3 pb-3 pl-0 pr-0 text-center">
			<h4 class="m-1">
				<i class="fa-solid fa-clipboard"></i>
			</h4>
			<p class="m-0">
				<a href="#cmntReturned" class="custom-m custom-bold"> <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">신고 반려건</font></font>
				</a>
			</p>
		</div>
		<div class="card">
			<div class="card-body" style="height: 300px; overflow: auto; overflow-x: hidden;">
				<div class="table-responsive">
					<table id="cmntReturnedTable" class="table table-bordered">  
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고 반려건 종료 -->
</div>

<script type="text/javascript">
//아작스 통신을 위한 csrf 인증 토큰
let header = '${_csrf.headerName}';
let token = '${_csrf.token}';

const unhandledTable = document.querySelector("#cmntUnhandledTable");
const disposedTable = document.querySelector("#cmntDisposedTable");
const returnedTable = document.querySelector("#cmntReturnedTable");

let lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 존재하지 않습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
        "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중입니다",
        "processing" : "처리중입니다"
    };

window.addEventListener('DOMContentLoaded', function(){
	getUnhandledList();
	getDisposedList();
	getReturnedList();
});

function getUnhandledList(){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/community/manage/unhandled", true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = JSON.parse(xhr.responseText);
			let str = "";
			str += "<thead><tr><td>No</td><td>신고사유</td><td>글제목</td><td>작성자</td><td>작성일</td><td>처리</td><td>반려</td></tr></thead>";
			str += "<tbody>";
			
			for(let i = 0; i < data.length; i++){
				str += "<tr>";
				str += 	"<td>" +  data[i].cmnt_content + "</td>";
				str += 	"<td><span class='badge badge-dark'>" +  data[i].cmnt_report + "</span></td>";
				str += 	"<td><a href='/community/detail/" + data[i].cmnt_no + "'>" +  data[i].cmnt_title + "</a></td>";
				str += 	"<td>" +  data[i].smem_no + "</td>";
				
				let cmnt_date = data[i].cmnt_date.substring(0, 11);
				str += 	"<td>" +  cmnt_date + "</td>";
				str += 	"<td><input type='hidden' value='"+ data[i].cmnt_no + "'/><button type='button' class='badge badge-success' onclick='cmntDisposed(this)' style='cursor:pointer;'>승인</button></td>";
				str += 	"<td><input type='hidden' value='"+ data[i].cmnt_no + "'/><button type='button' class='badge badge-danger' onclick='cmntReturned(this)' style='cursor:pointer;'>반려</button></td>";
				str += "</tr>";
			}
			str += "</tbody>";

			unhandledTable.innerHTML = str;

			$("#cmntUnhandledTable").DataTable({ searching: false, paging: true, pagingType : "simple_numbers", "bLengthChange": false, language : lang_kor, pageLength: "3"});

		}
	}
	xhr.send();
}

function cmntDisposed(cthis){
	let cmnt_no = cthis.previousElementSibling.value;
	let url = "/community/manage/cmntDisposed/" + cmnt_no;
	let xhr = new XMLHttpRequest();
	xhr.open("get", url, true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let check = xhr.responseText;
			
			if(check == 1){
				alert("성공적으로 처리되었습니다.");
				/*
				$("#cmntUnhandledTable").DataTable().clear().draw();
				getUnhandledList();
				$("#cmntDisposedTable").DataTable().clear().draw();
				getDisposedList();
				*/
				// location.href = location.href;
				$("#cmntUnhandledTable").DataTable().destroy();
				getUnhandledList();
				$("#cmntDisposedTable").DataTable().destroy();
				getDisposedList();
			}
		}
	}
	xhr.send();
}

function cmntReturned(cthis){
	let cmnt_no = cthis.previousElementSibling.value;
	let url = "/community/manage/cmntReturned/" + cmnt_no;
	let xhr = new XMLHttpRequest();
	xhr.open("get", url, true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let check = xhr.responseText;
			
			if(check == 1){
				alert("성공적으로 반려처리되었습니다.");
				/*
				$("#cmntUnhandledTable").DataTable().clear().draw();
				getUnhandledList();
				$("#cmntReturnedTable").DataTable().clear().draw();
				getReturnedList();
				*/
				// location.href = location.href;
				$("#cmntUnhandledTable").DataTable().destroy();
				getUnhandledList();
				$("#cmntReturnedTable").DataTable().destroy();
				getReturnedList();
			}
		}
	}
	xhr.send();
}

function getDisposedList(){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/community/manage/disposed", true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			let data = JSON.parse(xhr.responseText);
			let str = "";
			str += "<thead><tr><td>No</td><td>글제목</td><td>작성자</td><td>작성일</td><td>처리</td></tr></thead>";
			str += "<tbody>";
			
			for(let i = 0; i < data.length; i++){
				str += "<tr>";
				str += 	"<td>" +  data[i].cmnt_content + "</td>";
				str += 	"<td><a href='/community/detail/" + data[i].cmnt_no + "'>" +  data[i].cmnt_title + "</a></td>";
				str += 	"<td>" +  data[i].smem_no + "</td>";
				let cmnt_date = data[i].cmnt_date.substring(0, 11);
				str += 	"<td>" +  cmnt_date + "</td>";
				str += 	"<td><span class='badge badge-success'>승인 완료</span></td>";
				str += "</tr>";
			}
			str += "</tbody>";

			disposedTable.innerHTML = str;

			$("#cmntDisposedTable").DataTable({ searching: false, paging: true, pagingType : "simple_numbers", "bLengthChange": false, language : lang_kor, pageLength: "3"});
		}
	}
	xhr.send();	
}

function getReturnedList(){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/community/manage/returned", true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			let data = JSON.parse(xhr.responseText);
			let str = "";
			str += "<thead><tr><td>No</td><td>글제목</td><td>작성자</td><td>작성일</td><td>반려</td></tr></thead>";
			str += "<tbody>";
			
			for(let i = 0; i < data.length; i++){
				str += "<tr>";
				str += 	"<td>" +  data[i].cmnt_content + "</td>";
				str += 	"<td><a href='/community/detail/" + data[i].cmnt_no + "'>" +  data[i].cmnt_title + "</a></td>";
				str += 	"<td>" +  data[i].smem_no + "</td>";
				let cmnt_date = data[i].cmnt_date.substring(0, 11);
				str += 	"<td>" +  cmnt_date + "</td>";
				str += 	"<td><span class='badge badge-danger'>반려 완료</span></td>";
				str += "</tr>";
			}
			str += "</tbody>";

			returnedTable.innerHTML = str;

			$("#cmntReturnedTable").DataTable({ searching: false, paging: true, pagingType : "simple_numbers", "bLengthChange": false, language : lang_kor, pageLength: "3"});
		}
	}
	xhr.send();	
}

</script>