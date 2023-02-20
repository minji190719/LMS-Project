<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.notEmpty{
	margin-bottom:20px;
}

.testCss {
	background-color :#e9ecef;
}
#friendTable{
	width:225px;
}
#resultTable{
	width:250px;
}

#trashDiv{
	position:absolute;
	width:25px;height:25px;
	top:630px;left:1095px;
	z-index:1;
	
}
.tmpclass{
	animation : hendle 0.1s infinite;
}

@keyframes hendle{
	from{
		transform:rotate(5deg);
	}
	to{
		transform:rotate(-5deg);
	}
	
}


/* .clip{ */
/* 	position :relative; */
/* 	top:55px;left:-15px; */
/* 	z-index:1; */
/* 	color : #304674 */
/* } */
.thumbtack{
	position :relative;
	top:25px;
	z-index:1;
	color : #304674;
	font-size : 1.5em;
}
</style>


<i class="fa-solid fa-trash-can fa-3x" id="trashDiv"></i>	
<div class="container-fluid col-11" id="scheduleBoard">
<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>스터디 그룹 만들기</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/attend/attendApplyPage">스터디그룹만들기</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>
	
	<div class="row">
		<div class="col-12 d-flex">
		
		<div class="col-3">
				<div class="card mb-2 h-100">
					<div class="card-body col-12">
						<div class="card-title mb-4">
							<h5 class="font-weight-bold">친구 요청 목록</h5><hr>
						</div>
						<div class="col-12 d-flex justify-content-end">
							<input type="text" placeholder="학번입력" class="input-default" id="mem_no">
							<input type="button" class="btn btn-Info btn-sm" value="검색" id="searchFriend"> 
						</div>
						<div class="col-12 mt-4" style="margin-left:5%;" >
							<div class="col-12 d-flex justify-content-end pr-4">
								<select id="selectListBox" class="input-default">
									<option value="request">요청목록</option>
									<option value="wait">대기목록</option>
								</select>
							</div>
							<table class="custom-table-sm text-center custom-font-dark table-spacing" id="friendTable">
								<thead>
									<tr>
										<th>학번</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody id="friendWait">
								</tbody>
							</table>
						</div>
					</div>
				</div>
		</div>
		<div class="col-9">
				<div class="card mb-2 h-100 pb-1">
					<div class="card-body">
						<div class="card-title">
							<h5 class="font-weight-bold">친구목록</h5><hr>
						</div>
					<div class="d-flex justify-content-end">
						<span class="text-danger custom-font-bold mb-3"> ※현재학기 시간표만 가능합니다.</span>
					</div>
						<table class="custom-table-sm text-center custom-font-dark height-200 ">
							<thead>
								<tr>
									<th style="width:50px;">선택</th>
									<th>학번</th>
									<th>이름</th>
									<th>학년</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="myFriendTable">
							</tbody>
						</table>
					</div>
			</div>
		</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12 d-flex mt-4 h-100">
			<div class="col-8">
				<div class="card" style="height:590px;">
					<div class="card-body">
						<div class="card-title">
							<h5 class="font-weight-bold">개인별시간표</h5><hr>
						</div>
						<div id="timeTableContainer">
							<div class="row bg-white custom-div-radius height-500 pb-5" data-child='0' id="backBoard">
								<div class="col scheduleBox d-flex justify-content-center" data-no="1"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card pb-2"  style="height:590px;">
					<div class="card-body">
						<div class="card-title">
							<h5 class="font-weight-bold">스케줄링 결과</h5><hr>
						</div>
						<div class="row custom-div-radius height-500 pb-3">
							<div class="col-12">
								<div id="resultTime" class="pt-2">
								
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>

		</div>
	</div>
	
</div>
<script>
// 개개인 시간표 담을 배열
let allTimeTable = [];
// div 갯수
let maxDiv = 4;
let divlength = 1;
let notEmptys;
let childrenIndex = 0;
let tiemHeight = 500;
let scheduleBox;
let tmpscheduleBox;
let scheduleBoxs;
let timeTableContainer;
let draggables;
// div 모음

