<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#modifyform{
	display:none;
}

.input_file_button{
	 padding: 8px 25px;
	 background-color:#FF6600;
	 border-radius: 4px;
	 color: white;
	 cursor: pointer;
}
span > .bed{
	color: red;
}
span > .good{
	font-size: 1.3rem;
	color: #006600;
}
</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;마이페이지<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/mypage/List">마이페이지</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row justify-content-center" id="contentlist">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-s custom-bold">개인 정보</h5>							
				</div>
				<div class="form-validation">
					<c:set value="${getList[0] }" var="list"></c:set>
					<div class="form-group row" id="myPageList">
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학번</span>
							<input type="text" class="form-control input-default" id="mem_no" name="mem_no" value="${list.smem_no }" disabled><br>
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;입학년도</span>
							<input type="text" class="form-control input-default" id="stu_joinyear" name="stu_joinyear" placeholder="${list.stu_joinyear }" disabled><br>
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학년</span>
							<input type="text" class="form-control input-default" id="stu_schyear" name="stu_schyear" placeholder="${list.stu_schyear }학년" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;이름</span>
							<input type="text" class="form-control input-default" id="mem_name" name="mem_name" placeholder="${list.mem_name }" disabled><br>
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학과코드</span>
							<input type="text" class="form-control input-default" id="dep_code" name="dep_code" placeholder="${list.dep_code }" disabled><br>
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;재학학기</span>
							<input type="text" class="form-control input-default" id="stu_semester" name="stu_semester" placeholder="${list.stu_semester }학기" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;단과대학</span>
							<input type="text" class="form-control input-default" id="col_name" name="col_name" placeholder="${list.col_name }" disabled><br>
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학과</span>
							<input type="text" class="form-control input-default" id="DEP_NAME" name="DEP_NAME" placeholder="${list.dep_name }" disabled><br>
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;전공</span>
							<input type="text" class="form-control input-default" id="stu_dep" name="stu_dep" placeholder="${list.stu_dep }" disabled>
						</label>

						<!-- 프로필 이미지 -->
						<div class="col-lg-3 col-sm-6" id="showimg" style="text-align: center;">
							<form id="myimgchange" action="/mypage/updateimg" class="form-valide" method="post" enctype="multipart/form-data">
								<div id="sumnailDiv">
									<img src="${list.mem_photopath}" width="150px" height="200px" onerror="this.src='../resources/images/대체이미지.jpg'"><br>
								</div>
								<div style="padding: 10px;">
									<label class="input_file_button" for="member_imagee"> 업로드 </label>
									<input type="file" id="member_imagee" name="member_imagee" style="display: none;" multiple="multiple" onchange="c_image()" />
									<button type="button" class="btn mb-1 btn-primary custom-btn-s" id="img_change" name="img_change" onclick="imgchange()">저장하기</button>
								</div>
							</form>
						</div>
					</div>
					<div class="form-group row" style="margin-top: -25px;">
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;생년월일</span>
							<input type="text" class="form-control input-default" id="MEM_REG1" name="MEM_REG1" placeholder="${list.mem_reg1 }" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;국적</span>
							<input type="text" class="form-control input-default" id="MEM_NATION" name="val-username" placeholder="대한민국" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;성별</span>
							<input type="text" class="form-control input-default" id="mem_sex" name="MEM_SEX" placeholder="${list.mem_sex }" disabled>
						</label>
						<label class="col-lg-3 col-form-label" for="form-label">
							<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학적상태</span>
							<input type="text" class="form-control input-default" id="stu_record" name="STU_RECORD" placeholder="${list.stu_record }" disabled>
						</label>
					</div>
					<form class = "updateform" id="updateform">
						<div class="form-group row">
							<label class="col-lg-3 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;휴대폰번호</span>
								<input type="text" class="form-control input-default" id="mem_tel" name="mem_tel" value="${list.mem_tel }">
								<span class="mem_tele"></span>
							</label>
							<label class="col-lg-3 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;비상연락처</span>
								<input type="text" class="form-control input-default" id="mem_tel2" name="mem_tel2" value="${list.mem_tel }">
								<span class="mem_telep"></span>
							</label>
							<label class="col-lg-3 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;이메일</span>
								<input type="text" class="form-control input-default" id="mem_email" name="mem_email" value="${list.mem_email }">
								<span class="mem_mail"></span>
							</label>
							<label class="col-lg-3 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;비밀번호</span>
								<input type="password" class="form-control input-default" id="mem_pass" name="mem_pass" value="${list.mem_pass }">
								<span class="mem_pass"></span>
							</label>
						</div>

						<div class="form-group row" style="display: flex; justify-content: space-between;">
							<label class="col-lg-4 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;주소</span>
								<input type="text" class="form-control input-default" id="mem_addr1" name="mem_addr1" value="${list.mem_addr1 }">
							</label>
							<label class="col-lg-4 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;상세 주소</span>
								<input type="text" class="form-control input-default" id="mem_addr2" name="mem_addr2" value="${list.mem_addr2 }">
							</label>
							<button type="button" style="float: left; height: 37px; margin-top: 32px;" class="btn mb-1 btn-outline-dark" onclick="eh_autoValueForAddr()">자동완성</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="col-lg-2 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;우편번호</span>
								<input type="text" class="form-control input-default" id="mem_postnum" name="mem_postnum" value="${list.mem_postnum }">
							</label> &nbsp;&nbsp;
							<i class="fa-solid fa-magnifying-glass-location" onclick="findMyAddr()" style="font-size: 25px; margin-top: 35px; cursor: pointer;"></i>
							&nbsp;&nbsp;
						</div>


						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;은행명</span>
								<input type="text" class="form-control input-default" id="mem_bank" name="mem_bank" value="${list.mem_bank }">
							</label>
							<label class="col-lg-4 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;예금주</span>
								<input type="text" class="form-control input-default" id="mem_depo" name="mem_depo" value="${list.mem_depo }">
							</label>
							<label class="col-lg-4 col-form-label" for="form-label">
								<span class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;계좌번호</span>
								<input type="text" class="form-control input-default" id="mem_banknum" name="mem_banknum" value="${list.mem_banknum }">
							</label>
						</div>
					</form>
					<div class="form-group row">
						<label class="col-lg-12 col-form-label" for="form-label">
							<button type="button" class="btn mb-1 btn-primary custom-btn-s" style="float: right;" onclick="modifySuccess()">수정하기</button>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 학적변동 시작 -->
