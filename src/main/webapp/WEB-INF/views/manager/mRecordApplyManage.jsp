<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>

	.MapplyList td:nth-child(7){
	text-align: center;
	}

</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;휴/복학 관리<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/recordapproval/Mrecordmain">휴/복학 관리</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-6">
		<div class="card">
			<div class="card-body">
					<div class="card-title">
						<h5 class="custom-m custom-bold">
							학적 변동 신청 내역
						</h5>
					</div>
				<div class="table-responsive custom-table1" id="disp">
					<table class="table table-hover">
						<thead class="custom-theader-m">
							<tr onclick="stuinfo()">
								<th width="10%">No.</th>
								<th width="15%">신청년도/학기</th>
								<th width="15%">신청일자</th>
								<th width="15%">학번</th>
								<th width="15%">성명</th>
								<th width="15%">신청구분</th>
								<th width="15%">승인구분</th>
							</tr>
						</thead>
						<tbody class="MapplyList">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<form class="form-valide" action="/upadteRecord" method="post" id="detailform">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-m custom-bold">신청 상세</h5>
					</div>
					<hr/>
					<br/>
					<div class="form-group row" id="datalist">
						<label class="col-lg-6" for="form-label"> <span
							class="text">성명</span> <input type="text" class="form-control"
							id="mem_name" name="mem_name" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">학번</span> <input type="text" class="form-control"
							id="smem_no" name="smem_no" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">신청구분</span> <input type="text" class="form-control"
							id="rcrda_reason" name="rcrda_reason" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">학년</span> <input type="text" class="form-control"
							id="stu_schyear" name="stu_schyear" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">소속</span> <input type="text" class="form-control"
							id="stu_dep" name="stu_dep " disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">입학정보(입학날짜)</span> <input type="text"
							class="form-control" id="stu_joinyear" name="stu_joinyear"
							disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">생년월일</span> <input type="text" class="form-control"
							id="mem_reg1" name="mem_reg1" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">연락처</span> <input type="text" class="form-control"
							id="mem_tel" name="mem_tel" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">휴복학 시작년도</span> <input type="text"
							class="form-control" id="rcrda_startyear" name="rcrda_startyear"
							disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">휴복학 시작학기</span> <input type="text"
							class="form-control" id="rcrda_startsemester"
							name="rcrda_startsemester" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">휴복학 종료년도</span> <input type="text"
							class="form-control" id="rcrda_endyear" name="rcrda_endyear"
							disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">휴복학 종료학기</span> <input type="text"
							class="form-control" id="rcrda_endsemester"
							name="rcrda_endsemester" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <span
							class="text">신청일시</span> <input type="text" class="form-control"
							id="rcrda_date" name="rcrda_date" disabled>
						</label>
						<label class="col-lg-6" for="form-label"> <input
							type="hidden" class="form-control" id="rcrda_code"
							name="rcrda_code" disabled>
						</label>
						<br/><br/>
						<div class="col-lg-12">
							<span class="text">반려사유</span> <input type="text"
								class="form-control" id="rcrda_reject" name="rcrda_reject"><br/>
							<div class="col-15">
								<button type="button" class="btn mb-1 btn-outline-danger"
									style="float: right;" id="apply_reject" name="apply_reject"
									onclick="reject()">반려</button>
								&nbsp; &nbsp; &nbsp; &nbsp;
								<button type="button" class="btn mb-1 btn-primary custom-btn-m"
									style="float: right;" id="apply_approve" name="apply_approve"
									onclick="approve()">승인</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>
