<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;상담 신청내역<br />
		</h4>
	</div>
	<div class="col-lg-6">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a
						href="/student/counselList.do">상담 신청내역</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div id="page">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="form-group row custom-right-array">
						<div class="col-2">
							<span><input type="text" class="form-control input-default" id="searchProfessorName"
								placeholder="교수 이름 검색"></span>
						</div>
						<div class="col-2">
							<select id="searchState" class="form-control input-default">
								<option value="" selected="selected">===상태 선택===</option>
								<option value="0">대기</option>
								<option value="1">승인</option>
								<option value="2">반려</option>
								<option value="3">완료</option>
							</select>
						</div>
						<div class="col-2 custom-right-array">
							<select id="searchType" class="form-control input-default">
								<option value="" selected="selected">===대면/비대면 선택===</option>
								<option value="0">대면</option>
								<option value="1">비대면</option>
							</select>
							<i class="fa-solid fa-magnifying-glass fa-2x custom-s" onclick="search()" style="padding-top: 10px; padding-left: 10px;"></i>
						</div>
					</div>
					<div class="table-responsive custom-table1">
						<table class="table table-hover">
							<thead class="custom-theader-s">
								<tr style="text-align: center;">
									<th style="width: 50px;">No</th>
									<th>상담 교수</th>
									<th>상담 주제</th>
									<th>상담 신청일</th>
									<th>상담일</th>
									<th>상담 시간</th>
									<th>삼당 신청 상태</th>
									<th>상담 유형</th>
									<th>상담 내용</th>
									<th>반려 사유</th>
								</tr>
							</thead>
							<tbody style="height: 600px;">
								<c:if test="${empty counselApplyList}">
									<tr style="text-align: center;">
										<td colspan="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상담신청
											내역이 존재하지 않습니다</td>
									</tr>
								</c:if>
								<c:set value="${proffsorNameList}" var="proffsorName"></c:set>
								<c:if test="${not empty counselApplyList}">
									<c:forEach items="${counselApplyList}" var="counselApply"
										varStatus="sts">

										<tr style="text-align: center;">
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 50px;">${sts.index + 1}</td>
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${proffsorName[sts.index].mem_name}</td>
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
												title="${counselApply.cnsla_sub}">${counselApply.cnsla_sub}</td>
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${counselApply.cnsla_date}</td>
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${counselApply.cnsl_date}</td>
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${counselApply.cnsla_time}</td>
											<c:choose>
												<c:when test="${counselApply.cnsla_state == 1}">
													<td><span
														class="badge badge-success">승인</span></td>
												</c:when>
												<c:when test="${counselApply.cnsla_state == 2}">
													<td><span
														class="badge badge-danger">반려</span></td>
												</c:when>
												<c:when test="${counselApply.cnsla_state == 3}">
													<td><span
														class="badge badge-success">완료</span></td>
												</c:when>
												<c:otherwise>
													<td><span
														class="badge badge-dark">대기</span></td>
												</c:otherwise>
											</c:choose>
											<c:if test="${counselApply.cnsla_type == 0}">
												<td>대면</td>
											</c:if>
											<c:if test="${counselApply.cnsla_type == 1}">
												<td>비대면</td>
											</c:if>
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
												title="${counselApply.cnsla_content}">${counselApply.cnsla_content}</td>
											<c:if test="${counselApply.cnsla_reject == null}">
												<td>
													<form class="form-valide" id="frm${sts.index}">
														<input type="hidden" id="cnsla_code" name="cnsla_code"
															value="${counselApply.cnsla_code}">
														<c:if test="${counselApply.cnsla_state == 0}">
																	<span class="btn mb-1 btn-outline-danger btn-sm"
																onclick="proc(this)">상담취소</span>
														</c:if>
													</form>
												</td>
											</c:if>
											<c:if test="${counselApply.cnsla_reject != null}">
												<td
													style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
													title="${counselApply.cnsla_reject}">${counselApply.cnsla_reject}</td>
											</c:if>
										</tr>
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
function proc(btn){ 
	
	   swal({
		   title: "신청 취소",
		   text: "정말 상담 신청을 취소하시겠습니까?\n신청 취소시 되돌릴 수 없습니다.",
		   icon: "warning",
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
         console.log(value)
         
         switch(value){
         case "select":
        	 var header = $("meta[name='_csrf_header']").attr('content');
     		var token = $("meta[name='_csrf']").attr('content');
     		
     		let cnsla_code = $(btn).parent().find("#cnsla_code").val();
     		
     		console.log(cnsla_code);

     		$.ajax({
     			url : "/student/counsel/return",
     			type : "post",
     			data : {"cnsla_code" : cnsla_code},
     			success : function(res){
     				if(res == "OK"){
     					console.log("전송 성공");
						swal({
							   title: "신청 취소 완료",
							   text: "상담 취소에 성공하였습니다.",
							   icon: "success"
					     }).then((value) => { 
								location.href =  "/student/counselList.do"
					     });
     				}
     			},
     			beforeSend : function(xhr){
     		    	    xhr.setRequestHeader(header, token);
     		    },
     			dataType : "text"
     			
     		})
            break;
         default:
            break;
         }
      })
	
// 	if(confirm("취소하시겠습니까?")){
// 		var header = $("meta[name='_csrf_header']").attr('content');
// 		var token = $("meta[name='_csrf']").attr('content');
		
// 		let cnsla_code = $(btn).parent().find("#cnsla_code").val();
		
// 		console.log(cnsla_code);

// 		$.ajax({
// 			url : "/student/counsel/return",
// 			type : "post",
// 			data : {"cnsla_code" : cnsla_code},
// 			success : function(res){
// 				if(res == "OK"){
// 					console.log("전송 성공");
// 					swal({
// 						  title: "상담이 취소되었습니다",   //큰 글씨
// 						  icon: "success",   //info, success등 종류
// 						});
// // 					alert("상담이 취소되었습니다");
// 					location.href = "/student/counselList.do"
// 				}
// 			},
// 			beforeSend : function(xhr){
// 		    	    xhr.setRequestHeader(header, token);
// 		    },
// 			dataType : "text"
			
// 		})
		
// 	}
	
	
}

