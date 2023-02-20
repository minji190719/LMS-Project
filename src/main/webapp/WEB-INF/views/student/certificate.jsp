<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;증명서 발급<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/student/certificate">증명서 발급</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div id="isj0">
	<div class="row">
		<div class="col-lg-6">
			<div class="card" style="height: 750px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-s custom-bold">증명서 종류</h5>
					</div>
					<div class="table-responsive">
					
					
						<table class="table table-hover">
							<thead>
								<tr style="text-align: center;">
									<th style="width: 100px;">No</th>
									<th>증명서명</th>
									<th>금액</th>
									<th>발급하기</th>
								</tr>
							</thead>
							<tbody style="overflow-y: hidden;">
								<c:if test="${not empty certificateList}">
									<c:forEach items="${certificateList}" var="certificate"
										varStatus="sts">
										<tr style="text-align: center;">
											<td style="width: 100px;">${sts.index + 1}</td>
											<td>${certificate.crtf_name}</td>
											<td>${certificate.crtf_price}</td>
											<td><input type="hidden" id="crtf_code" name="crtf_code"
												value="${certificate.crtf_code}"> 
												<button class="label label-pill label-dark" style="cursor: pointer;" data-toggle="modal"
												data-target="#basicModal${certificate.crtf_code}">발급</button>
												<div class="modal fade"
													id="basicModal${certificate.crtf_code}"
													style="display: none;" aria-hidden="true">
													<!-- Modal -->
													<div class="modal-dialog" role="document">
														<form class="form-valide" id="frm${sts.index}">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">증명서발급</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div id="replace">
																<div class="modal-body">
																	<div class="card-body">
																		<div class="form-validation">
																			<input type="hidden" id="crtf_code" name="crtf_code"
																				value="${certificate.crtf_code}">
																			<div class="form-group row">
																				<label class="col-lg-4 col-form-label"
																					for="cnsla_type">발급형식 <span
																					class="text-danger">*</span>
																				</label>
																				<div class="col-lg-6">
																					<select class="form-control input-default" id="download_type"
																						name="download_type">
																						<!-- 																						<option value="email">매일</option> -->
																						<option value="pdf">PDF</option>
																						<!-- 																						<option value="kakao">카카오</option> -->
																					</select>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label class="col-lg-4 col-form-label"
																					for="cnsla_type">매수 <span
																					class="text-danger">*</span>
																				</label>
																				<div class="col-lg-6">
																					<input type="hidden" id="crtf_price"
																						name="crtf_price"
																						value="${certificate.crtf_price}"> <select
																						class="form-control input-default" onchange="proc7(this)"
																						id="crtfh_count" name="crtfh_count">
																						<option selected="selected" value="0">선택
																							</option>
																						<option value="1">1</option>
																						<option value="2">2</option>
																						<option value="3">3</option>
																					</select>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label class="col-lg-4 col-form-label"
																					for="cnsla_type">총액 <span
																					class="text-danger">*</span>
																				</label>
																				<div class="col-lg-6">
																					<input type="text" class="form-control input-default"
																						id="crtfh_ttlprice" name="crtfh_ttlprice"
																						readonly="readonly">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label class="col-lg-4 col-form-label"
																					for="cnsla_type">결제방식 <span
																					class="text-danger">*</span>
																				</label>
																				<div class="col-lg-6">
																					<select class="form-control input-default" id="crtfh_payway"
																						name="crtfh_payway">
																						<option value="kakao">카카오</option>
																						<option value="bank">무통장입금</option>
																						<option value="phone">휴대폰결제</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																
																<div class="modal-footer">
																	<input type="hidden" id="crtf_code" name="crtf_code"
																		value="${certificate.crtf_code}"> <input
																		type="hidden" id="stu_record" name="stu_record"
																		value='<c:out value="${memberVO['STU_RECORD']}"></c:out>'>
																	<button type="button" class="btn mb-1 btn-primary custom-btn-s"
																		onclick="payment(this, '${memberVO['MEM_NAME']}', '${memberVO['MEM_TEL']}')">결제하기</button>
																	<button type="button" onclick="valuesReset(this)" class="btn mb-1 btn-outline-dark"
																		data-dismiss="modal">Close</button>
																</div>
																</div>
															</div>
														</form>
													</div>
												</div></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="card" style="height: 750px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-s custom-bold">증명서 발급내역</h5>
					</div>
					<div style="padding-left: 6%; margin-top: 10px; margin-bottom: 3px;" class="alert alert-warning">
						<span style="font-weight: bold;">유의사항</span> <br> <span>
							* 발급 받은 증명서는 발급 날짜로 부터 3일 동안 출력이 가능합니다 </span>
					</div>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr style="text-align: center;">
									<th style="width: 50px;">No</th>
									<th style="">증명서명</th>
									<th style="width: 150px;">발급일자</th>
									<th style="">매수</th>
									<th style="">총액</th>
									<th style="">결제방식</th>
									<th style="">발급형식</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty certificateHisList}">
									<tr style="text-align: center;">
										<td colspan="7">증명서 발급 내역이 존재하지 않습니다</td>
									</tr>
								</c:if>
								<c:if test="${not empty certificateHisList}">
									<c:forEach items="${certificateHisList}" var="certificateHis"
										varStatus="sts">
										<tr
											onclick="openPDF(${certificateHis.crtf_code}, ${certificateHis.crtfh_code})" style="text-align: center; cursor: pointer;">
											<td style=" width: 50px;">${sts.index + 1}</td>
											<c:if test="${certificateHis.crtf_code == 5}">
												<td title="재학증명서">재학증명서</td>
											</c:if>
											<c:if test="${certificateHis.crtf_code == 6}">
												<td title="졸업증명서">졸업증명서</td>
											</c:if>
											<td style="width: 150px;" title="${certificateHis.crtfh_date}">${certificateHis.crtfh_date}</td>
											<td title="${certificateHis.crtfh_count}">${certificateHis.crtfh_count}</td>
											<td title="${certificateHis.crtfh_ttlprice}">${certificateHis.crtfh_ttlprice}</td>
											<c:if test="${certificateHis.crtfh_payway eq 'kakao'}">
												<td>카카오</td>
											</c:if>
											<c:if test="${certificateHis.crtfh_payway eq 'bank'}">
												<td>무통장입금</td>
											</c:if>
											<c:if test="${certificateHis.crtfh_payway eq 'phone'}">
												<td>휴대폰결제</td>
											</c:if>

											<td>${certificateHis.download_type}</td>
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
 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