<div class="row" id="recordlist">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="custom-s custom-bold">학적 변동 내역</h5>						
				</div>
				<div class="active-member">
					<div class="table-responsive custom-table1">
						<table class="table table-hover">
							<thead class="custom-theader-s">
								<tr>
									<th>No.</th>
									<th>시작년도/학기</th>
									<th>종료년도/학기</th>
									<th>변동일자</th>
									<th>학적상태</th>
									<th>학적변동</th>
									<th>변동사유</th>
									<th>반려사유</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="${getappList }" var="appList"></c:set>
								<c:choose>
									<c:when test="${empty appList }">
										<tr>
											<td colspan="8" style="text-align: center;">신청내역이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${ appList}" var="List" varStatus="status">
											<tr>
												<td>${status.index+1 }</td>
												<td>${List.rcrda_startyear }/
													${List.rcrda_startsemester }</td>
												<td>${List.rcrda_endyear }/${List.rcrda_endsemester }</td>
												<td><span>${fn:substring(List.rcrda_start,0,10) }</span></td>
												<c:choose>
													<c:when test="${List.rcrda_state == 0 }">
														<td>대기</td>
													</c:when>
													<c:when test="${List.rcrda_state == 1 }">
														<td>승인</td>
													</c:when>
													<c:when test="${List.rcrda_state == 2 }">
														<td>반려</td>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${List.rcrda_record == 0 }">
														<td>재학</td>
													</c:when>
													<c:when test="${List.rcrda_record == 1 }">
														<td>휴학</td>
													</c:when>
													<c:when test="${List.rcrda_record == 2 }">
														<td>복학</td>
													</c:when>
												</c:choose>
												<td>${List.rcrda_reason }</td>
												<c:choose>
													<c:when test="${List.rcrda_state == 0 }">
														<td></td>
													</c:when>
													<c:when test="${List.rcrda_state == 1 }">
														<td></td>
													</c:when>
													<c:when test="${List.rcrda_state == 2 }">
														<td>${List.rcrda_reject }</td>
													</c:when>
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
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
keyEvent();
keyEvent1();
keyEvent2();
keyEvent3();
function keyEvent(){
	let mem_tel = document.querySelector("#mem_tel");
	mem_tel.addEventListener("keyup", function(){
		let reg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(reg.test(mem_tel.value)){
			document.querySelector(".mem_tele").innerHTML='<p class= "good">형식과 일치합니다.</p>';
			console.log("정규식 통과")
		}else{
			document.querySelector(".mem_tele").innerHTML='<p class = "bed">핸드폰번호 형식에 맞춰 입력해주세요</p>';
			console.log("정규식 실패")
		}
	})
};
function keyEvent1(){
	let mem_tel2 = document.querySelector("#mem_tel2");
	mem_tel2.addEventListener("keyup", function(){
		let reg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(reg.test(mem_tel2.value)){
			document.querySelector(".mem_telep").innerHTML='<p class= "good">형식과 일치합니다.</p>';
			console.log("정규식 통과")
		}else{
			document.querySelector(".mem_telep").innerHTML='<p class = "bed">전화번호 형식에 맞게 입력해주세요</p>';
			console.log("정규식 실패")
		}
	})
};
function keyEvent2(){
	let mem_email = document.querySelector("#mem_email");
	mem_email.addEventListener("keyup", function(){
		let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(reg.test(mem_email.value)){
			document.querySelector(".mem_mail").innerHTML='<p class= "good">형식과 일치합니다.</p>';
			console.log("정규식 통과")
		}else{
			document.querySelector(".mem_mail").innerHTML='<p class = "bed">이메일형식에 맞춰입력해주세요</p>';
			console.log("정규식 실패")
		}
	})
};
function keyEvent3(){
	let mem_pass = document.querySelector("#mem_pass");
	mem_pass.addEventListener("keyup", function(){
		let reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		
		if(reg.test(mem_pass.value)){
			document.querySelector(".mem_pass").innerHTML='<p class= "good">형식과 일치합니다.</p>';
			console.log("정규식 통과")
		}else{
			document.querySelector(".mem_pass").innerHTML='<p class = "bed">영문+숫자를 조합해주세요</p>';
			console.log("정규식 실패")
		}
	})
};

