<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
.popover{
	display:block;
}
.popover>.arrow{
	display:none;
}
#redColor{
	background-color: #FF5733;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#oranColor{
	background-color: #FFBD33;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#lemonColor{
	background-color: #DBFF33;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#greenColor{
	background-color: #33FF57;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#darkGreenColor{
	background-color: #33FFBD;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

input[name=color]{
 	display:none;
}

input[name=color]:checked + label{
	border:2px solid black;
}

.fc-day-sun{
	color : red;
}
.fc-day-sat{
	color:blue;
}
.drawArea{
	margin-top:20px;
	width:1500px;
	background-color:white;
	height:820px;
	border-radius :50px;
}

#calendar{
	width: 1400px;
}

.fc .fc-daygrid-day-number{
   color : #0a3875;
   font-weight : bold;
}
.fc .fc-university-button{
	background-color:red;
}

#calTitle{
	font : 30px bold;
}
#calMonth{
	font-size : 25px;
	font-weight:bold;
}
.height-290{
	height:290px;
}
#myTodoList{
	height:300px;
}

.kanBody{
	height:300px;
}

.linethrough{
	text-decoration: line-through;
}

.clickBg{
	background-color: #e9ecef;
}

</style>
<div class="row justify-content-center">
	<div class="col-lg-5">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;일정<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/calendar/main">일정</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="card col-7 mr-2">
		<div class="card-body">
			<div id="calendar" class="col-12"></div>
		</div>
	</div>
	<div class="card col">
		<div class="card-body col text-dark height-290">
			<h4 id="calTitle">2023학년도 학사일정</h4>
			<hr>
			<div id="calMonth"></div>
			<div class="col-12" id="calDay">
			
			</div>
		</div>
		<div class="card-body" id="myTodoList">
			<h4>개인 일정 목록</h4>
			<div class="row">
				<div class="col-4">
					<span class="custom-font-bold">월별</span>
					<div class="card col-12 kanBody pt-2" id="dayBoard">
					</div>
				</div>
				<div class="col-8">
					<span class="custom-font-bold">상세정보</span>
					<div class="card col-12 kanBody pt-2" id="detailBoard">

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="dataModal" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	    		<div class="card">
                      <div class="card-header bg-darkGreen custom-fontColor-white">
                          <h5 class="mb-0 collapsed " data-toggle="collapse" data-target="#collapseOne1" aria-expanded="false" aria-controls="collapseOne1" style="color:white;"><i class="fa" aria-hidden="true"></i>내 일정등록</h5>
                      </div>
					<div class="card-body">
						<div class="card-text">
							<div class="row">
								<label for="title" class="custom-font-dark">제목</label>
								<input type="text" id="title" placeholder="제목" class="form-control col-12 mb-1 input-default">
								<label for="content" class="custom-font-dark">내용</label>
								<input type="text" id="content" placeholder="내용" class="form-control col-12 mb-2 input-default">
							</div>
							<div class="row">	
								<span class="custom-font-dark">시간</span>
							</div>
							<div class="row">
								<input type="text" class="form-control col-6 input-default" placeholder="시작날짜" id="min-date">
								<input type="text" class="form-control col-6 input-default" placeholder="끝 날짜" id="max-date">
								<span class="mt-2 custom-font-dark">색상</span><label class="mt-2 custom-font-dark offset-6">AllDay<input type="checkBox" id="allDay" class="ml-2"></label>
							</div>
							<div class="row">
								<div class="col-6">
									<input type="radio" name="color" id="color1" value="#FF5733">
									<label for="color1" id="redColor" class="mr-2"></label>
									<input type="radio" name="color" id="color2" value="#FFBD33">
									<label for="color2" id="oranColor" class="mr-2"></label>
									<input type="radio" name="color" id="color3" value="#DBFF33">
									<label for="color3" id="lemonColor" class="mr-2"></label>
									<input type="radio" name="color" id="color4" value="#33FF57">
									<label for="color4" id="greenColor" class="mr-2"></label>
									<input type="radio" name="color" id="color5" value="#33FFBD">
									<label for="color5" id="darkGreenColor"></label>
								</div>
								<div class="offset-1">
									
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<input type="button" class="btn btn-primary custom-btn-s" value="등록" id="insertBtn">
						<input type="button" class="btn btn-outline-dark" value="자동완성" id="autoBtn">
					</div>
				</div>			
	    </div>
	</div>
