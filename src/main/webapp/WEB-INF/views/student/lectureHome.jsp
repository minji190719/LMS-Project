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
.highlight{
	background-color:#f0efff;
}
.custom-font-dark {
   color : #0a3875;
   font-weight : bold;
}

</style>


<div class="row mt-3">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>수강신청</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/lecture/home">수강신청</a></li>
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
					<h5 class="font-weight-bold">
						<label for="year">학생정보</label>
					</h5>
				</div>
				 <div class="d-flex" style=" padding: 10px;">
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
			            value="4학년(1학기)">
			      </div>
			    </div>
			</div>
		</div>
	</div> <!-- 개인정보 보여주기 끝 -->
	
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold">
						<label for="year">검색</label>
					</h5>
				</div>
<!-- 검색 바 -->
    <div class="row mb-3">
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
		</div>
	</div><!-- 검색기능 끝 -->
<!-- 강의목록 -->
<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold">
						<label for="year">강의목록</label>
					</h5>
				</div>
				
	<div class="row col-12 mb-3">
        <table id="dataTable" style="cursor:pointer;" class="table">
           <thead>
              <tr onclick="event.stopPropagation()" class="custom-font-dark">
                  <th>선택</th>
                  <th>개설학과</th>
                  <th>학년</th>
                  <th>과목번호</th>
                  <th>과목명</th>
                  <th>정원</th>
                  <th>수강가능인원</th>
                  <th>개설이수구분</th>
                  <th>학점</th>
                  <th>담당교수</th>
                  <th>강의시간</th>
                  <th>강의계획서</th>
               </tr>
            </thead>
            <tbody id="lectureList">
            </tbody>
        </table>
   </div>
			</div>
		</div>
	</div><!-- 강의목록 끝-->


	   <div class="row col-md-12 d-flex">
         <div class="card col-8 mr-3 custom-div-radius">
            <div class="card-body">
               <div class="card-title">
                  <h5 class="font-weight-bold">수강 신청 내역 </h5>
               </div>
               <div class="d-flex justify-content-end">
                  <h5 class="font-weight-bold">총 학점 : <span id="creditBox">0</span>/21</h5>
               </div>               
                  <table class="table text-center ">
                     <thead class="custom-theader">
                        <tr>
                           <th>순번</th>
                           <th>과목명</th>
                           <th>학점</th>
                           <th>개설이수구분</th>
                           <th>뺴기</th>
                        </tr>
                     </thead>
                     <tbody id="myLecture" class="autoCount">

                     </tbody>
                  </table>
               
            </div>
         </div>
         <div class="card col custom-div-radius">
            <div class="card-body">
               <h4 class="card-title">시간표</h4>
               
               <div class="container">
                  <table border="1" class="text-center mini-timeTable">
                       <thead>
                        <tr class="text-center">
                           <th colspan="1"></th>
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

</div>







<script>
var countS;
var timeTable = Array.from({length:10}, () => Array(5).fill(0));
let websocket;
var dataTable;
const lectureList=document.querySelector("#lectureList");

window.onload = function(){
   // 웹소켓
   connectlec();
   // 테이블 세팅
   dataTable = $("#dataTable").DataTable({
    	//표시 건수기능 숨기기
		lengthChange: false,
		// 정보 표시 숨기기
 		info: false,
 		// 페이징 기능 숨기기
    	paging: false,
    	scrollY: '250',
    	scroller: true,
    	responsive: true
   });
   init();
   keyEvent();
}

function keyEvent(){
	
   $('.column_filter').on('keyup change', function () {
       filterColumn($(this).attr('data-column'));
   });
   
   $('#dataTable tbody').on('mouseenter', 'td', function () {
       var colIdx = dataTable.cell(this).index().column;
		
		$(dataTable.cells().nodes()).removeClass('highlight');
		$(dataTable.column(colIdx).nodes()).addClass('highlight');
   });
   
   $('#dataTable tbody').on('mouseleave', 'td', function () {
       var colIdx = dataTable.cell(this).index().column;
		
		$(dataTable.cells().nodes()).removeClass('highlight');
   });
   
}

