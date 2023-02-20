<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:if test="${not empty dataList}">
   <c:set value="${dataList }" var="List"></c:set>
</c:if>
<c:if test="${not empty myLecApplyList}">
   <c:set value="${myLecApplyList }" var="myList"></c:set>
</c:if>

<style>

.custom-font-dark {
   color : #0a3875;
   font-weight : bold;
}
</style>

<div class="row mt-3">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>예비수강신청</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/prelecture/home">예비수강신청</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

   <div class="row justify-content-center">  
  
   <!-- 맨위 개인 정보 보여주는 구간 -->
   <div class="col-md-12">
     <div class="card">
	   	<div class="card-body">
	   		<div class="card-title">
	   	   		<h5 class="font-weight-bold"><label for="year">학생정보</label></h5>
	   		</div>
	   		<div class="d-flex">
		      <div class="col-md-3">
		         <span class="col-3 custom-font-dark">소속</span> <input class="col-9" type="text"
		            value="공과대학 컴퓨터공학과">
		      </div>
		      <div class="col-md-3">
		         <span class="col-6 custom-font-dark">기준학점</span> <input class="col-6" type="text"
		            value="18">
		      </div>
		      <div class="col-md-3">
		         <span class="col-6 custom-font-dark">신청가능학점</span> <input class="col-6" type="text"
		            value="18">
		      </div>
		      <div class="col-md-3">
		         <span class="col-3 custom-font-dark">학년</span> <input class="col-9" type="text"
		            value="2학년(4학기)">
		      </div>
	   		</div>
	   	</div>
	  </div>
	 </div>
 
 <!-- 검색 바 -->
	<div class="col-md-12">
     <div class="card">
	   	<div class="card-body">
	   	<div class="card-title">
	   	   <h5 class="font-weight-bold"><label for="year">검색</label></h5>
	   	</div>
	   	<div class="row col-12 mb-3">
         <div class="col-md-4">
            <div class="row">
               <div class="col-4 align-center">
                  <span class="col-12 custom-font-dark">개설학과</span> 
               </div>
               <input type="text" class="column_filter col-6" id="col1_filter" data-column="1">
            </div>
         </div>
         <div class="col-md-4">
            <div class="row">
               <div class="col-4">
                  <span class="col-12 custom-font-dark">학년</span> 
               </div>
               <input type="text" class="column_filter col-6" id="col2_filter" data-column="2">
            </div>
         </div>
         <div class="col-md-4">
            <div class="row">
               <div class="col-4">
                  <span class="col-12 custom-font-dark">과목코드</span> 
               </div>
               <input type="text" class="column_filter col-6" id="col3_filter" data-column="3">
            </div>
         </div>
      </div>
      
      <div class="row col-12">
         <div class="col-md-4">
            <div class="row">
               <div class="col-4 align-center">
                  <span class="col-12 custom-font-dark">과목명</span> 
               </div>
               <input type="text" class="column_filter col-6" id="col4_filter" data-column="4">
            </div>
         </div>
         <div class="col-md-4">
            <div class="row">
               <div class="col-4">
                  <span class="col-12 custom-font-dark">개설이수구분</span> 
               </div>
               <select class="column_filter" id="col7_smart" data-column="7">
                  <option>선택</option>
                  <option value="전공/필수">전공/필수</option>
                  <option value="전공/선택">전공/선택</option>
                  <option value="교양/필수">교양/필수</option>
                  <option value="교양/선택">교양/선택</option>
               </select>
            </div>
         </div>
      </div>
	   	</div>
	 </div>
	</div>	<!-- 검색바 끝 -->

<!-- 강의 목록 -->
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold">
						<label for="year">강의목록</label>
					</h5>
				</div>
				 <div class="row custom-div-radius mb-3" style="background-color: white;">
			        <table id="dataTable" class="table table-hover" style="cursor:pointer;">
			           <thead>
			              <tr onclick="event.stopPropagation()">
			                  <th>장바구니</th>
			                  <th>개설학과</th>
			                  <th>학년</th>
			                  <th>과목번호</th>
			                  <th>과목명</th>
			                  <th>정원</th>
			                  <th>수강인원</th>
			                  <th>개설이수구분</th>
			                  <th>학점</th>
			                  <th>담당교수</th>
			                  <th>강의시간</th>
			                  <th>강의계획서</th>
			               </tr>
			            </thead>
			            <tbody>
			            </tbody>
			        </table>
			   </div>
			</div>
		</div>
	</div> <!-- 강의목록 끝 -->

