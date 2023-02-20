<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
.table-sticky{

}

.table-sticky-m thead tr th{
	position: sticky;
	top:-1px;
	background-color : rgba(245, 245, 245, 0.493) !important;
}

#memList {
	position : relative;
	height : 330px;
	overflow: auto;
}

#tableName th{
	position: sticky; top:0;z-index:1;
	background:#8b8989;
	color:white;
}

#detailBox{
	height:500px;
}
.clickbg{
	background-color:#efefef;
}

</style>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;학생 등록<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/enroll/register">학생 등록</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<!-- 첫번째 컨테이너 -->
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body height-400">
			    <div style="display: flex; justify-content: space-between; margin-left: 15px; margin-right: 15px;">
			    	<div>총 <span id="totalStudent">0</span>건</div>
					<div>
						등록건수 : <span id="registerS">0</span>건 | 미등록 건수 : <span id="unregisterS">0</span>건
					</div>
			    </div>
				<div class="col-12" id="memList">
					<table class=' table table-bordered table-hover table-sticky'
						id="memListTable" style="cursor: pointer;">
						<thead id="tableName custom-theader-m">
							<tr>
								<th>학번</th>
								<th>회원명</th>
								<th>단과대학</th>
								<th>학과명</th>
								<th>성별</th>
								<th>등록체크</th>
							</tr>
						</thead>
						<tbody id="dataBox">
							<tr>
								<td colspan=6
									class="height-200 text-center custom-font-size-100">Excel
									파일 드래그시 자동으로 데이터가 입력됩니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원정보보기 컨테이너 -->
		<div class="row">
			<div class="col-6">
				<form class="form-valide" id="regForm" enctype="multipart/form-data">
					<input type="hidden" name="dep_code" id="dep_d_code">
					<div class="card" id="detailBox">
						<div class="card-body" >
					<div class="card-title">
						<h5 class="custom-m custom-bold">등록 회원 정보
						</h5>
					</div>
					<div class="row mb-1">
									<div class="col">
										<label class="text" for="smem_d_no"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학번</label>
										<input type="text" class="form-control input-default text-center" id="smem_d_no"
											name="smem_no" placeholder="학번 입력" required>
									</div>
									<div class="col">
										<label class="text" for="mem_d_name"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;성명</label>
										<input type="text" class="form-control input-default text-center col" id="mem_d_name"
											name="mem_name" placeholder="이름">	
									</div>
									<div class="col">
										<label class="text" for="mem_d_sex"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;성별</label>
										<input type="text" class="form-control input-default text-center col" id="mem_d_sex"
											name="mem_sex" placeholder="성별">
									</div>
								</div>	
								
								<div class="row mb-1">
									<div class="col">
										<label class="text" for="col_d_name"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;단과명</label>
										<input type="text" class="form-control input-default text-center" id="col_d_name"
											name="col_name" placeholder="단과명">
									</div>
									<div class="col">
										<label class="text" for="dep_d_name"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학과</label>
										<input type="text" class="form-control input-default text-center" id="dep_d_name"
											name="dep_name" placeholder="학과">
									</div>
									<div class="col">
										<label class="text" for="stu_d_semester"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;학년</label>
										<input type="text" class="form-control input-default text-center" id="stu_d_semester"
											name="stu_semester" placeholder="학년">
									</div>
								</div>	
								
								<div class="row mb-1">
									<div class="col">
										<label class="text" for="mem_d_tel"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;연락처</label>
										<input type="text" class="form-control input-default text-center" id="mem_d_tel"
											name="mem_tel" placeholder="연락처">
									</div>
									<div class="col">
										<label class="text" for="mem_d_reg1"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;주민등록번호</label>
										<div class="row">
											<div class="col custom-font-20">
												<input type="text" class="form-control input-default text-center col" id="mem_d_reg1"
													name="mem_reg1" placeholder="앞">
											</div>
											<div class="col">
												<input type="text" class="form-control input-default text-center col" id="mem_d_reg2"
													name="mem_reg2" placeholder="뒤">
											</div>
										</div>
									</div>
									<div class="col">
										<label class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;이메일</label>
										<input type="text" class="form-control input-default text-center" id="mem_d_email"
											name="mem_email" placeholder="이메일">
									</div>
								</div>	
								
								<div class="row mb-1">
									<div class="col">
										<label class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;주소</label>
										<input type="text" class="form-control input-default text-center" id="mem_d_addr1"
													name="mem_addr1" placeholder="주소">
									</div>
									<div class="col">
										<label class="text"><i class="fa-solid fa-caret-down"></i>&nbsp;&nbsp;상세주소</label>
										<input type="text" class="form-control input-default text-center" id="mem_d_addr2"
													name="mem_addr2" placeholder="상세">
									
									</div>
								</div>
								<div class="row mb-1 offset-11 pt-2">
									<input type="button" class="btn mb-1 btn-primary custom-btn-m" value="등록" id="regBtn">
								</div>
							</div>
						</div>
					<sec:csrfInput/>
				</form>
			</div>
			<div class="col">
				<div class="card height-500">
					<div class="card-body">
						<table class="table table-hover table-bordered table-sticky-m">
							<thead class="custom-theader-m">
								<tr>
									<th>순번</th>
									<th>학번</th>
									<th>이름</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="dataBody">
							<tbody>
						</table>
					</div>
				</div>
			</div>	
		</div>

