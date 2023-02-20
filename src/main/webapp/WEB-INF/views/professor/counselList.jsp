<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%
	int cnt1 = 0;
	int cnt2 = 0;
%>
<head>
<style type="text/css">

.sjCounselListTb{
	height: 550px;
	overflow: auto;
}
.sjFixedHeader {
	position: sticky;
	top: 0;
}
</style>
</head>
<div id="isj">

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>상담일정관리</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/professor/counselList">상담일정관리</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>


	<div class="row">
		<div class="col-lg-6">
			<div class="card" style="height: 750px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;">
				<div class="card-body">
				<h5 class="font-weight-bold mb-4">상담 신청내역</h5>
					<div class="table-responsive sjCounselListTb">
						<table class="table table-hover">
							<thead class="sjFixedHeader text-center custom-theader"  style="background-color:#EBEBEB;">
								<tr>
									<th>No</th>
									<th>학번</th>
									<th>이름</th>
									<th>상담날짜</th>
									<th>상담시간</th>
									<th>상담유형</th>
									<th>처리구분</th>
								</tr>
							</thead>
							<tbody class="text-center">
							<c:if test="${empty professorCounselList}">
								<tr>
									<td colspan="7">상담신청 내역이 존재하지 않습니다</td>
								</tr>
							</c:if>
								<c:if test="${not empty professorCounselList}">
									<c:set value="${studentNameList}" var="studentName"></c:set>
									<c:forEach items="${professorCounselList}" var="professorCounsel" varStatus="sts">
											<c:if test="${professorCounsel.cnsla_state == 0}">
											<tr>
												<td><%=++cnt1%></td>
												<td>
													${professorCounsel.smem_no}
												</td>
												<td>
													${studentName[sts.index].mem_name}
												</td>
												<td title="${professorCounsel.cnsl_date}">${professorCounsel.cnsl_date}</td>
												<td title="${professorCounsel.cnsla_time}">${professorCounsel.cnsla_time}</td>
												<c:if test="${professorCounsel.cnsla_type == 0}">
													<td>대면</td>
												</c:if>
												<c:if test="${professorCounsel.cnsla_type == 1}">
													<td>비대면</td>
												</c:if>
												<c:if test="${professorCounsel.cnsla_state == 0}">
													<td class="d-flex pl-5"><input type="hidden" id="cnsla_code"
														name="cnsla_code" value="${professorCounsel.cnsla_code}">
														
														<button class="btn mb-1 btn-outline-success btn-sm"
														onclick="proc2(this)">승인</button>
														
														<button class="btn mb-1 ml-2 btn-outline-danger btn-sm"
														data-toggle="modal"
														data-target="#basicModal${professorCounsel.cnsla_code}">반려</button>
														<!-- Modal -->
														<div class="modal fade"
															id="basicModal${professorCounsel.cnsla_code}"
															style="display: none;" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<form class="form-valide" id="frm${sts.index}">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" style="font-weight: bold;">반려사유</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<div class="card-body">
																				<div class="form-validation">
																					<input type="hidden" id="cnsla_code"
																						name="cnsla_code"
																						value="${professorCounsel.cnsla_code}">
																					<div class="form-group row">
																						<label class="col-lg-4 col-form-label"
																							for="val-password">내용 <span
																							class="text-danger">*</span>
																						</label>
																						<div class="col-lg-6">
																							<input rows="7" cols="20" class="form-control input-default"
																								placeholder="반려사유를 입력해주세요" name="returnContent" id="returnContent"></input>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn mb-1 btn-primary custom-btn-p"
																				onclick="proc(this)" data-dismiss="modal">확인</button>
																			<button type="button" onclick="autoValue()" class="btn mb-1 btn-outline-dark"
																				>자동완성</button>
																			<button type="button" class="btn mb-1 btn-outline-dark" onclick="deleteValue()"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</form>
															</div>
														</div></td>
												</c:if>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="card" style="height: 750px; overflow: scroll; overflow-x:hidden;overflow-y:hidden;">
				<div class="card-body">
					<h5 class="font-weight-bold mb-4">승인 완료된 상담 신청내역</h5>
					<div class="table-responsive sjCounselListTb">
						<table class="table table-hover">
							<thead class="sjFixedHeader text-center custom-theader"  style="background-color:#EBEBEB;">
								<tr>
									<th>No</th>
									<th>학번</th>
									<th>이름</th>
									<th>상담날짜</th>
									<th>상담시간</th>
									<th>상담유형</th>
									<th></th>
								</tr>
							</thead>
							<tbody class="text-center">
								<c:if test="${not empty professorCounselList}">
									<c:set value="${studentNameList}" var="studentName" />
									<c:forEach items="${professorCounselList}"
										var="professorCounsel" varStatus="sts">
										<c:if test="${professorCounsel.cnsla_state == 1}">
											<tr>
												<td><%=++cnt2%></td>
												<td>${professorCounsel.smem_no}</td>
												<td>${studentName[sts.index].mem_name}</td>
												<td title="${professorCounsel.cnsl_date}">${professorCounsel.cnsl_date}</td>
												<td title="${professorCounsel.cnsla_time}">${professorCounsel.cnsla_time}</td>
												<c:if test="${professorCounsel.cnsla_type == 0}">
													<td>대면</td>
												</c:if>
												<c:if test="${professorCounsel.cnsla_type == 1}">
													<td>비대면</td>
												</c:if>
												<c:if test="${professorCounsel.cnsla_state == 1}">
													<td><input type="hidden" id="cnsla_code"
														name="cnsla_code" value="${professorCounsel.cnsla_code}">
														<span class="label label-pill label-dark custom-btn-p"
														data-toggle="modal"
														data-target="#basicModal${professorCounsel.cnsla_code}" style="cursor: pointer;">신청상세</span>
														<!-- Modal -->
														<div class="modal fade"
															id="basicModal${professorCounsel.cnsla_code}"
															style="display: none;" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<form class="form-valide" id="frm${sts.index}">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" style="font-weight: bold;">상담신청상세</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<div class="card-body">
																				<div class="form-validation">
																					<div class="form-group row">
																						<label class="col-lg-4 col-form-label"
																							for="cnsla_type">유형 <span
																							class="text-danger">*</span>
																						</label>
																						<div class="col-lg-6">
																							<c:if test="${professorCounsel.cnsla_type == 0}">
																								<input type="text" class="form-control input-default"
																									value="대면" disabled="disabled">
																							</c:if>
																							<c:if test="${professorCounsel.cnsla_type == 1}">
																								<input type="text" class="form-control input-default"
																									value="비대면" disabled="disabled">
																							</c:if>
																						</div>
																					</div>
																					<div class="form-group row">
																						<label class="col-lg-4 col-form-label"
																							for="cnsla_sub">상담주제 <span
																							class="text-danger">*</span>
																						</label>
																						<div class="col-lg-6">
																							<input type="text" class="form-control input-default"
																								disabled="disabled"
																								value="${professorCounsel.cnsla_sub}">
																						</div>
																					</div>
																					<div class="form-group row">
																						<label class="col-lg-4 col-form-label"
																							for="val-password">상담내용 <span
																							class="text-danger">*</span>
																						</label>
																						<div class="col-lg-6">
																							<textarea rows="4" cols="10" class="form-control input-default"
																								disabled="disabled">
																						${professorCounsel.cnsla_content}
																					</textarea>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<c:if test="${professorCounsel.cnsla_type == 1}">
																				<button type="button" class="btn mb-1 btn-primary custom-btn-s"
																					onclick="zoomOn(${professorCounsel.smem_no})" data-dismiss="modal">화상회의 열기</button>
																			</c:if>
																			<button type="button" class="btn mb-1 btn-outline-dark"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</form>
															</div>
														</div></td>
												</c:if>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>

