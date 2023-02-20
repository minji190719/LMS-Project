<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;장학금 신청<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/scholar">장학금 신청</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="alert alert-warning">※장학금 신청시 최대 2주 소요됩니다.</div>
				<p class="text-muted">
					<code></code>
				</p>
				<div id="accordion-three" class="accordion">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0 collapsed" data-toggle="collapse"
								data-target="#collapseOne4" aria-expanded="false"
								aria-controls="collapseOne4">
								<i class="fa" aria-hidden="true"></i>장학금 종류 조회를 원할 시 클릭하십시오.
							</h5>
						</div>
						<div id="collapseOne4" class="collapse" data-parent="#accordion-three">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead class="custom-theader-s">
											<tr>
												<th>No.</th>
												<th>장학명칭</th>
												<th>지급 대상</th>
												<th>증빙 서류</th>
												<th>신청 시작일</th>
												<th>신청 종료일</th>
												<th>장학 금액</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${scholarListVO}" var="scholarListVO">
												<tr>
													<th>${scholarListVO.schl_number }</th>
													<th>${scholarListVO.schl_name }</th>
													<td>${scholarListVO.schl_target }</td>
													<td>${scholarListVO.schl_document }</td>
													<td>${fn:substring(scholarListVO.schl_start, 0, 10) }</td>
													<td>${fn:substring(scholarListVO.schl_end, 0, 10) }</td>
													<td>
														<span class="badge custom-btn-s px-2">
															학기당&nbsp;
															<fmt:formatNumber value="${scholarListVO.schl_price }" type="currency"/>
														</span>
													</td>
												</tr>											
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0 collapsed" data-toggle="collapse"
								data-target="#collapseOne1" aria-expanded="false"
								aria-controls="collapseOne1">
								<i class="fa" aria-hidden="true"></i>장학금 신청을 원할 시 클릭하십시오.
							</h5>
						</div>
						<div id="collapseOne1" class="collapse"
							data-parent="#accordion-three" style="">
							<div class="col-lg-12" style="display: flex; justify-content: center;">
								<div class="card-body">
									<div class="card-title">장학금 신청</div>
									<hr/>
									<div class="form-validation">
										<form id="scholarApplyForm" class="form-valide" novalidate="novalidate">
											<div class="form-group row">
												<label class="col-lg-6 col-form-label" for="val-skill">장학금 선택<span class="text-danger">*</span>
												</label>
												<div class="col-lg-6">
													<select class="form-control" id="schl_code" name="schl_code" required="required">
														<c:choose>
															<c:when test="${empty scholarListVO}">										
																<option value="" selected="selected" disabled="disabled" id="scholarListState">신청 가능한 장학금이 없습니다.</option>
															</c:when>
															<c:otherwise>
																<option value="" selected="selected" disabled="disabled" id="scholarListState">===선택하십시오===</option>
																<c:forEach items="${scholarListVO }" var="scholarListVO">
																	<option value="${scholarListVO.schl_code}">${scholarListVO.schl_name }</option>
																</c:forEach>										
															</c:otherwise>
														</c:choose>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-6 col-form-label" for="val-username">첨부 증빙자료</label>
												<div class="col-lg-6">
													<input type="file" accept=".pdf" multiple="multiple"
														class="form-control" id="scholarFiles" name="scholarFiles" multiple="multiple" required="required">
												</div>
											</div>
											<div class="form-group row">
												<div class="col-lg-12 ml-auto text-right">
													<input type="reset" class="btn mb-1 btn-outline-dark" value="초기화"/>
													<input type="submit" class="btn mb-1 btn-primary custom-btn-s" value="신청"/>
													<input type="button" class="btn mb-1 btn-outline-dark" onclick="autoValue()" value="자동완성">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-s custom-bold">나의 장학금 신청 내역</h5>							
				</div>
				<hr/>
				<!-- 다양한 agGrid테마 존재: ag-theme-alpine, ag-theme-balham, ag-theme-material  -->
				<div class="ag-theme-material table-responsive" id="scholarApplyListSpace" style="height: 500px; width: auto;">

				</div>
			</div>
		</div>		
	</div>
</div>


<!-- aggrid -->

