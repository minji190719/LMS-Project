<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.studnentTotal{height:450px;}
.studentDetail{height:530px;}
.studentGrade{height:530px;}
.studnetAttend{height:200px;}

.thead-bg{
/* 	background-color:#eeafaf; */
	background-color : #EBEBEB;
	height : 30px;
}
.tbody-bg{
	background-color:#fff7f7;
}

.table-sticky-p thead tr th{
	position: sticky;top:0;
/* 	background-color : #eeafaf; */
/*  	background-color : #e9ddce;  고대 노란색 */
  	background-color : #EBEBEB;
  	
}

#bindTable{
	border-collapse: separate;
	border-spacing: 0 6px;

}


</style>

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>성적입력</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/professor/lecGrade">성적입력</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>
   
   <div class="row">
   		<div class="col-12">
   			<div class="card">
				<div class="card-body col-12 pt-2">
					<div class="stuScoreHeader d-flex justify-content-between mt-3">
						<div class="d-flex col-lg-6">
						<label class="text-dark custom-font-bold mr-sm-2 mt-2" style="width:30%;">내 강의 목록 </label>
<!-- 						<span class="text-dark custom-font-bold w-100">내 강의 목록 :</span> -->
						<select id="myLecList" class="custom-select mr-sm-2" style="width:200%;">
						</select>
						</div>

						<input type="button" class="btn mb-1 btn-dark custom-font-bold custom-btn-p" value="최종성적제출" id="finishBtn">
					
					</div>
   				</div>

         <div class="studnentTotal ml-4 mr-4 mb-5">
            <span class="ml-3">※성적목록 : 시험 성적은 중간과 기말을 합한 점수 입니다. 최종성적은 성적산출방법에 따라 자동으로 부여 되며 추가적인 성적은 직접 입력해야합니다.</span>
            <br><br>
            <form class="form overflow-auto height-400" id="tableForm">
	            <table class="table-sm table table-hover text-center text-dark table-sticky-p " id="bindTable" style="cursor:pointer;">
	               <thead class="thead-bg" id="headLine">
	                  <tr>
	                     <th>No.</th>
	                     <th>단과대학</th>
	                     <th>학과</th>
	                     <th>학년</th>
	                     <th>학번</th>
	                     <th>이름</th>
	                     <th>시험</th>
	                     <th>과제</th>
	                     <th>출결</th>
	                     <th>총점</th>
	                     <th>최종성적</th>
	                  </tr>
	               </thead>
	               <tbody id="studentBody" >
	                  
	               </tbody>
	            </table>   
            </form>            
         </div>
   			</div>
   		
   
   
	<div class="col-12 pl-0 d-flex">
      	<div class="card col-9 ml-0">
      	<div class="card-body">
         <div class="studentDetail row">
            <div class="col-4">
               <div class="mb-5">
                  <label for="year"><i class="fa-sharp fa-solid fa-circle-down mr-2"></i><span class="custom-font-dark">만점기준작성</span></label>
                  <table class="table table-bordered text-center text-dark col-12">
                  <thead class="thead-bg">    
                     <tr>
                        <th style="width:110px;">강의계획서</th>
                        <th>중간</th>
                        <th>기말</th>
                        <th>과제</th>
                        <th>출결</th>
                     </tr>
                  </thead>
                  <tbody class="tbody-bg">
                     <tr>
                        <td>성적반영비율</td>
                        <td>35%</td>
                        <td>35%</td>
                        <td>20%</td>
                        <td>10%</td>
                     </tr>
                     <tr>
                        <td>총수강인원</td>
                        <td id="totalStu">10명</td>
                        <td>점수평균</td>
                        <td colspan=2 id="studentAvg">0점</td>
                     </tr>
                  </tbody>   
                  </table>                  
               </div>
               <div class="col-12">
<pre>강의계획서 성적반영비율은 수정불가능 합니다. 
권장 비율   A 학점  20% 이내
           B 학점  50% 이내
           C,D 학점 100% 이내
</pre>
<table class="table table-sm text-center custom-font-bold mt-4" style="font-size:12px;">
	<tr>
		<th>구분</th>
		<th>일정</th>
	</tr>
	<tr>
		<td>성적 입력</td>
		<td>2023.1.25.(수) 09:00 ~ 2023.2.7.(화) 08:30</td>
	</tr>
	<tr>
		<td>성적 공시 및 정정</td>
		<td>2023.2.7.(화) 10:00 ~ 2023.2.14.(화) 17:00</td>
	</tr>
	<tr>
		<td>성적 확정</td>
		<td>2023.2.14.(수) 11:00</td>
	</tr>
