<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.mjLecAttendListTb{
	height: 550px;
	overflow: auto;
}
.mjFixedHeader {
	position: sticky;
	top: 0;
}
</style>


<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>출석부 관리</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lad/myLecStuentAttend">출석부 관리</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>


<div class="row d-flex">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div>
					<h5 class="font-weight-bold mb-4">과목 정보 </h5>
				</div>
				<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">담당과목</span></div>
				<select class="form-control input-default" id="selectLolCode" onchange="pSelectLectureFn2()">
					<c:choose>
						<c:when test="${lecture eq null }">
							<option value="">담당 강좌 없음</option>
						</c:when>
						<c:otherwise>
							<option value="" selected="selected">강좌선택</option>
							<c:forEach items="${lecture }" var="lecture">
								<option value="${lecture.LOL_CODE}">[학부]${lecture.COL_NAME}&nbsp;${lecture.DEP_NAME}&nbsp;
								-&nbsp;${lecture.LOL_NAME}&nbsp;(${lecture.LOL_YEAR}/${lecture.LOL_SEMESTER}학기)</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
				</div>
					<hr>
					<div class="table-responsive">
						<form name="lecInfoForm">
							<table class="table w-100" border="1" style="text-align : center;">
								<tr>
									<td>강의번호</td>
									<td><input type="text" class="form-control input-default" name="LEC_CODE" id="lec_code" style="border:none; text-align : center;" readonly="readonly"></td>
									<td>소속</td>
									<td><input type="text" class="form-control input-default" name="COL_NAME" style="border:none; text-align : center;" readonly="readonly"></td>
									<td>전공</td>
									<td><input type="text" class="form-control input-default" name="DEP_NAME" style="border:none; text-align : center;" readonly="readonly"></td>
									<td>학년</td>
									<td><input type="text" class="form-control input-default" name="LOL_SCHYEAR" style="border:none; text-align : center;" readonly="readonly"></td>
								</tr>
								<tr>
									<td class="form col-lg-1">학점</td>
									<td><input type="text" class="form-control input-default" name="LOL_CREDIT" style="border:none; text-align : center;" readonly="readonly"></td>
									<td class="form col-lg-1">정원</td>
									<td><input type="text" class="form-control input-default" name="LOL_LIMIT" style="border:none; text-align : center;" readonly="readonly"></td>
									<td class="form col-lg-1">요일/시간</td>
									<td><input type="text" class="form-control input-default" name="LOL_DAYnTIME" id="LOL_DAYnTIME" style="border:none; text-align : center;" readonly="readonly"></td>
									<td class="form col-lg-1">강의실</td>
									<td><input type="text" class="form-control input-default" name="ROOM_NUM" style="border:none; text-align : center;" readonly="readonly"></td>
								</tr>
							</table>
						</form>
					</div>

			</div>
		</div>
	</div>
	
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-4">출석부</h5>
					<hr>
				</div>
				<div class="table-responsive mjLecAttendListTb" style="width:100%; height:500px; overflow:auto">
							<table class="mjAttendTable table text-center" >
								<thead class="mjFixedHeader custom-thaeder" style="background-color:#EBEBEB;">
									<tr>
										<th>번호</th>
										<th>주차</th>
										<th>회차/요일</th>
										<th>시간</th>
<!-- 										<th>출석</th> -->
<!-- 										<th>지각</th> -->
<!-- 										<th>결석</th> -->
										<th>출결</th>
									</tr>
								</thead>

								<tbody  id="lecWeekListTb">

								</tbody>
							</table>
						</div>

			</div>
		</div>
	</div>
	
	
</div>

<!-- 폼데이터 동적생성
<div id="formSub">

</div> -->
<script>
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}';

function pSelectLectureFn2(){
	let lolCode = document.getElementById("selectLolCode").value;
	
	console.log("LolCode", lolCode);
	
	let lecWeekList = document.getElementById("lecWeekList");
	
	let data = {
			lolCode : lolCode,
	}

	$.ajax({
		method : "POST",
		url : "/lad/getMyOpenLecWeektList",
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("응답하라..", result);
			lecWeekListTemplate(result);
		},
		error : function(){

		}
	})
	
}

const lecWeekListTemplate = function(data){

	console.log("일단 호출", data);

	let form = document.lecInfoForm;		// document.form의 네임;
	let elems = form.elements;

	for(let i = 0; i < elems.length; i++){
		elems[i].value = data[elems[i].name];
	}

	// 요일/날짜 넣기
	let code = "";
	code = `\${data.LOL_DAY1}(\${data.LOL_STARTIME1}~\${data.LOL_ENDTIME1}) / \${data.LOL_DAY2}(\${data.LOL_STARTIME2}~\${data.LOL_ENDTIME2})`;
	document.getElementById("LOL_DAYnTIME").value = code;
	
	
	// 테이블 출력
	let cnt = 1;
	let table = "";
	for(let i = 0; i < 15; i++){
		table += `<tr>
				  <td>\${cnt}</td>
				  <td rowspan="2">\${i+1}주차</td>
				  <td>1 / \${data.LOL_DAY1}</td>
				  <td>\${data.LOL_STARTIME1}~\${data.LOL_ENDTIME1}</td>
				  <td><button type="button"  class="btn mb-1 btn-rounded btn-primary btn-sm custom-btn-p" onclick="attendBtn('\${cnt}')">출결관리</button></td>
				  </tr>`;
				  
				  cnt++;
				  
		table += `<tr>
				  <td>\${cnt}</td>
				  <td>2 / \${data.LOL_DAY2}</td>
				  <td>\${data.LOL_STARTIME2}~\${data.LOL_ENDTIME2}</td>
				  <td><button type="button"  class="btn mb-1 btn-rounded btn-primary btn-sm custom-btn-p" onclick="attendBtn('\${cnt}')">출결관리</button></td>
				  <tr>
				  `;	
		  		cnt++;
	}
	
	let lecWeekListTb = document.getElementById("lecWeekListTb");
	lecWeekListTb.innerHTML = table;
	
};

function attendBtn(cnt){
	let lecCode = document.getElementById('lec_code').value;
	console.log("찍어볼게요 민지", lecCode);
	console.log("찍어볼게요 cnt", cnt);
	console.log("찍어볼게요 주차 : ", Math.ceil(cnt/2), "주차");
	console.log("찍어볼게요 회차 : ", (cnt%2 == 0 ? 2 : 1), "회차");
	
	// let url = "/lad/pAttendStrudentList/" + lecCode;
	let url = "/lad/pAttendStrudentList/" + cnt + "/" + lecCode;
    let name = "popup attend";
    let option = "width = 900, height = 800, top = 100, left = 200, location = no"
    window.open(url, name, option);
	
  
    
}


</script>