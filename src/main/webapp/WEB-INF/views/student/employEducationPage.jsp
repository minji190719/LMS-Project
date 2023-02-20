<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<style type="text/css">
table, thead {
   display:block;
    width:100%;
}

table thead tr {
   display:table;
    table-layout:fixed;
    width:100%;
}

tbody { 
   display: block;
    height: 600px;
    overflow-y: scroll;
}

tbody tr {
   display: table;
   table-layout: fixed; 
   width:100%;
}
</style>

<div>
	<div id="employEducationProgramList"></div>
</div>
 
<script type="text/javascript">
	window.onload = function() {
		let header = $("meta[name='_csrf_header']").attr('content');
		let token = $("meta[name='_csrf']").attr('content');
		
		$.ajax({
			url : "/employEducation/employEducationProgramList",
			type : "post",
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			success : function(res){
				console.log(res);
				firstDrawHTML(res);
			},
			dataType : "json"
		})
	}
	
function firstDrawHTML(res){
	let employEducationProgramList = $("#employEducationProgramList");
	let HTML = ``;
		HTML += `<div class="row">
			<div class="col-lg-6">
			<h4 class="card-title custom-s mt-3 custom-bold">
				<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;취업 프로그램<br />
			</h4>
		</div>
		<div class="col-lg-6">
			<div class="row page-titles" style="background: none !important;">
				<div class="col p-md-0">
					<ol class="breadcrumb custom-bold">
						<li class="breadcrumb-item"><a href="/main/home"><i
								class="fa-solid fa-house"></i></a></li>
						<li class="breadcrumb-item active"><a
							href="/employEducation/employEducationPage">취업 프로그램</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
		
		  <div class="row">
			 <div class="col-lg-12">
				<div class="card">
				<div id="searchBlock" style="margin-left: 85%; margin-top: 20px;">
				<input type="text" class="form-control-sm input-default" style="margin: 5px; border: 1px solid gray;" id="searchWord" placeholder="프로그램 이름 입력">
				<i class="mdi mdi-magnify"onclick="search()"></i>
			</div>
				   <div class="card-body" style="height: 737px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;">
					   <div class="table-responsive" style="overflow: scroll; overflow-x:hidden; overflow-y:hidden;">
						   <table class="table table-hover" id="tableTest">
							   <thead class="custom-theader-s">
								   <tr style="text-align: center;">
									   <th style="width:50px;">No.</th>
									   <th style="width:300px;">프로그램</th>
									   <th style="width:50px;">정원</th>
									   <th style="width:50px;"></th>
								   </tr>
							  </thead>
							  <tbody>
								   `;
								   
							       if(res.length > 0){
							    	   for (let i = 0; i < res.length; i++) {
										   HTML += `<tr style="text-align:center;">
													   <td style="width:50px;">\${i+1}</td>
													   <td style="width:300px;">
													   	   <br>
														   <div style=" text-align:left; font-size: 20px; font-weight: bold; cursor: pointer;" onclick="employEducationProgramDetailPage(\${res[i].epro_code})">&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].epro_name}</div>
														   <br>
														   <div style="">&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].epro_charcontent}</div>
														   <br>
														   <div style="text-align: right;">
														   		<span style=" font-size: 15px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;참여기간 :</span>
														   		\${res[i].epro_start} ~ \${res[i].epro_end}
														   </div>
													   </td>
													   <td style="text-align : center; width:50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].epro_limit}</td>
													   <td style="width:50px;">
													   	<button class="btn mb-1 btn-primary custom-btn-s" onclick="employEducationProgramApply(\${res[i].epro_code})">신청</button>
													   </td>
												   </tr>  `;
									 	  }
							       }else{
							    	   HTML += `<tr><td colspan="4">검색 결과가 존재하지 않습니다</td></tr>`;
							       }
								  
								   
								   HTML += `
							   </tbody>
						   </table>
					   </div>
				   </div>
				</div>
			 </div>
			 <div id="employEducationProgramDetail"></div>
			 ;`
			 
			 $(employEducationProgramList).html(HTML);
	
}