</div>
<script>	
	var nowClick;

	function requestapplyList() {
		$.ajax({
					url : "/recordapproval/SapplyAllList",
					type : "get",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						var html = "";
						data.forEach(function(obj, idx) {
									html += "<tr onclick='sDetailinfo(this)' style='cursor:pointer;'>";
									html += "<td width='10%'>" + (idx + 1) + "</td>";
									html += "<td width='15%'>" + obj.rcrda_startyear + "/"
											+ obj.rcrda_startsemester + "</td>";
									html += "<td width='15%'>" + obj.rcrda_date + "</td>";
									html += "<td width='15%'>" + obj.smem_no + "</td>";
									html += "<td width='15%'>" + obj.mem_name + "</td>";
									html += "<td width='15%'>" + obj.rcrda_reason + "</td>";
									if (obj.rcrda_state == '0') {
										obj.rcrda_state = '<span class="badge badge-dark">대기</span>'
									} else if (obj.rcrda_state == '1') {
										obj.rcrda_state = '<span class="badge badge-success">승인</span>'
									} else {
										obj.rcrda_state = '<span class="badge badge-danger">반려</span>'
									}
									html += "<td width='15%'>" + obj.rcrda_state + "</td>";
									html += "</tr>";
								});
						$(".MapplyList").html(html);
					}
				});

	}
	function responseList(xhr, msg) {
		console.log(xhr);
		if (typeof xhr != 'undefined' || xhr != null) {
			console.log(Object.values(xhr.list[0].rcrda_state));
			console.log(Object.values(xhr.list[0].notice_year));
			for (var i = 0; i < xhr.list.length; i++) {
				html += "<td>" + xhr.list[i].rcrda_startyear + "/"
						+ xhr.list[i].rcrda_startsemester + "</td>";
				html += "<td>" + xhr.list[i].rcrda_date + "</td>";
				html += "<td>" + xhr.list[i].smem_no + "</td>";
				html += "<td>" + xhr.list[i].mem_name + "</td>";
				html += "<td>" + xhr.list[i].rcrda_reason + "</td>";
				html += "<td>" + xhr.list[i].rcrda_state + "</td>";
			}
			document.getElementById('.MapplyList').innerHTML = html;
		} else {
			console.log("continue");
		}
	}
	window.onload = function() {
		requestapplyList();
	};

	function sDetailinfo(data) {
	
		let clickBg = document.querySelector(".clickBg");
		if(clickBg){
			clickBg.classList.remove("clickBg");
		}
		data.classList.add('clickBg');
		
		nowClick = data;
		var memId = data.children[3].innerText;
		var rcrda_reason = data.children[5].innerText;
		var ListNum = data.children[0].innerText;
		console.log(data.children[0].innerText);
		console.log(memId)
		console.log(rcrda_reason)
		$.ajax({
			url : "/recordapproval/SapplyNoList",
			type : "get",
			data : {
				"memId" : memId,
				"rcrda_reason" : rcrda_reason
			},
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				var html = "";
				console.log(data);
				var rcrda_reason = document.querySelector("#rcrda_reason");
				rcrda_reason.value = data[0].RCRDA_REASON;
				console.log(data[0].RCRDA_REASON);

				var rcrda_startyear = document
						.querySelector("#rcrda_startyear");
				rcrda_startyear.value = data[0].RCRDA_STARTYEAR;
				console.log(data[0].RCRDA_STARTYEAR)

				var rcrda_startsemester = document
						.querySelector("#rcrda_startsemester");
				rcrda_startsemester.value = data[0].RCRDA_STARTSEMESTER;
				console.log(data[0].RCRDA_STARTSEMESTER)

				var rcrda_endyear = document.querySelector("#rcrda_endyear");
				rcrda_endyear.value = data[0].RCRDA_ENDYEAR;
				console.log(data[0].RCRDA_ENDYEAR)

				var rcrda_endsemester = document
						.querySelector("#rcrda_endsemester");
				rcrda_endsemester.value = data[0].RCRDA_ENDSEMESTER;
				console.log(data[0].RCRDA_ENDSEMESTER)

				var stu_dep = document.querySelector("#stu_dep");
				stu_dep.value = data[0].STU_DEP;
				console.log(data[0].STU_DEP)

				var stu_schyear = document.querySelector("#stu_schyear");
				stu_schyear.value = data[0].STU_SCHYEAR;
				console.log(data[0].STU_SCHYEAR)

				var stu_joinyear = document.querySelector("#stu_joinyear");
				stu_joinyear.value = data[0].STU_JOINYEAR;
				console.log(data[0].STU_JOINYEAR)

				var smem_no = document.querySelector("#smem_no");
				smem_no.value = data[0].SMEM_NO;
				console.log(data[0].SMEM_NO)

				var mem_name = document.querySelector("#mem_name");
				mem_name.value = data[0].MEM_NAME;
				console.log(data[0].MEM_NAME)

				var mem_reg1 = document.querySelector("#mem_reg1");
				mem_reg1.value = data[0].MEM_REG1;
				console.log(data[0].MEM_REG1)

				var mem_tel = document.querySelector("#mem_tel");
				mem_tel.value = data[0].MEM_TEL;
				console.log(data[0].MEM_TEL)

				var rcrda_date = document.querySelector("#rcrda_date");
				rcrda_date.value = data[0].RCRDA_DATE;

				var rcrda_code = document.querySelector("#rcrda_code");
				rcrda_code.value = data[0].RCRDA_CODE;
				console.log(rcrda_code.value);
			}	
		});
	}

	function reject() {

		var rcrda_code = $('#rcrda_code').val();
		var rcrda_reject = $('#rcrda_reject').val();
		let header = $("meta[name='_csrf_header']").attr('content');
		let token = $("meta[name='_csrf']").attr('content');

		$.ajax({
					url : "/recordapproval/upadteRecord",
					type : "post",
					dataType : "text",
					data : {
						"rcrda_reject" : rcrda_reject,
						"rcrda_code" : rcrda_code,
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {
						console.log(data);
						nowClick.children[6].innerHTML = '<span class="badge badge-danger">반려<span>';
						swal({
							  text: "반려되었습니다.",
							  icon: "success",
							  button: "확인",
							})

					},
					error : function() {
						console.log("이거안되나?");
					}
				})
	};

	function approve() {
		var rcrda_code = $('#rcrda_code').val();
		var smem_no = $('#smem_no').val();
		let header = $("meta[name='_csrf_header']").attr('content');
		let token = $("meta[name='_csrf']").attr('content');
		$.ajax({
					url : "/recordapproval/validationRecord",
					type : "post",
					dataType : "text",
					data : {
						"rcrda_code" : rcrda_code,
						"smem_no" : smem_no
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {

						nowClick.children[6].innerHTML = '<span class="badge badge-success">승인</span>';
						swal({
							  text: "승인되었습니다.",
							  icon: "success",
							  button: "확인",
							})
					},
					error : function() {
						console.log("여기들어옴?");
					}
				})
	}
</script>