function valuesReset(btn){
	let frm = $(btn).parent().parent().parent().parent();
	console.log("폼태그 아이디값 : ",$(frm).attr("id"));
// 	console.log("폼 길이 :",frm.length);
	
	for(let i=0;i<frm.length;i++){
		frm[i].reset();
	}
}


function payment(btn1, name, phone){
	const btn = btn1;
	let code = $(btn).parent().find("#crtf_code").val();
	
	let price = $(btn).parent().parent().find("#crtfh_ttlprice").val();
	
	let crtfName; 
		
	let memName = name;
	
	let phoneNum = phone;
	
	console.log("증명서 코드 :", code);
	console.log("증명서 총액 :", price);
	console.log("증명서 결제 회원이름 :", memName);
	console.log("증명서 결제 회원 폰넘버 :", phoneNum);
	
	if(code == "5"){
		crtfName = "재학증명서";
	}else{
		crtfName = "졸업증명서";
	}
	
	 var IMP = window.IMP; 
     IMP.init("imp81322142");
        
         IMP.request_pay({
             pg : 'html5_inicis.INIpayTest',
             pay_method : 'kakao',
             merchant_uid: "00000000-0000020", 
             name : crtfName,
//              amount : price,
             amount : 100,
             buyer_email : 'Iamport@chai.finance',
             buyer_name : memName,
             buyer_tel : phoneNum
         }, function (rsp) { // callback
             if (rsp.success) {
                 console.log("결제 정보 : ",rsp);
                 paymentState = true;
                 replaceHTML(btn, rsp);
//                  alert("결제가 완료 되었습니다");
                 swal({
                	  title: "결제가 완료 되었습니다",   //큰 글씨
                	  icon: "success",   //info, success등 종류
                	});
             } else {
                 console.log(rsp);
             }
         });
     
}