<script type="text/javascript">

function deleteValue(){
	document.querySelector("#returnContent").value = "";
}

function autoValue(){
	document.querySelector("#returnContent").value = "급한 일정이 생겨서 반려합니다";
}

console.log("zoomOn")
	function zoomOn(userId){
	
// 		alert("학번 : " + userId);
		let smem_no = userId;
		
		//여기서
		let json = {
				state : '1',
				"studentId" : smem_no,
				msg : "https://us05web.zoom.us/j/7648277127?pwd=VS9oL2RXN3ZwZHVkU1pIV0NGTm8xZz09",
				purpose :"1"
		}
		sendMessage(JSON.stringify(json));
	
	
		window.open("/zoom/openZoom","","scrollbars=no,menubar=no,top=300px,left=400,width=500,height=400");	
		
		
		
// 		location.href = "/zoom/openZoom";
	
	}


	function proc(btn) {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');

		let cnsla_code = $(btn).parent().parent().find("#cnsla_code").val();
		let returnContent = $(btn).parent().parent().find("#returnContent")
				.val();

		console.log(returnContent)
		console.log(cnsla_code);
		
		$.ajax({
			url : "/professor/counsel/return",
			type : "post",
			data : {
				"cnsla_code" : cnsla_code,
				"cnsla_reject" : returnContent
			},
			success : function(res) {
				if (res == "OK") {
					console.log("전송 성공");
// 					alert("반려되었습니다");
					
					swal("반려되었습니다")
                             .then((value)=>{
					
                            	 location.href = "/professor/counselList";
                           
                             })
					
				}
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			dataType : "text"

		})
		
	}
	function proc2(btn) {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');

		let cnsla_code = $(btn).parent().find("#cnsla_code").val();

		console.log(cnsla_code);
		
		
		  swal("승인하시겠습니까?",{
	            buttons:{
	               select:"확인",
	               cancel:"취소"
	            }
	         }).then((value)=>{
	            console.log(value)
	            
	            switch(value){
	            case "select":
	            	$.ajax({
	    				url : "/professor/counsel/validation",
	    				type : "post",
	    				data : {
	    					"cnsla_code" : cnsla_code
	    				},
	    				success : function(res) {
	    					if (res == "OK") {
	    						console.log("전송 성공");
// 	    						alert("승인되었습니다");
	    						
	    						swal({
	    							  title: "승인되었습니다",   //큰 글씨
	    							  icon: "success",   //info, success등 종류
	    							});
	    						
	    						$("#isj").load("/professor/counselList #isj");
	    						// 				location.href = "/professor/counselList"
	    					}
	    				},
	    				beforeSend : function(xhr) {
	    					xhr.setRequestHeader(header, token);
	    				},
	    				dataType : "text"

	    			})
	               break;
	            default:
	               break;
	            }
	         })
		
		
// 		if(confirm("승인하시겠습니까?")){
			
// 		}
		
	}
</script>
</body>
</html>