<div class="row col-md-12 d-flex">
         <div class="card custom-div-radius height-600 col-8 mr-3" >
            <div class="card-body">
            	<div class="card-title d-flex">
	   	   			<h5 class="font-weight-bold">예비수강 신청 내역 </h5>
	   			</div>
	   			<div class="d-flex justify-content-end">
                 	<h6 class="font-weight-bold">총 학점 : <span id="creditBox">0</span>/21</h6>
	   			</div>
                  
                  <table style="width:100%" class="table text-center ">
                     <thead class="custom-theader">
                        <tr>
                           <th>순번</th>
                           <th>과목명</th>
                           <th>학점</th>
                           <th>개설이수구분</th>
                           <th>빼기</th>
                        </tr>
                     </thead>
                     <tbody id="myLecture" class="autoCount">

                     </tbody>
                  </table>
               
            </div>
         </div>
         <div class="card custom-div-radius height-600 col" >
            <div class="card-body ">
               <div class="card-title">
					<h5 class="font-weight-bold">
						<label for="year">예상시간표</label>
					</h5>
				</div>
               <div class="container height-500">
                  <table border="1" class="text-center font-weight-bold mini-timeTable height-500" style="border-color:#d1cdc9;">
                       <thead>
                        <tr class="text-center">
                           <th></th>
                           <th>월</th>
                           <th>화</th>
                           <th>수</th>
                           <th>목</th>
                           <th>금</th>
                        </tr>
                       </thead>
                       <tbody id="timeTableList">
                        <c:forEach begin="0" end="9" step="1" varStatus="state">
                           <tr>
                              <td> ${9 + state.index}:00</td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                           </tr>
                        </c:forEach>
                       </tbody>
                  </table>
               </div>
	         </div>
	      </div>
   </div>

</div> <!-- 전체 row 끝 -->


   

   


<script>
var timeTable = Array.from({length:10}, () => Array(5).fill(0));
var  table;
window.onload = function(){
   
   // 테이블 세팅
   table = $("#dataTable").DataTable({
      //표시 건수기능 숨기기
      lengthChange: false,
//          // 검색 기능 숨기기
//          searching: false,
//          // 정렬 기능 숨기기
//          ordering: false,
//         // 정보 표시 숨기기
         info: false,
         autoWidth: false,
//         // 페이징 기능 숨기기
         paging: false,
           scrollY:250,
           scrollCollapse: false
   });   
   
   init();
}

function init(){
       
   
    $('.column_filter').on('keyup change', function () {
        filterColumn($(this).attr('data-column'));
    });
   
   
    // 검색바 삭제
   var example_filter = $("#dataTable_filter");
   example_filter.html("");
  
   var header = $("meta[name='_csrf_header']").attr('content');
   var token = $("meta[name='_csrf']").attr('content');
   var tabledataBox = document.querySelector("#tabledataBox");
   
   $.ajax({
      url :"/prelecture/list",
      type: "get",
      beforeSend : function(xhr){
         xhr.setRequestHeader(header, token);
      },
      success: function(res){
      
         var myLecture = document.querySelector("#myLecture");   
        
         // 강의 목록
         res[0].forEach((data, i)=>{
            lecList(data);
         }) // 강의목록 끝
         
         // 수강바구니
         res[1].forEach((data, i) => {
        	 if(data.LA_STATE == 0){
	            addBlock(data);
        	 }
         })  //수강바구니
         
         // 시간표
         res[1].forEach((data, i)=>{
             timeTableInsert(data);
         })
      }
   })
}



//검색 필터
function filterColumn(i) {
   var data = $('#col' + i + '_filter').val();
   if(i == 7){
      data = $('#col' + i + '_smart').val();
      if(data == "선택") data = "" ;
   }

    $('#dataTable')
        .DataTable()
        .column(i)
        .search(
            data
        )
        .draw();
}