// 테이블위 데이터 드래그 했을때

////////////// 드래그 앤 드롭 끝


// 초기 변수들
let header;          // 헤더
let token;           // 토큰
let searchFriend;    // 친구 검색 버튼
let friendWait;      // 친구 대기 목록
let selectListBox;   // select박스 
let myFriendTable;    // 내 친구 목록
let backBoard;       // 뒷배경 전용임
let resultTime;      //결과값
/// 안착한 시간표

let successTimeTable=[];
let tmpNo;

window.onload = function(){
	//쓰레기통
	trashEvent();
	
	// 초기값 세팅
	// 드래그 앤 드롭
	scheduleBoxs = document.querySelectorAll(".scheduleBox:not(.notEmpty)");
	timeTableContainer = document.querySelector("#timeTableContainer");
	backBoard = document.querySelector("#backBoard");
	resultTime = document.querySelector("#resultTime");
	// 드래그한 요소가 안으로 들어 왔을때
	backBoard.addEventListener("dragover", function(e){
	   e.preventDefault();
	})

	backBoard.addEventListener("dragenter", function(e){
	   e.preventDefault();
	   
	   //partColor
	   backBoard.classList.add("partColor")
	   
	   let divide = timeTableContainer.getBoundingClientRect().width/5;
	   let divright = timeTableContainer.getBoundingClientRect().right;
	   
	   let addBlockPosition = divright-divide;
	   scheduleBox = document.querySelector(".scheduleBox:not(.notEmpty)");	
	   
	   if(addBlockPosition < e.clientX && e.clientX < divright){
	      // 현재 div는 1 array=0 
	      if(allTimeTable.length == divlength && allTimeTable.length >= 0){
	    	  
	    	  if(divlength+1 == maxDiv){
				console.log("더이상 추가할 수 없습니다.")    		  
	    	  }else{
		         checkArrayLength();
		         divlength++;
	    	  }
	      }

	   }
	})

	
	backBoard.addEventListener("dragleave", function(e){
	   e.preventDefault();
	   backBoard.classList.remove("partColor");
	   if(allTimeTable.length < divlength && divlength != 1){
	      if(scheduleBox != null){
	         divlength--;
	         scheduleBox.remove();
	         return;
	      }
	   }
	})
	

	backBoard.addEventListener("drop", function(e){
		
	   timeTableCheck(scheduleBox, e);
	   backBoard.classList.remove("partColor");
	   
	   setTimeout(function(){
		   let tmp = document.querySelectorAll(".timeTableBox");
		   if(tmp != null){
			   tmp.forEach((value,i)=>{
				   successTimeTable.push(value.parentElement)
				   
				   value.addEventListener("dragstart", function(e){
					   
					    tmpNo=this.parentElement.dataset.no;
						console.log(tmpNo)
					    value.addEventListener("dragend", function(e){
						   
					    })
				   });
			   })
			   
		   }
	   }, 100)

	   
	   e.preventDefault();
	})

	
	//////////////////////////////
	header = $("meta[name='_csrf_header']").attr('content');   
	token = $("meta[name='_csrf']").attr('content');           
	searchFriend = document.querySelector("#searchFriend");    
	friendWait = document.querySelector("#friendWait"); 
	selectListBox = document.querySelector("#selectListBox");
	myFriendTable = document.querySelector("#myFriendTable");
	
	keyEvent();
	myList();
}
let trashDiv;
// 쓰레기통 함수
function trashEvent(){
	trashDiv = document.querySelector("#trashDiv");
	
	trashDiv.addEventListener("mousedown", function(e){
		e.preventDefault();
		
		trashDiv.classList.toggle("tmpclass");
	    let shiftX = event.clientX - trashDiv.getBoundingClientRect().left;
	    let shiftY = event.clientY - trashDiv.getBoundingClientRect().top;
		trashDiv.style.zIndex = 1000;
		
		function moveAt(event){
			event.preventDefault();
			settingPosition(event.pageY, event.pageX);
		}
		
		function settingPosition(y,x){
			trashDiv.style.top = y-shiftY + "px";
			trashDiv.style.left = x-shiftX + "px";
		}
	   
		document.addEventListener("mousemove", moveAt);
		
		trashDiv.onmouseup = function(){
			trashDiv.classList.toggle("tmpclass");
			document.removeEventListener("mousemove", moveAt);
			trashDiv.onmouseup = null;
		}
	})
	
	
	trashDiv.addEventListener("dragenter", function(e){
		e.preventDefault();
	})
	trashDiv.addEventListener("dragover", function(e){
		e.preventDefault();
	})
	trashDiv.addEventListener("drop", function(e){
		e.preventDefault();
		let tmpSchedulBox = document.querySelectorAll(".scheduleBox");
		tmpSchedulBox.forEach((value,i)=>{
			console.log("dsads : " + value.dataset.no)
			if(value.dataset.no == tmpNo){
				delTime(value.children[0].children[3]);
				tmpNo=0;
			}
		})
		
		e.preventDefault();
	})

	
}