</table>
               </div>
            </div>
            <div class="col-4">
                  <label for="year"><i class="fa-sharp fa-solid fa-circle-down mr-2"></i><span class="custom-font-dark">성적환산적용기준</span></label>
                  <table class="table table-bordered text-center text-dark col-12" id="changeCredit">
                  <thead class="thead-bg">    
                     <tr>
                        <th>순번</th>
                        <th>학점</th>
                        <th>인원(명)</th>
                        <th>비율(%)</th>
                        <th>비율합</th>
                     </tr>
                  </thead>
                  <tbody class="tbody-bg">
                     <tr>
                        <td>1</td>
                        <td>A+</td>
                        <td id="grade1"></td>
                        <td>0.0</td>
                        <td rowspan=2>20</td>
                     </tr>
                     <tr>
                        <td>2</td>
                        <td>A</td>
                        <td id="grade2"></td>
                        <td>0.0</td>
                     </tr>
                     <tr>
                        <td>3</td>
                        <td>B+</td>
                        <td id="grade3"></td>
                        <td>0.0</td>
                        <td rowspan=2>30</td>
                     </tr>
                     <tr>
                        <td>4</td>
                        <td>B</td>
                        <td id="grade4"></td>
                        <td>0.0</td>
                     </tr>
                     <tr>
                        <td>5</td>
                        <td>C+</td>
                        <td id="grade5"></td>
                        <td>0.0</td>
                        <td rowspan=5>50</td>
                     </tr>
                     <tr>
                        <td>6</td>
                        <td>C</td>
                        <td id="grade6"></td>
                        <td>0.0</td>
                     </tr>
                     <tr>
                        <td>7</td>
                        <td>D+</td>
                        <td id="grade7"></td>
                        <td>0.0</td>
                     </tr>
                     <tr>
                        <td>8</td>
                        <td>D</td>
                        <td id="grade8"></td>
                        <td>0.0</td>
                     </tr>
                     <tr>
                        <td>9</td>
                        <td>F</td>
                        <td id="grade9"></td>
                        <td>0.0</td>
                     </tr>
                     <tr>
                        <td colspan=2>합계</td>
                        <td id="gradeTotal">0</td>
                        <td>100%</td>
                        <td>100</td>
                     </tr>
                  </tbody>   
                  </table>              
            </div>
            <div class="col-4">
                 <label for="year"><i class="fa-sharp fa-solid fa-circle-down mr-2"></i><span class="custom-font-dark">출결상황</span></label>
                 <div class="overflow-auto" style="height:470px;">
                  <table class="table table-bordered text-center text-dark col-12 table-sticky-p shAttendTable">
					<thead class="thead-bg">
						<tr>
							<th>차수</th>
							<th>회차</th>
							<th>출석</th>
							<th>지각</th>
							<th>결석</th>
							<th>공결</th>
						</tr>
					</thead>  
					<tbody class="tbody-bg">
						<tr>
							<td rowspan=2>1주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>2주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>3주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>4주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>5주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>6주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>7주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>8주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>9주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>10주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>11주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>12주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>13주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>14주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td rowspan=2>15주차</td>
							<td>1</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
						<tr>
							<td>2</td>
							<td>o</td>
							<td>x</td>
							<td>x</td>
							<td>x</td>
						</tr>
					</tbody>
                  </table>   
                  </div> 
            </div>
         </div>
      	
      	</div>
      	</div>
      	
      	<div class="card col-3 ml-3">
      	<div class="card-body">
         <div class="studentGrade">
         	<span class="custom-font-dark">성적입력</span>
            <form class="form-horizontal pt-5">
               <div class="form-row">
                  <div class="form-group col-md">
                     <input type="text" class="form-control input-default" placeholder="단과대학" id="COL_NAME">  
                  </div>
                  <div class="col">
                     <input type="text" class="form-control input-default" placeholder="학과명" id="DEP_NAME"> 
                  </div>
               </div>      
                     
               <div class="form-row">
                  <div class="form-group col-md">
                     <input type="text" class="form-control input-default" placeholder="학번" id="SMEM_NO"> 
                  </div>
                  <div class="col">
                     <input type="text" class="form-control input-default" placeholder="이름" id="MEM_NAME">  
                  </div>
               </div>      
                     
               <div class="form-row">
                  <div class="form-group col-md-3">
                     <span>중간고사</span>
                     <input type="text" class="form-control input-default" placeholder="75">                  
                  </div>
                  <div class="form-group col-md-3">
                     <span>기말고사</span>
                     <input type="text" class="form-control input-default" placeholder="85">                  
                  </div>
                  <div class="form-group col-md-3">
                     <span>과제</span>
                     <input type="text" class="form-control input-default" placeholder="95">                  
                  </div>
                  <div class="form-group col-md-3">
                     <span>출결</span>
                     <input type="text" class="form-control input-default" placeholder="100">                  
                  </div>
               </div>
               
               <div class="form-row">
                  <div class="form-group col-md-4">
                     <span>학생평균</span>
                     <input type="text" class="form-control input-default" placeholder="" id="avgScore">
                  </div>
                  <div class="form-group col-md">
                     <span>총점</span>
                     <input type="text" class="form-control input-default" placeholder="" id="LGC_TOTALSCORE">
                  </div>
                  <div class="form-group col-md">
                     <span>석차</span>
                     <input type="text" class="form-control input-default" placeholder="" id="LGC_RANKING">
                  </div>
               </div>
                  <div class="form-group col-md-12">
                     <div class="form-row">
                        <div class="col-xs-9">
                           	<label class="col-xs-2 control-label">최종성적 부여</label>
                            <div class="row">
                           		<select id="grade">
                           			<option selected hidden="hidden">==선택==</option>
                           			<option value="A+">A+</option>
                           			<option value="A">A</option>
                           			<option value="B+">B+</option>
                           			<option value="B">B</option>
                           			<option value="C+">C+</option>
                           			<option value="C">C</option>
                           			<option value="D+">D+</option>
                           			<option value="D">D</option>
                           			<option value="F">F</option>
                           		</select>
                              <input type="button" class="btn btn-light ml-1" value="성적변경" id="changeBtn">   
                           </div>
                        </div>
                     </div>
                  </div>
            </form>
         </div>
      	
      	</div>