function lecList(data){
      
    var text = "";
    text += '<form id="dataForm" onclick="event.stopPropagation()">';
    text += '<input type="button" class="btn btn-primary btn-sm" value="강의계획서" onclick="showPlan(this)">';
    text += '<input type="hidden" value="'+data.LOL_CODE+'" name="lol_code">';
    text += '<input type="hidden" value="'+data.MEM_NO+'" name="mem_no">';
    text += '<input type="hidden" value="'+data.LOL_NAME+'" name="lol_name">';
    text += '<sec:csrfInput/>';
    text += '</form>';
    
    table.row.add([
       '<td><input type="button" class="btn btn-primary custom-btn-s mb-1 btn-sm" onclick="lectureData(this)" value="추가">'
       +'<input type="hidden" value="'+data.LEC_CODE+'" name="lec_code">'
       +'</td>',
       '<td>'+data.DEP_NAME+'</td>',
       '<td>'+data.LOL_SCHYEAR+'</td>',
       '<td>'+data.LOL_CODE+'</td>',
       '<td>'+data.LOL_NAME+'</td>',
       '<td>'+data.LOL_LIMIT+'</td>',
       '<td>'+data.LOL_STUDENTNUM+'</td>',
       '<td>'+data.MAJOR_CULTURAL+'/'+data.CHOICE_REQUIRE+'</td>',
       '<td>'+data.LOL_CREDIT+'</td>',
       '<td>'+data.MEM_NAME+'</td>',                                                    
       '<td>'+data.LOL_DAY1+':'+data.LOL_STARTIME1+'~'+data.LOL_ENDTIME1+'/'
       +data.LOL_DAY2+':'+data.LOL_STARTIME2+'~'+data.LOL_ENDTIME2+'</td>',                                                                           
       text                                                                           
       ]).draw(false);
}


function showPlan(data){
   
   
   var popWidth = 920;
   var popHeight = 600;

   var popupX = (window.screen.width / 2) - (popWidth / 2);
   var popupY= (window.screen.height / 2) - (popHeight / 2);
   
   var pop = window.open("","content",
   "menubar=no, width="+popWidth+", height="+popHeight+" left="+popupX+" top="+popupY+"");
   
   // window.open post로 보내기(form 태그를 보내면 됩니당)
   var result = data.parentNode;
   result.action = "/prelecture/showPlan";
   result.method = "post";
   result.target = "content";
   
   result.submit();
}

//수강바구니 데이터 추가 일단 대충 만듬
function lectureData(data){
   event.preventDefault();
   
   // 여기서는 수강바구니에 담겨야 합니다.
   
   var header = $("meta[name='_csrf_header']").attr('content');
   var token = $("meta[name='_csrf']").attr('content');
   var myLecture = document.querySelector("#myLecture");
   
   swal("추가하시겠습니까?",{
       buttons:{
          select:"확인",
          cancel:"취소"
       }
    }).then((value)=>{
       switch(value){
       case "select":
   	    // 학점이 초과하는지 체크
			if(creaditCheck(data)){
			   swal({
					  title: "학점이 초과합니다.",   //큰 글씨
					  icon: "warning",   //info, success등 종류
			   });
			   return;
			}
			
			// 시간이 겹치는지 체크
			if(checkTime(data)){
			   swal({
				  title: "시간표가 겹칩니다.",   //큰 글씨
				  icon: "warning",   //info, success등 종류
				});
			   return;
			}
			
		   let jsonObject = {
				   lec_code : data.parentElement.children[1].value
		   }
		   // 인서트 이후 수강인원 카운트 해줘야함
		   let xhr = new XMLHttpRequest();
		   xhr.open('post', '/prelecture/insertLec', true);
		   xhr.onreadystatechange = () => {
			   if(xhr.readyState == 4 && xhr.status == 200){
				   addBlock(JSON.parse(xhr.responseText));
				   swal({
					   title: "추가되었습니다.",   //큰 글씨
					   icon: "success",   //info, success등 종류
					});
			   }else if(xhr.readyState == 4 && xhr.status == 400){
				   console.log(xhr.responseText)
			   }
		   }
		   xhr.setRequestHeader(header,token);
		   xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
		   xhr.send(JSON.stringify(jsonObject));
          break;
       default:
          break;
       }
    })
   
//    if(!confirm("추가하시겠습니까?")){
//       return;
//    }
   
//    // 학점이 초과하는지 체크
//    if(creaditCheck(data)){
//       alert("수강가능한 학점을 초과하셨습니다.")
//       return;
//    }
   
//    // 시간이 겹치는지 체크
//    if(checkTime(data)){
//       alert("시간표가 겹칩니다...")
//       return;
//    }
   
   // 학번, 강의코드

//    let jsonObject = {
// 		   lec_code : data.parentElement.children[1].value
//    }
   
   
//    // 인서트 이후 수강인원 카운트 해줘야함
//    let xhr = new XMLHttpRequest();
//    xhr.open('post', '/prelecture/insertLec', true);
//    xhr.onreadystatechange = () => {
// 	   if(xhr.readyState == 4 && xhr.status == 200){
// 		   addBlock(JSON.parse(xhr.responseText));
// 	   }else if(xhr.readyState == 4 && xhr.status == 400){
// 		   console.log(xhr.responseText)
// 	   }
//    }
//    xhr.setRequestHeader(header,token);
//    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
//    xhr.send(JSON.stringify(jsonObject));

}