function search(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let searchProfessorName = $("#searchProfessorName").val();
	let searchState = $("#searchState").val();
	let searchType = $("#searchType").val();
	
	console.log(searchProfessorName);
	console.log(searchState);
	console.log(searchType);
	
	$.ajax({
		url : "/student/counselApplyListSearch",
    	type : "post",
    	data : {"searchProfessorName" : searchProfessorName, "searchState" : searchState,
    			"searchType" : searchType
    		},
    	success : function(result){
    		console.log(result);
    		loadPage(result);
        },
        beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
        },
        dataType : "json"
	})
}

function loadPage(result){
	let page = $("#page").empty();
	let str = ``;
		str = `
			<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="form-group row custom-right-array">
							<div class="col-2">
								<span><input type="text"
									class="form-control input-default "
									style="border: 1px solid gray;" id="searchProfessorName"
									placeholder="교수 이름 검색"></span>
							</div>
							<div class="col-2">
								<select id="searchState" class="form-control input-default ">
									<option value="" selected="selected">===상태 선택===</option>
									<option value="0">대기</option>
									<option value="1">승인</option>
									<option value="2">반려</option>
									<option value="3">완료</option>
								</select>
							</div>
							<div class="col-2 custom-right-array">
								<select id="searchType" class="form-control input-default ">
									<option value="" selected="selected">===대면/비대면 선택===</option>
									<option value="0">대면</option>
									<option value="1">비대면</option>
								</select>
								<i class="fa-solid fa-magnifying-glass fa-2x custom-s" onclick="search()" style="padding-top: 10px; padding-left: 10px;"></i>
							</div>
						</div>
						<div class="table-responsive custom-table1">
						<table class="table table-hover">
							<thead class="custom-theader-s">
								<tr style="text-align: center;">
									<th style="width: 50px;">No</th>
									<th>상담 교수</th>
									<th>상담 주제</th>
									<th>상담 신청일</th>
									<th>상담일</th>
									<th>상담 시간</th>
									<th>삼당 신청 상태</th>
									<th>상담 유형</th>
									<th>상담 내용</th>
									<th>반려 사유</th>
								</tr>
							</thead>
							<tbody style="height: 600px;">`;
									if(result.length <= 0){
										str += `<tr style="text-align:center;">
													<td colspan="10">검색 결과가 존재하지 않습니다</td>
												</tr>`;
									}
									
									for(let i=0;i<result.length;i++){
										str += `<tr style="text-align: center;">
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; width: 50px;">\${i + 1}</td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">\${result[i].mem_name}</td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${result[i].cnsla_sub}">\${result[i].cnsla_sub}</td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">\${result[i].cnsla_date}</td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">\${result[i].cnsl_date}</td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">\${result[i].cnsla_time}</td>
											`;

											if(result[i].cnsla_state == 1){
												str += `<td><span class="badge badge-success">승인</span></td>`;
											}else if(result[i].cnsla_state == 2){
												str += `<td><span class="badge badge-danger">반려</span></td>`;
											}else if(result[i].cnsla_state == 3){
												str += `<td><span class="badge badge-success">완료</span></td>`;
											}else {
												str += `<td><span class="badge badge-dark">대기</span></td>`;
											}

											if(result[i].cnsla_type == 0){
												str += `<td>대면</td>`;
											}else{
												str += `<td>비대면</td>`;
											}
											
											str += `<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${result[i].cnsla_content}">\${result[i].cnsla_content}</td>`;

											if(result[i].cnsla_reject == null){
												str += `<td>
															<form class="form-valide" id="frm\${i+ 1}">
																<input type="hidden" id="cnsla_code" name="cnsla_code" value="\${result[i].cnsla_code}">`;

																if(result[i].cnsla_state == 0){
																	str += `<span class="btn mb-1 btn-outline-danger btn-sm" onclick="proc(this)">상담취소</span>`;
																}
																		
												str += `	</form>
														</td>`;	
											}

											if(result[i].cnsla_reject != null){
												str += `<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${result[i].cnsla_reject}">\${result[i].cnsla_reject}</td>`;
											}
												
										str += `</tr>`;
									}

										
						str +=`</tbody>
						</table>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>`;
	$(page).html(str);
}
</script>