// 배열길이 확인해서 디브 만들기
function checkArrayLength(){
   let text = divCreate();
   timeTableContainer.children[childrenIndex].innerHTML += text;
}

function divCreate(){
   text = '<div class="col height-'+tiemHeight+' scheduleBox d-flex justify-content-center" data-no="'+(allTimeTable.length+1)+'">'
   text += '</div>'
   
   return text;
}

function delTime(table){
	   
	let data = table.parentElement.children[1].children[0].innerText
	let tmpTbody = document.querySelector("#myFriendTable");
	let tmpTr = tmpTbody.children;
	for(let i=0;i<tmpTr.length;i++){
		if(tmpTr[i].children[1].innerText == data){
			tmpTr[i].children[0].children[0].checked = false;
			break;
		}
	}
	
	// data-no 가 겹치게 들어가기 때문에 data-no를 초기화 할 필요가 있음...
	if(allTimeTable.length == 1){
     	allTimeTable.splice((table.parentElement.parentElement.dataset.no*(1)-1),1);
     	table.parentElement.parentElement.classList.remove("notEmpty")
		table.parentElement.remove();
	}else{
    	allTimeTable.splice((table.parentElement.parentElement.dataset.no*(1)-1),1);
	    divlength--;
	    table.parentElement.parentElement.remove();
	}
	// data-no 초기화
	resetDataNo();
	
	if(divlength == 1){
		resultTime.innerHTML = "";
		return;
	}
	
	resultTimeCheck();
}

function resetDataNo(){
	console.log(timeTableContainer.children[0].children)
	let childNode = timeTableContainer.children[0].children;
	for(let i=0;i<childNode.length;i++){
		childNode[i].dataset.no = (i+1);
	}
}

////////////////
function timeTableCheck(table, e){
	
	// 여기 스택이 자꾸 쌓임
	let data = e.dataTransfer.getData("tagData");
	
	myAjax({
		type:"post",
		url:"/friend/timeTable",
		data:data,
		contentType:"application/json; charset=utf-8",
		security:{
			header:header,
			token:token
		},
		success:function(res){
		   timeTableCreate(res, table);
		   let tmpTbody = document.querySelector("#myFriendTable");
		   let tmpTr = tmpTbody.children;
		   let jsonData = JSON.parse(data);
		   for(let i=0;i<tmpTr.length;i++){
			   if(tmpTr[i].children[1].innerText == jsonData.smem_no){
				   tmpTr[i].children[0].children[0].checked = true;
				   break;
			   }
		   }
		},
		error:function(res){
			
	        swal({
				  title: "시간표가 없습니다.",   //큰 글씨
				  icon: "warning",   //info, success등 종류
				});
			divlength--;
			scheduleBox.remove();
		}
	})
	
	
}
////////////////////
// 함수 모음
function myList(){
	// 친구목록
	myFriendList();
	// 대기 목록
// 	myFriendWait();
	// 요청 목록
	myFrinedRequest();
}