function init(){
   
   // 검색 커스텀
   $("div.dt_title").html('수강목록');
   
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
         var headerData = $("#headerData");
        
         let startTime = performance.now();

         // 수강바구니 목록
         res[1].forEach((data, i)=>{
            myLecList(data);
         }) // 수강바구니 목록 끝
         
         
         // 강의 목록
         res[0].forEach((data, i)=>{
            lecList(data);
         }) // 강의목록 끝
         
         
         // 수강바구니
         res[1].forEach((data, i) => {
            if(data.LA_STATE == 1){
               addBlock(data);
            }
            
         })//수강바구니
         
         // 시간표
         res[1].forEach((data, i)=>{
            if(data.LA_STATE == 1){
                timeTableInsert(data);
            }
         })
         
         let endTime = performance.now(); 
         console.log(endTime - startTime)
      }
   })
}

// 검색 필터
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

function lecList(data){
   
    var text = "";
    text += '<form id="dataForm" onclick="event.stopPropagation()">';
    text += '<input type="button" class="btn btn-primary btn-sm" value="강의계획서" onclick="showPlan(this)">';
    text += '<input type="hidden" value="'+data.LOL_CODE+'" name="lol_code">';
    text += '<input type="hidden" value="'+data.MEM_NO+'" name="mem_no">';
    text += '<input type="hidden" value="'+data.LOL_NAME+'" name="lol_name">';
    text += '<sec:csrfInput/>';
    text += '</form>';
    
    dataTable.row.add([
       '<td><input type="button" class="btn btn-primary btn-sm custom-btn-s" onclick="lectureData(this)" value="추가">'
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
    ]).draw();
}

function myLecList(data, table){
   
   if(data.LA_STATE == 1) {
       return;
    }
    
    var text = "";
    text += '<form id="dataForm" onclick="event.stopPropagation()">';
    text += ' <input type="button" class="bnt btn-primary btn-sm" value="강의계획서" onclick="showPlan(this)">';
    text += ' <input type="hidden" value="'+data.LOL_CODE+'" name="lol_code">';
    text += ' <input type="hidden" value="'+data.MEM_NO+'" name="mem_no">';
    text += ' <input type="hidden" value="'+data.LOL_NAME+'" name="lol_name">';
    text += ' <sec:csrfInput/>';
    text += '</form>';
    
    dataTable.row.add([
       '<td><input type="button" onclick="lectureData(this)" value="확정" class="btn btn-success btn-sm">'
       +'<input type="hidden" value="'+data.LA_CODE+'" name="la_code">'
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
       ]).draw();
}

