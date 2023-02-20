<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  #btnId{ 
 	width: 57px; 
 	height: 57px; 
  	display: inline-flex;  
     flex-direction: column;  
     align-items: center;  /*      가로 - 중앙으로   */
     justify-content: flex-start;  /*       세로 - 상단으로    */
     padding-top: 14px; 
     font-size: 20px; 
     font-weight: bold;
     color: white;
 } 

 #divforseat{
 	
 }
 
 .btn-success{
 	background-color: #5480C2;
 }
 
 .btn-warning{
 	background-color: #C6C9CC;
 }

</style>
</head>
<body>
<h4 class="card-title">
	<i class="fa-solid fa-graduation-cap"></i>&nbsp;&nbsp; 열람실 자리예약
</h4>
<div class="row">
	<div class="col-lg-9" >
		<div id="divforseat" class="card" style="height: 900px; overflow: auto; overflow-y:hidden; ">
			<div class="card-body" style="width: 1245px;">
			<select class="form-control input-default" style="width: 150px;">
				<option>제 1 열람실</option>
				<option>제 2 열람실</option>
				<option>제 3 열람실</option>
			</select>
            <br>
				<button id="btnId" type="button" class="btn mb-1 btn-success">1</button>
				<button id="btnId" type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">2</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId" type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">3</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">4</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">5</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">6</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId" type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">7</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">8</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">9</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">10</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId" type="button" class="btn mb-1 btn-success">11</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">12</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">13</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">14</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId" type="button" class="btn mb-1 btn-success">15</button>
				<button id="btnId" type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">16</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">17</button>
				<button id="btnId" type="button" class="btn mb-1 btn-success">18</button>
				<hr style="border: 2px solid lightgrey;">
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >19</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >20</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">21</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >22</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >23</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">24</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >25</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >26</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >27</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >28</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >29</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >30</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">31</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >32</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >31</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >32</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >33</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >34</button>
				<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="divForSeatList">
				
				</div>
				<hr style="border: 2px solid lightgrey;">                 
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >53</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning"  value="1" onclick="btnReservation(this)">54</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-warning"  value="1" onclick="btnReservation(this)">55</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-warning"  value="1" onclick="btnReservation(this)">56</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >57</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >58</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >59</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >60</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >61</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >62</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >63</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >64</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >65</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >66</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >67</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >68</button>
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">69</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >70</button>
				<br><br><br><br>                                     
				<div class="alert alert-dark" style="text-align:center; width: 100px; height: 300px; float: left; padding-bottom: 5px;"><h1>출</h1><br><h1>입</h1><br><h1>구</h1><br> </div>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >71</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >72</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >73</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >74</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">75</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >76</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >77</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >78</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >79</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">80</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >81</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >82</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >83</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">84</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >85</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >86</button>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">87</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >88</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >89</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >90</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >91</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">92</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >93</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)" >94</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">95</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" >96</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >97</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">98</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >99</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >100</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)">101</button>&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-success" >102</button>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
				<br><br>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" value="1" onclick="btnReservation(this)" style="width: 140px;">103</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">104</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">105</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">106</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">107</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">108</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">109</button>&nbsp;&nbsp;                                                  
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">110</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">111</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">112</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">113</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">114</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 140px;">115</button>&nbsp;&nbsp;                                                  
				<button id="btnId"  type="button" class="btn mb-1 btn-warning" value="1" onclick="btnReservation(this)" style="width: 140px;">116</button>&nbsp;&nbsp;                                                  
				                                                                             
			</div>
		</div> 
	</div> 
	<div class="col-lg-3" >
		<div class="card" style="height: 900px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;">
			<div class="card-body">
				<span class="icon icon-xcloud001"></span>
			  <form id="seatInfomation">
				<div class="alert alert-primary" style="font-size: 23px; padding-left: 33px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;좌석 정보 및 주의사항</div>
				<div class="alert alert-warning" >
					※ 주의사항 ※<br>
					▶ 열람실 내에서는 마스크를 꼭 착용해주세요.<br>
					▶ 열람실 내에서는 잡담을 최소화해주세요.<br>
					▶ 열람실 내의 시설물을 훼손하지 마세요.<br>(낙서, 훼손 시 원상복구 조치)<br>
					▶ 열람실 이용 후 개인쓰레기는 정리해주세요.<br>
					▶ 열람실 내에서는 음료를 제외한 음식물을 취식할 수 없습니다.<br>
				</div>
				 <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>학번</label>
                        <input type="text" id="smem_no" class="form-control input-default" value="${smem_no }" disabled="disabled">
                    </div>
                    <div class="form-group col-md-6">
                        <label>성명</label>
                        <input type="text" id="stu_name" class="form-control input-default" value="${mem_name }" disabled="disabled">
                    </div>
                </div>
				 <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>좌석번호</label>
                        <input type="text" id="seatNumber" class="form-control input-default" value="" disabled="disabled" style="font-size: 20px;">
                    </div>
                    <div class="form-group col-md-6">
                        <label>반납시각</label>
                        <input type="text" id="seatExit" class="form-control input-default" value="" disabled="disabled" style="font-size: 20px;">
                    </div>
                </div>
                <div id="reserveBtn" onclick="BtnReserve()" class="alert alert-info" style="cursor:pointer; width: 165px; height: 100px; float: left; font-size: 20px; text-align: center; padding-top: 35px;">예약</div>
