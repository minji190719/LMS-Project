<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.lecOpenManagementList .page-item a{
	background-color: #FFFFFFF !important;
	color : var(--custom-m) !important;
}

.lecOpenManagementList .pagination .active a{
	background-color: var(--custom-m) !important;
	color : #FFFFFF !important;
}
.lecOpenManagementList tr:first-child{
	width: 2%;
}

.lecOpenManagementList tr:nth-child(4) {
	width: 20%;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;개설 과목 관리<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a
						href="/loMng/lecOpenManagementList">개설 과목 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row lecOpenManagementList">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold">개설 신청 목록</h5>
				</div>

				<div class="table-responsive">
					<table class="table table-hover table-bordered zero-configuration"
						id="lecOpenApplyListBody">
						<thead class="custom-theader-m">
							<tr>
								<th>No.</th>
								<th>과목번호</th>
								<th>전공</th>
								<th>강의명</th>
								<th>작성자(교번)</th>
								<th>신청일</th>
								<th>상태</th>
								<th>내용</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="card" style="height: 600px;">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold">개설 승인 목록</h5>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-bordered zero-configuration"
						id="lecOpenAppSuccessListBody">
						<thead class="custom-theader-m">
							<tr>
								<th>No.</th>
								<th>과목번호</th>
								<th>전공</th>
								<th>강의명</th>
								<th>작성자(교번)</th>
								<th>신청일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- 승인목록 띄우기 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="card" style="height: 600px;">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-m custom-bold">승인 / 반려 목록</h5>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-bordered zero-configuration"
						id="lecOpenRejectListBody">
						<thead class="custom-theader-m">
							<tr>
								<th>No.</th>
								<th>과목번호</th>
								<th>전공</th>
								<th>강의명</th>
								<th>작성자(교번)</th>
								<th>신청일</th>
								<th>상태</th>
								<th>사유</th>
							</tr>
						</thead>
						<tbody>
							<!-- 반려 목록 띄우기 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 승인 입력 모달 -->
<div class="modal fade" id="lecStateChangeNInsertRoomModal"
	role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-sm">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title font-weight-bold">승인처리</h4>
				<button type="button" class="close updateModalClose"
					data-dismiss="modal">×</button>
			</div>
			<div class="modal-body d-flex justify-content-center">
				<form id="lolAcceptModalForm">
					<div class="form-group">
						<label for="lecRoomNumber" class="col-form-label mr-2 font-weight-bold">강의실 배정</label> <select
							name="room_num" id="lecRoomNumber">
							<option value="">강의실 선택</option>
							<c:forEach items="${roomList }" var="roomList">
								<option value="${roomList.ROOM_CODE}"><c:out
										value='${roomList.COL_NAME} ${roomList.ROOM_NUM}호' /></option>
							</c:forEach>
						</select>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light updateModalClose"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn custom-btn-m"
					id="updateAcceptContent">승인</button>
			</div>
		</div>

	</div>
</div>


<!-- 반려사유 입력 모달 -->
<div class="modal fade" id="rejectContentUpdateModal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title font-weight-bold">반려</h4>
				<button type="button" class="close updateRejectModalClose"
					data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<form id="lolRejectModalForm">
					<div class="form-group">
						<label for="rejectContentText" class="col-form-label font-weight-bold">반려사유작성</label>
						<textarea class="form-control" id="rejectContentText"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light"
					onclick="autoCompleteMRejectBtn()">자동완성</button>
				<button type="button" class="btn btn-default updateRejectModalClose"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-dark"
					id="updateRejectContent">반려</button>
			</div>
		</div>

	</div>
</div>

<!-- 반려 사유 보기 Modal -->
<div class="modal fade" id="rejectContentShowModal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title font-weight-bold">반려 사유</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body  d-flex justify-content-center">
				<p id="rejectContentModal"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
			</div>
		</div>

	</div>
</div>

<script>
//시큐리티용 토큰
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}';

window.onload = function(){
	
	getLecOpenApplyList();
}

function getLecOpenApplyList(){
	
	$.ajax({
		
		method : "get",
        url : "/loMng/lecOpenApplyList",
        dataType : "json",
        beforeSend : function(xhr){
 		        xhr.setRequestHeader(header, token);
        },
        success : function(result){
            console.log("result : ", result);
            loaListTemplate(result)
//             $("#lecOpenApplyListBody").html(loaListTemplate(result));
//             $("#lecOpenAppSuccessListBody").html();
        },
        error : function(){
            console.log("실패");
        }

	})
}

