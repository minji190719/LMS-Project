<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
#myTuiListTable td{
	text-align: center;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;등록금 납부 / 납부내역 조회<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/tuition">등록금 납부 / 납부내역 조회</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title" style="display: flex; justify-content: space-between;">
					<c:forEach items="${enrollFeeList }" var="enrollFeeVO">
						<c:choose>						
							<c:when test="${(enrollFeeVO.enrl_year eq year) and (enrollFeeVO.enrl_semester eq semester) and (empty enrollFeeVO.enrl_date)}">
								<div class="card-title">					
									<h5 class="custom-bold">${year }년도 ${semester }학기 등록금 납부</h5>
									<code>* 장학금을 신청한 경우, 장학금 결과가 반영되었는지 고지서를 출력하셔서 확인하십시오.</code>
								</div>
								<div style="text-align: right;"> 
									<form id="payEnrollFeeForm">
												<input type="hidden" name="enrl_code" value="${enrollFeeVO.enrl_code }" />
												<input type="submit" class="btn btn-primary custom-btn-s" value="등록금 납부하기"/>
									</form>
								</div>
							</c:when>
							<c:when test="${(enrollFeeVO.enrl_year eq year) and (enrollFeeVO.enrl_semester eq semester) and (not empty enrollFeeVO.enrl_date)}">
								<div class="card-title">					
									<h5 class="custom-bold">${year }년도 ${semester }학기 등록금 납부</h5>
									<code>* 등록금 수납이 완료되었습니다(납부일 ${enrollFeeVO.enrl_date})</code>
								</div>							
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
				<div class="table-responsive .custom-table1">
					<table class="table table-hover" id="studentInfo">
						<tr>
							<th class="custom-theader-s">학번</th>
							<td>${studentInfo.SMEM_NO}</td>
							<th class="custom-theader-s">성명</th>
							<td>${studentInfo.MEM_NAME}</td>
							<th class="custom-theader-s">학년</th>
							<td>${studentInfo.STU_SCHYEAR}</td>
						</tr>
						<tr>
							<th class="custom-theader-s">대학</th>
							<td>${studentInfo.COL_NAME}</td>
							<th class="custom-theader-s">학부</th>
							<td>${studentInfo.STU_DEP}</td>
							<th class="custom-theader-s">학적상태</th>
							<td>${studentInfo.STU_RECORD}</td>
						</tr>
						<tr>
							<th class="custom-theader-s">년도</th>
							<td>${year }</td>
							<th class="custom-theader-s">학기</th>
							<td>${semester }</td>
							<th class="custom-theader-s">고지서구분</th>
							<td>등록금 고지서</td>
						</tr>
						<c:if test="${empty enrollFeeList}">
							<tr>
								<td colspan="7" style="text-align: center;">재학 승인된 학생만 등록금 납부가 가능합니다. 납부할 내용이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${enrollFeeList }" var="enrollFeeVO">
							<c:if test="${(enrollFeeVO.enrl_year eq year) and (enrollFeeVO.enrl_semester eq semester)}">							
								<tr>
									<th rowspan="3" class="custom-theader-s">등록금</th>
									<th class="custom-theader-s">① 입학금</th>
									<td colspan="4"><fmt:formatNumber value="${enrollFeeVO.enrl_admiss }" type="currency"/></td>
								</tr>
								<tr>
									<th class="custom-theader-s">② 수업료</th>
									<td colspan="4"><fmt:formatNumber value="${enrollFeeVO.enrl_fee }" type="currency"/></td>
								</tr>
								<tr>
									<th class="custom-theader-s">③ 장학금</th>
									<td colspan="4"><fmt:formatNumber value="${enrollFeeVO.scholarship }" type="currency"/></td>
								</tr>
								<tr>
									<th class="custom-theader-s">실납부 금액</th>
									<th class="custom-theader-s">① + ② - ③</th>
									<td colspan="4" class="text-danger"><fmt:formatNumber value="${enrollFeeVO.enrl_total }" type="currency"/></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row" >
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-bold">등록금 납부내역 조회</h5>							
				</div>
				<div class="table-responsive">
					<table class="table table-hover" id="myTuiListTable">
						<thead class="custom-theader-s">
							<tr>
								<td colspan="4">등록금 내역</td>
								<td rowspan="2">장학금 내역</td>
								<td rowspan="2">실 납부 금액</td>
								<td rowspan="2">납부일자</td>
							</tr>
							<tr>
								<td>년도</td>
								<td>학기</td>
								<td>입학금</td>
								<td>수업료</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty enrollFeeList}">
								<tr>
									<td colspan="7">조회할 등록금 내역이 없습니다.</td>
								</tr>
							</c:if>	
							<c:forEach items="${enrollFeeList }" var="enrollFeeVO">
									<tr>
										<td>${enrollFeeVO.enrl_year }</td>
										<td>${enrollFeeVO.enrl_semester }</td>
										<td><fmt:formatNumber value="${enrollFeeVO.enrl_admiss }" type="currency"/></td>
										<td><fmt:formatNumber value="${enrollFeeVO.enrl_fee }" type="currency"/></td>
										<td><fmt:formatNumber value="${enrollFeeVO.scholarship }" type="currency"/></td>
										<td><fmt:formatNumber value="${enrollFeeVO.enrl_total }" type="currency"/></td>
										<c:choose>
											<c:when test="${empty enrollFeeVO.enrl_date}">
												<td>
													<span class="badge badge-warning">납부 대기</span>
												</td>
											</c:when>
											<c:otherwise>
												<td>${enrollFeeVO.enrl_date }</td>
											</c:otherwise>
										</c:choose>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//아작스 통신을 위한 csrf 인증 토큰
	let header = '${_csrf.headerName}';
	let token = '${_csrf.token}';

	let payEnrollFeeForm = document.querySelector("#payEnrollFeeForm");

	payEnrollFeeForm.addEventListener("submit", function(){
		event.preventDefault();
		
		let enrl_code = payEnrollFeeForm.children[0].value;
		let url = "/tuition/pay/" + enrl_code;

		let xhr = new XMLHttpRequest();
		xhr.open("get", url, true);
		xhr.setRequestHeader(header, token);
		xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let cnt = xhr.responseText;
				if(cnt > 0){
	   				swal({
	 					  title: "납부 성공", 
	 					  text : "등록금 납부가 완료되었습니다",
	 					  icon: "success" 
	 					}).then((value) => { 	
							location.href = location.href;
	 					})
				}else{
	   				swal({
	 					  title: "납부 실패", 
	 					  text : "등록금 납부에 실패했습니다. 추후에 다시 시도해주십시오",
	 					  icon: "error" 
	 					})
				}
			}
		}
		xhr.send();
	});
</script>