<!--                 <div id="extendsBtn" onclick="BtnExtends()" class="alert alert-warning" style="cursor:pointer; width: 100px; height: 100px; float:left; margin-left: 28px; font-size: 20px; text-align: center; padding-top: 35px;" >연장</div> -->
                <div id="exitBtn" onclick="BtnExit()" class="alert alert-danger" style="cursor:pointer; width: 165px; height: 100px; float: right; font-size: 20px; text-align: center; padding-top: 35px;">반납</div>
                <br>
                <br>
                <br>
                <button id="btnId"  type="button" class="btn mb-1 btn-success" style="background-color:#4FE363; width: 50px; height: 50px;"></button>&nbsp;&nbsp;&nbsp;본인 예약 좌석<br>
                <button id="btnId"  type="button" class="btn mb-1 btn-success" style="width: 50px; height: 50px;"></button>&nbsp;&nbsp;&nbsp;사용 가능 좌석 <br>
                <button id="btnId"  type="button" class="btn mb-1 btn-warning" style="width: 50px; height: 50px;"></button>&nbsp;&nbsp;&nbsp;사용 불가능 좌석<br>
                <button id="btnId"  type="button" class="btn mb-1 btn-secondary" style="width: 50px; height: 50px;"></button>&nbsp;&nbsp;&nbsp;2인 이상 사용가능 좌석<br>
			  </form>
			</div>
		</div> 
	</div> 
</div> 

</body>
<script type="text/javascript">
// 	var all = querySelectorAll(".btn").
window.onload=function(){
	seatList();
}
	
	//좌석번호 클릭 이벤트
	function btnReservation(rthis){
		
		if(rthis.value == 1){
			swal("", "이미 예약된 좌석입니다! 다른 좌석을 선택해주세요!", "warning",{
	            buttons:"확인"
	        }).then((value)=>{
				return false;
	        })
		}else{
			console.log(rthis.value);
			
			//좌석번호
			var btnValue = rthis.innerText;
			var seatNumber = document.querySelector("#seatNumber");
			var seatExit = document.querySelector("#seatExit");
			var theTime = new Date();

			theTime.setHours(theTime.getHours() + 2);
			
			var date = theTime.getDate();
			var hours = theTime.getHours();
			var minutes = theTime.getMinutes();
			var seconds = theTime.getSeconds();

			swal(btnValue +" 번 좌석을 선택하셨습니다!",{buttons:"확인"});
			
			seatNumber.value = btnValue;
			seatExit.value = date + '일 ' + hours + '시 ' + minutes + "분";
		}
		
		
// 		if(rthis.value == 2){
// 			alert("사용할 수 없는 좌석입니다! 다른 좌석을 선택해주세요!");
// 			return false;
// 		}
		
		
	}
	