const loaListTemplate = loaList => {
	let code = "";
	let codeS = "";
	let codeF = "";
	
	console.log(loaList)
	let tableOption = {
			blengthMenu : false,
			displayLength : 5,
			destroy : true,
			ordering : false,
			info : false,
			responsive : true,
			visible : true,
			fixedHeader : true,
		    "language": {
		        "emptyTable": "등록된 내용이 없습니다.",
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
		};
	var table1 = $("#lecOpenApplyListBody").DataTable(tableOption);
	var table2 = $("#lecOpenAppSuccessListBody").DataTable(tableOption);
	var table3 = $("#lecOpenRejectListBody").DataTable(tableOption);

	var table1cont=1;
	var table2cont=1;
	var table3cont=1;
	
	let cnt = 0;
	for(let i = 0; i < loaList.length; i++){
		if(loaList[i].LOL_STATE == 0){
			cnt++;
		}
	}
    
	if(cnt == 0){
	   	table1.row.add([ `<td style="display:none"></td>`,
	   					 `<td style="display:none"></td>`,
	   					 `<td style="display:none"></td>`,
	   					 `<td style="display:none"></td>`,
	   					 `<td colspan="9">개설 신청 목록이 없습니다.</td>`,
	   					 `<td style="display:none"></td>`,
	   					 `<td style="display:none"></td>`,
	   					 `<td style="display:none"></td>`,
	   					 `<td style="display:none"></td>`
	   		
	   		]).draw(false);
	}
	    
	for(let i = 0; i < loaList.length; i++){
		
	    console.log("민지 확인 ",loaList[i].LOL_STATE);
		if(loaList[i].LOL_STATE == 0){

 			table1.row.add([
 				`<td>\${table1cont}</td>`,
 				`<td>\${loaList[i].LOL_CODE}</td>`,
 				`<td>\${loaList[i].DEP_NAME}</td>`,
 				`<td>\${loaList[i].LOL_NAME}</td>`,
 				`<td>\${loaList[i].MEM_NAME}(\${loaList[i].PMEM_NO})</td>`,
 				`<td>\${loaList[i].LOL_DATE }</td>`,
 				`<td><span class="badge px-2" style="background-color: gray; color:white;">대기</span></td>`,
 				`<td><button type="button" class="badge badge-dark" onclick="lecOpenApplyContent('\${loaList[i].LOL_CODE}')" style="cursor: pointer;">보기</button></td>`,
 				`<td><button type="button" class="badge badge-success" onclick="lecOpenAcceptBtn('\${loaList[i].LOL_CODE}')" style="cursor: pointer;">승인</button>&nbsp;&nbsp;/&nbsp;&nbsp;<button type="button" class="badge badge-danger" onclick="lecOpenRejectBtn('\${loaList[i].LOL_CODE}')" style="cursor: pointer;">반려</button></td>`
		     ]).draw(false);
 			table1cont++;
		}
		  
		if(loaList[i].LOL_STATE == 1){
			
			table2.row.add([
				`<td>\${table2cont}</td>`,
				`<td>\${loaList[i].LOL_CODE}</td>`,
				`<td>\${loaList[i].DEP_NAME}</td>`,
				`<td>\${loaList[i].LOL_NAME}</td>`,
				`<td>\${loaList[i].MEM_NAME}(\${loaList[i].PMEM_NO})</td> `,
				`<td>\${loaList[i].LOL_DATE }</td>`,
				`<td><span class="badge badge-success px-2">승인</span></td>`
			]).draw(false);
			table2cont++;
		}
		
		
		if(loaList[i].LOL_STATE == 2){
			table3.row.add([
				`<td>\${table3cont}</td>`,
				`<td>\${loaList[i].LOL_CODE}</td>`,
				`<td>\${loaList[i].DEP_NAME}</td>`,
				`<td>\${loaList[i].LOL_NAME}</td>`,
				`<td>\${loaList[i].MEM_NAME}(\${loaList[i].PMEM_NO})</td>`,
				`<td>\${loaList[i].LOL_DATE}</td>`,
				`<td><span class="badge badge-danger px-2">반려</span></td>`,
				`<td><button type="button" class="badge badge-dark" data-toggle="modal" data-target="#rejectContentShowModal" onclick="lolRejectContent('\${loaList[i].LOL_CODE}')">보기</button></td>`
			]).draw(false);
			table3cont++;
		}// if문 끝
		
    }// for문 끝
	
// 	$("#lecOpenApplyListBody").html(code);
// 	$("#lecOpenAppSuccessListBody").html(codeS);
// 	$("#lecOpenRejectListBody").html(codeF);
	
}

// 반려사유 보기
function lolRejectContent(lolCode){

	console.log(lolCode);
	let data = {
			lolCode : lolCode
	}
	
	$.ajax({
		type: "POST",
		url : "/loMng/getlolRejectContent",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "text",
		beforeSend : function(xhr){
		        xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("반려사유 가져와서 찍어보기",result)
			$("#rejectContentModal").html(result);
			
		},
		error : function(){
			console.log("실패");
		}
		
		
	})
}


// 신청내용 보기
function lecOpenApplyContent(lolCode){
	
	var url = "/loMng/lecOpenApplyContents/" + lolCode;
    var name = "popup test";
    var option = "width = 900, height = 800, top = 100, left = 200, location = no"
    window.open(url, name, option);
}


// 개설신청 승인
function lecOpenAcceptBtn(lolCode){
	
	// 모달 띄우기
	$("#lecStateChangeNInsertRoomModal").modal("show");
	
	let updateModalClose = $(".updateModalClose");
	
	updateModalClose.on("click",function(){
			 $("#lolAcceptModalForm")[0].reset()
			 $('#lecStateChangeNInsertRoomModal').modal('hide');
	})
	
	updateAcceptContent.onclick = function(event){
		event.preventDefault();
		
		let room_code = $("#lecRoomNumber").val();
		
		let data = {
			lol_code : lolCode,
			room_code : room_code
		}
		
		console.log("room_code : ",room_code);
		console.log("lolCode : ",lolCode);
		
        $.ajax({
            type: "POST",
            url: "/loMng/lecOpenAcceptManage",
            data : JSON.stringify(data),
            contentType : "application/json; charset=utf-8",
            dataType : "text",
            beforeSend : function(xhr){
		        xhr.setRequestHeader(header, token);
			},
            success : function(result){
                console.log("승인완료!" , result);
                swal({
            		title: "승인 완료 되었습니다.",
            		icon: "success",
            		closeOnClickOutside : false
            	}).then(function(){
	                $('#lecOpenApplyListBody').dataTable().fnClearTable(); 
	                $('#lecOpenAppSuccessListBody').dataTable().fnClearTable(); 
	                $('#lecOpenRejectListBody').dataTable().fnClearTable(); 
	//                 $("#lecOpenApplyListBody").DataTable().destroy();
	//                 $("#lecOpenAppSuccessListBody").DataTable().destroy();
	//                 $("#lecOpenRejectListBody").DataTable().destroy();
	               
	                getLecOpenApplyList();
            		
            	});
                
                
            },
            error : function(){
                console.log("실패")
            }
        })
        
         $("#lolAcceptModalForm")[0].reset()
			 $('#lecStateChangeNInsertRoomModal').modal('hide');
		
	}
	
 
}

// 개설신청 반려
function lecOpenRejectBtn(lolCode){
// 	  data-toggle="modal" data-target="#rejectContentUpdateModal" 
	$("#rejectContentUpdateModal" ).modal("show");
	
	
	// 모달 닫기버튼 리셋
	let updateRejectModalClose = $(".updateRejectModalClose");
	updateRejectModalClose.on("click",function(){
			 $("#lolRejectModalForm")[0].reset()
			 $('#rejectContentUpdateModal').modal('hide');
	})
	
	
	// 모달 반려사유 등록시 ajax 실행
	updateRejectContent.onclick = function(event) {
		
		event.preventDefault();
			
		let lolReject = $("#rejectContentText").val();

		let data = {
				lol_reject : lolReject,
				lol_code : lolCode
			}
		

	    $.ajax({
	        method : "POST",
	        url : "/loMng/lecOpenRejectManage",
	        data : JSON.stringify(data),
	        contentType : "application/json;charset=utf-8",
	        dataType : "text",
	        beforeSend : function(xhr){
			        xhr.setRequestHeader(header, token);
			},
	        success : function(result){
	            console.log("성공!", result)
	            swal({
					title: "반려되었습니다.",
					icon: "success",
					closeOnClickOutside : false
				}).then(function(){
					// 이벤트
		        	$('#lecOpenApplyListBody').dataTable().fnClearTable(); 
		            $('#lecOpenAppSuccessListBody').dataTable().fnClearTable(); 
		            $('#lecOpenRejectListBody').dataTable().fnClearTable(); 
		            getLecOpenApplyList();
					
				});
	        },
	        error : function(){
	
	        }
	        
	    })
	    
	    $("#lolRejectModalForm")[0].reset();
  	  	$('#rejectContentUpdateModal').modal('hide'); 
	}

}

// 반려사유 자동완성
function autoCompleteMRejectBtn(){
	$("#rejectContentText").val("해당 교과목은 개설할 수 없습니다.");
}
</script>