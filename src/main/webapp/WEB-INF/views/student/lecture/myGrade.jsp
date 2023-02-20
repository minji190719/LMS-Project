<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.custom-div-radius{
	border-radius : 10px;
}

.bg-gray{
	background-color : #f3f3f3;
	color:black;
}

.custom-font-dark {
/*    color : #0a3875; */
   color : #3d4d61;
/*    font-weight : bold; */
}

.table-spacing {
	border-collapse: separate;
	border-spacing: 0 10px;
}

.addGrade{
/* 	background-color:#fff6e7; */
}

input[type="checkbox"]:checked:after {
    color: var(--custom-s);
}

</style>

<div class="row">
   <div class="col-lg-6">
      <h4 class="card-title custom-s mt-3">
         <i class="fa-solid fa-circle-chevron-right"></i>&nbsp;<strong>전체 성적 조회</strong><br/>
      </h4>   
   </div>
   <div class="col-lg-6">   
      <div class="row page-titles" style="background: none !important;">
         <div class="col p-md-0">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
               <li class="breadcrumb-item active" style="font-weight:bold;"><a href="/student/myLecGrade">전체 성적 조회</a></li>
            </ol>
         </div>
      </div>
   </div>
</div>

<div class="row">
	<div class="col-lg-12 col-sm-6">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-3">영역별 취득 현황</h5>
				</div>
				<div class="table-responsive custom-table1">
					<table class="table table-hover" style="border-bottom:1">
						<thead class="custom-theader">
							<tr>
								<th>영역</th>
								<th>전공선택</th>
								<th>전공필수</th>
								<th>교양선택</th>
								<th>교양필수</th>
								<th>총학점</th>
							</tr>
						</thead>
						<tbody id="totalGrade">
							<tr>
								<td>취득학점</td>
								<td>45</td>
								<td>25</td>
								<td>15</td>
								<td>15</td>
								<td>100</td>
							</tr>
							<tr class="addGrade">
								<td>추가필요학점</td>
								<td>45</td>
								<td>25</td>
								<td>15</td>
								<td>15</td>
								<td>100</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
		
		<div class="col-lg-12 col-sm-6">
			<div class="card">
				<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-3">전체 성적 조회</h5>
				</div>
				<div class="form-group row pl-3 pr-3" style="display: flex; justify-content: center;">
						<div class="col-lg-2">
							<label for="year"><i class="fa-solid fa-circle-arrow-down"></i>&nbsp;년도 선택</label><br>
							<select class="custom-select mr-sm-2 col" id="year">
								<option selected="selected">년도</option>
								<option value="2022">2022</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
							</select>
						</div>
						<div class="col-lg-2">
							<label for="semester"><i class="fa-solid fa-circle-arrow-down"></i>&nbsp;학기 선택</label><br>
							<select class="custom-select mr-sm-2 col" id="semester">
								<option selected="selected">학기</option>
								<option value="1">1</option>
								<option value="2">2</option>
							</select>
						</div>
						<div class="col-lg-1" style="text-align: center;">
							<label for="allGrade"><i class="fa-solid fa-circle-arrow-down"></i>&nbsp;전체 선택</label><br>
							<input type="checkbox" id="allGrade" value="all" checked="checked" class="form-check-input">
						</div>
						<div class="col-lg-1 tmp-center">
							<input type="button"
								class="btn mb-1 btn-outline-dark custom-font-bold" value="조회"
								id="selectGrade">
						</div>
						<div class="col-lg-6 text-right">
							<br/><br/>
							<span id="totalLength">전체[]건</span>
						</div>
					</div>
					<div class="col-12 height-500 custom-overflow-auto">
						<table class="custom-table table-sticky text-center">
							<thead class="custom-theader">
								<tr class="height-40">
									<th style="width: 60px;">년도</th>
									<th style="width: 80px;">학기</th>
									<th style="width: 120px;">학기종류</th>
									<th>과목</th>
									<th style="width: 120px;">이수구분</th>
									<th style="width: 60px;">학점</th>
									<th style="width: 60px;">등급</th>
									<th style="width: 60px;">평점</th>
									<th style="width: 80px;">취득여부</th>
									<th style="width: 80px;">학점포기</th>
									<th style="width: 80px;">재수강</th>
								</tr>
							</thead>
							<tbody id="myLecGrade">

							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>

		<div class="col-12">
			<div class="card">
				<div class="card-body">
				<div class="card-title">
					<h5 class="font-weight-bold mb-3">년도/학기별 취득학점현황</h5>
				</div>
					<div class="col-lg-12">
						<table class="table table-sticky">
							<thead>
								<tr>
									<th>학년도</th>
									<th>학기</th>
									<th>신청학점</th>
									<th>전공선택</th>
									<th>전공필수</th>
									<th>교양선택</th>
									<th>교양필수</th>
									<th>총 취득학점</th>
									<th>평균 평점</th>
								</tr>
							</thead>
							<tbody id="yearSemester">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</div>
<script>
var myLecGrade;
let selectGrade;
let year;
let semester;
let yearSemester;
let totalGrade;
var header; 
var token; 
window.onload = function(){
	header = $("meta[name='_csrf_header']").attr('content');
	token = $("meta[name='_csrf']").attr('content');

	myLecGrade = document.querySelector("#myLecGrade");
	selectGrade = document.querySelector("#selectGrade");
	yearSemester = document.querySelector("#yearSemester");
	totalGrade = document.querySelector("#totalGrade");
	
	let jsonObject = {};
	
	showMyGradeList(jsonObject);
	
	selectGrade.addEventListener("click", function(){
		year = document.querySelector("#year").value;
		semester = document.querySelector("#semester").value;
		
		let jsonObject = {
				lg_year : year,
				lg_semester : semester,
				flag:true
		}
		
		showMyGradeList(jsonObject);
	})

}

