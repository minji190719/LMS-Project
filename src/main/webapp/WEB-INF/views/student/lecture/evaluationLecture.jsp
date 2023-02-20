<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#evalBoard{
	height:320px;
}

#icon{
	position:relative;
	top:3px;
}

</style>
<div class="container-fluid">
<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>강의평가</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/evaluation/home">강의평가</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

	<div class="row">	
	<div class="col-12 mt-3">
		<div class="card">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">학기 정보</h5>
				<div class="d-flex">
					<div class="col-3">
						<label for="year" class="custom-font-dark"><i class="fa-solid fa-circle-down mr-1"></i>년도</label> <input
							type="text" class="form-control input-default" placeholder="2022" id="year">
					</div>
					<div class="col-3">
						<label for="semester" class="custom-font-dark"><i class="fa-solid fa-circle-down mr-1"></i>학기</label> <input
							type="text" class="form-control input-default" placeholder="2" id="semester">
					</div>
					<div class="col-3">
						<label for="smemno" class="custom-font-dark"><i class="fa-solid fa-circle-down mr-1"></i>학번</label> <input
							type="text" class="form-control input-default" placeholder="20220001" id="smemno">
					</div>
					<div class="col-3">
						<label for="memName" class="custom-font-dark"><i class="fa-solid fa-circle-down mr-1"></i>이름</label> <input
							type="text" class="form-control input-default" placeholder="김도윤" id="memName">
					</div>
				</div>
				
				</div>
				</div>
			</div>

	<div class="col-12">
		<div class="card">
			<div class="card-body">
			<div class="col-12">
				<h5 class="font-weight-bold mb-1">강의평가실시현황</h5>
				<div class="ml-2 mb-5 text-right">
					<span class="font-weight-bold">※ 강의평가 결과는 교원업적평가에 반영되고 강사 위촉시
						자료로 활용되며, 평가내용이 교과목별 담당교수에게 전달되어 교수내용 및 수업방식의 개선에 활용됩니다.
					공정하고 진지한 응답을 부탁드립니다.</span>
				</div>
				<table class="table">
						<tr>
							<td class="text-dark custom-font-bold">대상 :</td>
							<td class="text-center custom-font-bold" id="evalNum"></td>
							<td class="text-dark custom-font-bold ">실시 :</td>
							<td class="text-center custom-font-green" id="doNum"></td>
							<td class="text-dark custom-font-bold ">미실시 :</td>
							<td class="text-center custom-font-red" id="notNum"></td>
							<td> </td>
							<td class="bg-white text-danger custom-font-bold text-right" id="posibleShow">성적조회불가능</td>
						</tr>
				</table>				
			</div>
			<div class="table-responsive col-12 overflow-auto" id="evalBoard">
				<table class="table table-hover table-sticky">
					<thead>
						<tr class="custom-theader" style="position: relative; top: -10px;">
							<th>교과목번호</th>
							<th>교과목명</th>
							<th>이수구분</th>
							<th>학점</th>
							<th>담당교수</th>
							<th>평가상태</th>
						</tr>
					</thead>
					<tbody id="myLecGrade" style="cursor:pointer;">

					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>

	<div class="col-12">
		<div class="card">
			<div class="card-body">
			<div class="col-12 text-center">
				<i class="fas fa-chevron-circle-up fa-2x" id="icon"></i>
			</div>
			<div class="col-12 custom-acotianOff pt-1" id="dataBox">
					<div class="row">
						<div id="contentBox" class="ml-5 col-11">
							<form id="evalForm" class="col-12 flex-fill">
								<input type="text" value="교과목번호" id="lecCode" class="input-default text-center custom-font-dark" readonly>  
								<input type="text" value="과목명" id="lecName" class="input-default text-center custom-font-dark" readonly> 
								<input type="text" value="교수명" id="proName" class="input-default text-center custom-font-dark" readonly>
								<br><br><br>
								<table class="table table-sm custom-font-bold">
									<thead>
										<tr>
											<th class="custom-font-dark">유형 : 공통강의평가<hr></th>
											<th class="text-center">매우그렇다.<hr></th>
											<th class="text-center">그렇다.<hr></th>
											<th class="text-center">보통이다.<hr></th>
											<th class="text-center">아니다.<hr></th>
											<th class="text-center">매우아니다.<hr></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><p>1. 수업의 목표와 내용에 연관된 핵심적인 내용들이 다루어 졌다.</p></td>
											<td class="text-center"><input type="radio" value="5" name="q1"></td>
											<td class="text-center"><input type="radio" value="4" name="q1"></td>
											<td class="text-center"><input type="radio" value="3" name="q1"></td>
											<td class="text-center"><input type="radio" value="2" name="q1"></td>
											<td class="text-center"><input type="radio" value="1" name="q1"></td>
										</tr>
										<tr>
											<td><p>2. 교수는 학문적 이해를 바탕으로 열성적으로 수업을 진행하였다.</p></td>
											<td class="text-center"><input type="radio" value="5" name="q2"></td>
											<td class="text-center"><input type="radio" value="4" name="q2"></td>
											<td class="text-center"><input type="radio" value="3" name="q2"></td>
											<td class="text-center"><input type="radio" value="2" name="q2"></td>
											<td class="text-center"><input type="radio" value="1" name="q2"></td>
										</tr>
										<tr>
											<td><p>3. 수업을 통하여 해당분야에 대한 이해와 지식이 향상되었다.</p></td>
											<td class="text-center"><input type="radio" value="5" name="q3"></td>
											<td class="text-center"><input type="radio" value="4" name="q3"></td>
											<td class="text-center"><input type="radio" value="3" name="q3"></td>
											<td class="text-center"><input type="radio" value="2" name="q3"></td>
											<td class="text-center"><input type="radio" value="1" name="q3"></td>
										</tr>
										<tr>
											<td><p>4. 교수는 철저하게 수업을 관리하였다.(출결관리, 학습분위기 조성, 휴강 시 보강 등)</p></td>
											<td class="text-center"><input type="radio" value="5" name="q4"></td>
											<td class="text-center"><input type="radio" value="4" name="q4"></td>
											<td class="text-center"><input type="radio" value="3" name="q4"></td>
											<td class="text-center"><input type="radio" value="2" name="q4"></td>
											<td class="text-center"><input type="radio" value="1" name="q4"></td>
										</tr>
										<tr>
											<td><p>5. 수업은 전반적으로 만족스러웠다.</p></td>
											<td class="text-center"><input type="radio" value="5" name="q5"></td>
											<td class="text-center"><input type="radio" value="4" name="q5"></td>
											<td class="text-center"><input type="radio" value="3" name="q5"></td>
											<td class="text-center"><input type="radio" value="2" name="q5"></td>
											<td class="text-center"><input type="radio" value="1" name="q5"></td>
										</tr>
										<tr>
											<td colspan=6>
												<div class="row">
													<div class="col-5">
														<p>6. 강의내용 및 방법에 개선해야할 점이 있다면 무엇이 있을까요?</p>
														<textarea class="input-default" rows="5" cols="55" style="resize:none;" id="q6"></textarea>
													</div>
													<div class="col-6 ml-5 pt-5 mr-0">
														※유의사항※<br>
														강의평가시 평가답변은 <span style="color:red;">전혀 그렇지 않다.</span> 그렇지 않다. 보통이다. 그렇다. 
														<span style="color:blue;">매우그렇다.</span> 입니다.<br>
														강의평가 답변시에 한번 더 확인 후 강의평가를 완료하기 바라며, 저장후에는 수정이 <span style="color:red;">불가능</span>함을 다시 한번 알려드립니다.
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<input type="button" class="btn btn-primary mb-2 btn custom-btn-s" value="제출" id="evalBtn">
								<input type="button" class="btn btn-outline-dark mb-2 btn" value="자동완성" id="autoBtn">
							</form>
						</div>
					</div>
				</div>

			
		</div>
		</div>
		</div>
	</div>