</div>
  </div> 		

   </div>
      	
      
<!--       <div class="col-3 bg-white ml-2 custom-div-radius pt-2 mb-3"> -->
<!--       </div> -->
   </div>

<script>
var dumyData = "";
var nowClick;
var lecture;

window.onload = function(){
	keyEventList();
	
	var headLine = document.querySelector("#headLine");
	var lecList = document.querySelector("#myLecList");
	
	headLine.addEventListener("click", function(){
		event.stopPropagation();
	})
	
	// 내 강의목록 출력 
	const promiseObj = () => new Promise((resolve, reject)=>{
		
		$.ajax({
			url:"/professor/myLecList",
			type:"get",
			success:function(res){
				var myLecList = document.querySelector("#myLecList");
				text = '';
				res.forEach((data, i) => {
					
					console.log(data.state)
					
					if(i == 0){
						if(data.state == 1){
							var finishBtn = document.querySelector("#finishBtn");
							finishBtn.classList.remove("btn-primary");
							finishBtn.classList.add("btn-secondary");
							finishBtn.value = "성적입력완료";
						}
						
						text += '<option value="'+data.LEC_CODE+'_'+data.state+'" selected="selected">'+data.LOL_NAME+'</option>';
					}else{
						text += '<option value="'+data.LEC_CODE+'_'+data.state+'">'+data.LOL_NAME+'</option>';
					}
				})
				myLecList.innerHTML = text;
				
				var lecCode = myLecList.value;
				var lecCodeOrigin = lecCode.split("_")[0];
				
				resolve(lecCodeOrigin);
			}
		})
		
	})
   
	promiseObj().then((data)=>{
		// 내강의에 맞는 학생 리스트 출력
	    lecGradeList(data);
	});
	
	// 키이벤트 
	lecList.addEventListener("change", function(){
		var studentBody = document.querySelector("#studentBody");
		studentBody.innerHTML = "";
		
		var finishBtn = document.querySelector("#finishBtn");
		
		finishBtn.classList.add("btn-primary");
		finishBtn.classList.remove("btn-secondary");
		finishBtn.value = "최종성적제출";
		
		
		if(lecList.value.split("_")[1] == 1){
			finishBtn.classList.remove("btn-primary");
			finishBtn.classList.add("btn-secondary");
			finishBtn.value = "성적입력완료";
		}
		
		lecGradeList(lecList.value.split("_")[0]);
	})
	
	// json 객체로 만들어서 보냅시다
	var finishBtn = document.querySelector("#finishBtn");
	finishBtn.addEventListener("click", function(){

	   swal("정말로 등록하시겠습니까?",{
            buttons:{
               select:"확인",
               cancel:"취소"
            }
         }).then((value)=>{
            console.log(value)
            
            switch(value){
            case "select":
        		var lecCode = document.querySelector("#myLecList");
        		var state = lecCode.options[lecCode.selectedIndex].value.split("_")[1];
        		
        		if(state == 1){
        			alert("이미 성적 입력을 마쳤습니다.")
        			return;
        		}
        		
        		var tableForm = document.querySelector("#tableForm");
        			
        		// tbody 하위 태그들
        		var tbodyTag = tableForm.children[0].children[1].children;
        		
        		var jsonObject=[];
        		
        		for(let i=0;i<tbodyTag.length;i++){
        			var tmpObj = {};
        			for(let j=0;j<tbodyTag[i].children.length;j++){
        				var inputTag = tbodyTag[i].children[j].children[0];
        				if(typeof(inputTag) != "undefined"){
        					var name = inputTag.getAttribute("name");
        					var value = inputTag.value;
        					tmpObj[name] = value;
        				}
        			}
        			
        			tmpObj.LEC_CODE = lecCode.value.split("_")[0];
        			tmpObj.LOL_NAME = lecCode.options[lecCode.selectedIndex].text;
        			tmpObj.rating = tbodyTag[i].children[10].children[2].value;
        			jsonObject.push(tmpObj)
        		}
        		
        		console.log(jsonObject)
        		addGrade(jsonObject);
               break;
            default:
               break;
            }
         })
// 		var lecCode = document.querySelector("#myLecList");
// 		var state = lecCode.options[lecCode.selectedIndex].value.split("_")[1];
		
// 		if(state == 1){
// 			alert("이미 성적 입력을 마쳤습니다.")
// 			return;
// 		}
		
// 		var tableForm = document.querySelector("#tableForm");
			
// 		// tbody 하위 태그들
// 		var tbodyTag = tableForm.children[0].children[1].children;
		
// 		var jsonObject=[];
		
// 		for(let i=0;i<tbodyTag.length;i++){
// 			var tmpObj = {};
// 			for(let j=0;j<tbodyTag[i].children.length;j++){
// 				var inputTag = tbodyTag[i].children[j].children[0];
// 				if(typeof(inputTag) != "undefined"){
// 					var name = inputTag.getAttribute("name");
// 					var value = inputTag.value;
// 					tmpObj[name] = value;
// 				}
// 			}
			
// 			tmpObj.LEC_CODE = lecCode.value.split("_")[0];
// 			tmpObj.LOL_NAME = lecCode.options[lecCode.selectedIndex].text;
// 			tmpObj.rating = tbodyTag[i].children[10].children[2].value;
// 			jsonObject.push(tmpObj)
// 		}
		
// 		addGrade(jsonObject);
	})
	
	
	// 동적태그 바인딩
    document.querySelector("#bindTable").addEventListener("click", function(e){
    	
	    var tmp;
    	if(e.target.parentElement.classList.contains("showInfo")){
    		tmp = e.target.parentElement;
    		var tmpBg = document.querySelector(".bg-gray");
	    	  if(tmpBg != null){
	    		  tmpBg.classList.remove("bg-gray");
	    	  } 
    		
	          document.querySelector("#COL_NAME").value = tmp.children[1].innerText;
	          document.querySelector("#DEP_NAME").value = tmp.children[2].innerText;
	          document.querySelector("#SMEM_NO").value = tmp.children[4].innerText;
	          document.querySelector("#MEM_NAME").value = tmp.children[5].innerText;
	          document.querySelector("#LGC_TOTALSCORE").value = tmp.children[9].innerText + "/100";
	          document.querySelector("#LGC_RANKING").value = tmp.children[0].innerText + "/" + dumyData.length;
	          document.querySelector("#grade").value = tmp.children[10].innerText;
	          
	          tmp.classList.add("bg-gray");
	          
	          nowClick = tmp;
    	}
   })
}