// 키 or 스위치 등등 변화는 이벤트
function keyEvent(){
	searchFriend.addEventListener("click", function(){
		frinedSearch();
	})
	
	selectListBox.addEventListener("change", function(){
		console.log(selectListBox.value)
		let flag = selectListBox.value;
		if(flag == 'request'){
			myFrinedRequest();
		}else if(flag == "wait"){
			myFriendWait();
		}
		
	})
}

// 요청 수락
function acceptFriend(data){
	console.log(12312)

	let requestDiv = data.parentElement.parentElement;
	let friendId = requestDiv.children[0].innerText;
	let jsonObject = {};
	
	jsonObject.smem_no = friendId;
	
   swal("요청을 수락하시겠습니까?",{
          buttons:{
             select:"확인",
             cancel:"취소"
          }
       }).then((value)=>{
          console.log(value)
          
          switch(value){
          case "select":
      		myAjax({
    			url:"/friend/update",
    			data:JSON.stringify(jsonObject),
    			type:"post",
    			contentType:"application/json; charset=utf-8",
    			security : {
    				header:header,
    				token:token
    			},
    			success:function(res){
    				let jsonArray = [];
    				jsonArray.push(JSON.parse(res))
    				text = createMyFriendTable(jsonArray)
    				
    				if(myFriendTable.children[0].children[0].innerText == '친구가 없습니다.'){
    					myFriendTable.innerHTML = text;
    				}else{
    					myFriendTable.innerHTML += text;
    				}
    				requestDiv.remove();
    				setDraggables();
			        swal({
					  title: "수락되었습니다.",   //큰 글씨
					  icon: "success",   //info, success등 종류
					});

    			},
    			error:function(xhr){
			        swal({
					  title: "에러발생! 에러코드400",   //큰 글씨
					  icon: "warning",   //info, success등 종류
					});
    			}
    		})
             break;
          default:
             break;
          }
       })
	
	
// 	if(confirm("친구요청을 수락하시겠습니까??")){
		
// 		myAjax({
// 			url:"/friend/update",
// 			data:JSON.stringify(jsonObject),
// 			type:"post",
// 			contentType:"application/json; charset=utf-8",
// 			security : {
// 				header:header,
// 				token:token
// 			},
// 			success:function(res){
// 				console.log(res)
// 				let jsonArray = [];
// 				jsonArray.push(JSON.parse(res))
// 				text = createMyFriendTable(jsonArray)
				
// 				if(myFriendTable.children[0].children[0].innerText == '친구가 없습니다.'){
// 					myFriendTable.innerHTML = text;
// 				}else{
// 					myFriendTable.innerHTML += text;
// 				}
// 				requestDiv.remove();
// 			},
// 			error:function(xhr){
// 				console.log(123213)
// 			}
// 		})
// 	}
	
}


// 요청삭제
function delFriend(data){
	
	   swal("요청을 취소하시겠습니까?",{
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
           console.log(value)
           
           switch(value){
           case "select":
       		let fmem_no = data.parentElement.parentElement.children[0].innerText;
    		let jsonObject = {};
    		jsonObject.fmemNo = fmem_no;
    		
    		myAjax({
    			url:"/friend/delete",
    			data:JSON.stringify(jsonObject),
    			type:"post",
    			security:{
    				header:header,
    				token:token
    			},
    			contentType:"application/json; charset=utf-8",
    			success:function(res){
    				data.parentElement.parentElement.remove();
   				   swal({
 						  title: "취소되었습니다.",   //큰 글씨
 						  icon: "success",   //info, success등 종류
   					});

    				
    			},
    			error:function(xhr){
   				   swal({
					  title: "실패했습니다. 에러코드 : 400",   //큰 글씨
					  icon: "warning",   //info, success등 종류
   					});
    			}
    		}) 
              break;
           default:
              break;
           }
        })
	
	
	
// 	if(confirm("요청을 취소하시겠습니까?")){
// 		let fmem_no = data.parentElement.parentElement.children[0].innerText;
// 		let jsonObject = {};
// 		jsonObject.fmemNo = fmem_no;
		
// 		myAjax({
// 			url:"/friend/delete",
// 			data:JSON.stringify(jsonObject),
// 			type:"post",
// 			security:{
// 				header:header,
// 				token:token
// 			},
// 			contentType:"application/json; charset=utf-8",
// 			success:function(res){
// 				console.log(res)
// 				data.parentElement.parentElement.remove();
// 			},
// 			error:function(xhr){
// 				console.log(xhr)
// 				alert("삭제에 실패하였습니다.")
// 			}
// 		})
// 	}
}