// 수강바구니 데이터 추가 일단 대충 만듬
function lectureData(data){
   event.preventDefault();
   
   
   
   swal("등록하시겠습니까?",{
       buttons:{
          select:"확인",
          cancel:"취소"
       }
    }).then((value)=>{
       console.log(value)
       
       switch(value){
       case "select":
    	   
    	   var header = $("meta[name='_csrf_header']").attr('content');
    	   var token = $("meta[name='_csrf']").attr('content');
    	   var myLecture = document.querySelector("#myLecture");
    	   
    	   // 학점이 초과하는지 체크
    	   if(creaditCheck(data)){
			   swal({
					  title: "수강가능한 학점을 초과하셨습니다.",   //큰 글씨
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
    	   
    	   // 학번, 강의코드
    	   var code = {};
    	   var addUrl = "";
    	   if(data.value == "확정"){
    	      laCode = data.parentNode.children[1].value;
    	      lecCode = data.parentNode.children[1].value;
    	      code.laCode = laCode;
    	      addUrl = "laCode";
    	   }else if(data.value="추가"){
    	      lecCode = data.parentNode.children[1].value;
    	      code.lecCode = lecCode;
    	      addUrl = "lecCode"
    	   }
    	   
    	   // 인서트 이후 수강인원 카운트 해줘야함
    	   
    	   var promise = () => new Promise((resolve, reject) => {
    	      $.ajax({
    	         url:"/lecture/insertLec/"+addUrl,
    	         data:JSON.stringify(code),
    	         type:"post",
    	         contentType:"application/json;charset=utf-8",
    	         beforeSend : function(xhr){
    	            xhr.setRequestHeader(header, token);
    	         },
    	         success:function(res){
    	          
    	          if(data.value == "확정"){
    	        	  dataTable.row(data.parentElement.parentElement).remove().draw();
//     	              data.parentNode.parentNode.remove();
    	          }  
    	           
    	          let lecTag = data.parentElement.parentElement;
    	          
    	          countStuNum(lecTag, 1);
    	          
    	          var lecCode = data.parentElement.parentElement.children[0].children[1].value;
    	          
    	          addBlock(res);
    	          timeTableInsert(res);
    	          
    	          // 소켓 테스트
    	          var jsonObject = {
    	             state : "1",
    	             userId : "${userId}",
    	             lecCode : lecCode,
    	             purpose : "1",
    	             count : "1"
    	          }
    	          
    	          sendMessageLec(jsonObject);
    	          
    	          resolve(res);
    	          
    	         },
    	         error : function(xhr){
   				   swal({
   						  title: "이미 추가한 강의입니다.",   //큰 글씨
   						  icon: "warning",   //info, success등 종류
					});
    	            reject("등록에 실패하셨네여...");
    	         }
    	      })
    	   })
    	   
    	   promise().then((data)=>{
    	      
    	       var header = $("meta[name='_csrf_header']").attr('content');
    	       var token = $("meta[name='_csrf']").attr('content');
    	      
    	      var jsonArray = [];
    	      
    	      jsonArray.push(data)
    	      $.ajax({
    	         url:"/lecture/insertTimeTable",
    	         data:JSON.stringify(data),
    	          beforeSend : function(xhr){
    	             xhr.setRequestHeader(header, token);
    	          },
    	         type:"post",
    	         contentType:"application/json;charset=utf-8",
    	         success:function(res){
     				swal({
 						  title: "추가되었습니다.",   //큰 글씨
 						  icon: "success",   //info, success등 종류
					});
    	         },
    	         error:function(){
    				swal({
   						  title: "시간표 등록에 실패했습니다.",   //큰 글씨
   						  icon: "warning",   //info, success등 종류
 					});
    	         }
    	      })
    	   })   
    	   
    	   
          break;
       default:
          break;
       }
    })
}


function creaditCheck(data){
   
   var credit = data.parentNode.parentNode.children[8].innerText*1;
   var creditBox = document.querySelector("#creditBox").innerText*1;
   
   if(credit + creditBox > 21){
      return true;
   }
   
   return false;
}

function addBlock(res){
   
   var myLecture = document.querySelector("#myLecture");
   
   var lolName = res.LOL_NAME;
   var lolCredit = res.LOL_CREDIT;
   var majorChoice = res.MAJOR_CULTURAL+"/"+res.CHOICE_REQUIRE;
   
   // 총 학점 계산
   creditCalculator(res,1);
   
   text = ""
   text += "<tr data-code='"+res.LOL_CODE+"'>";
   text += "<td></td>";
   text += "<td>"+lolName+"</td>";
   text += "<td>"+lolCredit+"</td>";
   text += "<td>"+majorChoice+"</td>";
   text += "<td>";
   text += "<input type='hidden' value='"+res.LA_CODE+"' name='la_code'>";
   text += "<input class='btn mb-1 btn-outline-danger' type='button' value='취소' onclick='blockDelete(this)''>";
   text += "</td>";
   text += "</tr>";
   
   myLecture.innerHTML += text;
   
   tableCount();
}

function creditCalculator(res, data){
	
   let sign = 0;
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
    	   
    	   var laCode = data.parentNode.children[0].value;
    	   var header = $("meta[name='_csrf_header']").attr('content');
    	   var token = $("meta[name='_csrf']").attr('content');
    	   
    	   $.ajax({
    	      url:"/prelecture/deletetLec/"+1,
    	      data:{"la_code" : laCode},
    	      type:"post",
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader(header, token);
    	      },
    	      success:function(res){
    	    	  
    	        var deleteTag = data.parentNode.parentNode;
    	        deleteTag.remove();
    	         
    	      	var countS = data.parentElement.parentElement.children[2];
    	     	let lecCode = data.parentElement.parentElement.dataset.code;
    	    	let lecutureData = lectureList.children;
    	    	let tmpCode;
    	    	
    	    	for(let i=0;i<lecutureData.length;i++){
    	    		if(lecCode == lecutureData[i].children[3].innerText){
    	    			let lecTag = lecutureData[i];
    	    			tmpCode = lecTag.children[0].children[1].value;
    	    			//정원이 0일때 예외처리
    	    			countStuNum(lecTag, 0);
    	    		}
    	    	} 
    	    	
    	    	let jsonObject = {
    	    			state : "1",
    	    			userId : "${userId}",
    	    			purpose : "1",
    	    			lecCode : tmpCode,
    	    			count : "0"
    	    	}
    	    	
    	    	sendMessageLec(jsonObject);
    	    	
    	         tableCount();
    	         creditCalculator(res, 0);
    	         timeTableDelete(res);
    	         

  			   swal({
  				  title: "삭제되었습니다.",   //큰 글씨
  				  icon: "success",   //info, success등 종류
  				});

    	      },
    	      error:function(){
   			   swal({
   				  title: "삭제에 실패했습니다. 에러코드 : 400",   //큰 글씨
   				  icon: "warning",   //info, success등 종류
   				});
    	      }
    	   })
    	   
          break;
       default:
          break;
       }
    })
}