function myLecList(){
	
	const promiseObj = () => new Promise((resolve, reject)=>{
		
		$.ajax({
			url:"/professor/myLecList",
			type:"get",
			success:function(res){
				var myLecList = document.querySelector("#myLecList");
				text = '';
				res.forEach((data, i) => {
					if(i == 0){
						text += '<option value="'+data.LEC_CODE+'" selected="selected">'+data.LOL_NAME+'</option>';
					}else{
						text += '<option value="'+data.LEC_CODE+'">'+data.LOL_NAME+'</option>';
					}
				})
				myLecList.innerHTML = text;
				
				var lecCode = myLecList.value;
				resolve(lecCode);
			}
		})
		
	})
   
	promiseObj().then((data)=>{
		// 내강의에 맞는 학생 리스트 출력
	    lecGradeList(data);
	});
	
}

function lecGradeList(data){
	
	   var header = $("meta[name='_csrf_header']").attr('content');
	   var token = $("meta[name='_csrf']").attr('content');

	   // 학생 성적 불러오기
	   // 강의 코드  data
	   
	   // 프로마이스 하는중
	   
	   const promiseTest = () => new Promise((resolve, reject)=>{
		 
		   $.ajax({
			      url:"/professor/lecGrade/list",
			      data:{"lecCode" : data},
			      type:"post",
			      dataType:"json",
			      beforeSend : function(xhr){
			          xhr.setRequestHeader(header, token);
			      },
			      success:function(res){
			         var studentBody = document.querySelector("#studentBody");
			         dumyData = res;
			         
			         // 학점 비교
				     compareCredit(res);
			         
			         // 학생 평균
					  avgScore(res);
			         
			         // 리스트 출력
			         res.forEach((data,i) => {
				        text = '<tr class="text-center showInfo">';
			            text += '<td>'+(i+1)+'</td>';
			            text += '<td><input type="hidden" value="'+data.COL_NAME+'" name="COL_NAME">'+data.COL_NAME+'</td>'
			            text += '<td><input type="hidden" value="'+data.DEP_NAME+'" name="DEP_NAME">'+data.DEP_NAME+'</td>'
			            text += '<td><input type="hidden" value="'+data.STU_SCHYEAR+'" name="STU_SCHYEAR">'+data.STU_SCHYEAR+'</td>'
			            text += '<td><input type="hidden" value="'+data.MEM_NO+'" name="MEM_NO">'+data.MEM_NO+'</td>'
			            text += '<td><input type="hidden" value="'+data.MEM_NAME+'" name="MEM_NAME">'+data.MEM_NAME+'</td>'
			            text += '<td><input type="hidden" value="'+data.LGC_TEST+'" name="LGC_TEST">'+data.LGC_TEST+'</td>'
			            text += '<td><input type="hidden" value="'+data.LGC_TASK+'" name="LGC_TASK">'+data.LGC_TASK+'</td>'
			            text += '<td><input type="hidden" value="'+data.LGC_ATTEND+'" name="LGC_ATTEND">'+data.LGC_ATTEND+'</td>'
			            text += '<td><input type="hidden" value="'+data.LGC_TOTALSCORE+'" name="LGC_TOTALSCORE">'+data.LGC_TOTALSCORE+'</td>'
			            text += '<td><input type="hidden" value="'+data.grade+'" name="grade"><span>'+data.grade
			            + '</span><input type="hidden" value="'+data.rating+'" name="rating"></td>';
			            text += '</tr>';
			            
			            studentBody.innerHTML += text;
			            
			            resolve(res)
			         })
			      }
			   })
	   })
	   
	   promiseTest();
// 	   promiseTest().then((res) => {
// 		   addGrade(res);
// 	   })
}