//////일반 함수들////////
function myFrinedRequest(){
	myAjax({
		type:"post",
		url:"/friend/myFriendRequest",
		security:{
			header:header,
			token:token
		},
		contentType:"application/x-www-form-urlencoded",
		success:function(res){
			
			text = createFriendRequest(JSON.parse(res));
			friendWait.innerHTML = text;
			
		},
		error:function(res){
			console.log("여기 실행되나여???")
			text = '<tr>';
			text += '<td colspan=2 class="text-center text-danger">친구요청 목록이 없습니다.</td>';
			text += '</tr>';
			
			friendWait.innerHTML = text;
		}
	})
}

function myFriendWait(){
	
	myAjax({
		type:"post",
		url:"/friend/myFriendWait",
		security:{
			header : header,
			token : token
		},
		contentType:"application/x-www-form-urlencoded",
		success:function(res){
			text = createFriendWait(JSON.parse(res));
			friendWait.innerHTML = "";
			friendWait.innerHTML += text;
		},
		error:function(){
			text = '<tr>';
			text = '<td>친구대기 목록이 없습니다.</td>';
			text = '</tr>';
			friendWait.innerHTML = text;
		}
	})
}


function myFriendList(){
	myAjax({
		type:"post",
		url:"/friend/myFriendList",
		contentType:"application/x-www-form-urlencoded",
		security:{
			header:header,
			token:token
		},
		success:function(res){
			text = createMyFriendTable(JSON.parse(res));
			myFriendTable.innerHTML = "";
			myFriendTable.innerHTML += text;
			
			setDraggables();
		},
		error:function(res){
			text = "<tr>";
			text += "<td colspan=5 class='text-center'>친구가 없습니다.</td>";
			text += "</tr>";
			
			myFriendTable.innerHTML = text;
		}
	})
}

function setDraggables(){
	draggables = document.querySelectorAll(".draggable");
	
	draggables.forEach((draggable, i) =>{
	   draggable.removeEventListener("dragstart", setDataTransForm);
		
	   draggable.addEventListener("dragstart", setDataTransForm);
	   
	   function setDataTransForm(){
	      let jsonObject = {
	         smem_no : this.children[1].innerText,
	         mem_name : this.children[2].innerText
	      }
	      event.dataTransfer.setData("tagData", JSON.stringify(jsonObject));
		   
	   }
	})
	
}

// 프랜드 서치~
function frinedSearch(){
	
	let mem_no = document.querySelector("#mem_no").value;
	
	let promise = () => new Promise((resolve, reject) => {
		
		let xhr = new XMLHttpRequest();
		xhr.open('post', '/friend/search', true);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				
			   swal(mem_no + "학번에게 친구요청을 하시겠습니까?",{
		            buttons:{
		               select:"확인",
		               cancel:"취소"
		            }
		         }).then((value)=>{
		            console.log(value)
		            
		            switch(value){
		            case "select":
		               resolve(mem_no);
		               break;
		            default:
		               break;
		            }
		         })
			}else if(xhr.readyState == 4 && xhr.status == 400){
			   swal({
					  title: "검색하신 학번은 존재하지 않습니다.",   //큰 글씨
					  icon: "warning",   //info, success등 종류
				});
			}
		}
		xhr.setRequestHeader(header,token);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send("memNo="+mem_no);
	})
	
	promise().then((data) => {
		let xhr = new XMLHttpRequest();
		xhr.open("post", "/friend/insert", true);
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				let jsonData = {};
				jsonData.FMEM_NO = data;
				let arrayDate = [];
				arrayDate.push(jsonData)
				
				text = createFriendWait(arrayDate);
				friendWait.innerHTML += text;
				
				let jsonObject = {
						state:"1",
						userId:data,
						msg:"친구요청합니다.",
						purpose:"0",
						sender:"${userId}"
				}
				
				sendMessage(JSON.stringify(jsonObject));
				
			   swal({
					  title: "친구요청을 마쳤습니다.",   //큰 글씨
					  icon: "success",   //info, success등 종류
				});

				
			}else if(xhr.readyState == 4 && xhr.status == 400){
				   swal({
						  title: "요청을 실패했습니다. 에러코드 400",   //큰 글씨
						  icon: "warning",   //info, success등 종류
						});

			}
		}
		xhr.setRequestHeader(header,token);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send("memNo="+data);
	})
}