</div>

<script>
let minDate;
let maxDate;
let insertBtn = document.querySelector("#insertBtn");
let header;
let token;
let calDay;
let calTitle;
let calMonth;
let dayBoard;
let detailBoard;
let updatePen;
let trashBtn;
let autoBtn;
window.onload = function(){
	
	header = $("meta[name='_csrf_header']").attr('content');
	token = $("meta[name='_csrf']").attr('content');
	calDay = document.querySelector("#calDay");
	calTitle = document.querySelector("#calTitle");
	calMonth = document.querySelector("#calMonth");
	dayBoard = document.querySelector("#dayBoard");
	detailBoard = document.querySelector("#detailBoard");
	updatePen = document.querySelector("#updatePen");
	autoBtn = document.querySelector("#autoBtn");
	
	autoBtn.addEventListener("click", function(){
		document.querySelector("#title").value="404 최종 발표";
		document.querySelector("#content").value="404 최종 발표 중입니다.";
		document.querySelector("#allDay").checked = true;
		document.querySelector("#color2").checked = true;
	})
	
	insertBtn.addEventListener("click", insertCal);
	$("#min-date, #max-date").bootstrapMaterialDatePicker({
			format: 'YYYY/MM/DD HH:mm',
			minDate : new Date()
	});
	
	let jsonObject = {
			CLDR_CATEGORY : '0',
			CLDR_START : null,
			MONTH : "2"
	}
	
	drawCalendar(jsonObject);
	
	keyEvent();
	
	kanban();
}

let kanBoard;
let eventData=[];
let checkBtn;
let calMeno;
function keyEvent(){
	detailBoard.addEventListener("click", function(e){
		if(e.target.getAttribute("id") == "checkBtn"){
			checkBtn=document.querySelector("#checkBtn");
			checkBtn.addEventListener("change", changeEvent)
		}
		function changeEvent(){
			console.log(checkBtn.checked);
			let jsonData = {
				check:checkBtn.checked==true?1:0,
				groupId:cldrCode		
			}
			let xhr = new XMLHttpRequest();
			xhr.open("post", "/calendar/checkboxUpdate",true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					nowClick.classList.toggle("linethrough")
				}
			}
			xhr.setRequestHeader(header,token);
			xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8")
			xhr.send(JSON.stringify(jsonData));
			
			checkBtn.removeEventListener("change", changeEvent);
		}
		
		if(e.target.getAttribute("id") == "updatePen"){
			$('[data-toggle="popover"]').popover();

			
			calMeno = document.querySelector("#calMeno");
			calMeno.removeAttribute("readonly");
			calMeno.focus();
		}
		
		if(e.target.getAttribute("id") == "trashBtn"){
			
			
			swal("삭제하시겠습니까?",{
				buttons:{
					select:"확인",
					cancel:"취소"
				}
			}).then((value)=>{
				console.log(value)
				
				switch(value){
				case "select":
					let jsonData = {
							groupId:cldrCode		
					}
					let xhr = new XMLHttpRequest();
					xhr.open("post", "/calendar/deleteCal",true);
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4 && xhr.status == 200){
							detailBoard.innerHTML='';
							nowClick.parentElement.remove();
							calendar.getEventById(cldrCode).remove();
							swal({
								  title: "삭제되었습니다.",   //큰 글씨
								  icon: "success",   //info, success등 종류
							});
						}
					}
					xhr.setRequestHeader(header,token);
					xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8")
					xhr.send(JSON.stringify(jsonData));
					break;
				default:
					break;
				}
			})
			
			if(true)return;
			

			if(confirm("삭제하시겠습니까?")){
			}
		}
		
		if(e.target.getAttribute("id") == "updateBtn"){
			setTimeout(function(){
				$('[data-toggle="popover"]').popover("hide");
			},300)
			
			calMeno = document.querySelector("#calMeno");
			let jsonData = {
				memo:calMeno.value,
				groupId:cldrCode
			}
			updateCar(jsonData);
		}
	})
}
function updateCar(data){
	
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/calendar/update", true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText)
			if(xhr.responseText == "success"){
				calMeno.readOnly = true;
			}else if(xhr.responseText == "success2"){
			}
		}
	}
	xhr.setRequestHeader(header,token);
	xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	xhr.send(JSON.stringify(data));
}