<script type="text/javascript">
	// 장학금 신청 자동 값 채우기
	function autoValue(){
		document.querySelector("#schl_code").children[4].selected = true; // 어학 우수 장학금
	}

	// 스프링 인증 토큰
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';

	const scholarApplyForm = document.querySelector("#scholarApplyForm");
	const scholarFiles = document.querySelector("#scholarFiles");
	const scholarApplyListSpace = document.querySelector("#scholarApplyListSpace");
	
	const scholarListState = document.querySelector("#scholarListState");
	const scholarApplyBtn = document.querySelector('input[type="submit"]');
	
	// const sTableBtns = document.querySelector(".ag-paging-page-summary-panel");
	
	function getScholarApplyList(){
		
		// ag-grid를 사용하기 위해 column명 설정
		const columnDefs = [
			{ headerName: "No", field : "scha_number" },
			{ headerName: "장학금신청번호", field : "scha_no" },
			{ headerName: "장학금명", field : "schl_name" }, 
			{ headerName: "신청일", field : "scha_date" },
			{ headerName: "진행 상태", field : "scha_state" },
			{ headerName: "반려 사유", field : "scha_reject" },
			{ headerName: "(승인/반려) 결정일", field : "scha_cdate" }
		];
		
		// ▷ AgGrid 설정 gridOptions
		/*
		const gridOptions = {
			columnDefs : columnDefs,
			rowData : "",
			defaultColDef : { // 기본적으로 컬럼에 적용할 옵션 선택
				sortable : true,
				filter : true,
				editable : false
			},
	        onGridReady: function (event) { // 행 넓이 자동 조절
	            event.api.sizeColumnsToFit();
	        },
	        localeText: {noRowsToShow: '장학금 신청내역이 존재하지 않습니다.'},
			pagination : true,
			paginationAutoPageSize: true,
			// paginationPageSize : 8,
			onCellClicked : params => {
				console.log("자유롭게 데이터를 가공해서 사용해봅시다", params.value);
			}			
		};
		*/
		
       const gridOptions = {
    	         columnDefs: columnDefs,
    	         rowData : "",
    	         defaultColDef: {sortable: true, filter: true},

    	         rowSelection: 'multiple',
    	         animateRows: true,
   		         onGridReady: function (event) { // 행 넓이 자동 조절
   		            event.api.sizeColumnsToFit();
   		         },
   		         localeText: {noRowsToShow: '장학금 신청내역이 존재하지 않습니다.'},
   				 pagination : true,
   				 paginationAutoPageSize: true,
    	         onCellClicked: params => {
    	           c// onsole.log('cell was clicked', params)
    	         }
    	};
		
		// ag-grid 생성(scholarApplyListSpace에 출력하고, gridOptions 통해 상세 설정)
		new agGrid.Grid(scholarApplyListSpace, gridOptions);
	
		var tokens = $("meta[name='_csrf']").attr('content');
		
		// ▶ 나의 장학금 신청내역(페이지 로딩시)
		$.ajax({
			type : "get",
			url : "/scholar/getList",
			processData : false,
			contentType : false, // contentType은 보내는 데이터 타입
			dataType: "json",
			headers : {
				"X-CSRF-TOKEN" : tokens
			},
			success : function(data) {
				// 장학금신청번호, 장학금명, 신청일, 진행 상태, 반려 사유

				// 리스트를 생성한다.
				let sObjectList = new Array();

				for(let i=0; i < data.length; i++) {

					for(let j=0; j < data[i].scholarApplyList.length; j++) {
						// 객체를 생성한다.
						let sObject = new Object();
						let scha_no = data[i].scholarApplyList[j].scha_no;
						sObject.scha_no = scha_no;
						sObject.schl_name = data[i].schl_name;
						let scha_date = data[i].scholarApplyList[j].scha_date;
						sObject.scha_date =scha_date.substr(0,10);

						let scha_state = data[i].scholarApplyList[j].scha_state;
						sObject.scha_reject = data[i].scholarApplyList[j].scha_reject;
						let scha_cdate = data[i].scholarApplyList[j].scha_cdate;
						if(scha_cdate != null){
							sObject.scha_cdate = scha_cdate.substring(0,10);
						}
						
						switch(scha_state) {
							case 0:
								sObject.scha_state = "대기";			
								break;
							case 1:
								sObject.scha_state = "승인";
								break;
							case 2:
								sObject.scha_state = "반려";
								break;
							default:
								sObject.scha_state = "default";
								break;
						};
						
						let scha_number = data[i].scholarApplyList[j].scha_number;
						sObject.scha_number = scha_number;
						sObjectList.push(sObject);
					};

				};
				
				// agGrid에 parseData 세팅한다.
				gridOptions.api.setRowData(sObjectList);
				createDelBtnStyle();
			}
		});		
	}
	
	function createDelBtnStyle(){
		// 장학금 신청 상태가 대기 상태일시 삭제버튼 활성화 위해 state, no, reject 위치를 가져온다.
		const scha_states = document.querySelectorAll("[col-id=scha_state]");
		const scha_nos = document.querySelectorAll("[col-id=scha_no]");
		const scha_rejects = document.querySelectorAll("[col-id=scha_reject]");
		
		for(let i = 1; i < scha_states.length; i++){ // thead는 제외하므로 0아닌 1부터 찾는다.
			if(scha_states[i].textContent == "대기"){
				scha_rejects[i].innerHTML = "<button type='button' class='badge badge-danger' value='" 
											+ scha_nos[i].textContent + "' style='cursor: pointer;' onclick='delScholar(this)'>신청 취소</button>";
			}
		}
	}

	function delScholar(dthis){
	   swal({
		   title: "신청 취소",
		   text: "정말 장학금 신청을 취소하시겠습니까?\n신청 취소시 되돌릴 수 없습니다.",
		   icon: "warning",
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
        	
        	switch(value){
	        	case "select":
					let scha_no = dthis.value;
					let url = "/scholar/delete/" + scha_no;
					let xhr = new XMLHttpRequest();
					xhr.open("get", url, true);
					xhr.setRequestHeader(header, token);
					xhr.setRequestHeader('content-type', 'text/plain;charset=utf-8');
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4 && xhr.status == 200){
							// alert(xhr.responseText);
							swal({
							   title: "신청 취소 완료",
							   text: "취소에 성공하였습니다.",
							   icon: "success",
					           buttons:{
					              select:"확인"
					           }
					        }).then((value) => { 
					        	scholarApplyListSpace.innerHTML = "";
					        	getScholarApplyList();
					        });
						}
					}
					xhr.send(scha_no);
	        		break;
	        	default:
	        		break;
        	}
        	
		
	})
		
	}
	
	window.addEventListener("DOMContentLoaded", function(){
		getScholarApplyList();
		
		if(scholarListState.textContent == '신청 가능한 장학금이 없습니다.'){
			scholarApplyBtn.disabled = true;
		}
	});
	
	/*
	sTableBtns.addEventListener("click", function(event){
		createDelBtnStyle();
	});
	*/

  
	// ▶ 장학금 신청 폼
	scholarApplyForm.addEventListener("submit", function() {
		event.preventDefault();
	
		let files = scholarFiles.files;
		console.log(files);
		
		var formData = new FormData(scholarApplyForm);
		
		for(let i = 0; i < files.length; i++){
			formData.append("schaFiles", files[i]); // 같은 이름으로 append하면 배열이 된다.
		};
	
 		let xhr = new XMLHttpRequest();
 		xhr.open("post", "/scholar/apply", true);
 		xhr.setRequestHeader(header, token);
 		xhr.onreadystatechange = function(){
 			console.log(xhr.readyState);
 			console.log(xhr.status);
 			if(xhr.readyState == 4 && xhr.status == 200){
   				swal({
 					  title: "신청 성공", 
 					  text : "장학금 신청이 완료되었습니다",
 					  icon: "success",
			          buttons:{
				              select:"확인"
				      }
 					}).then((value) => { 						
		 				
		 				scholarApplyForm.reset(); // 장학금 신청 폼을 초기화
			        	scholarApplyListSpace.innerHTML = "";
			        	getScholarApplyList();
 					})
 			};
 		};
 		xhr.send(formData);	
	});

</script>