// 	function BtnExtends(){
// 		var seatNumber = document.getElementById("seatNumber").value;
// 		var seatExit = document.querySelector("#seatExit");
		
// 		if(!confirm("연장하시겠습니까?")){
// 			return false;
// 		}

// 		var theTime = new Date();

// 		theTime.setHours(theTime.getHours() + 3);
		
// 		var date = theTime.getDate();
// 		var hours = theTime.getHours();
// 		var minutes = theTime.getMinutes();
// 		var seconds = theTime.getSeconds();
		
// 		seatExit.value = date + '일 ' + hours + '시 ' + minutes + "분";
		
// 		var seatExitVal = seatExit.value

// 		console.log(seatExitVal);
		
// 		$.ajax({
// 			url : "/seat/extends",
// 			method : "GET",
// 			data : {"seat_code" : seatNumber,"seat_start" : seatExitVal},
// 			success : function(data){
// 				alert(data);
// 				seatList();
				
// 			}
// 		})

		
// 	}


	function BtnReserve(){
		
		var seatNumber = document.getElementById("seatNumber").value;
		var stu_name = document.getElementById("stu_name").value;
		var seatExit = document.getElementById("seatExit").value;
	
		
		console.log(seatNumber);

		if(seatNumber == null || seatNumber == ""){
			swal("좌석을 선택해주세요!",{buttons:"확인"})
			return false;
		}
				
// 		if(!confirm("좌석을 예약하시겠습니까? 유효시간은 2시간입니다.")){
// 			return false;
// 		}
		swal("좌석을 예약하시겠습니까?", "유효시간은 2시간입니다.", "info",{
            buttons:{
            	select : "확인",
            	cancel : "취소"
            }
         }).then((value)=>{
			switch(value){
				case "select" : 
					$.ajax({
						url : "/seat/reservation",
						method : "GET",
						data : {"seat_code" : seatNumber, "stu_name" : stu_name, "seat_start" : seatExit},
						success : function(res){
							swal(res,"","success",{buttons:"확인"})
							.then((value)=>{
								seatList();
							})
						}
					})
					break;
				default : 
					break;
			}          
         })
		
		
		
	}
	
	
	
	function seatList(){
		
		var str = "";
		var divForSeatList = document.getElementById("divForSeatList");

		$.ajax({
			url : "/seat/getAllSeatList",
			method : "GET",
			dataType : "json",
			success : function(dataList){
				console.log(dataList)
				
				for(var j = 0; j < dataList.length; j++){
					
					if(dataList[j].seat_state == 0){
						str += '<button id="btnId"  type="button" class="btn mb-1 btn-success" onclick="btnReservation(this)">'+dataList[j].seat_code+'</button>&nbsp;';
					}else if(dataList[j].seat_state == 1){
						str += '<button  id="btnId"  type="button" class="btn mb-1" style="background-color:#4FE363;" onclick="btnReservation(this)">'+dataList[j].seat_code+'</button>&nbsp;';
					}
					
					if((j % 4) == 0){
						str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					}
					
				}
				
				divForSeatList.innerHTML = str;
				
			}
		
		})
		
	}
	
	function BtnExit(){
		
		var seatNumberVal = document.getElementById("seatNumber").value;
		
		var seatExit = document.getElementById("seatExit");
		var seatNumber = document.getElementById("seatNumber");
		
		console.log("cccccccccc",seatNumberVal);
		
// 		if(!confirm("좌석을 반납하시겠습니까?")){
// 			return false;
// 		}
		swal("좌석을 반납하시겠습니까?",{
			buttons : {
				select : "확인",
				cancel : "취소"
			}
		})
		.then((value)=>{
			switch(value){
				case "select":
					
					$.ajax({
						url : "/seat/seatExit",
						method : "GET",
						data : {"seat_code" : seatNumberVal},
						success : function(data){
							swal(data , "" , "success" , {buttons:"확인"})
							.then((value) => {
								seatExit.value = '';
								seatNumber.value = '';
								seatList();
							})
						},
						dataType : "text"
					})
					
					break;
				default:
					break;
			}
			
		})
		
		
	
		
	}
</script>
</html>