function employEducationProgramDetailPage(eproCode){
	let employEducationProgramList = $("#employEducationProgramList");
	let width = $(employEducationProgramList).find(".col-lg-12");
	let searchBlock = $("#searchBlock");
	
	let header = $("meta[name='_csrf_header']").attr('content');
	let token = $("meta[name='_csrf']").attr('content');
	
	let epro_code = eproCode;
	console.log("epro_code : ",epro_code);
	
	$.ajax({
		url : "/employEducation/employEducationProgramDetailPage",
		type : "post",
		data : {"epro_code" : epro_code},
		beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
     	},
		success : function(res){
			$(width).attr("class", "col-lg-8");
			$(searchBlock).css("margin-left", "800px");
			console.log("디테일 : ", res);
			detailDrawHTML(res);
		},
		dataType : "json"
	})
	
	
}

function detailDrawHTML(res){
	let employEducationProgramDetail = $("#employEducationProgramDetail");
	$(employEducationProgramDetail).attr("class", "col-lg-4");
	let HTML = ``;
	HTML += `
			
				<div class="card" style="height: 803px;" >
				   <div class="card-body">
					   <div class="table-responsive" overflow-x:hidden;>
						   <table class="table table-hover" id="tableTest">
							   <thead>
								  <tr>
								  	<td>
								  		<img onclick="detailReturn()" style="cursor: pointer;" src="/resources/employProgram/\${res.epro_content}" width="100%" ></img>
									</td>
								  </tr>
							   </thead>
						   </table>
					   </div>
				   </div>
			 `;
	$(employEducationProgramDetail).html(HTML);
}

function detailReturn(){
	const employEducationProgramDetail = $("#employEducationProgramDetail");
	let employEducationProgramList = $("#employEducationProgramList");
	let width = $(employEducationProgramList).find(".col-lg-8");
	let searchBlock = $("#searchBlock");
	$(searchBlock).css("margin-left", "85%");
	$(width).attr("class", "col-lg-12");
	$(employEducationProgramDetail).empty();
	
}

function employEducationProgramApply(eproCode){
	
	  swal("신청하시겠습니까?",{
          buttons:{
             select:"확인",
             cancel:"취소"
          }
       }).then((value)=>{
          console.log(value)
          
          switch(value){
          case "select":
        	  let header = $("meta[name='_csrf_header']").attr('content');
      		let token = $("meta[name='_csrf']").attr('content');
      		let epro_code = eproCode;
      		console.log("취업프로그램신청 : ",epro_code);
      		
      		$.ajax({
      			url : "/employEducation/employEducationProgramApply",
      			type : "post",
      			data : {"epro_code" : epro_code},
      			beforeSend : function(xhr){
      	    	    xhr.setRequestHeader(header, token);
      	     	},
      			success : function(res){
      				console.log("신청후 : ",res);
      				if(res == "OK"){
//       					alert("신청이 완료되었습니다");
      					swal({
      						  title: "신청이 완료되었습니다",   //큰 글씨
      						  icon: "success",   //info, success등 종류
      						});
      				}else{
//       					alert("이미 신청한 프로그램입니다");
      					swal({
      						  title: "이미 신청한 프로그램입니다",   //큰 글씨
      						  icon: "warning",   //info, success등 종류
      						});
      				}
      				
      				
      			},
      			dataType : "text"
      		})
             break;
          default:
             break;
          }
       })
	
	
// 	if(confirm("신청하시겠습니까?")){
		
			
// 	}
	
}

function search(){
	let header = $("meta[name='_csrf_header']").attr('content');
	let token = $("meta[name='_csrf']").attr('content');
	
	let searchWord = $("#searchWord").val();
	
	$.ajax({
		url : "/employEducation/employEducationProgramList",
		type : "post",
		data : {"searchWord" : searchWord},
		beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
     	},
		success : function(res){
			console.log(res);
			firstDrawHTML(res);
		},
		dataType : "json"
	})
		
}

</script>
</html>