function addGrade(data){
	 
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	$.ajax({
		url : "/professor/lecGrade/insert",
		data:JSON.stringify(data),
		type:"post",
		contentType: 'application/json',
		beforeSend : function(xhr){
		    xhr.setRequestHeader(header, token);
		},
		success:function(res){
			var lecCode = document.querySelector("#myLecList");
			var state = lecCode.options[lecCode.selectedIndex];  // 자바 가져올듯
			
			var index = lecCode.value.indexOf("_");  // 5
			var changeState = lecCode.value.substring(0, index+1) + "1";
			state.value = changeState;
			
			var finishBtn = document.querySelector("#finishBtn");
			finishBtn.classList.remove("btn-primary");
			finishBtn.classList.add("btn-secondary");
			finishBtn.value = "성적입력완료";
			  swal({
					title: "최종 성적을 부여하였습니다.",   //큰 글씨
					icon: "success",   //info, success등 종류
			});
		},error:function(res){
			 swal({
				title: "성적등록에 실패했습니다.",   //큰 글씨
				icon: "warning",   //info, success등 종류
			});
		}
	})
}

function avgScore(data){
	
	var totalScore = 0;
	var totalStudent = data.length;
	data.forEach((data, i) => {
		totalScore += data.LGC_TOTALSCORE;
	})
	var avgScore = totalScore/totalStudent;
	document.querySelector("#avgScore").value = avgScore.toFixed(2);
	document.querySelector("#studentAvg").innerText=avgScore.toFixed(2)+"점";
}