// 해당 태그를 넣어야 합니다.
function countStuNum(lecTag, state){
	
	let stuNum = lecTag.children[6].innerText;
	let btnTag = lecTag.children[0].children[0];
	
	if(stuNum == 0){
		btnTag.value = "추가";
		btnTag.classList.replace("btn-white","btn-primary");
		btnTag.disabled = false;
		lecTag.style.backgroundColor = "";
	}else if(stuNum == 1){
		btnTag.parentElement.parentElement.style.backgroundColor = "#eeeeee";
        btnTag.value="마감";
        btnTag.classList.replace("btn-primary","btn-white");
        btnTag.disabled = true;
	}
	
	// 0이 삭제  1이 추가
	if(state == 0){
		lecTag.children[6].innerText = stuNum*(1) + 1;
	}else if(state == 1){
		lecTag.children[6].innerText = stuNum*(1) - 1;
	}
	
}

function timeTableInsert(data) {
   
	
    var timeTableList = document.querySelector("#timeTableList");
    var dayArray = ["월", "화", "수", "목", "금"];
    var timeArray = ['9','10','11','12','13','14','15','16','17','18'];

    var color = [
		"#bb9ca2","#847792","#494c73","#4282a3","#8ebbd8","#9f889c","#66638c","#2b386b","#256e9d","#70a7d0","#7f718a","#464c7a",
		"#0c215a","#05568b","#5190c0","#7c8da4","#416993","#083d74","#0073a5","#4cadd9","#a5acbe","#6c87b0","#2a92bf","#76ccf5"];
    	
    var colorCnt = getRandomColor();
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
    
    colorCnt = getRandomColor();
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

///////// 실시간 수강신청

// window.addEventListener("unload", function(){
// 	offClose();
// })

//입장 버튼을 눌렀을 때 호출되는 함수
function connectlec() {
	
    // 웹소켓 주소
    var wsUri = "wss://${pageContext.request.serverName}${pageContext.request.contextPath}/websocket/echo.do";
    // 소켓 객체 생성
    websocket = new WebSocket(wsUri);
    //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
    websocket.onopen = onOpenLec;
    websocket.onmessage = onMessageLec;
}

//웹 소켓에 연결되었을 때 호출될 함수

function onOpenLec() {
   
   var jsonObject = {
         "state" : "0",
         "userId" : "${userId}",
         "msg" : "hihi~"
   }
   
   websocket.send(JSON.stringify(jsonObject));
}

// * 1 메시지 전송
function sendMessageLec(message){
   websocket.send(JSON.stringify(message));
}

// * 2 메세지 수신
function onMessageLec(evt) {
	
   var data = JSON.parse(evt.data);
   
   if(data.state == "0"){
	   console.log(data.userId + "접속하셨습니다.")
	   console.log(data.msg)
	   return;
   }
   
   if(data.state == "1"){
	   var tmpTag;
	   var tmplecCode = document.querySelectorAll("input[name=lec_code]");
	   
	   console.log(data.lecCode)
	   
	   tmplecCode.forEach((value,i)=>{
		  	if(value.getAttribute("value") == data.lecCode){
		  		tmpTag = value.parentElement.parentElement;
		  		return;
		  	}
	   })
	   
		countStuNum(tmpTag, data.count);
// 	   tmpTag.parentElement.parentElement.children[6].innerText = tmpTag.parentElement.parentElement.children[6].innerText*(1) - 1;
   }
   
   if(data.state == "2"){
	   console.log(data.userId + "떠났습니다...")
	   console.log(data.msg)
	   return;
   }
   
}


</script>