</div>
<script>
var nowClick;
let autoBtn;
window.onload = function(){
	
	showList();
	keyEvent();
}

function keyEvent(){
	
	//자동완성
	autoBtn = document.querySelector("#autoBtn");
	autoBtn.addEventListener("click", function(){
		let q1s = document.getElementsByName("q1");
		let q2s = document.getElementsByName("q2");
		let q3s = document.getElementsByName("q3");
		let q4s = document.getElementsByName("q4");
		let q5s = document.getElementsByName("q5");
		let q6 = document.querySelector("#q6");
		
		q1s[0].checked = true;
		q2s[1].checked = true;
		q3s[0].checked = true;
		q4s[1].checked = true;
		q5s[0].checked = true;
		q6.innerText = "그동안 고생많으셨습니다.";
	})
	
	// 등록버튼요
	var evalBtn = document.querySelector("#evalBtn");
	evalBtn.addEventListener("click", function(){
		
		var evalArray = [];
		var jsonObject={};
		var countCheck = 0;
		for(let i=1;i<=5;i++){
			var question = document.getElementsByName("q"+i);
			question.forEach((data,j)=>{
				if(data.checked){
					var value = data.value;
					jsonObject["ls_question"+i] = value*(1);
					countCheck++;
					
				}
			})
		}
		jsonObject["lec_code"] = document.querySelector("#lecCode").value;
		jsonObject.ls_content=document.querySelector("#q6").value;
		evalArray.push(jsonObject);
		
		// 항목을 전부 체크하지않았을때 예외처리 해줘야 합니다.
		if(countCheck < 5){
				swal({
				   text: "모든 항목을 체크하셔야 합니다.",
				   icon: "warning",
		           buttons:{
		              select:"확인",
		           }
		        })
			return;
		}

		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		
		var lecCode = document.querySelector("#lecCode").innerText;
		// DB 작업
		
		$.ajax({
			url:"/evaluation/insertEval",
			data:JSON.stringify(jsonObject),
			type:"post",
	     	beforeSend : function(xhr){
	        	xhr.setRequestHeader(header, token);
	        },
			contentType:"application/json ",
			dataType:"text",
			success:function(res){
				   swal({
					   title: "완료",
					   text: "강의 평가가 완료되었습니다.",
					   icon: "success",
			           buttons:{
			              select:"확인"
			           }
			        })
				evalBtn.disabled=true;
				successEval();
				checkPosible();
				window.scrollTo({ left: 0, top: 110, behavior: "smooth" });
			},
			error:function(xhr){
				swal({
					   text: "잘못 입력하셨습니다.",
					   icon: "danger",
			           buttons:{
			              select:"확인"
			           }
		          });
			}
		})
	})
}

