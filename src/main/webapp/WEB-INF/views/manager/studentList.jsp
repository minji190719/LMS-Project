<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;학생 조회<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/Mstudent/studentAllList">학생 조회</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-7" >
		<div class="card">
			<div class="card-body">
				<div class="alert alert-danger">※ 개인정보를 제공받은 목적 외의 용도로 이용하거나 이를 제3자에게 제공하는 경우 처벌을 받을 수 있습니다.</div>
				<div class="form-group row">
					<div class="col-3">
						<select id="dep" onchange="getAllStudentList()"
							class="form-control input-default">
							<option selected="selected" value="">=== 학과 선택 ===</option>
							<option value="전자공학과">전자공학과</option>
							<option value="컴퓨터공학과">컴퓨터공학과</option>
							<option value="실용음악과">실용음악과</option>
							<option value="연극영화과">연극영화과</option>
							<option value="성악과">성악과</option>
							<option value="무용과">무용과</option>
							<option value="건축공학과">건축공학과</option>
							<option value="국어교육과">국어교육과</option>
							<option value="영어교육과">영어교육과</option>
							<option value="수학교육과">수학교육과</option>
							<option value="사법학과">사법학과</option>
							<option value="공법학과">공법학과</option>
							<option value="국어국문학과">국어국문학과</option>
							<option value="영어영문학과">영어영문학과</option>
							<option value="심리학과">심리학과</option>
							<option value="경제학과">경제학과</option>
							<option value="경영학과">경영학과</option>
							<option value="호텔경영학과">호텔경영학과</option>
							<option value="사회학과">사회학과</option>
							<option value="인류학과">인류학과</option>
							<option value="정치외교학과">정치외교학과</option>
						</select>
					</div>
					<div class="col-3">
						<select id="record" onchange="getAllStudentList()" class="form-control input-default">
							<option selected="selected" value="">=== 학적 상태 ===</option>
							<option value="재학">재학</option>
							<option value="휴학">휴학</option>
							<option value="졸업">졸업</option>
							<option value="자퇴">자퇴</option>
						</select>
					</div>
					<div class="col-3">
						<input type="text" class="form-control input-default" id="name" oninput="getAllStudentList()" placeholder="이름 검색">
					</div>
					<div class="col-3" style="display: flex;justify-content: flex-end;">
						<button type="button" class="btn btn-primary custom-btn-m" onclick="btnSendEmail()">이메일 발송</button>
					</div>
				</div>         
				 <div class="table-responsive custom-table1">
				     <table class="table table-hover" id="EH_MtableTest">
				         <thead class="custom-theader-m">
				             <tr>
				                 <th width="5%"><input type="checkbox" onclick="checkAll(this)"></th>
				                 <th width="5%">No</th>
				                 <th width="15%">학번</th>
				                 <th width="10%">성명</th>
				                 <th width="10%" >성별</th>
				                 <th width="20%">학과명</th>
				                 <th width="10%">입학년도</th>
				                 <th width="10%" >학적상태</th>
				                 <th width="15%"></th>
				             </tr>
				         </thead>
				         <tbody id="ajaxMprofessorList" style="height: 550px;">
<!-- 				           ajax part -->
				         </tbody>
				     </table>
				 </div>
			</div>
		</div>
	</div>
   <div class="col-lg-5" id="divForEmail">
        <div class="card" id="studentDetail">
			<div class="card-body" style="padding-top:0px; height: 800px;">
				<br/><br/>
				<div class="card-title">
					<h5 class="custom-m custom-bold">학생 상세 정보</h5>
				</div>
				<br/>
				<div class="basic-form" style="">
                   <form id="updateForm">
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>학번</label>
                               <input type="text" id="smemNo" class="form-control input-default" disabled="disabled">
                               <input type="hidden" id="volo_code">
                           </div>
                           <div class="form-group col-md-6">
                               <label>성명</label>
                               <input type="text" id="stuName" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>학과</label>
                               <input type="text" id="stuDep" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>학년</label>
                               <input type="text" id="stuGrade" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>성별</label>
                               <input type="text" id="memSex" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>연락처</label>
                               <input type="text" id="memTel" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>입학년도</label>
                               <input type="text" id="stuJoin" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>학적상태</label>
                               <input type="text" id="stuRecord" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <br><br>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>이메일</label>
                               <input type="text" id="memEmail" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6" style="display: flex; align-self: flex-end;">
		                       <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="btnSendEach(this)">이메일 발송</button>&nbsp;&nbsp;&nbsp;&nbsp;
                           </div>
                       </div>
                    </form>
                    <br/>
                   	<div style="float: right;">
                       <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnReset()">초기화</button>
                   	</div>	
               </div>
            </div>
        </div>
     </div>
   
