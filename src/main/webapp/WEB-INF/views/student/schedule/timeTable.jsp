<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="row col-12 justify-content-center">
	<div class="d-flex ml-5" style="width:68%;">
	   <div class="col-lg-6">
	      <h4 class="card-title custom-s mt-3">
	         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>시간표</strong><br/>
	      </h4>   
	   </div>
	   <div class="col-lg-6 d-flex justify-content-end">   
	      <div class="row page-titles" style="background: none !important;">
	         <div class="col p-md-0">
	            <ol class="breadcrumb">
	               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
	               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/schedule/sHome">시간표</a></li>
	            </ol>
	         </div>
	      </div>
	   </div>
	</div>
</div>

<div class="row justify-content-center">
<div class="col-lg-8">
	<div class="card">
		<div class="card-body">
			<h3 class="font-weight-bold text-center">시간표 조회</h3>
			<div class="container-fluid custom-div-radius height-800"	id="timeBoard">
				<div class="container">
					<div class="col-12 mb-3">
						<label class="custom-font-dark" for="year">년도</label> 
						<select id="year">
							<c:forEach items="${dataMap }" var="data" step="2">
								<option value="${data.ST_YEAR }">${data.ST_YEAR }년</option>
							</c:forEach>
						</select> <label class="custom-font-dark" for="semester">학기</label>
						<select id="semester">
							<option value="1">1학기</option>
							<option value="2">2학기</option>
						</select> &nbsp; <input type="button" class="btn mb-1 btn-white custom-btn-s" value="조회"
							id="showBtn">
					</div>
					<table class="custom-table" id="timeTable" border="1" style="border-color:#999999; box-sizing:border-box;">
						<thead style="height: 40px;" class="text-center">
							<tr style="color:#000000; font-weight: 900;">
								<th style="width: 10%;">시간/요일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
							</tr>
						</thead>
						<tbody class="text-center font-weight-bold" id="timeTableList">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script>
var timeTable = Array.from({length:10},() =>  Array(5).fill(0))
var color = ["#2d2454","#453f64","#46547f","#809eb2","#add0e9","#ffdc62","#7888bc","#97a6d5"];
var colorCount=0;
let showBtn = document.querySelector("#showBtn");

window.onload = function(){
	
	let jsonObject = {
			year:document.querySelector("#year").value,
			semester:document.querySelector("#semester").value
	}
	
	showTimeTable(jsonObject);
	
	showBtn.addEventListener("click", function(){
		let jsonObject = {
				year:document.querySelector("#year").value,
				semester:document.querySelector("#semester").value
		}
		showTimeTable(jsonObject);
	})

}

function showTimeTable(data){
	
	resetTimeTableList();
	
    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/schedule/showList", true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	xhr.onreadystatechange  = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObject = JSON.parse(xhr.response)
			console.log(jsonObject)
			
			jsonObject.forEach((data, i) => {
				
				timeTableInsert(data);
				colorCount++;
				if(colorCount == color.length-1){
					colorCount=0;
				}
			})
		}
	};
	xhr.setRequestHeader(header, token);
	xhr.send(JSON.stringify(data));
	
}



function timeTableInsert(data) {
	   
    var timeTableList = document.querySelector("#timeTableList");
    var dayArray = ["월", "화", "수", "목", "금"];
    var timeArray = ['9','10','11','12','13','14','15','16','17','18'];


    if(data.ST_DAY1 != null){
          var dayPosition = dayArray.indexOf(data.ST_DAY1) + 1;
          var timeStart = timeArray.indexOf(data.ST_STARTTIME1);
          var timeEnd = timeArray.indexOf(data.ST_ENDTIME1);
          
          for(let i=timeStart+1; i<=timeEnd; i++){
            timeTableList.children[i].children[dayPosition].innerHTML = data.LOL_NAME +"<br>-"+ data.LEC_CODE+"-";
            timeTableList.children[i].children[dayPosition].style.backgroundColor = color[colorCount];
        	timeTableList.children[i].children[dayPosition].style.color = "#ffffff";
            timeTable[i][dayPosition-1] = 1;
          }
    }
    
    if(data.ST_DAY2 != null){
          var dayPosition = dayArray.indexOf(data.ST_DAY2) + 1;
          var timeStart = timeArray.indexOf(data.ST_STARTTIME2);
          var timeEnd = timeArray.indexOf(data.ST_ENDTIME2);
          
          for(let i=timeStart+1; i<=timeEnd; i++){
        	timeTableList.children[i].children[dayPosition].innerHTML = data.LOL_NAME +"<br>-"+ data.LEC_CODE+"-";
        	timeTableList.children[i].children[dayPosition].style.backgroundColor = color[colorCount];
        	timeTableList.children[i].children[dayPosition].style.color = "#ffffff";
            timeTable[i][dayPosition-1] = 1;
          }
    }
}

function resetTimeTableList(){
	
	let timeTableList = document.querySelector("#timeTableList");
	
	text = "";
	for(let i=9;i<=18;i++){
		text+="<tr style='color:#000000; font-weight: 900;'>"
		text+="<td>"+String(i).padStart(2,"0")+":00</td>"
		text+="<td></td>"
		text+="<td></td>"
		text+="<td></td>"
		text+="<td></td>"
		text+="<td></td>"
		text+="</tr>"
	}
	timeTableList.innerHTML = text;
}






</script>