function showMyGradeList(value) {
	$.ajax({
		url:"/student/myGradeList",
		type:"post",
		data : JSON.stringify(value),
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr){
	         xhr.setRequestHeader(header, token);
	    },
		success:function(res){
			console.log(res)
			document.querySelector("#totalLength").innerText = "전체["+res.length+"]건";
			
			text = '';
			let year = res[0].lg_year;
			let semester = res[0].lg_semester;
			
			let jsonObject = {};
			let jsonArray = [];
			let jsonArea = {};
			let count=0;
			
			jsonObject.year = year;
			jsonObject.semester = semester;
			
			res.forEach((data,i)=>{
				if(data.lg_year == 2022 && data.lg_semester == 2){
					console.log(data.lg_year+"    " +data.lg_semester )
					return;
				}else{
					if(year != data.lg_year || semester != data.lg_semester){
						console.log(year + "    "+ data.lg_year)
						jsonObject.length=count;
						count = 0;
						jsonObject.area = jsonArea;
						jsonArray.push(jsonObject);
						jsonArea = {}
						jsonObject = {};
						year = data.lg_year;
						semester = data.lg_semester;
						jsonObject.year = year;
						jsonObject.semester = semester;
					}
					count++;
					jsonArea[data.lg_area.replace("/","")] = (isNaN(jsonArea[data.lg_area.replace("/","")])?0:jsonArea[data.lg_area.replace("/","")]) + data.lg_acq_credit*(1);
					jsonObject.credit = (isNaN(jsonObject.credit)?0:jsonObject.credit) + data.lg_acq_credit*(1);
					jsonObject.rating = (isNaN(jsonObject.rating)?0:jsonObject.rating) + data.lg_rating*(1);
					
					text += '<tr class="">';
					text += '<td>'+data.lg_year+'</td>';
					text += '<td>'+data.lg_semester+'</td>';
					text += '<td>정규</td>';
					text += '<td>'+data.lg_name+'</td>';
					text += '<td>'+data.lg_area+'</td>';
					text += '<td>'+data.lg_acq_credit+'</td>';
					text += '<td>'+data.lg_grade+'</td>';
					text += '<td>'+data.lg_rating+'</td>';
					text += '<td>취득</td>';
					if(data.lg_giveup == 0){
						text += '<td>X</td>';
					}else{
						text += '<td>O</td>';
					}
					text += '<td>X</td>'; 						// 재수강여부
					text += '</tr>';
				}	
			})
			jsonObject.area = jsonArea;
			jsonObject.length=count;
			jsonArray.push(jsonObject)
			
			myLecGrade.innerHTML = text;
			
			if(value.flag)return;
			let mc=0;
			let mn=0;
			let cc=0;
			let cn=0;
			console.log(jsonArray)
			
			text = '';
			jsonArray.forEach((value,i)=>{
				
				text+='<tr>';
				text+='<td>'+value.year+'</td>';
				text+='<td>'+value.semester+'</td>';
				text+='<td>'+value.credit+'</td>';
				text+='<td>'+ (isNaN(value.area.전공선택)?0:value.area.전공선택)+'</td>';
				text+='<td>'+ (isNaN(value.area.전공필수)?0:value.area.전공필수)+'</td>';
				text+='<td>'+ (isNaN(value.area.교양선택)?0:value.area.교양선택)+'</td>';
				text+='<td>'+ (isNaN(value.area.교양필수)?0:value.area.교양필수)+'</td>';
				text+='<td>'+value.credit+'</td>';
				text+='<td>'+(value.rating*(1)/value.length*(1)).toFixed(2)+'</td>';
				text+='</tr>';
			})
			console.log(text)
			yearSemester.innerHTML = text;
			
			for(let i=0;i<yearSemester.children.length;i++){
				mc = mc*(1) + yearSemester.children[i].children[3].innerText*(1);
				mn = mn*(1) + yearSemester.children[i].children[4].innerText*(1);
				cc = cc*(1) + yearSemester.children[i].children[5].innerText*(1);
				cn = cn*(1) + yearSemester.children[i].children[6].innerText*(1);
			}
			
			totalGrade.children[0].children[1].innerText=mc;			
			totalGrade.children[0].children[2].innerText=mn;			
			totalGrade.children[0].children[3].innerText=cc;			
			totalGrade.children[0].children[4].innerText=cn;
			totalGrade.children[0].children[5].innerText=mc+mn+cc+cn;
			
			totalGrade.children[1].children[1].innerText=79-mc*(1);			
			totalGrade.children[1].children[2].innerText=21-mn*(1);			
			totalGrade.children[1].children[3].innerText=15-cc*(1);			
			totalGrade.children[1].children[4].innerText=15-cn*(1);			
			totalGrade.children[1].children[5].innerText=(79-mc*(1))+(21-mn*(1))+(15-cc*(1))+(15-cn*(1));			
			
		},
		error:function(xhr){
			console.log(xhr.status)
			text = "";
			text += '<tr>';
			text += '<td colspan="11" class="text-center"> 데이터가 없습니다.~~</td>';
			text += '</tr>';
			myLecGrade.innerHTML = text;
		}
	})
}
</script>