////////////////////////////////////////////////////////////
function keyEventList(){
	var changeBtn = document.querySelector("#changeBtn");
	
	changeBtn.addEventListener("click", function(){
		
		let changeCredit = document.querySelector("#changeCredit tbody").children;
		let tmpgrade = nowClick.querySelector("input[name=grade]").value;
		
		console.log(changeCredit);
		console.log(nowClick.querySelector("input[name=grade]").value);
		
		for(let i=0;i<changeCredit.length;i++){
			let tmpCredit = changeCredit[i];
			if(tmpCredit.children[1].innerText == tmpgrade){
				tmpCredit.children[2].innerText = tmpCredit.children[2].innerText*(1) - 1;
				console.log(i)
				break;
			}			
		}
		
		
		var grade = document.querySelector("#grade").value;
		var gradeId = document.querySelector("#gradeId");
		var ratingId = document.querySelector("#ratingId");
		
		for(let i=0;i<changeCredit.length;i++){
			let tmpCredit = changeCredit[i];
			if(tmpCredit.children[1].innerText == grade){
				tmpCredit.children[2].innerText = tmpCredit.children[2].innerText*(1) + 1;
				break;
			}			
		}
		
		var gradeList = ['A+', 'A', 'B+','B','C+','C','D+','D','F'];
		var ratingList = ['4.5', '4', '3.5','3','2.5','2','1.5','1','0'];
		var index = gradeList.indexOf(grade);
		var rating = ratingList[index];
		
 		nowClick.children[10].children[1].innerText = grade;
		nowClick.children[10].children[0].value = grade;
		nowClick.children[10].children[2].value = rating;
		
		ratingCal();
	})
}

function showInfo(data){
   
   var tmpNo = data.children[4].innerText;
   
   for(let i =0; i < dumyData.length;i++){
      
      if(dumyData[i].MEM_NO === tmpNo){
         console.log(i + "이곳입니다!!")
      }
   }
}
   
function compareCredit(data){

	// 석차 비교 나중에 직접 구현 
	data.sort(function(a, b){
		return -(a.LGC_TOTALSCORE - b.LGC_TOTALSCORE)
	})
	
	// 백분율 체크
	var totalStudent = data.length*1;
	var rank;
	var percent;
	
	let a=0;
	let b=0;
	let c=0;
	let d=0;
	
	for(let i=0; i<data.length;i++){
		rank = data[i].LGC_RANKING;
		percent = (rank/totalStudent) * 100;
		
		if(percent <= 20){
			data[i].grade = "A";
			data[i].rating = '4';
			a++;
		}else if(percent <= 50){
			data[i].grade = "B";
			data[i].rating = '3';
			b++;
		}else if(percent <= 70){
			data[i].grade = "C";
			data[i].rating = '2';
			c++;
		}else{
			data[i].grade = "D";
			data[i].rating = '1';
			d++;
		}
	}
	
	document.querySelector("#totalStu").innerText=data.length+"명";
	document.querySelector("#grade2").innerText=a;
	document.querySelector("#grade4").innerText=b;
	document.querySelector("#grade6").innerText=c;
	document.querySelector("#grade8").innerText=d;
	document.querySelector("#gradeTotal").innerText=data.length;
	
	
	ratingCal();
}    


function ratingCal(){
	let changeCredit = document.querySelector("#changeCredit tbody").children;
	let gradeTotal = document.querySelector("#gradeTotal").innerText*(1);
	console.log(changeCredit)
	for(let i=0;i<changeCredit.length-1;i++){
		let tmpTr = changeCredit[i].children[2].innerText;
		if(tmpTr != ""){
			changeCredit[i].children[3].innerText = (tmpTr/gradeTotal*100).toFixed(2);
		}
	}
	
	let sum=0;
	for(let i=0;i<changeCredit.length-1;i++){
		sum+=changeCredit[i].children[3].innerText*(1);
		if(i<4){
			if(i%2 == 1){
				console.log(changeCredit[i-1].children[4])
				changeCredit[i-1].children[4].innerText = sum.toFixed(2);
				sum=0;
			}
		}else{
			if(i==8){
				changeCredit[4].children[4].innerText = sum.toFixed(2);
				sum=0;
			}
		}
	}	
}
   

</script>