</div>	
</body>

<script type="text/javascript">
window.onload = function(){
	var table = $("#EH_MtableTest");
	getAllStudentList();
	
	jQuery.noConflict(); // 충돌방지
}

//신청자 및 등록자 리스트 불러오는 메소드
function getAllStudentList(){
	
	var dep = $("#dep").val();
	var record = $("#record").val();
	var name = $("#name").val();
	
	
	var ajaxMprofessorList = $("#ajaxMprofessorList");
	var sendData = {
			"stu_dep" : dep,
			"stu_record" : record,
			"mem_name" : name
	}
	
	console.log("값 체크1 : ",dep);
	console.log("값 체크2 : ",record);
	console.log("값 체크3 : ",name);
	
	$.ajax({
		method : "GET",
		url : "/Mstudent/getAllStudentList",
		data : sendData,
		dataType : "json",
		success : function(resList){
			console.log(resList);	
			
			ajaxMprofessorList.html(getList(resList));
		}
		
	})
	
}

const getList = resList => {
	let str = "";
	
	if(resList.length == 0) {
		str += "<tr><td colspan='9'>학생 리스트가 존재하지 않습니다</td></tr>";
		console.log("체크해봅시다1")
		
	}else{
		console.log("체크해봅시다2")
		
		for(var i = 0; i < resList.length; i++){
				str += "<tr style='text-align:center;'>";
				str += `<td width="5%"><input id="checkBoxForEmail" type="checkbox" value="\${resList[i].MEM_EMAIL}"></td>`;
				str += `<td width="5%">\${i+1}</td>`;
				str += `<td width="15%">\${resList[i].SMEM_NO}</td>`;
				str += `<td width="10%">\${resList[i].MEM_NAME}</td>`;
				str += `<td width="10%">\${resList[i].MEM_SEX}</td>`;
				str += `<td width="20%">\${resList[i].STU_DEP}</td>`;
				str += `<td width="10%">\${resList[i].STU_JOINYEAR}</td>`;
				str += `<td width="10%" >\${resList[i].STU_RECORD}</td>`;
				str += `<td width="15%"><span id="\${resList[i].SMEM_NO}" name="spanBtn" class="label label-pill label-dark" style="cursor: pointer;" onclick="btnStudentDetail('\${resList[i].SMEM_NO}',this)" >보기</span></td>`;
				str += "</tr>";
		}
	}
	return str;
}




function btnStudentDetail(smem_no,e){
	
	let clickBg = document.querySelector(".clickBg");
	if(clickBg){
		clickBg.classList.remove("clickBg");
	}
	e.parentElement.parentElement.classList.add("clickBg");

	
	console.log("값 확인 : ",smem_no);
	
	var smemNo = $("#smemNo");
	var mem_name = $("#stuName");
	var stu_dep = $("#stuDep");
	var stu_grade = $("#stuGrade");
	var mem_sex = $("#memSex");
	var mem_tel = $("#memTel");
	var stu_join = $("#stuJoin");
	var stu_record = $("#stuRecord");
	var mem_email = $("#memEmail");
	
	
	$.ajax({
		url : "/Mstudent/getStudentDetail",
		method : "GET",
		data : {"smem_no" : smem_no},
		success : function(res){
// 			console.log(res);
			
			smemNo.val(res.SMEM_NO);
			mem_name.val(res.MEM_NAME);
			stu_dep.val(res.STU_DEP);
			stu_grade.val(res.STU_SCHYEAR);
			mem_sex.val(res.MEM_SEX);
			mem_tel.val(res.MEM_TEL);
			stu_join.val(res.STU_JOINYEAR);
			stu_record.val(res.STU_RECORD);
			mem_email.val(res.MEM_EMAIL);
		
			
		}
	})
	
	
	
}