function addBlock(res){
	console.log(res.LOL_NAME)
	console.log(res)
	
   var myLecture = document.querySelector("#myLecture");
   
   var lolName = res.LOL_NAME;
   var lolCredit = res.LOL_CREDIT;
   var majorChoice = res.MAJOR_CULTURAL+"/"+res.CHOICE_REQUIRE;
   
   // 총 학점 계산
   creditCalculator(res,1);
   timeTableInsert(res);

   text = ""
   text += "<tr>";
   text += "<td></td>";
   text += "<td>"+lolName+"</td>";
   text += "<td>"+lolCredit+"</td>";
   text += "<td>"+majorChoice+"</td>";
   text += "<td>";
   text += "<input type='hidden' value='"+res.LA_CODE+"' name='la_code'>";
   text += "<input class='btn mb-1 btn-outline-danger' type='button' value='취소' onclick='blockDelete(this)'>";
   text += "</td>";
   text += "</tr>";
   
   myLecture.innerHTML += text;
   
   tableCount();
}

function creditCalculator(res,data){
   
   var sign = 0;
   if(data == 0) sign = -1;
   if(data == 1) sign = 1; 
   
   var creditBox = document.querySelector("#creditBox");
   var credit = creditBox.innerText*1;
   
   credit = credit + res.LOL_CREDIT*(1)*(sign);
   creditBox.innerText = credit;
}

function blockDelete(data){
	
	
	   swal("수강을 취소하시겠습니까?",{
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
           console.log(value)
           
           switch(value){
           case "select":
       	      var laCode = data.parentElement.children[0].value;
       	      var header = $("meta[name='_csrf_header']").attr('content');
       	      var token = $("meta[name='_csrf']").attr('content');
       	      
       	      
       	      
       	      $.ajax({
       	         url:"/prelecture/deletetLec/"+0,
       	         data:{"la_code" : laCode},
       	         type:"post",
       	         beforeSend : function(xhr){
       	            xhr.setRequestHeader(header, token);
       	         },
       	         success:function(res){
       	            
       	           var deleteTag = data.parentNode.parentNode;
       	           deleteTag.remove();
       	           
       			   console.log(res)
       			   
       	           tableCount();
       	           creditCalculator(res, 0);
       	           timeTableDelete(res);
       	           
    			   swal({
    					  title: "취소되었습니다.",   //큰 글씨
    					  icon: "success",   //info, success등 종류
   					});
       	           
       	         },
       	      })
              break;
           default:
              break;
           }
        })
   
//    if(!confirm("수강을 취소하시겠습니까?")){return;}
      
//       var laCode = data.parentElement.children[0].value;
//       var header = $("meta[name='_csrf_header']").attr('content');
//       var token = $("meta[name='_csrf']").attr('content');
      
      
      
//       $.ajax({
//          url:"/prelecture/deletetLec/"+0,
//          data:{"la_code" : laCode},
//          type:"post",
//          beforeSend : function(xhr){
//             xhr.setRequestHeader(header, token);
//          },
//          success:function(res){
            
//            var deleteTag = data.parentNode.parentNode;
//            deleteTag.remove();
           
// 		   console.log(res)
		   
//            tableCount();
//            creditCalculator(res, 0);
//            timeTableDelete(res);
//          },
//       })
}