function kanban(){
	kanBoard = document.querySelector(".kanBoard");
}

let dataSetInfo;
function drawCalendar(data){
	
	$.ajax({
		  url: "/calendar/showList2",
		  type: "POST",
		  data:JSON.stringify(data),
		  dataType: "JSON",
		  contentType:"application/json;charset=utf-8",
		  beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	      },
		  success:function(res){
				let calendarEl = document.querySelector("#calendar");
			    calendar = new FullCalendar.Calendar(calendarEl, {
			    	headerToolbar : {
			    		start : '',
			    		center: 'title',
			    		end: 'customPrev,today,customNext'
			    	},
			    	events : function(info, successCallback, failureCallback) {
						  let us = [];
						  let ps = [];
						  let dateCheck;
						  
						  let monthData = new Date();
						  
						  res.forEach((value,i)=>{
							  dateCheck = new Date(value.start);
							  
							  if(value.category == '${userId}'){
								  value.id = value.groupId;
								  ps.push(value)
							  }
							  
							  if(value.category == '0'){
								  console.log(dateCheck.getMonth()+1 == data.MONTH&& dateCheck.getYear()+1900 != 2023)
								  if(dateCheck.getMonth()+1 != data.MONTH){
									  value.category='3';
								  }else if(dateCheck.getMonth()+1 == data.MONTH && dateCheck.getYear()+1900 != 2023){
									  value.category='3';
								  }
							  }
						  })
						  successCallback(ps);
					},
					windowResize:function(res){
						console.log(res + "resize중입니다....")
					},
			    	customButtons : {
			    		today:{
			    			text:"오늘",
			    			click:function(){
			    			}
			    		},
			    		customPrev : {
			    			text:"<",
			    			click:function(){
			    				let fc_dom_1 = document.querySelector("#fc-dom-1");
			    				if(fc_dom_1.innerText == '2023년 1월'){
			    					alert("첫 달입니다.")
			    					return;
			    				}
			    				
			    				calendar.prev();
			    				
			    				let year = fc_dom_1.innerText.split(" ")[0].slice(0,-1);
			    				let month = fc_dom_1.innerText.split(" ")[1].slice(0,-1);
			    				let jsonObject = {
			   						CLDR_CATEGORY :'0',
			   						CLDR_START : year+"/"+month,
			 						MONTH : month
			    				}
			    				dayBoard.innerHTML = '';
			    				detailBoard.innerHTML = '';
			    				calDay.innerHTML = '';
			    				searchDay(jsonObject);
			    			}
			    		},
			    		customNext : {
			    			text:">",
			    			click:function(){
			    				let fc_dom_1 = document.querySelector("#fc-dom-1");
			    				if(fc_dom_1.innerText == '2024년 2월'){
			    					alert("마지막 달입니다.")
			    					return;
			    				}
			    				calendar.next();
			    				let year = fc_dom_1.innerText.split(" ")[0].slice(0,-1);
			    				let month = fc_dom_1.innerText.split(" ")[1].slice(0,-1);
			    				let jsonObject = {
			       						CLDR_CATEGORY : '0',
			       						CLDR_START : year+"/"+month,
			       						MONTH : month
			        			}
			    				dayBoard.innerHTML = '';
			    				detailBoard.innerHTML = '';
			    				calDay.innerHTML = '';
			    				searchDay(jsonObject);
			    			}
			    		}
			    	},
				    height: 800,
				    contentHeight: 780,
				    aspectRatio: 3,  // see: https://fullcalendar.io/docs/aspectRatio
			      	initialView: 'dayGridMonth',
			      	locale : 'ko',   // 언어설정
			        editable: true,  // 편집
			        selectable: true,  // 선택
			        droppable: false,  // 드롭
			        weekends:true,     // 주말
			      	select : function(event){
			      		addInfo(event);
			      	},
// 			      	eventClick:function(event){
// 			      		if(confirm("해당 메모를 삭제하시겠습니까?")){
// 			      			event.event.remove();
// 			      		}
// 			      	},
			      	eventDragStart:function(event){
			      		dataSetInfo=event.event.startStr;
			      	},
// 			      	eventDragStop:function(res){
// 			      		dataSetInfo=null;
// 			      	},
			      	eventDrop:function(event){
						let jsonData = {
								memo:null,
								groupId:event.event._def.groupId,
								start:event.event.startStr,
								end:event.event.startStr
						}
						updateCar(jsonData);
			      		
			      		// 무조건 수정 된다는 상황.....
			      		let day = event.event.startStr.split("-")[2];
			      		let originDay = dataSetInfo.split("-")[2];
			      		
			      		for(let i=0;i<dayBoard.children.length;i++){
			      			let changeTag = dayBoard.children[i];
			      			if(changeTag.dataset.no*(1) == originDay){
			      				changeTag.dataset.no = day*(1);
			      				changeTag.children[0].children[0].innerText = day*(1);
			      				daySort();
			      				break;
			      			}
			      		}
			      		
			      		dataSetInfo=null;
			      	}
			    });
			    
			    calendar.render();
			    createUniInfo(res);
		  },
		  error : function(request,status,error){
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		  }
	});
};