<script>

let header;
let token;
let nowClick;
let dataBody;
window.onload = function(){
	header=$("meta[name='_csrf_header']").attr('content');
	token=$("meta[name='_csrf']").attr('content');
	dataBody=document.querySelector("#dataBody");
	keyEvent();
	
	var memData = $(".memData");
	
	// 유저등록
	var regBtn = $("#regBtn");
	regBtn.on("click", function(){
		
	   swal("등록하시겠습니까?",{
            buttons:{
               select:"확인",
               cancel:"취소"
            }
         }).then((value)=>{
            switch(value){
            case "select":
        		var queryString = $("#regForm").serialize(); 
        		
        		$.ajax({
        			url : "/enroll/enrollReg",
        			type : "post",
        			data : queryString,
        			dataType : "text",
        			success : function(res){
        				if(res == "success"){
        					document.querySelector("#unregisterS").innerText = document.querySelector("#unregisterS").innerText*(1)-1;
        					document.querySelector("#registerS").innerText = document.querySelector("#registerS").innerText*(1)+1;
        					nowClick.children[5].children[0].checked =true;
        					let text = addTableData();
        					dataBody.innerHTML += text;
        					statusCreate();
       					   swal({
       							  title: "등록이 완료되었습니다.",   //큰 글씨
       							  icon: "success",   //info, success등 종류
       						});

        				}
        				
        			},
        			error : function(xhr) {
    					   swal({
    							  title: "등록을 실패했습니다.",   //큰 글씨
    							  icon: "warning",   //info, success등 종류
    						});
        			}
        			
        		})
               break;
            default:
               break;
            }
         })
		
		
// 		var queryString = $("#regForm").serialize(); 
		
// 		$.ajax({
// 			url : "/enroll/enrollReg",
// 			type : "post",
// 			data : queryString,
// 			dataType : "text",
// 			success : function(res){
// 				if(res == "success"){
// 					document.querySelector("#unregisterS").innerText = document.querySelector("#unregisterS").innerText*(1)-1;
// 					document.querySelector("#registerS").innerText = document.querySelector("#registerS").innerText*(1)+1;
// 					nowClick.children[5].children[0].checked =true;
// 					let text = addTableData();
// 					dataBody.innerHTML += text;
// 					statusCreate();
// 					alert("등록이 완료되었습니다.")
// 				}
				
// 			},
// 			error : function(xhr) {
// 				console.log(xhr.status)
// 			}
			
// 		})
	})
}

function addTableData(){
	text='';
	text+='<tr>';
	text+='<td></td>';
	text+='<td>'+nowClick.children[0].innerText+'</td>';
	text+='<td>'+nowClick.children[1].innerText+'</td>';
	text+='<td>등록완료</td>';
	text+='</tr>';
	return text;
}