function btnSendEmail(){
	var studentDetail = document.getElementById("studentDetail");
	var divForEmail = document.getElementById("divForEmail");
// 	var checkBoxForEmail = document.querySelectorAll("#checkBoxForEmail");
// 	checkBoxForEmail
	
	var checked = document.querySelectorAll("input[type='checkbox']:checked");
	var sort = [];
	
// 	console.log(checked)
	
	
	
	jQuery.noConflict(); // 충돌방지
	
// 	console.log("값 확인입니다!! ",checkBoxForEmail);
	
	var str = `<div class="col-12">
			        <div class="card" id="emailForStudent" style="height: 800px; overflow:auto;"><br><br>
			            <div class="card-body" style="padding-top:0px;">
							<div class="card-title">
								<h5 class="custom-s custom-bold">
									이메일 발송
								</h5>
							</div>
			           		<div class="basic-form">
			                    <form id="emailForm">
			                        <div class="form-group row">
			                            <label class="col-sm-2 col-form-label">받는 사람</label>
			                            <div class="col-sm-10">
			                                <input type="text" id="receiver" name="receiver" style="width: 100%;" class="form-control input-default" value="">
			                            </div>
			                        </div>
			                        <div class="form-group row">
			                            <label class="col-sm-2 col-form-label">제목</label>
			                            <div class="col-sm-10">
			                                <input type="text" id="title" name="title" style="width: 100%;" class="form-control input-default">
			                            </div>
			                        </div>
			                        <div class="form-group row">
			                            <label class="col-sm-2 col-form-label">파일첨부</label>
			                            <div class="input-group mb-3" style="width: 79%; margin-left: 14px;">
			                                <div class="input-group-prepend"><span class="input-group-text">Upload</span>
			                                </div>
			                                <div class="custom-file">
			                                    <input type="file" class="custom-file-input" id="emailFile" name="emailFile">
			                                    <label class="custom-file-label"></label>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="form-group">
			                            <textarea style="float: right; width: 82%;" class="" rows="10"  id="content2" name="content"></textarea>
			                        </div>
			                    </form>
			                </div>
			                <div style="float: right;">
				                <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="btnEmailSend()">보내기</button>
				                <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnAutoVal()">자동완성</button>
				                <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnEmailReset()">초기화</button>
				                <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnBack()">돌아가기</button>
			               	</div>	
			            </div>
			        </div>
			     </div>`;
			     
			 
			    

	
	studentDetail.remove();
	divForEmail.innerHTML = str;
	
	var receiver = document.getElementById("receiver");	
	
	for(var i=0; i<checked.length; i++){
		sort.push(checked[i].value);
		receiver.value += sort[i] + ",";
	}
	console.log(sort);
	
	var summernote = $("#content2");
	 	
 	summernote.summernote({
 	    height: 300,        // 에디터 높이
 	    minHeight: 300,    // 최소 높이
 	    maxHeight: null,    // 최대 높이(null 제한없음)
 	    focus: false,        // 에디터 로딩후 포커스를 맞출지 여부
 	    lang: "ko-KR",      // 한글 설정
 	    toolbar: [
 	                ['fontname', ['fontname']],     // 글꼴 설정
 	                ['fontsize', ['fontsize']],    // 글자 크기 설정
 	                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
 	                ['color', ['forecolor','color']],    // 글자색
 	                ['table', ['table']],    // 표만들기
 	                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
 	                ['height', ['height']],    // 줄간격
 	                ['insert',['picture','link','video']],    // 그림첨부, 링크만들기, 동영상첨부
 	                ['view', ['fullscreen', 'codeview', 'help']]    // 코드보기, 확대해서보기, 도움말
 	    ],
 	      // 추가한 글꼴
 	    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 	     // 추가한 폰트사이즈
 	    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

 	});

	
}
function btnBack(){
	
	var emailForStudent = document.getElementById("emailForStudent");
	emailForStudent.remove();
	
	var str = `<div class="col" id="divForEmail">
		        <div class="card"  id="studentDetail" style="height: 800px; overflow:scroll; overflow-x:hidden; overflow-y:hidden;"><br><br>
		            <div class="card-body" style="padding-top:0px;">
						<div class="card-title">
							<h5 class="custom-m custom-bold">학생 상세 정보</h5>
						</div>
						<br/>
		               <div class="basic-form" style="">
		                   <form id="updateForm">
	                       <div class="form-row">
	                           <div class="form-group col-md-6">
	                               <label>학번</label>
	                               <input type="text" id="smemNo" class="form-control input-default" disabled="disabled">
	                               <input type="hidden" id="volo_code">
	                           </div>
	                           <div class="form-group col-md-6">
	                               <label>성명</label>
	                               <input type="text" id="stuName" class="form-control input-default" disabled="disabled">
	                           </div>
	                       </div>
	                       <div class="form-row">
	                           <div class="form-group col-md-6">
	                               <label>학과</label>
	                               <input type="text" id="stuDep" class="form-control input-default" disabled="disabled">
	                           </div>
	                           <div class="form-group col-md-6">
	                               <label>학년</label>
	                               <input type="text" id="stuGrade" class="form-control input-default" disabled="disabled">
	                           </div>
	                       </div>
	                       <div class="form-row">
	                           <div class="form-group col-md-6">
	                               <label>성별</label>
	                               <input type="text" id="memSex" class="form-control input-default" disabled="disabled">
	                           </div>
	                           <div class="form-group col-md-6">
	                               <label>연락처</label>
	                               <input type="text" id="memTel" class="form-control input-default" disabled="disabled">
	                           </div>
	                       </div>
	                       <div class="form-row">
	                           <div class="form-group col-md-6">
	                               <label>입학년도</label>
	                               <input type="text" id="stuJoin" class="form-control input-default" disabled="disabled">
	                           </div>
	                           <div class="form-group col-md-6">
	                               <label>학적상태</label>
	                               <input type="text" id="stuRecord" class="form-control input-default" disabled="disabled">
	                           </div>
	                       </div>
	                       <br><br><br>
	                       <div class="form-row">
	                           <div class="form-group col-md-6">
	                               <label>이메일</label>
	                               <input type="text" id="memEmail" class="form-control input-default" disabled="disabled">
	                           </div>
	                           <div class="form-group col-md-6" style="display: flex; align-self: flex-end;">
			                       <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="btnSendEach(this)">이메일 발송</button>&nbsp;&nbsp;&nbsp;&nbsp;
	                           </div>
	                       </div>
	                    </form>
	                    <br/><br/><br/>
	                   	<div style="float: right;">
	                       <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnReset()">초기화</button>
	                   	</div>
		               </div>
		            </div>
		        </div>
		     </div>`;
		     
	divForEmail.innerHTML = str;
}




