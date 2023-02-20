<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.custom-div-radius{
	border-radius : 10px;
}

.bg-gray{
	background-color : #d8e3f2;
}

.custom-font-dark {
   color : #0a3875;
   font-weight : bold;
}

.table-spacing {
	border-collapse: separate;
	border-spacing: 0 10px;
}


</style>
<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>현재 학기 성적 조회</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/student/myLecGradeNow">현재 학기 성적 조회</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>
<div class="row justify-content-center">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">학기 정보</h5>
				<div class="form-group row">
					<div class="col-4">
						<label for="year"><i class="fa-solid fa-circle-arrow-down"></i>&nbsp;
							<span class="custom-font-dark">년도</span></label><br> <input
							class="form-control input-default" type="text" id="year"
							value="2022" readonly>
					</div>
					<div class="col-4">
						<label for="semester"><i
							class="fa-solid fa-circle-arrow-down"></i>&nbsp; <span
							class="custom-font-dark">학기</span></label><br> <input
							class="form-control input-default" type="text" id="semester"
							value="2" readonly>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h5 class="font-weight-bold mb-4">성적 조회</h5>
				<div class="table-responsive custom-table1">
					<table class="table table-hover">
						<thead class="custom-theader">
							<tr>
								<th>년도</th>
								<th>학기</th>
								<th>학기종류</th>
								<th>과목</th>
								<th>이수구분</th>
								<th>학점</th>
								<th>등급</th>
								<th>평점</th>
								<th>취득여부</th>
								<th>학점포기</th>
								<th>재수강</th>
							</tr>
						</thead>
						<tbody id="myLecGrade">
	
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
let header;
let token;
let myLecGrade;
window.onload = function(){
	header= document.querySelector("meta[name='_csrf_header']").getAttribute("content");
	token= document.querySelector("meta[name='_csrf']").getAttribute("content");
	myLecGrade = document.querySelector("#myLecGrade");
	
	showList();
}	

function showList(){
	
	let xhr = new XMLHttpRequest();
	xhr.open("post", "/student/nowMyGradeList",true);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = JSON.parse(xhr.responseText)
			text = "";
			
			data.forEach((value,i) => {
				text += '<tr class="bg-white custom-font-dark">';
				text += '<td>'+value.LG_YEAR+'</td>';
				text += '<td>'+value.LG_SEMESTER+'</td>';
				text += '<td>정규</td>';
				text += '<td>'+value.LG_NAME+'</td>';
				text += '<td>'+value.LG_AREA+'</td>';
				text += '<td>'+value.LG_ACQ_CREDIT+'</td>';
				text += '<td>'+value.LG_GRADE+'</td>';
				text += '<td>'+value.LG_RATING+'</td>';
				text += '<td>취득</td>';
				if(value.LG_GIVEUP == 0){
					text += '<td>X</td>';
				}else{
					text += '<td>O</td>';
				}
				text += '<td>X</td>'; 						// 재수강여부
				text += '</tr>';
			})
			
			myLecGrade.innerHTML = text;
		}
	}
	
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	xhr.send();
}

</script>


</html>