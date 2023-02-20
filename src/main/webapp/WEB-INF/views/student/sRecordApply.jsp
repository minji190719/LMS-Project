<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.recordApply i{
	color : var(--custom-s);
}

</style>

<div class="row justify-content-center">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;휴/복학 신청<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/recordapply/applylist">휴/복학 신청</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row justify-content-center recordApply">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-s custom-bold">나의 정보</h5>
				</div>
				<div class="form-validation">
					<div class="form-group row" >
					<c:set value="${Myinfo }" var="asd"></c:set>
					<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학번</span>
							<input type="text" class="form-control input-default" id="SMEM_NO"
								name="SMEM_NO" placeholder="${Myinfo.SMEM_NO }" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;성명</span>
							<input type="text" class="form-control input-default" 
							 placeholder="${Myinfo.MEM_NAME }" disabled>
							</label>
							<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;입학 정보</span>
							<input type="text" class="form-control input-default" id="STU_SCHYEAR"
								name="STU_SCHYEAR" placeholder="${Myinfo.STU_JOINYEAR }" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;연락처</span>
							<input type="text" class="form-control input-default" id="STU_SCHYEAR"
								name="STU_SCHYEAR" placeholder="${Myinfo.MEM_TEL }" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;소속</span>
							<input type="text" class="form-control input-default" id="STU_SCHYEAR"
								name="STU_SCHYEAR" placeholder="${Myinfo.STU_DEP}" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학년</span>
							<input type="text" class="form-control input-default" id="STU_SCHYEAR"
								name="STU_SCHYEAR" placeholder="${Myinfo.STU_SCHYEAR}" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;변동</span>
							<input type="text" class="form-control input-default" id="STU_SCHYEAR"
								name="STU_SCHYEAR" placeholder="${Myinfo.STU_RECORD}" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;생년월일</span>
							<input type="text"class="form-control input-default" id="STU_SCHYEAR"
								name="STU_SCHYEAR" placeholder="${Myinfo.MEM_REG1}" disabled>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row justify-content-center recordApply">
	<div class="col-lg-8">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-s custom-bold">학적변동 신청 내역</h5>
				</div>
				<div class="table-responsive custom-table1" id ="disp">
					<table class="table table-hover">
						<thead class="custom-theader-s">
							<tr>
								<th>No.</th>
								<th>신청구분</th>
								<th>시작년도/학기</th>
								<th>종료년도/학기</th>
								<th>신청일자</th>
								<th>승인구분</th>
								<th>반려사유</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody style="height: 428px;">
							<c:set value="${recordapplynolist }" var="applyList"></c:set>
							<c:choose>
								<c:when test="${empty applyList }">
									<tr>
										<td colspan="8">신청내역이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${applyList }" var="list" varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td>${list.rcrda_reason }</td>
											<td>${list.rcrda_startyear }/${list.rcrda_startsemester }학기</td>
											<td>${list.rcrda_endyear }/${list.rcrda_endsemester }학기</td>
											<td><fmt:formatDate value="${list.rcrda_date}" pattern="yyyy/MM/dd" /></td>
											<c:choose>
												<c:when test="${list.rcrda_state == 0 }">
													<td><span class="badge badge-dark">대기</span></td>
												</c:when>
												<c:when test="${list.rcrda_state == 1 }">
													<td><span class="badge badge-success">승인</span></td>
												</c:when>
												<c:when test="${list.rcrda_state == 2 }">
													<td><span class="badge badge-danger">반려</span></td>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${list.rcrda_state == 0 }">
													<td></td>
												</c:when>
												<c:when test="${list.rcrda_state == 1 }">
													<td></td>
												</c:when>
												<c:when test="${list.rcrda_state == 2 }">
													<td>${list.rcrda_reject }</td>
												</c:when>
											</c:choose>
											<c:choose>											
												<c:when test="${list.rcrda_state == 0}">
													<td><input type="hidden" value="${list.rcrda_code}"
														id="rcrda_code">
														<button type="button" class="btn mb-1 btn-outline-danger"
															id="apply_delete" name="apply_delete" style="left: 10px;"
															onclick="applydelete(this)">삭제</button>
													</td>
												</c:when>
												<c:otherwise>
													<td></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-s">학적변동 신청</h5>
				</div>
				<div class="table-responsive">
					<form class="form-validation" id = "recordApplyForm" action="SrecordApply" method="post" >
						<table class="table table-hover">
							<tbody style="overflow-y : hidden;">
								<tr>
									<td>학적 구분</td>
									<td><select class="form-control" name="rcrda_record">
										<option value ="1">휴학</option>
										<option value="2">복학</option>
										<option value="3">자퇴</option>
									</select>
								</tr>
								<tr>
									<td>학적변동사유</td>
									<td><select class="form-control" name="rcrda_reason">
											<option value = "군휴학">군휴학</option>
											<option value = "가사휴학">가사휴학</option>
											<option value = "취업">취업</option>
											<option value = "일반복학">일반복학</option>
											<option value = "군복학">군복학</option>
											<option value = "자퇴">자퇴</option>
									</select></td>
								</tr>
								<tr>
									<td>신청년도</td>
									<td><input type="text" class="form-control input-flat"
										name="rcrda_startyear" id = "rcrda_startyear" placeholder="예:2023) 자퇴의 경우 공백"></td>

								</tr>
								<tr>
									<td>학기</td>
									<td><select class="form-control" name="rcrda_startsemester">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="자퇴">자퇴</option>
									</select></td>
								</tr>
								<tr>
									<td>종료년도</td>
									<td><input type="text" class="form-control input-flat" id = "rcrda_endyear" name="rcrda_endyear" placeholder="예:2024) 자퇴의경우 공백"></td>

								</tr>
								<tr>
									<td>학기</td>
									<td><select class="form-control" name="rcrda_endsemester">
											<option value = "1">1</option>
											<option value="2">2</option>
											<option value="자퇴">자퇴</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn mb-1 btn-primary custom-btn-s" style = "margin-top:10px; float:right;" onclick = "apply()">등록</button>
						<button type="button" class="btn mb-1 btn-outline-dark" style = "margin-top:10px; float:right;" onclick = "autoValue()">자동완성</button>
						<sec:csrfInput/>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