//평가완료시
function successEval(){
	nowClick.children[5].innerHTML = "<span class='text-success'>실시</span>";
	var doNum = document.querySelector("#doNum");
	var notNum = document.querySelector("#notNum");
	
	doNum.innerText = doNum.innerText*(1) + 1;
	notNum.innerText = notNum.innerText*(1) - 1;
	
	document.querySelector("#dataBox").classList.remove("custom-acotianOn")
	document.querySelector("#dataBox").classList.add("custom-acotianOff")
	let trTag = document.querySelector(".onBox");
	trTag.classList.replace("bg-wwGreen","bg-white");
	trTag.classList.remove("onBox");
}


function checkPosible(){
	var evalNum = document.querySelector("#evalNum");
	var doNum = document.querySelector("#doNum");
	
	if(evalNum.innerText == doNum.innerText){
		document.querySelector("#posibleShow").innerHTML = "<span class='text-success'>성적조회가능</span>";
		   swal("현재학기성적조회 페이지로 이동하시겠습니까?",{
	            buttons:{
	               select:"확인",
	               cancel:"취소"
	            }
	         }).then((value)=>{
	            console.log(value)
	            
	            switch(value){
	            case "select":
	               location.href="/student/myLecGradeNow";
	               break;
	            default:
	               break;
	            }
	         })
	}
	
	
}