function checkAll(selectAll)  {
	  const checkboxes  = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}


function btnReset(){
	var form = document.querySelector("#updateForm")
	form.reset();
}

function btnEmailReset(){
	var emailForm = document.querySelector("#emailForm")
	
	emailForm.reset(); 
}


function btnSendEach(){
	var studentDetail = document.getElementById("studentDetail");
	var divForEmail = document.getElementById("divForEmail");
	var memEmail = document.getElementById("memEmail").value;
	
	
	console.log(memEmail)
	
	var str = `<div class="col">
			        <div class="card" id="emailForStudent" style="height: 800px; overflow:scroll; overflow-x:hidden; overflow-y:hidden;"><br><br>
			            <div class="card-body" style="padding-top:0px;">
							<div class="card-title">
								<h5 class="custom-m custom-bold">이메일 발송</h5>
							</div>
			           		<div class="basic-form">
			                    <form id="emailForm">
			                        <div class="form-group row">
			                            <label class="col-sm-2 col-form-label">받는 사람</label>
			                            <div class="col-sm-10">
			                                <input type="text" id="receiver" name="receiver" style="width: 100%;" class="form-control input-default" >
			                            </div>
			                        </div>
			                        <div class="form-group row">
			                            <label class="col-sm-2 col-form-label">제목</label>
			                            <div class="col-sm-10">
			                                <input type="text" id="title" name="title" style="width: 100%;" class="form-control input-default">
			                            </div>
			                        </div>
			                        <div class="form-group row">
			                            <label class="col-sm-2 col-form-label">파일 첨부</label>
			                            <div class="col-sm-10">
			                                <input type="file" id="emailFile" name="emailFile" class="form-control-file">
			                            </div>
			                        </div>
			                        <div class="form-group">
			                            <label>내용</label>
			                            <textarea style="float: right; width: 82%;" class="" rows="10"  id="content1" name="content"></textarea>
			                            <br>
			                        </div>
			                        <input type="checkbox" class="form-check-input" value=""> 
			                    </form>
			                </div>
			                <div style="float: right;">
				                <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="btnEmailSend()">보내기</button>
				                <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnAutoVal()">자동완성</button>
				                <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnEmailReset()">초기화</button>
				                <button type="button" class="btn mb-1 btn-outline-dark" onclick="btnBack()">돌아가기</button>
			               	</div>	
			            </div>
			        </div>
			     </div>`;
			     
			     
	
    
	studentDetail.remove();
	divForEmail.innerHTML = str;

	
	var receiver = document.getElementById("receiver");
	
    console.log(receiver);
	receiver.value = memEmail;

	var summernote1 = $("#content1");
 	
 	summernote1.summernote({
 	    height: 270,        // 에디터 높이
 	    minHeight: 300,    // 최소 높이
 	    maxHeight: null,    // 최대 높이(null 제한없음)
 	    focus: false,        // 에디터 로딩후 포커스를 맞출지 여부
 	   	codeviewFilter: false,
 	 	codeviewIframeFilter: false,
 	    lang: "ko-KR",      // 한글 설정
 	    toolbar: [
 	                ['fontname', ['fontname']],     // 글꼴 설정
 	                ['fontsize', ['fontsize']],    // 글자 크기 설정
 	                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
 	                ['color', ['forecolor','color']],    // 글자색
 	                ['table', ['table']],    // 표만들기
 	                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
 	                ['height', ['height']],    // 줄간격
 	                ['insert',['picture','link','video']],    // 그림첨부, 링크만들기, 동영상첨부
 	                ['view', ['fullscreen', 'help']]    // 코드보기(에디터자체에서지원하는것 XSS방지용 지금은 빼놓음), 확대해서보기, 도움말
 	    ],
 	      // 추가한 글꼴
 	    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 	     // 추가한 폰트사이즈
 	    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
 	    //이부분은 에디터 밑에 공백부분삭제
 	}).on("summernote.enter", function(we, e) {
        $(this).summernote("pasteHTML", "<br><br>");
        e.preventDefault();
    });

}