function replaceHTML(btn, rsp){
	let replace = $(btn).parent().parent().parent().find("#replace");
	
	let crtf_code = $(replace).find("#crtf_code").val();
	let stu_record = $(replace).find("#stu_record").val();
	let crtfh_count = $(replace).find("#crtfh_count").val();
	let crtf_price = $(replace).find("#crtf_price").val();
	let crtfh_payway = $(replace).find("#crtfh_payway").val();
	let download_type = $(replace).find("#download_type").val();
	
	console.log("증명서 코드 : ",crtf_code);
	console.log("증명서 이름 : ",stu_record);
	console.log("즘명서 매수 :",crtfh_count);
	console.log("증명서 총 가격 : ",crtf_price);
	console.log("증명서 결제 방식 : ",crtfh_payway);
	console.log("증명서 다운로드 타입 : ",download_type);
	
	let newHTML = ``;
	
	$(replace).empty();
	
	newHTML +=
		`<div class="modal-body">
		<div class="card-body">
		<div class="form-validation">
		<div class="form-group row">
			<input type="hidden" id="crtf_code" name="crtf_code" value="\${crtf_code}"></input>
			<input type="hidden" id="stu_record" name="stu_record" value="\${stu_record}"></input>
			<input type="hidden" id="crtfh_count" name="crtfh_count" value="\${crtfh_count}"></input>
			<input type="hidden" id="crtf_price" name="crtf_price" value="\${crtf_price}"></input>
			<input type="hidden" id="crtfh_payway" name="crtfh_payway" value="\${crtfh_payway}"></input>
			<input type="hidden" id="download_type" name="download_type" value="\${download_type}"></input>
			<label class="col-lg-4 col-form-label"
				for="cnsla_type">증명서명 <span
				class="text-danger">*</span>
			</label>
			<div class="col-lg-6">
				<input type="text" class="form-control input-default"
				id="name" name="name"
				value="\${rsp.name}"
				readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-lg-4 col-form-label"
				for="cnsla_type">결제자 <span
				class="text-danger">*</span>
			</label>
			<div class="col-lg-6">
			<input type="text" class="form-control input-default"
				id="buyer_name" name="buyer_name"
				value="\${rsp.buyer_name}"
				readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-lg-4 col-form-label"
				for="cnsla_type">총액 <span
				class="text-danger">*</span>
			</label>
			<div class="col-lg-6">
				<input type="text" class="form-control input-default"
					id="paid_amount" name="paid_amount"
					value="\${rsp.paid_amount}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-lg-4 col-form-label"
				for="cnsla_type">결제번호<span
				class="text-danger">*</span>
			</label>
			<div class="col-lg-6">
			<input type="text" class="form-control input-default"
				id="merchant_uid" name="merchant_uid"
				value="\${rsp.merchant_uid}" readonly="readonly">
			</div>
		</div>
	</div>
</div>
</div>
<div class="modal-footer">
<input type="hidden" id="crtf_code" name="crtf_code"
	value="${certificate.crtf_code}"> <input
	type="hidden" id="stu_record" name="stu_record"
	value='<c:out value="${memberVO['STU_RECORD']}"></c:out>'>
<button type="button" class="btn mb-1 btn-primary custom-btn-s"
	onclick="proc8(this)">발급</button>
<button type="button" onclick="valuesReset(this)" class="btn mb-1 btn-outline-dark"
	data-dismiss="modal">취소</button>
</div>`;
	
	$(replace).html(newHTML);
	
}


function openPDF(crtf_code, crtfh_code){
	console.log(crtf_code, crtfh_code);
	
	var pop = window.open("about:blank","content","menubar=no, left=550,width=920,height=1000");
	
	pop.location.href = "/student/popPdf?pdfName=certificate" + crtf_code + "-" + crtfh_code;
	
}


function proc7(selBox){
	console.log("aaaaa");
	let crtfh_ttlprice = $(selBox).parent().parent().parent().find("#crtfh_ttlprice")
	
// 	console.log("길이", crtfh_ttlprice.length);
// 	if(crtfh_ttlprice == ""){
// 		alert("매수를 선택해 주세요");
// 		return false;
// 	}
	
	let cnt = $(selBox).val();
	let price = $(selBox).parent().find("#crtf_price").val();
	
	console.log(price);
	
	$(crtfh_ttlprice).val(price * cnt);
	
}

function proc8(btn){
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let crtf_code =	$(btn).parent().parent().find("#crtf_code").val()
	let stu_record = $(btn).parent().parent().find("#stu_record").val();
	let crtfh_count = $(btn).parent().parent().find("#crtfh_count").val();
	let crtfh_ttlprice = $(btn).parent().parent().find("#crtf_price").val() * crtfh_count;
	let crtfh_payway = $(btn).parent().parent().find("#crtfh_payway").val();
	let download_type = $(btn).parent().parent().find("#download_type").val();

	if(crtf_code == 5 && stu_record != "재학"){
		swal({
			  title: "서비스 권한이없습니다",   //큰 글씨
			  icon: "success",   //info, success등 종류
			});
// 		alert("서비스 권한이없습니다");
		return false;
	}
	
	if(crtf_code == 6 && stu_record != "졸업"){
		swal({
			  title: "졸업 증명서는 졸업자만 발급이 가능합니다",   //큰 글씨
			  icon: "success",   //info, success등 종류
			});
// 		alert("졸업 증명서는 졸업자만 발급이 가능합니다");
		return false;
	}
	
	console.log("증명서 코드", crtf_code);
	console.log("학적상태", stu_record);
	console.log("증명서 개수", crtfh_count);
	console.log("증명서 발급 금액", crtfh_ttlprice);
	console.log("증명서 결제방식", crtfh_payway);
	console.log("증명서 발급 방식", download_type);
	
	var pop = window.open("about:blank","content","menubar=no, width=920,height=1000");
	
	$.ajax({
		type : "post",
		url : "/student/certificateApply",
		data : {"crtf_code" : crtf_code, "stu_record" : stu_record, "crtfh_count" : crtfh_count,
				"crtfh_ttlprice" : crtfh_ttlprice, "crtfh_payway" : crtfh_payway, "download_type" : download_type},
		success : function(res){
			if(res != "NG"){
				$(".modal-backdrop").remove();
				pop.location.href="/student/popPdf?pdfName="+res;				 
				$("#isj0").load("/student/certificate #isj0");
			}
		},
		beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
     	},
		dataType : "text"
	})
	
	// ------------------------------결제 api 로직------------------------------
	
	// ------------------------------결제 api 로직 끝------------------------------
	
	
	
	
	
}

</script>