<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>	
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
.swal-button--confirm{
	background-color: #8e304d;
}

.swal-title {
	color: #000000;
}
</style>



<input type="hidden" value="${lecCode }" id="lecCode">
<input type="hidden" value="${cnt }" id="lecCnt">
<title>출결 처리</title>
<div class="container-fluid justify-content-center">
	<div class="row">
		<div class="col-lg-11">
		<br>
		<h3 class="font-weight-bold mt-1 mb-4 pl-1 text-center">출석부</h3>
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-between">
						<div>
							<input type="radio" name="check_attend" style="cursor:pointer" value="0">일괄출석 
							<input type="radio" name="check_attend" style="cursor:pointer" value="2">일괄결석 
							<button type="button" class="btn mb-1 btn-dark btn-sm" id="changeAttendChk">선택 변경</button> 
						</div>
						<div>
							<button type="button" class="btn mb-1 btn-sm text-white" style="background-color:#8e304d;" onclick="attendClose()">출결완료</button> 
						</div>
					</div>
					<hr>
					<div class="table-responsive">
						<table class="table text-center">
							<thead>
								<tr>
									<th>No</th>
									<th>이름</th>
									<th>소속</th>
									<th>학번</th>
									<th>출결구분</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody id="attendStuList">
							<!-- 학생 리스트 출력 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}';

window.onload = function(){
	
	getStudentList();
}

function getStudentList(){
	
	let lecCode = document.getElementById("lecCode").value;
	let lecCnt = document.getElementById("lecCnt").value;
	
	let lecWeek = Math.ceil(lecCnt / 2);
	let lecCount = (lecCnt % 2 == 0 ? 2 : 1);

	let data = {
		lec_code : lecCode,
		attend_week :  lecWeek,
		attend_day : lecCount
	}
	
	$.ajax({
		method : "post",
		url : "/lad/getLecAttendStudentList",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("list 불러오기 : ", result);
			document.getElementById("attendStuList").innerHTML = studentListTemplate(result);
		},
		error : function(){

		}
		
	})
};

const studentListTemplate = (stuList) =>{
	let code = "";
	console.log(stuList[0].MEM_NAME);
	let cnt = 1;

	let lecCode = document.getElementById("lecCode").value;

	for(let i = 0; i < stuList.length; i++){
		code += `
				<tr>
					<td>\${cnt}</td>	
					<td>\${stuList[i].MEM_NAME}</td>	
					<td>\${stuList[i].COL_NAME} \${stuList[i].STU_DEP}</td>
					<td>\${stuList[i].SMEM_NO}</td>`;
					if(stuList[i].ATTEND_STATE == null){
						code += `<td>미출결</td>`;					
					}else if(stuList[i].ATTEND_STATE == 0){
						code += `<td>출석</td>`;	
					}else if(stuList[i].ATTEND_STATE == 1){
						code += `<td>지각</td>`;	
					}else{
						code += `<td>결석</td>`;
					}
		 code +=	`<td>
						<button type="button" minji1 class="btn mb-1 btn-outline-success btn-sm" onclick="attendBtnFn(this, '0', '\${lecCode}', '\${stuList[i].SMEM_NO}')">출석</button>
						<button type="button" 		 class="btn mb-1 btn-outline-warning btn-sm" onclick="attendBtnFn(this, '1', '\${lecCode}', '\${stuList[i].SMEM_NO}')">지각</button>
						<button type="button" minji3 class="btn mb-1 btn-outline-danger btn-sm" onclick="attendBtnFn(this, '2', '\${lecCode}', '\${stuList[i].SMEM_NO}')">결석</button>
					</td>
				</tr>
		`;
		cnt++; 
	}

	return code;
}

function attendBtnFn(athis, state, lecCode, smemNo){

	let lecCnt = document.getElementById("lecCnt").value;

	let lecWeek = Math.ceil(lecCnt / 2);
	let lecCount = (lecCnt % 2 == 0 ? 2 : 1);
	
	console.log("! : ", $(athis).closest("tr"))
	console.log("!! : ",$(athis).closest("tr").children('td:eq(1)').text());
// 	console.log($(athis).closest('tr').find('td:eq(4)').text());

	let attendInfo =  $(athis).closest("tr").children('td:eq(4)');
	
	console.log("lecCode : ",lecCode);
	console.log('lecCnt : ',lecCnt);
	console.log('state : ',state);
	console.log('주차 : ',lecWeek , "주차");
	console.log('회차 : ',lecCount, "회차");
	
	let data = {
		smem_no : smemNo,
		attend_state : state,
		lec_code : lecCode,
		attend_week : lecWeek,
		attend_day :lecCount
	}

	$.ajax({
		method : "POST",
		url : "/lad/insertAttentance",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		dataType : "text",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("성공이다ㅜ : ", result);
			attendTdtext(state, attendInfo);
		},
		error : function(){

		}
	})
}

function attendTdtext(state, attendInfo){
	console.log("attendInfo : ", attendInfo)

	let text = "";
	if(state == '0'){ 
		text = "출석";
	}else if(state == 1){
		text = "지각";
	}else{
		text = "결석";
	}
	attendInfo.text(text);
	

}

$("#changeAttendChk").on("click", function(){

	console.log($('input[name="check_attend"]:checked').val());
	
	let state = $('input[name="check_attend"]:checked').val();
	
	console.log("나! " ,$("button[minji1]"));
	
	if(state == 0){
		$("button[minji1]").trigger("click");
		
	}else if(state == 2){
		$("button[minji3]").trigger("click");
	}
	
})

function attendClose(){
// 	alert("출결이 완료 되었습니다.")
	swal({
		title: "출결이 완료 되었습니다.",
		icon: "success",
		closeOnClickOutside : false
	}).then(function(){
		// 이벤트
		window.close();
	});
	
}

</script>