function searchDay(data){
	$.ajax({
		  url: "/calendar/showList2",
		  type: "POST",
		  data:JSON.stringify(data),
		  dataType: "JSON",
		  contentType:"application/json;charset=utf-8",
		  beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	      },
		  success : function(res){
			  createUniInfo(res);
		  },
		  error : function(){
				console.log("123")
		  }
	});
}

function createUniInfo(res){
	
	  let month = document.querySelector("#fc-dom-1").innerText.split(" ")[1].slice(0,-1);
	  calMonth.innerText = month+"월";
	  let dayList = ['일','월','화','수','목','금','토'];
	  
	  res.forEach((value,i)=>{
		  	  if(value.category == '0'){
				  let date = new Date(value.start);
				  let date2 = new Date(value.end);
				  let day = dayList[date.getDay()];
				  let tmpStr='';
				  if(date.getDate() != date2.getDate()){
					  tmpStr='~'+date2.getDate()+'('+dayList[date.getDay()]+')';
				  }
				  text='';
				  text+='<div class="row">';
				  text+='<div class="pt-3 text-dark custom-font-bold col-3">'+date.getDate()+'('+day+')'+tmpStr+'</div>';
				  text+='<div class="pt-3 text-dark custom-font-bold col">'+value.title+'</div>';
				  text+='</div>';
				  calDay.innerHTML += text;
		  	  }else if(value.category == '${userId}'){
				  let date = new Date(value.start);
				  let today = new Date();
				  let date2 = new Date(value.end);
				  let day = dayList[date.getDay()];
				  let tmpStr='';
				  if(date.getDate() != date2.getDate()){
					  tmpStr='~'+date2.getDate()+'('+dayList[date.getDay()]+')';
				  }
				  if(month == date.getMonth()+1){
					  let linethrough = value.check==1?"linethrough":"";
					  atext ='';
			  		  atext+='<div class="row mb-2 dayspan" data-no="'+date.getDate()+'" draggable="true">';
			  		  atext+='<span id="'+value.groupId+'" class="col-10 text-dark custom-font-bold '+linethrough+'" draggable="true" onclick="showDetail(this)"><span>'+date.getDate()+'</span>일 '+value.title+'</span>';
			  		  atext+='</div>';
		  			  dayBoard.innerHTML +=atext;
				  }
		  	  }
		  	  
	  })
	  
	  daySort();
	  
}

