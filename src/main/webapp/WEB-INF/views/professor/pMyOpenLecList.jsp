<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="row">
	
		<div class="col">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h4>개설 강좌 조회</h4>
					</div>
					<div class="lecListTableBorder">
						<!-- 여기 안에 패딩주고 컬러줄 것 -->

						<div class="table-responsive">
							<table class="table table-hover table-striped table-bordered zero-configuration" id="myOpenLecListTable">
								<thead>
									<tr>
										<th>번호</th>
										<th>강의번호</th>
										<th>전공</th>
										<th>교과목명</th>
										<th>시간</th>
										<th>이수구분</th>
										<th>학기</th>
									</tr>
								</thead>

								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


<script>
// 시큐리티용 토큰
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}';
 
window.onload = function() {

	getLoadList();
	
}

function getLoadList() {
	
	$.ajax({
		type : "GET",
		url : "/lad/getMyOpenLecList",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result){
			console.log("리스트 결과 받아오기~~ ",result);
			tableTemplate(result);
			
		},
		error : function(){
			console.log("Error");
		}
	})	// ajax 끝

}

const tableTemplate = resultList => {
	
	let table = $("#myOpenLecListTable").DataTable();
	let cnt = 1;
	
	console.log("왜 안찍혀 ",resultList[0].LEC_CODE);

	
	for(let i = 0; i < resultList.length; i++){
		if(resultList.length == 0){
			table.row.add([
				"<td colspan='6'>등록된 강좌가 없습니다.</td>"
			]).draw(false);
		}else{
			table.row.add([
				
				`<td>\${cnt}</td>`,
				`<td>\${resultList[i].LEC_CODE}</td>`,
				`<td>\${resultList[i].DEP_NAME}</td>`,
				`<td>\${resultList[i].LOL_NAME}</td>`,
				`<td>\${resultList[i].LOL_DAY1}&nbsp;(\${resultList[i].LOL_STARTIME1}~\${resultList[i].LOL_ENDTIME1})</td>`,
				`<td>\${resultList[i].MAJOR_CULTURAL}/\${resultList[i].CHOICE_REQUIRE}</td>`,				
				`<td>\${resultList[i].LOL_YEAR}/\${resultList[i].LOL_SEMESTER}</td>`		
			]).draw(false);
			cnt++;
		} 
	}
	
}

</script>