function timeTableCreate(data, table){
	
	let day = ['월','화','수','목','금'];
	let time = ['9','10','11','12','13','14','15','16','17','18'];
	
    let myTimeTable = Array.from({length:10}, () => Array(5).fill(0))
	let newData = JSON.parse(data);
    
    console.log(newData)
    
    newData.forEach((data, i)=>{
    	let col1 = day.indexOf(data.ST_DAY1);
    	let srow1 = time.indexOf(data.ST_STARTTIME1);
    	let erow1 = time.indexOf(data.ST_ENDTIME1);
    	let col2 = day.indexOf(data.ST_DAY2);
    	let srow2 = time.indexOf(data.ST_STARTTIME2);
    	let erow2 = time.indexOf(data.ST_ENDTIME2);
    	
    	myTimeTable[srow1][col1] = 1;
    	myTimeTable[erow1][col1] = 1;
    	myTimeTable[srow2][col2] = 1;
    	myTimeTable[erow2][col2] = 1;
    })
    
    text='';
	text+='<div class="timeTableBox" draggable="true" style="width:250px;">'
// 	text+='<i class="fa-solid fa-paperclip fa-3x clip"></i>';
	text+='<i class="fa-solid fa-thumbtack thumbtack"></i>';
	text+='<h5 class="text-right font-weight-bold"><span>'+newData[0].SMEM_NO+'</span>의 시간표</h5>';
	text+='<table class="custom-table-sm custom-font-dark timetable custom-table-height-35" border=1 >'
	text+='<thead>';
	text+='<tr>';
	text+='<th></th>';
	text+='<th>월</th>';
	text+='<th>화</th>';
	text+='<th>수</th>';
	text+='<th>목</th>';
	text+='<th>금</th>';
	text+='</tr>'; 
	text+='</thead>';
	text+='<tbody>';
		
	for(let i=0;i<10;i++){
		text+='<tr>';
		for(let j=0; j<6;j++){
			
			if(j==0){
				text+='<td>'+(9+i)+'</td>';
			}else{
				
				if(myTimeTable[i][j-1] == 1){
					text+='<td style="background-color:#4e6688;"></td>';
				}else{
					text+='<td style="background-color:#EAFDFC;"></td>';
				}
			}
		}
		text+='</tr>';
	}
	
	text+='</tbody>';
	text+='</table>';
	text+='<input type="button" class="btn btn-dark mt-2 mb-3" value="취소" onclick="delTime(this);">';
	text+='</div>';
	
   // 시간표가 들어간 시간표박스에 무언가 넣어주어야함
   table.innerHTML=text;
   table.classList.add('notEmpty');
   
   allTimeTable[table.dataset.no-1] = myTimeTable
   
   resultTimeCheck();
   
   return;
}

