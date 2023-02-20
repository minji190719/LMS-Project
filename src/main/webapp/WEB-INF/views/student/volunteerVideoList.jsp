<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<style>
.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}
</style>

<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;교내 봉사<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/volunteer/showList">교내 봉사</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-8">
		<div class="card" style="height: 750px;">
			<div class="card-body">
				<div id="newWay">
					<div class="alert alert-primary">전체 누적 봉사시간&nbsp;&nbsp;
						${totalTime } / 72 시간&nbsp;&nbsp;&nbsp;&nbsp;</div>
					<div class="alert alert-success">교내 누적 봉사시간&nbsp;&nbsp;
						${time } / 36 시간&nbsp;&nbsp;&nbsp;&nbsp;</div>
				</div>
				<div class="table-responsive">

					<table class="table table-hover">
						<thead class="custom-theader-s" style="text-align:center;">
							<tr>
								<th>No</th>
								<th>교육명</th>
								<th style="width: 450px;">교육내용</th>
								<th>부여시간</th>
								<th>재생시간</th>
								<th>참여</th>
							</tr>
						</thead>
						<tbody id="selectVolVideoList">

							<!--                             for ajax -->

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="card" style="height: 750px;">
			<div class="card-body">
				<h4>[필독] 유의사항</h4>
				<hr>
				<div class="pl-4 pr-4 pt-0">
					<ul>
						<li style="list-style-type: disc;">영상을 처음부터 끝까지 모두 시청하여야 문제를 풀 수 있습니다.</li>
						<li style="list-style-type: disc;">봉사시간으로 인정된 이후 30일 이내에 영상 시청 시 조작이 밝혀질 경우, 교내 봉사시간이 무효처리됩니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