function showList(){

	$.ajax({
		url : "/evaluation/myEvalList",
		type: "get",
		success:function(res){
			
			var count = res.length;
			var doEval = 0;
			var notEval = 0;
			var myLecGrade = document.querySelector("#myLecGrade");
			
			var text = '';
			
			res.forEach((data, i) => {
				text += '<tr class="custom-font-dark bg-white" onclick="detailLec(this)">';
				text += '<td>'+data.LEC_CODE+'</td>';
				text += '<td>'+data.LH_LECNAME+'</td>';
				text += '<td>'+data.LG_AREA+'</td>';
				text += '<td>'+data.LH_CREDIT+'</td>';
				text += '<td>'+data.LH_PROFESSOR+'</td>';
				if(data.LS_STATE == 0){
					text += '<td><span style="color:red;">미실시</span></td>';
				}else{
					text += '<td><span class="text-success">실시</span></td>';
				}
				text += '</tr>';
				
				if(data.LS_STATE == 0){
					notEval++;
				}
				if(data.LS_STATE == 1){
					doEval++
				}
			});
			
			if(notEval == 0){
				
				
				var posibleShow = document.querySelector("#posibleShow");
				posibleShow.innerHTML = "<span class='text-success'>성적조회가능</span>"
				
			}
			
			myLecGrade.innerHTML += text;
			var evalNum = document.querySelector("#evalNum");
			evalNum.innerText = count;
			var doNum = document.querySelector("#doNum");
			doNum.innerText = doEval;
			var notNum = document.querySelector("#notNum");
			notNum.innerText = notEval;
			
		}
	})
}


// 클릭시 아코디언 대충만들어서 지저분한상태
function detailLec(data){
	
	var evalBtn = document.querySelector("#evalBtn");
	if(data.children[5].children[0].innerText=="실시"){
		evalBtn.disabled = true;
	}else{
		evalBtn.disabled = false;
	}
	
	// 내용이 담김 상자
	var dataBox = document.querySelector("#dataBox");
	nowClick = data;
	
	
	//열고 닫는 함수
	// 닫힌상태로 누르면 열리고, 열린상태에서 다른사람꺼 눌렀을때는 안닫혀야함
	if(dataBox.classList.contains("custom-acotianOn")){
		if(data.classList.contains("onBox")){
			data.classList.toggle("onBox");
			
			data.classList.toggle("bg-white");
			data.classList.toggle("bg-wwGreen");
			
			iconRotate(data);
			openAco(dataBox);
			formReset(true);
			window.scrollTo({ left: 0, top: 400, behavior: "smooth" });
		}else{
			// 여기선 안닫힘
			var searchOnBox = document.querySelector(".onBox")
			
			data.classList.toggle("bg-white");
			data.classList.toggle("bg-wwGreen");
			searchOnBox.classList.toggle("bg-white");
			searchOnBox.classList.toggle("bg-wwGreen");
			
			searchOnBox.classList.toggle("onBox");
			data.classList.toggle("onBox");
			formReset(false);
			formDataAdd();
		}
	}else{
		// 현재 닫혀있음
		data.classList.toggle("bg-white");
		data.classList.toggle("bg-wwGreen");
		
		data.classList.toggle("onBox");
		formDataAdd();
		iconRotate(data);
		openAco(dataBox);
		window.scrollTo({ left: 0, top: 800, behavior: "smooth" });
	}
	

}
function openAco(dataBox){
	
	dataBox.classList.toggle("custom-acotianOn");
	dataBox.classList.toggle("custom-acotianOff");
}

function formReset(flag){
	var evalForm = document.querySelector("#evalForm");
	
	if(flag){
		setTimeout(function(){
			evalForm.reset();
		}, 400)
	}else{
		evalForm.reset();
	}
	
}
function formDataAdd(){
	
	var contentBox = document.querySelector("#contentBox");
	
	var lecCode = document.querySelector("#lecCode");
	var lecName = document.querySelector("#lecName");
	var proName = document.querySelector("#proName");
	lecCode.value = nowClick.children[0].innerText;
	lecName.value = nowClick.children[1].innerText;
	proName.value = nowClick.children[4].innerText;
	
}

function iconRotate(data){
	var dataBox = document.querySelector("#dataBox");
	var imageIcon = document.querySelector("#icon");
	var rotate;
	
	rotate = "rotate(180deg)";
	if(dataBox.classList.contains("custom-acotianOn")){
		rotate = "rotate(0)";
	}
	
	imageIcon.style.transform = rotate;
	imageIcon.style.transition = "all 0.35s";
	
}


</script>