function resultTimeCheck(){
	
	let empTable = Array.from({length:10}, () => Array(5).fill(0));
	allTimeTable.forEach((data,i)=>{
		for(let i=0;i<10;i++){
			for(let j=0;j<5;j++){
				empTable[i][j] = empTable[i][j] + data[i][j];
			}
		}
	})
 	text='<div class="row"><h4 class="col-12 d-flex justify-content-center font-weight-bold">그룹시간표</h4>';
 	text+='<div class="col-12 d-flex justify-content-center">';
	text+='<table class="custom-table-sm custom-font-dark timetable custom-table-height-35" border=1 ondragstart="return false" id="resultTable">'
	text+='<thead>';
	text+='<tr>';
	text+='<th>비고</th>';
	text+='<th>월</th>';
	text+='<th>화</th>';
	text+='<th>수</th>';
	text+='<th>목</th>';
	text+='<th>금</th>';
	text+='</tr>'; 
	text+='</thead>';
	text+='<tbody>';
	for(let i=0;i<10;i++){
		text+='<tr>';
		for(let j=0;j<6;j++){
			if(j==0){
				text+='<td>'+(9+i)+'</td>';
			}else{
				if(empTable[i][j-1]/allTimeTable.length == 0){
					text+='<td style="background-color:#6fd96f;"></td>';
				}else{
					text+='<td style="background-color:#4e6688;"></td>';
				}
			}
		}
		text+='</tr>';
	}
	text+='</tbody>';
	text+='</table></div>';
	text+='<div class="col-12 d-flex justify-content-center">';
	text+='<div class="offset-1 mt-3"><span style="color:#6fd96f;" class="custom-font-bold">- 가능한 시간</span><br>';
	text+='<span style="color:#4e6688;" class="custom-font-bold">- 불가능한 시간</span></div>';
	text+='</div>';
	text+='</div></div>';
	
	let resultTime = document.querySelector("#resultTime");
	resultTime.innerHTML = text;
	
	console.log(empTable)
	
}

// 내가 요청한 친구목록
function createFriendWait(data){
	text="";
	data.forEach((list,i)=>{
		text +=  '<tr class="testCss text-center">';
		text += '<td>'+list.FMEM_NO+'</td>';
		text += '<td><input type="button" class="btn btn-danger btn-sm" value="삭제" onclick="delFriend(this)"></td>';
		text += '</tr>';
	})
	return text;
}

// 내게 친구가 요청한 목록
function createFriendRequest(data) {
	text="";
	data.forEach((list, i)=>{
		text += '<tr class="testCss text-center">';
		text += '<td>'+list.SMEM_NO+'</td>';
		text += '<td><input type="button" class="btn btn-sm btn-success" value="수락" onclick="acceptFriend(this)"></td>';
		text += '</tr>';
	})
	
	return text;
}
// 나의 친구 목록
function createMyFriendTable(data){
	text = '';
	data.forEach((list,i)=>{
	console.log(list)
	
	text += '<tr class="draggable" draggable="true">';
		text+='<td><input type="checkBox" disabled></td>';
		if(list.FMEM_NO == "${userId}"){
			text += '<td>'+list.SMEM_NO+'</td>';	
		}else{
			text += '<td>'+list.FMEM_NO+'</td>';	
		}
		text += '<td>'+list.MEM_NAME+'</td>';	
		text += '<td>'+list.STU_SCHYEAR+'</td>';	
		text += '<td>'+list.MEM_EMAIL+'</td>';	
		text += '<td>'+list.MEM_TEL+'</td>';	
		text += '<td><input type="button" class="btn mb-1 btn-outline-danger" value="친구삭제" onclick="deleteFriend(this)"></td>';	
	text += '</tr>';
	})
	return text;
}
function deleteFriend(data){
	data.parentElement.parentElement.remove();
}


// 마이 아작스
function myAjax(data){
	
	let xhr = new XMLHttpRequest();
	xhr.open(data.type, data.url, true);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4&& xhr.status == 200){
			data.success(xhr.responseText);
			return;
		}else if(xhr.readyState == 4 && xhr.status == 400){
			data.error("에러에러!!!");
			return;
		}
	}
	
	if(data.security){
		xhr.setRequestHeader(data.security.header, data.security.token);
	}
	
	if(data.contentType){
		xhr.setRequestHeader("Content-Type", data.contentType);
	}
	xhr.send(data.data);
}





</script>