// 휴학 신청 자동 값 채우기 
function autoValue(){
	let frm =  document.querySelector("#recordApplyForm");
	frm.rcrda_record.value = "2";
	frm.rcrda_reason.value = "일반복학";
	frm.rcrda_startyear.value = "2023";
	frm.rcrda_startsemester.value = "1";
	frm.rcrda_endyear.value = "2023";
	frm.rcrda_endsemester.value = "1";
}

function apply(){
	var recordApplyForm = document.getElementById("recordApplyForm");
	swal({
		  text: "신청이 정상적으로 완료되었습니다.",
		  icon: "success",
		  button: "확인",
		})
		.then((value) =>{
		recordApplyForm.submit();
			
		});
	
}
function applydelete(aa){

	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	var rcrda_code = aa.parentNode.children[0].value;
	var deleteTag = aa.parentNode.parentNode;
	
 	 swal({
	   title: "신청 취소",
	   text: "정말 휴/복학 신청을 취소하시겠습니까?\n신청 취소시 되돌릴 수 없습니다.",
	   icon: "warning",
	         buttons:{
	            select:"확인",
	            cancel:"취소"
	         }
      }).then((value)=>{
        	
        switch(value){
        case "select":
        	$.ajax({
        		url : "/recordapply/ApplyDelete",
        		type : "post",	
             beforeSend : function(xhr){
                 xhr.setRequestHeader(header, token);
              },
        		data : {"rcrda_code" : rcrda_code},
        		success : function(data){
        			swal({
        				  text: "삭제되었습니다.",
        				  icon: "success",
        				  button: "확인",
        				})
        			deleteTag.remove();
        		},
        		error:function(){
        		}
        	})
           break;
        default:
           break;
        }
     })
	
}

</script>