window.onload = function(){
	getVolList();
}	
	
	
	//교육 리스트 뽑기
	 function getVolList(){
		 
		$.ajax({   // 리스트 가져오기
			method:"get",
			url: "/volunteer/showListData",
			dataType:"json",
			success: function(resList){
				console.log("result :  ", resList)					
					$("#selectVolVideoList").html(alreadyList(resList));				
			},
			error : function(request,status,error){
				console.log('실패 ')
			}
		})
	}
	
	
	
	const alreadyList = resList => {
		let str = "";
		if(resList.length == 0){
			str += "<tr><td colspan='6'>봉사내역이 존재하지 않습니다.</td></tr>";
		}else{
		
			for(var i = 0; i < resList.length; i++){
					
				str += "<tr>";
				str += `<th style='padding: 25px 0px; text-align:center;'>\${i+1}</th>`;
				str += "<td>"+resList[i].voll_name +"</td>";
				str += "<td>"+resList[i].voll_content +"</td>";
				str += "<td>"+resList[i].voll_time +"시간</td>";
				str += "<td>"+resList[i].voll_runtime +"분</td>";
				str += "<td>";
				
				str += `<div class="bootstrap-modal">`;
				str += '<input type="hidden" id="voll_code" name="voll_code" class="'+resList[i].voll_code+'" value="'+resList[i].voll_code+'">';
				str += '<input type="hidden" id="voll_time" name="voll_time" class="'+resList[i].voll_time+'" value="'+resList[i].voll_time+'">';
						if(resList[i].smem_no == null || resList[i].smem_no == ""){
                str += 			'<button type="button" id="videoButton"  data-num = "'+resList[i].voll_code+'" class="btn btn-primary custom-btn-s" onclick="video(this)" data-target="#basicModal'+i+'">참여하기</button>';
						}else{
                str += 			'<button type="button" class="btn mb-1 btn-success" onclick="exception()" >참여완료</button>';
						}
                str += '<div class="modal fade bd-example-modal-lg" id="basicModal'+i+'" style="display: none;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">';
				str +=		`<div class="modal-dialog modal-dialog-centered modal-lg">
					    		<div class="modal-content" style="width: 1150px;">
									<div class="modal-header">
										<h5 class="modal-title" id="modalTitle"></h5>
										<button type="button" class="close" data-dismiss="modal"><span>×</span>
										</button>
									</div>
                           			<div id="modalBody" class="modal-body" style="width: auto;">`;
	           	str +=	             	'<video id="videoPlay'+i+'" class="videoplayclass" width="100%" height="100%" >';
            	str +=          			'<source src="/resources/video/'+resList[i].voll_filename +'" type="video/mp4">';
	            str +=           		`</video>
                            		</div>
									<div class="modal-footer">
										<button type="button" id="register" class="btn mb-1 btn-primary custom-btn-s" onclick="registerQuizModal(this)">제출하기</button>
										<button type="button" id="btnClose" class="btn mb-1 btn-outline-dark" data-dismiss="modal">닫기</button>
									</div>
					    		</div>
					  		</div>
						</div>
               			</div>`;
				
				str += "</td>";
				str += "<tr>";
							
			}
		}
		return str;
	}
	
	function exception(){
		swal("","이미 참여하신 교육은 재참여가 불가합니다!", "warning",{buttons:"확인"});
		return false;
	}
	
	
	
	//참여하기 버튼 누르는 순간
	function video(pthis){
				
		
		   console.log(pthis.dataset.target)
		   let modalId= pthis.dataset.target;
		      
		      swal("영상을 시청하시겠습니까?",{
		            buttons:{
		               select:"확인",
		               cancel:"취소"
		            }
		         }).then((value)=>{
		            console.log(value)
		            
		            switch(value){
		            case "select":
		               //input hidden 
		              var modalTitle = $(pthis).parent().find('h5');
		              console.log(pthis.parentNode.children[0].value);
		              console.log();
		              console.log(modalTitle.length);
		              
		              var voll_code = pthis.parentNode.children[0].value;
		              $(modalId).modal('show');
		              
//		               alert("영상을 시청합니다.");
		              
		              $.ajax({
		                 url : "/volunteer/showVideo",
		                 type : "get",
		                 dataType : "json",
		                 data : {"voll_code":voll_code},
		                 success : function(data){
		                    console.log("성공");
		                    console.log(data.voll_name);
		                    
		                    $(modalTitle).html(data.voll_name);
		                 }
		                 
		              })
		              
		              //비디오 객체 정보
		              var play1 = $(pthis).next().children().children().children().next().children()[0].id;
		              var play = document.getElementById(play1);
		              
		              //모달창 정보
		              var basicModalId = $(pthis).parent().children()[2].id;
		              var basicModalEle = document.getElementById(basicModalId);
		              
		              //모달 body
//		               var modalBody = document.querySelector("#modalBody");

	        		
	        		play.play();
	        		
	        		console.log(basicModalId);
	        		console.log(basicModalEle);
	        		console.log(pthis.dataset.num);
//	         			$(document).ready(function(){
	        				
	        				setTimeout(function() {
	        					var time = play.duration;
	        					var modalBody = document.querySelectorAll("#modalBody")[pthis.dataset.num-1];
	        					
	        					console.log("time = "+ voll_code);
	        					
	        					setTimeout(function() {
// 	        						alert("영상 시청을 완료하셨습니다. 퀴즈페이지로 이동합니다");
	        						swal("영상 시청을 완료하셨습니다. 퀴즈페이지로 이동합니다",{buttons:"확인"})
	        						.then((value)=>{

		        						play.remove();
		        						modalBody.innerHTML = getVolQuizList(voll_code);
	        						})
//	         						alert(getVolQuizList(voll_code));

//	         						console.log(getVolQuizList(voll_code));
//	         						console.log(modalBody);
	        						
	        						
	        						
//	         						$(basicModalEle).modal('hide');
	        					}, (time + 0.5) * 1000);
	        					
	        				}, 500);
	            
	               break;
	            	   
	            default:
	               break;
	            }
	         })
		
		
			
			
	
	
		
		
	}//video(pthis)
	
	
	//퀴즈리스트 뽑는 곳
	function getVolQuizList(val){
		
		var voll_code = {
			"voll_code" : val
		}
		
		console.log("test2 = ",voll_code);
		
		var result = "";

		$.ajax({
			method : "get",
			url : "/volunteer/showQuizList",
			dataType : "json",
			async : false,
			data : voll_code,
			success : function(resList){
				console.log("값 나와라잇 : ",resList);
				
				let tblStr = "";
				
				for(var i = 0; i < resList.length; i++){
					tblStr +=	`<div style="margin-left:20%;">
									<div class="row">
										<div class="col-9">
								            <div class="card" >
								            	<h3>\${i+1} / 5 번 문제</h3>
								                <div class="card-body custom-theader-s">`;
					tblStr +=			            "<p class='custom-s'>"+resList[i].volq_quiz+"</p>";
					tblStr +=		            `</div>
								            </div>
								        </div>
									</div>
									<div class="row">
										<div class="col-xl-9 col-md-4 col-sm-3 mb-4 mb-sm-0">
								          <div class="list-group" id="list-tab" role="tablist">`;
		            tblStr +=		         '<input type="hidden" value="'+resList[i].volq_answer+'" >';
		            tblStr +=		         '<button class="list-group-item list-group-item-action" onclick="example(this)" id="example1" data-toggle="list" role="tab" aria-selected="false" value="1">'+resList[i].example1+'</button>';
            		tblStr +=		         '<button class="list-group-item list-group-item-action" onclick="example(this)" id="example2" data-toggle="list" role="tab" aria-selected="false" value="2">'+resList[i].example2+'</button>';
					tblStr +=				 '<button class="list-group-item list-group-item-action" onclick="example(this)" id="example3" data-toggle="list" role="tab" aria-selected="false" value="3">'+resList[i].example3+'</button>'; 
					tblStr +=				 '<button class="list-group-item list-group-item-action" onclick="example(this)" id="example4" data-toggle="list" role="tab" aria-selected="false" value="4">'+resList[i].example4+'</button>';
					tblStr +=			`</div>
								      </div>
									</div>
								</div><br><br><br><br><br>`;

				}
				result = tblStr;
// 				alert(result);
			}
			
		})
// 		console.log(result);
		return result;
	}
	
	
	
	let cnt = 0;
	function example(sthis){
		console.log($(sthis).parent().children().val());
		console.log($(sthis).val());
		
		var answer = $(sthis).parent().children().val();
		var myChoice = $(sthis).val();
		
		if(answer == myChoice){
			swal("정답입니다!","", "success");
			$(sthis).css("background-color","#304674");
			cnt++;
			console.log(cnt);
		} 
		
		if(answer != myChoice){
			swal("오답입니다!","", "error");
			$(sthis).css("background-color","#FF5A5A");
		}
// 		var register = document.getElementById("register");
// 		registerQuizModal(register,cnt);
		
	}
	
	
	function registerQuizModal(rthis){
		
		
		console.log("코드체크",$(rthis).parent().parent().parent().parent().parent().children()[0].value);
		var code = $(rthis).parent().parent().parent().parent().parent().children()[0].value;
		var time = $(rthis).parent().parent().parent().parent().parent().children()[1].value;
		var basicModalId2 = $(rthis).parent().parent().parent().parent().parent().children()[3].id;
		var modalBack = $(".modal-backdrop fade show");
// 		console.log("basicModalId2 this값 : ~~ ",basicModalId2);
// 		console.log("this값 : ~~ ",rthis)
// 		console.log(modalBack)
		
		$.ajax({
			method : "get",	
			url : "/volunteer/insertVolTime",
			data : {"voll_code" : code, "volh_time" : time},
			dataType : "text",
			success : function(res){
// 				alert(res);	
				$(basicModalId2).modal('hide');
				$(".modal-backdrop").remove();
				swal("4문제 이상 맞추어 1시간의 봉사시간이 적립됩니다!")
				.then((value) => {
					$("#newWay").load("/volunteer/showList #newWay");
					getVolList();
				});
// 				location.href="/volunteer/showList";
			}
			
		})
		
		
	}
		
		
	
		
		
	

</script>
</html>