function modifySuccess(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var mem_no = document.querySelector("#mem_no");
// 	var updateform = document.querySelector("#updateform");

	var formData = new FormData();
	formData.append("mem_no", document.querySelector("#mem_no").value);
	formData.append("mem_tel", document.querySelector("#mem_tel").value);
	formData.append("mem_tel2", document.querySelector("#mem_tel2").value);
	formData.append("mem_email", document.querySelector("#mem_email").value);
	formData.append("mem_postnum", document.querySelector("#mem_postnum").value);
	formData.append("mem_addr1", document.querySelector("#mem_addr1").value);
	formData.append("mem_addr2", document.querySelector("#mem_addr2").value);
	formData.append("mem_bank", document.querySelector("#mem_bank").value);
	formData.append("mem_depo", document.querySelector("#mem_depo").value);
	formData.append("mem_banknum", document.querySelector("#mem_banknum").value);
	formData.append("mem_pass", document.querySelector("#mem_pass").value);
	
	
	 $.ajax({
		url : "/mypage/uppic",
		method : "post",
		data : formData,
		processData : false,
		contentType : false,
     	beforeSend : function(xhr){
        xhr.setRequestHeader(header, token);
      	},
		success : function(data){
		swal({
			  text: "수정되었습니다.",
			  icon: "success",
			  button: "확인",
			})
			.then((value) =>{
				location.reload();
				
			})
		}
	}) 
}



function imgchange(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var mem_no = document.querySelector("#mem_no");
	var member_imagee = document.querySelector("#member_imagee");
	
	var formData = new FormData();
	formData.append("mem_no", document.querySelector("#mem_no").value);
	formData.append("member_imagee", document.querySelector("#member_imagee").files[0]);
	
	 $.ajax({
		url : "/mypage/updateimg",
		method : "post",
		data : formData,
		processData : false,
		contentType : false,
     	beforeSend : function(xhr){
        xhr.setRequestHeader(header, token);
      	},
		success : function(data){
			swal({
				  text: "사진이 변경되었습니다.",
				  icon: "success",
				  button: "확인",
				})
		}
	}) 
}

 		// 사진 썸네일 보여주기
		
		function c_image(){
			let sumnailDiv = document.querySelector("#sumnailDiv");
			let member_imagee = document.querySelector("#member_imagee");
			
	        let fileReader = new FileReader();  // 파일 읽어주는 아저씨(고마웡)
	        fileReader.readAsDataURL(member_imagee.files[0]);
	        fileReader.onload = () => {
	            let myImg = document.createElement("img");
	            myImg.width = 200; 
	            myImg.height = 250;
	            myImg.src = fileReader.result;
	            sumnailDiv.innerHTML = "";    		// 가지고 있는 거 다 버리기!
	            sumnailDiv.appendChild(myImg);    	// div태그에 img 태그 자식으로 넣기!
	        };
		};

		function findMyAddr(){
			 new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("mem_addr2").value = '';
		                
		                } else{
		                    document.getElementById("mem_addr2").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('mem_postnum').value = data.zonecode;
		                document.getElementById("mem_addr1").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("mem_addr2").focus();
		            }
		        }).open();
		}
		
		function eh_autoValueForAddr(){
			document.getElementById("mem_tel").value = '010-4956-7634';	
			document.getElementById("mem_tel2").value = '010-4956-7634';	
			document.getElementById("mem_email").value = 'onetwo@naver.com';	
			document.getElementById("mem_addr2").value = '101동 404호';	
			document.getElementById("mem_bank").value = '국민은행';
			document.getElementById("mem_depo").value = '김도윤';
			document.getElementById("mem_banknum").value = '17260204144348';
		}
		
		
</script>