function btnEmailSend(){
	
// 	alert("이메일을 전송중입니다...")
	
	swal("이메일을 전송중입니다...",{buttons:"확인"})
	
	var emailFile = document.querySelector("#emailFile");
	var emailForm = document.getElementById("emailForm");
	var content12 = document.querySelector("#content1");
	let file = emailFile.files[0];
	//<br>태그 삭제부분
	content12.value = content12.value.replaceAll("<br>","");
	
	let formData = new FormData(emailForm);
	formData.append("emailFiles",file);
	
	console.log(formData);
	
	var token = $("meta[name='_csrf']").attr('content');
	
	$.ajax({
		type : "POST",
		url : "/mail/send",
		data : formData,
		contentType : false,
		processData : false,
		headers : {
			"X-CSRF-TOKEN" : token
		},
		success : function(res){
			
// 			alert(res);
			if(res == "OK"){
				swal("메일 전송 완료","","success",{buttons:"확인"})
				.then((value)=>{
					btnBack();
				})
			}
		}
	})
	
}




function btnAutoVal(){
	var summernote2 = $("#content2");
	var summernote1 = $("#content1");
	var title = $("#title");
	var content = $("#content");
// 	var str = "";
	
// 	console.log(str);	
	title.val("안녕하세요 한국대학교입니다. ");
	
	summernote1.summernote('editor.pasteHTML',
	'한국대학교 신규 웹메일 서비스 오픈 안내입니다. \n한국대학교 웹메일 서비스 개편과 관련하여 대학구성원 여러분에게 안내드립니다 2023.02.15(수) 부터 신규 웹메일 서비스를 오픈합니다. ');
	summernote2.summernote('editor.pasteHTML',
	'한국대학교 신규 웹메일 서비스 오픈 안내입니다. \n한국대학교 웹메일 서비스 개편과 관련하여 대학구성원 여러분에게 안내드립니다 2023.02.15(수) 부터 신규 웹메일 서비스를 오픈합니다. ');
}


	

// var summernote = $("#content");

// summernote.summernote({
//     height: 500,        // 에디터 높이
//     minHeight: 500,    // 최소 높이
//     maxHeight: null,    // 최대 높이(null 제한없음)
//     focus: false,        // 에디터 로딩후 포커스를 맞출지 여부
//     lang: "ko-KR",      // 한글 설정
//     toolbar: [
//                 ['fontname', ['fontname']],     // 글꼴 설정
//                 ['fontsize', ['fontsize']],    // 글자 크기 설정
//                 ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
//                 ['color', ['forecolor','color']],    // 글자색
//                 ['table', ['table']],    // 표만들기
//                 ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
//                 ['height', ['height']],    // 줄간격
//                 ['insert',['picture','link','video']],    // 그림첨부, 링크만들기, 동영상첨부
//                 ['view', ['fullscreen', 'codeview', 'help']]    // 코드보기, 확대해서보기, 도움말
//     ],
//       // 추가한 글꼴
//     fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
//      // 추가한 폰트사이즈
//     fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

// });






















</script>
</html>