function excelUpload(formData){
	
// 	let i =0;
// 	setInterval(function(){
// 		console.log(i);
// 		i++;
// 	},100)
	
	$.ajax({
		url : "/enroll/upload",
		type : "post",
		enctype : "multipart/form-data",
		processData : false,
		contentType : false,
		data : formData,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(data){
			
			var dataBox = $("#dataBox");
			console.log("JSON 데이터 : ",data)
			text = "";
			
			let totalStudent = document.querySelector("#totalStudent");
			let unregisterS = document.querySelector("#unregisterS");
			totalStudent.innerText = data.length;
			unregisterS.innerText = data.length;
			
			for(let i=0; i < data.length; i++){
				var smem_no = 2023+"" + (data[i].mem_no + 1000);
				var mem_name = data[i].mem_name;
				var col_name = data[i].col_name;
				var dep_name = data[i].dep_name;
				var dep_code = data[i].dep_code;
				var mem_sex = data[i].mem_sex;

				var stu_joinyear = data[i].stu_joinyear;
				var mem_tel = data[i].mem_tel;
				var mem_email = data[i].mem_email;
				var mem_reg1 = data[i].mem_reg1;
				var mem_reg2 = data[i].mem_reg2;
				var mem_addr1 = data[i].mem_addr1;
				var mem_addr2 = data[i].mem_addr2;
				
				if(i == 0){
					$("#smem_d_no").val(smem_no);
					$("#mem_d_name").val(mem_name);
					$("#col_d_name").val(col_name);
					$("#dep_d_name").val(dep_name);
					$("#dep_d_code").val(dep_code);
					$("#stu_d_semester").val(1);
					$("#mem_d_sex").val(mem_sex);
					$("#stu_d_joinyear").val(stu_joinyear);
					$("#mem_d_tel").val(mem_tel);
					$("#mem_d_email").val(mem_email);
					$("#mem_d_reg1").val(mem_reg1);
					$("#mem_d_reg2").val(mem_reg2);
					$("#mem_d_addr1").val(mem_addr1);
					$("#mem_d_addr2").val(mem_addr2);
				}
				
				text += "<tr class='memData'>"
				text += "<td>"+smem_no+"</td>"
				text += "<td>"+data[i].mem_name+"</td>"
				text += "<td>"+data[i].col_name+"<input type='hidden' value='"+data[i].dep_code+"' name='dep_code'></td>"
				text += "<td>"+data[i].dep_name+"</td>"
				text += "<td>"+data[i].mem_sex+"</td>"
				text += '<td><input type="checkBox" disabled></td>'
				text += '<input type="hidden" value="'+data[i].stu_joinyear+'"  id="stu_joinyear" name="stu_joinyear">'
				text += '<input type="hidden" value="'+data[i].mem_tel+'"  id="mem_tel" name="mem_tel">'
				text += '<input type="hidden" value="'+data[i].mem_email+'"  id="mem_email" name="mem_email">'
				text += '<input type="hidden" value="'+data[i].mem_reg1+'"  id="mem_reg1" name="mem_reg1">'
				text += '<input type="hidden" value="'+data[i].mem_reg2+'"  id="mem_reg2" name="mem_reg2">'
				text += '<input type="hidden" value="'+data[i].mem_addr1+'"  id="mem_addr1" name="mem_addr1">'
				text += '<input type="hidden" value="'+data[i].mem_addr2+'"  id="mem_addr2" name="mem_addr2">'
				text += "</tr>"
			}
			dataBox.html(text);
		},
		dataType:"json"
		
	})
	
	
}



let excelDragField;
let memListTable;
function keyEvent(){
	excelDragField = document.querySelector("#memList");
	memListTable = document.querySelector("#memListTable");
	
	memListTable.addEventListener("click", function(e){
		nowClick = e.target.parentElement;
		
		let darkbg = document.querySelector(".clickbg");
		if(darkbg != null){
			console.log(darkbg)
			darkbg.classList.remove("clickbg")
		}
		nowClick.classList.add("clickbg");
		
		$("#smem_d_no").val(e.target.parentElement.children[0].innerText);
		$("#mem_d_name").val(e.target.parentElement.children[1].innerText);
		$("#col_d_name").val(e.target.parentElement.children[2].innerText);
		$("#dep_d_name").val(e.target.parentElement.children[3].innerText);
		$("#dep_d_code").val(e.target.parentElement.querySelector("input[name=dep_code]").value);
		$("#stu_d_semester").val(1);
		$("#mem_d_sex").val(e.target.parentElement.children[4].innerText);
		$("#stu_d_joinyear").val(stu_joinyear);
		$("#mem_d_tel").val(e.target.parentElement.querySelector("input[name=mem_tel]").value);
		$("#mem_d_email").val(e.target.parentElement.querySelector("input[name=mem_email]").value);
		$("#mem_d_reg1").val(e.target.parentElement.querySelector("input[name=mem_reg1]").value);
		$("#mem_d_reg2").val(e.target.parentElement.querySelector("input[name=mem_reg2]").value);
		$("#mem_d_addr1").val(e.target.parentElement.querySelector("input[name=mem_addr1]").value);
		$("#mem_d_addr2").val(e.target.parentElement.querySelector("input[name=mem_addr2]").value);
	})
	
	excelDragField.addEventListener("dragenter", function(e){
		e.preventDefault();
		console.log("dragenter")
		
		excelDragField.dragDrop = function(){
			
			document.addEventListener("dragover", dragOverEvent);
			
			document.addEventListener("drop", dropEvent)
			
			memListTable.addEventListener("dragleave", deletefunction)
		}
		
		excelDragField.dragDrop();
		
		function dragOverEvent(e){
			e.preventDefault();
		}
		
		function dropEvent(e){
			console.log("drop")
			e.preventDefault();
			
			const files = [...e.dataTransfer?.files];
			let formData = new FormData();
			formData.append("excel", files[0]);
			
			excelUpload(formData);
			
			document.removeEventListener("dragover",dragOverEvent);
			document.removeEventListener("drop",dropEvent);
			excelDragField.dragDrop = null;
		}
		
		function deletefunction(e){
			e.preventDefault();
			console.log("dragleave")
			document.removeEventListener("dragover",dragOverEvent);
			memListTable.removeEventListener("dragleave", deletefunction);
			excelDragField.dragDrop = null;
		}
	})
	
}

function statusCreate(){
	let tmpTr = dataBody.children;
	for(let i=0;i<tmpTr.length;i++){
		tmpTr[i].children[0].innerText = (i+1);
	}
	
	
}








</script>