function timeTableInsert(data) {
   
   
    var timeTableList = document.querySelector("#timeTableList");
    var dayArray = ["월", "화", "수", "목", "금"];
    var timeArray = ['9','10','11','12','13','14','15','16','17','18'];

    var color = [
    		"#bb9ca2","#847792","#494c73","#4282a3","#8ebbd8","#9f889c","#66638c","#2b386b","#256e9d","#70a7d0","#7f718a","#464c7a",
    		"#0c215a","#05568b","#5190c0","#7c8da4","#416993","#083d74","#0073a5","#4cadd9","#a5acbe","#6c87b0","#2a92bf","#76ccf5"]
    	
    var colorCnt =	getRandomColor();
    
    if(data.LOL_DAY1 != null){
          var dayPosition = dayArray.indexOf(data.LOL_DAY1) + 1;
          var timeStart = timeArray.indexOf(data.LOL_STARTIME1);
          var timeEnd = timeArray.indexOf(data.LOL_ENDTIME1);
          
          for(let i=timeStart+1; i<=timeEnd; i++){
            timeTableList.children[i].children[dayPosition].innerText = data.LOL_NAME;
            timeTableList.children[i].children[dayPosition].style.backgroundColor = color[colorCnt];
            timeTableList.children[i].children[dayPosition].style.color = "#ffffff";
            timeTable[i][dayPosition-1] = 1;
          }
    }
    
//     colorCnt = getRandomColor();
    if(data.LOL_DAY2 != null){
          var dayPosition = dayArray.indexOf(data.LOL_DAY2) + 1;
          var timeStart = timeArray.indexOf(data.LOL_STARTIME2);
          var timeEnd = timeArray.indexOf(data.LOL_ENDTIME2);
          
          for(let i=timeStart+1; i<=timeEnd; i++){
            timeTableList.children[i].children[dayPosition].innerText = data.LOL_NAME;
            timeTableList.children[i].children[dayPosition].style.backgroundColor = color[colorCnt];
            timeTableList.children[i].children[dayPosition].style.color = "#ffffff";
            timeTable[i][dayPosition-1] = 1;
          }
    }
}

function timeTableDelete(res){
   
    var timeTableList = document.querySelector("#timeTableList");
    var dayArray = ["월", "화", "수", "목", "금"];
    var timeArray = ['9','10','11','12','13','14','15','16','17','18'];
    
    if(res.LOL_DAY1 != null){
          var dayPosition = dayArray.indexOf(res.LOL_DAY1) + 1;
          var timeStart = timeArray.indexOf(res.LOL_STARTIME1);
          var timeEnd = timeArray.indexOf(res.LOL_ENDTIME1);
          
          for(let i=timeStart+1; i<=timeEnd; i++){
            timeTableList.children[i].children[dayPosition].innerText = "";
            timeTableList.children[i].children[dayPosition].style.backgroundColor = "";
            timeTable[i][dayPosition-1] = 0;
          }
    }
    
    if(res.LOL_DAY2 != null){
          var dayPosition = dayArray.indexOf(res.LOL_DAY2) + 1;
          var timeStart = timeArray.indexOf(res.LOL_STARTIME2);
          var timeEnd = timeArray.indexOf(res.LOL_ENDTIME2);
          
          for(let i=timeStart+1; i<=timeEnd; i++){
            timeTableList.children[i].children[dayPosition].innerText = "";
            timeTableList.children[i].children[dayPosition].style.backgroundColor = "";
            timeTable[i][dayPosition-1] = 0;
          }
    }
}

function tableCount(){
   
   var autoCount = document.querySelector(".autoCount");
   var count = autoCount.children.length;
   
   for(let i=0;i<count;i++ ){
      autoCount.children[i].children[0].innerText = (i+1); 
   }
}

function getRandomColor() {
   return Math.floor(Math.random() * 24);
}

function checkTime(data){
   
      var dataTime = data.parentElement.parentElement.children[10].innerText;
      
      var allTime = dataTime.split("/");
      
      var firstTime = allTime[0].split(":")[1].split("~");
      var firstDay = allTime[0].split(":")[0];
         
      var secondTime = allTime[1].split(":")[1].split("~");
      var secondDay = allTime[1].split(":")[0];
      
      var dayArray = ['월','화','수','목','금'];
      var timeArray = ['9','10','11','12','13','14','15','16','17','18'];
      
      var dayPosition = dayArray.indexOf(firstDay);
      var timeStart = timeArray.indexOf(firstTime[0]);
      var timeEnd = timeArray.indexOf(firstTime[1]);
      
      
      
      
      if(timeTable[timeStart][dayPosition] == 1 || timeTable[timeEnd][dayPosition]){
         return true;
      }
      
      dayPosition = dayArray.indexOf(secondDay);
      timeStart = timeArray.indexOf(secondTime[0]);
      timeEnd = timeArray.indexOf(secondTime[1]);
      
      if(timeTable[timeStart][dayPosition] == 1 || timeTable[timeEnd][dayPosition]){
         return true;
      }
      
      
      return false;
}

function creaditCheck(data){
      
      var credit = data.parentNode.parentNode.children[8].innerText*1;
      var creditBox = document.querySelector("#creditBox").innerText*1;
      
      if(credit + creditBox > 21){
         return true;
      }
      
      return false;
   }


</script>