let cldrCode;
let nowClick;
function showDetail(data){
	
	let clickBg = document.querySelector(".clickBg");
	if(clickBg){
		clickBg.classList.remove("clickBg");
	}
	data.classList.add("clickBg");
	
	
	
	nowClick= data;
	let groupId = data.getAttribute("id");
	cldrCode = groupId;
	
	console.log(cldrCode)
	
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/calendar/detail", true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let jsonData = JSON.parse(xhr.responseText);
			let date = new Date(jsonData.start);
			let dday = date.getMonth()+1 + "." + date.getDate() + "." + (date.getYear()*(1)+1900)
			
			text='';
			text+='<div class="card-header">';
			text+='<div class="row">'
			text+='<div class="col-5 cal-title">'+jsonData.title+'</div>';
			text+='<div class="col custom-font-bold">'+dday+'</div>';
			text+='<div class="col">';
			text+='<i class="fa-solid fa-pen pr-1" style="cursor:pointer" id="updatePen"></i>';
			text+='<i class="fa-solid fa-trash pr-2" style="cursor:pointer" id="trashBtn"></i>';
			let check = jsonData.check==1?"checked":"";
			
			text+='<input type="checkBox" '+check+' id="checkBtn">';
			text+='</div>';
			text+='</div>';
			text+='</div>';
			text+='<div class="card-body"><textarea id="calMeno" rows="5" cols="40" style="border: none;resize: none;" readonly>'+jsonData.memo+'</textarea></div>';
			text+='<div class="card-footer text-right"><input type="button" class="btn btn-sm" value="수정" id="updateBtn" '
			     +'data-container="body" data-toggle="popover" data-placement="top" data-content="수정되었습니다." data-original-title title></div>';
			detailBoard.innerHTML = text;
			
		}else if(xhr.readyState == 4  && xhr.status == 400){
			alert("상세정보가 없습니다.")
		}
	}
	xhr.setRequestHeader(header,token);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
	xhr.send("groupId="+groupId);
	
}


function addInfo(info){
	$("#dataModal").modal('show');
	let date = new Date();
	
	let start = info.startStr + " " +moment(date).format("HH:mm");
	let end = info.endStr + " " +date.getHours() + ":" + date.getMinutes();
	
	date = new Date(end);
	
	let tmptomorrow = new Date(date.setDate(date.getDate()-1));
	let tomorrow = moment(tmptomorrow).format("YYYY-MM-DD HH:mm")
	
	document.querySelector("#min-date").value = start;
	document.querySelector("#max-date").value = tomorrow;
}

function daySort(){
	
	let tmpTag = document.querySelectorAll(".dayspan");
	let tempTagArray = Array.prototype.slice.call(tmpTag, 0);
	tempTagArray.sort((a,b)=>{
		return a.dataset.no - b.dataset.no;
	})
	
	tempTagArray.forEach((value,i)=>{
		console.log(value)
		dayBoard.append(value);
	})
}


function insertCal(){
	let title = document.querySelector("#title").value;
	let content = document.querySelector("#content").value;
	let start = document.querySelector("#min-date").value;
	let end = document.querySelector("#max-date").value;
	let color = document.querySelector("input[name='color']:checked").value;
	let allDay = document.querySelector("#allDay").checked
	
	let jsonObject = {
		title:title,
		content:content,
		start:start,
		end:end,
		color:color,
		allDay:allDay
	}
	
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/calendar/insertCal", true);
	xhr.onreadystatechange = () =>{
		if(xhr.readyState == 4 && xhr.status == 200){
			
			console.log("등록성공")
			document.querySelector("#title").value = ""
			document.querySelector("#content").value = ""
			document.querySelector("#min-date").value = ""
			document.querySelector("#max-date").value = ""
			document.querySelector("input[name='color']:checked").checked = false;
			document.querySelector("#allDay").checked = false;
			$("#dataModal").modal('hide');
			
			let data = JSON.parse(xhr.responseText);
			data.id = data.groupId;
			calendar.addEvent(data);
			let dataArray = [];
			dataArray.push(data);
			createUniInfo(dataArray);
			
			daySort();
			
			
		}
	}
	
	xhr.setRequestHeader(header,token);
	xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	
	xhr.send(JSON.stringify(jsonObject));
}

</script>
