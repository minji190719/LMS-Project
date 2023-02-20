<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<style type="text/css">

#mChartCard{
	background-image: linear-gradient( rgba( 255, 255, 255, 0.3), rgba( 255, 255, 255, 0.9) ), url('/resources/images/차트배경2.png');
}

.chartdiv{
 	display: inline-block; 
	width: 50%; 
	backgroundColor: #ffffff!important;
}
.alertInElement{
 	display: inline-block;
 	 
}
.alertInElement select{
	margin-left: 10px;
	margin-right: 10px;
}

#spandiv{
	text-align: center;
	font-size: 4em;
	margin-bottom: 20px;
}
#surmary{
	font-family: 'GmarketSansMedium' !important; 
	font-weight: bold;
	color : #ffffff;
}


</style>
<div class="row justify-content-center">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-chart-simple"></i>&nbsp;&nbsp;카테고리별 통계<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/chartManage/chartPage">카테고리별 통계</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row">
    <div class="col-12">
        <div class="card" id="mChartCard" style="height: 800px;">
            <div class="card-body" id="cardBody">
            	<div>
            	<div style="" id="selForm">
            		<div id="alertBox" class="alertInElement">
             		<select class="form-control-sm input-default" onchange="createOption(this)" id="chartType">
             			<option value="" selected="selected">=== 옵션 선택 ===</option>
             			<option value="year_stu">연도별 학생 수</option>
             			<option value="coll_avg_price">단과대학별 평균 등록금</option>
             			<option value="dep_price">학과별 등록금</option>
             			<option value="sur_stat">설문조사 만족도 통계</option>
             		</select>
            		</div>
            		<div class="alertInElement" style="margin-bottom: 50px;">
            			<button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="createChart()">차트 생성</button>
            		</div>
            		<div id="spandiv">
            			<span id="surmary"></span>
            		</div>
            	</div>
            	</div>
            </div>
        </div>
    </div>
</div>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script>

// const myChart_obj = document.getElementById('myChart').getContext("2d");

// window.c_obj = new Chart(myChart_obj, createChartSetObj());

window.cnt = 0;
window.chartTypeName = "";
window.toggle = false;

function createOption(selBox){
	// alert(selBox.value);
	
// 	if(selBox.value == "year_stu" || selBox.value == "sur_stat"){
// 		if(!toggle){
// 			createInputSelBox();
// 			toggle = true;
// 		}
		
// 	}
	
	if(selBox.value == "year_stu"){
			createInputSelBox(0);
			let selForm = document.querySelector("#selForm");
			
	}
	
	if(selBox.value == "sur_stat"){
			createInputSelBox(1);
			let selForm = document.querySelector("#selForm");
			
	}
	
	if(selBox.value == "coll_avg_price"){
		let sur_question = document.querySelector("#sur_question");
		let stu_schyear = document.querySelector("#stu_schyear");
		let stu_gender = document.querySelector("#stu_gender");
		let stu_dep = document.querySelector("#stu_dep");
		
		if(sur_question != null){
			sur_question.remove();
		}
		if(stu_schyear != null){
			stu_schyear.remove();
		}
		if(stu_gender != null){
			stu_gender.remove();
		}
		if(stu_dep != null){
			stu_dep.remove();
		}
		
	}
	
	if(selBox.value == "dep_price"){
		let sur_question = document.querySelector("#sur_question");
		let stu_schyear = document.querySelector("#stu_schyear");
		let stu_gender = document.querySelector("#stu_gender");
		let stu_dep = document.querySelector("#stu_dep");
		
		if(sur_question != null){
			sur_question.remove();
		}
		if(stu_schyear != null){
			stu_schyear.remove();
		}
		if(stu_gender != null){
			stu_gender.remove();
		}
		if(stu_dep != null){
			stu_dep.remove();
		}
		
	}
	
	

	
// 	switch (selBox.value) {
// 		case "year_stu":
// 			createInputSelBox();
// 			break;
			
// 		case "sur_stat":
// 			createSurInputSelBox();
// 			break;
	
// 		default:
// 			break;
// 	}

}

function createInputSelBox(param){
	// alert("파라미터값 : ", param);
	let sur_question = document.querySelector("#sur_question");
	let stu_schyear = document.querySelector("#stu_schyear");
	let stu_gender = document.querySelector("#stu_gender");
	let stu_dep = document.querySelector("#stu_dep");
	
	if(stu_schyear != null && stu_gender != null && stu_dep != null){
		stu_schyear.remove();
		stu_gender.remove();
		stu_dep.remove();
	}
	
	if(sur_question != null){
		sur_question.remove();
	}
	
	if(!param){
		let alertBox = document.querySelector("#alertBox");
		
		// ---------------------학년 선택 selectBox 생성---------------------
		let schyear_select_obj = document.createElement("select");
		schyear_select_obj.setAttribute("id", "stu_schyear");
		schyear_select_obj.setAttribute("class", "form-control-sm input-default")
		
		let schyear_option_obj0 = document.createElement("option");
		schyear_option_obj0.innerText = "=== 학년 선택 ===";
		schyear_option_obj0.setAttribute("value", "");
		schyear_option_obj0.setAttribute("selected", true);

		let schyear_option_obj1 = document.createElement("option");
		schyear_option_obj1.innerText = "1";
		schyear_option_obj1.setAttribute("value", "1");

		let schyear_option_obj2 = document.createElement("option");
		schyear_option_obj2.innerText = "2";
		schyear_option_obj2.setAttribute("value", "2");

		let schyear_option_obj3 = document.createElement("option");
		schyear_option_obj3.innerText = "3";
		schyear_option_obj3.setAttribute("value", "3");

		let schyear_option_obj4 = document.createElement("option");
		schyear_option_obj4.innerText = "4";
		schyear_option_obj4.setAttribute("value", "4");

		schyear_select_obj.append(schyear_option_obj0);
		schyear_select_obj.append(schyear_option_obj1);
		schyear_select_obj.append(schyear_option_obj2);
		schyear_select_obj.append(schyear_option_obj3);
		schyear_select_obj.append(schyear_option_obj4);
		
		// ---------------------학년 선택 selectBox 끝---------------------
		
		// ---------------------성별 선택 selectBox생성---------------------
		let gender_select_obj = document.createElement("select");
		gender_select_obj.setAttribute("id", "stu_gender");
		gender_select_obj.setAttribute("class", "form-control-sm input-default")
		
		let gender_option_obj0 = document.createElement("option");
		gender_option_obj0.innerText = "=== 성별 선택 ===";
		gender_option_obj0.setAttribute("value", "");
		gender_option_obj0.setAttribute("selected", true);
		
		let gender_option_obj1 = document.createElement("option");
		gender_option_obj1.innerText = "남";
		gender_option_obj1.setAttribute("value", "남");

		let gender_option_obj2 = document.createElement("option");
		gender_option_obj2.innerText = "여";
		gender_option_obj2.setAttribute("value", "여");

		gender_select_obj.append(gender_option_obj0);
		gender_select_obj.append(gender_option_obj1);
		gender_select_obj.append(gender_option_obj2);

		// ---------------------성별 선택 selectBox끝---------------------

		// ---------------------학과 선택 selectBox생성---------------------
		let department_select_obj = document.createElement("select");
		department_select_obj.setAttribute("id", "stu_dep");
		department_select_obj.setAttribute("class", "form-control-sm input-default")
		
		let dep_option_obj0 = document.createElement("option");
		dep_option_obj0.setAttribute("value", "");
		dep_option_obj0.setAttribute("selected",true);
		dep_option_obj0.innerText = "=== 학과 선택 ===";
		department_select_obj.append(dep_option_obj0);
		
		let dep_list = cus_ajax("post", "/chartManage/getDepartmentInfo");
		
		console.log("리턴값 : ", dep_list);
		console.log("리턴값 길이: ", dep_list.length);

		for(let i=0;i<dep_list.length;i++){
			let dep_option_obj = document.createElement("option");
			dep_option_obj.setAttribute("value", dep_list[i].dep_name);
			dep_option_obj.innerText = dep_list[i].dep_name;
			department_select_obj.append(dep_option_obj);
		}

		// ---------------------학과 선택 selectBox끝---------------------


		alertBox.append(schyear_select_obj);
		alertBox.append(gender_select_obj);
		alertBox.append(department_select_obj);
		
		return false;
	}
	
	let alertBox = document.querySelector("#alertBox");
	// ---------------------설문조사 문항 선택 생성---------------------
	let sur_question_sel_obj = document.createElement("select");
	sur_question_sel_obj.setAttribute("id", "sur_question");
	sur_question_sel_obj.setAttribute("class", "form-control-sm input-default")
	
	let sur_question_opt0_obj = document.createElement("option");
	sur_question_opt0_obj.innerText = "문항선택";
	sur_question_opt0_obj.setAttribute("value", "");
	sur_question_opt0_obj.setAttribute("selected", true);
	
	let sur_question_opt1_obj = document.createElement("option");
	sur_question_opt1_obj.innerText = "1번";
	sur_question_opt1_obj.setAttribute("value", "surv_answer1");
	
	let sur_question_opt2_obj = document.createElement("option");
	sur_question_opt2_obj.innerText = "2번";
	sur_question_opt2_obj.setAttribute("value", "surv_answer2");
	
	let sur_question_opt3_obj = document.createElement("option");
	sur_question_opt3_obj.innerText = "3번";
	sur_question_opt3_obj.setAttribute("value", "surv_answer3");
	
	sur_question_sel_obj.append(sur_question_opt0_obj);
	sur_question_sel_obj.append(sur_question_opt1_obj);
	sur_question_sel_obj.append(sur_question_opt2_obj);
	sur_question_sel_obj.append(sur_question_opt3_obj);
	
	// ---------------------설문조사 문항 선택 끝---------------------
	
	
	// ---------------------학년 선택 selectBox 생성---------------------
	let schyear_select_obj = document.createElement("select");
	schyear_select_obj.setAttribute("id", "stu_schyear");
	schyear_select_obj.setAttribute("class", "form-control-sm input-default")
	
	let schyear_option_obj0 = document.createElement("option");
	schyear_option_obj0.innerText = "학년 선택";
	schyear_option_obj0.setAttribute("value", "");
	schyear_option_obj0.setAttribute("selected", true);

	let schyear_option_obj1 = document.createElement("option");
	schyear_option_obj1.innerText = "1";
	schyear_option_obj1.setAttribute("value", "1");

	let schyear_option_obj2 = document.createElement("option");
	schyear_option_obj2.innerText = "2";
	schyear_option_obj2.setAttribute("value", "2");

	let schyear_option_obj3 = document.createElement("option");
	schyear_option_obj3.innerText = "3";
	schyear_option_obj3.setAttribute("value", "3");

	let schyear_option_obj4 = document.createElement("option");
	schyear_option_obj4.innerText = "4";
	schyear_option_obj4.setAttribute("value", "4");

	schyear_select_obj.append(schyear_option_obj0);
	schyear_select_obj.append(schyear_option_obj1);
	schyear_select_obj.append(schyear_option_obj2);
	schyear_select_obj.append(schyear_option_obj3);
	schyear_select_obj.append(schyear_option_obj4);
	
	// ---------------------학년 선택 selectBox 끝---------------------
	
	// ---------------------성별 선택 selectBox생성---------------------
	let gender_select_obj = document.createElement("select");
	gender_select_obj.setAttribute("id", "stu_gender");
	gender_select_obj.setAttribute("class", "form-control-sm input-default")
	
	let gender_option_obj0 = document.createElement("option");
	gender_option_obj0.innerText = "성별선택";
	gender_option_obj0.setAttribute("value", "");
	gender_option_obj0.setAttribute("selected", true);
	
	let gender_option_obj1 = document.createElement("option");
	gender_option_obj1.innerText = "남";
	gender_option_obj1.setAttribute("value", "남");

	let gender_option_obj2 = document.createElement("option");
	gender_option_obj2.innerText = "여";
	gender_option_obj2.setAttribute("value", "여");

	gender_select_obj.append(gender_option_obj0);
	gender_select_obj.append(gender_option_obj1);
	gender_select_obj.append(gender_option_obj2);

	// ---------------------성별 선택 selectBox끝---------------------

	// ---------------------학과 선택 selectBox생성---------------------
	let department_select_obj = document.createElement("select");
	department_select_obj.setAttribute("id", "stu_dep");
	department_select_obj.setAttribute("class", "form-control-sm input-default")
	
	let dep_option_obj0 = document.createElement("option");
	dep_option_obj0.setAttribute("value", "");
	dep_option_obj0.setAttribute("selected",true);
	dep_option_obj0.innerText = "학과선택";
	department_select_obj.append(dep_option_obj0);
	
	let dep_list = cus_ajax("post", "/chartManage/getDepartmentInfo");
	
	console.log("리턴값 : ", dep_list);
	console.log("리턴값 길이: ", dep_list.length);

	for(let i=0;i<dep_list.length;i++){
		let dep_option_obj = document.createElement("option");
		dep_option_obj.setAttribute("value", dep_list[i].dep_name);
		dep_option_obj.innerText = dep_list[i].dep_name;
		department_select_obj.append(dep_option_obj);
	}

	// ---------------------학과 선택 selectBox끝---------------------


	alertBox.append(sur_question_sel_obj);
	alertBox.append(schyear_select_obj);
	alertBox.append(gender_select_obj);
	alertBox.append(department_select_obj);
	
	

}

function cus_ajax(type, url, param){
	let header = document.querySelector("meta[name='_csrf_header']").getAttribute('content');
	let token = document.querySelector("meta[name='_csrf']").getAttribute("content");
	
	let res;
	
// 	console.log(type);
// 	console.log(url);

	console.log(header);
	console.log(token);

	let xhr = new XMLHttpRequest();
	xhr.open(type, url, false);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){

			console.log("잘 갔다옴");
			res = JSON.parse(xhr.responseText);
			
			console.log("콜백 응답", res);
			console.log("콜백응답값 길이", res.length);
			
		}
	}
	xhr.setRequestHeader(header, token);
	
	if(param != null){
		// console.log("ajax param값 :", param);
		console.log("ajax param값 :", param);
		xhr.setRequestHeader('content-type', 'application/json; charset=UTF-8');
		xhr.send(JSON.stringify(param));
		console.log("ajax param값 :", param);
	}else{
		xhr.send();
	}
	
	return res;
	
}

function createChartSetObj(xLabelData, chartData, detailAlldData, questionNum){
	 
	 if(chartTypeName == "bar" || chartTypeName == "line"){
		 let options = {
				 series: [{
                     data: chartData
                   }],
                   chart: {
                     type: chartTypeName,
                     height: 500
                   },
                   plotOptions: {
                     bar: {
                       borderRadius: 4,
                       horizontal: true,
                     }
                   },
                   dataLabels: {
                     enabled: false
                   },
                   xaxis: {
                     categories: xLabelData,
                   },
                  
//                    colors: ['#304264']
                   colors: ['#000000']
                   
				 /*
				 series: [{
	                 name: "Desktops",
	                 data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
	               }],
	               chart: {
	                 height: 350,
	                 type: chartTypeName,
	                 zoom: {
	                   enabled: false
	                 }
	               },
	               dataLabels: {
	                 enabled: false
	               },
	               stroke: {
	                 curve: 'straight'
	               },
	               grid: {
	                 row: {
	                   colors: ['#f3f3f3', 'transparent'],
	                   opacity: 0.5
	                 },
	               },
	               xaxis: {
	                 categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
	               }
	               */
		        };
		 
			if(xLabelData != null){
				options.xaxis.categories = xLabelData;
			}
			
			if(chartData != null){
				options.series[0].data = chartData;
			}
			
			if(chartTypeName == "line"){
// 				options.colors = ['#E91E63'];
				options.colors = ['#000000'];
			}
			
			return options;
	 }
	 
	 if(chartTypeName == "pie"){
		 
		 let options = {
				 series: chartData,
                 chart: {
                   height: 510,
                   type: 'pie',
                   toolbar: {
                     show: true
                   }
                 },
                 labels: xLabelData	 
		 };
		 
		 	if(xLabelData != null){
				options.labels = xLabelData;
			}
			
			if(chartData != null){
				options.series = chartData;
			}
			
			return options;
		 
	 }
	 
	 if(chartTypeName == "rainBar"){
		 console.log("rainBar안 xLabelData : ", xLabelData);
		 console.log("rainBar안 chartData : ", chartData);
		 console.log("rainBar안 detailAlldData : ", detailAlldData);
		 console.log("rainBar안 questionNum : ", questionNum);
		 let options = {
		          series: [{
		          name: xLabelData[0],
		          data: [chartData[0], detailAlldData[1][0].SATISFACTION, detailAlldData[2][0].SATISFACTION]
		        }, {
		          name: xLabelData[1],
		          data: [chartData[1], detailAlldData[1][1].SATISFACTION, detailAlldData[2][1].SATISFACTION]
		        }, {
		          name: xLabelData[2],
		          data: [chartData[2], detailAlldData[1][2].SATISFACTION, detailAlldData[2][2].SATISFACTION]
		        }, {
		          name: xLabelData[3],
		          data: [chartData[3], detailAlldData[1][3].SATISFACTION, detailAlldData[2][3].SATISFACTION]
		        },
		        {
		          name: xLabelData[4],
		          data: [chartData[4], detailAlldData[1][4].SATISFACTION, detailAlldData[2][4].SATISFACTION]
		        }
		        ],
		          chart: {
		          type: 'bar',
		          height: 500,
		          stacked: true,
		          toolbar: {
		            show: true
		          },
		          zoom: {
		            enabled: true
		          }
		        },
		        responsive: [{
		          breakpoint: 480,
		          options: {
		            legend: {
		              position: 'bottom',
		              offsetX: -10,
		              offsetY: 0
		            }
		          }
		        }],
		        plotOptions: {
		          bar: {
		            horizontal: false,
		            borderRadius: 10,
		            dataLabels: {
		              total: {
		                enabled: true,
		                style: {
		                  fontSize: '13px',
		                  fontWeight: 900
		                }
		              }
		            }
		          },
		        },
		        xaxis: {
		        	type: 'category',
		            categories: questionNum, 
		              
		            
		        },
		        legend: {
		          position: 'right',
		          offsetY: 40
		        },
		        fill: {
		          opacity: 1
		        }
		        };
		 
		 return options;
		 
	 }
	 
	 
	 
	 
	 	/*
	 	var options = {
	 		series: [{
	            data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
	          }],
	          chart: {
	            type: 'bar',
	            height: 350
	          },
	          plotOptions: {
	            bar: {
	              borderRadius: 4,
	              horizontal: true,
	            }
	          },
	          dataLabels: {
	            enabled: false
	          },
	          xaxis: {
	            categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan',
	              'United States', 'China', 'Germany'
	            ],
	          }
	 	};
	 	*/
			
	
}

function selBoxReset(){
	let chartType = document.querySelector("#chartType");
	
	let sur_question = document.querySelector("#sur_question");
	let stu_schyear = document.querySelector("#stu_schyear");
	let stu_gender = document.querySelector("#stu_gender");
	let stu_dep = document.querySelector("#stu_dep");
	
	if(chartType != null){
		chartType.value = "";
	}
	if(sur_question != null){
		sur_question.value = "";
	}
	if(stu_schyear != null){
		stu_schyear.value = "";
	}
	if(stu_gender != null){
		stu_gender.value = "";
	}
	if(stu_dep != null){
		stu_dep.value = "";
	}
	
}

function createElement(){
	
	let cardBody = document.querySelector("#cardBody");
	
	let newDiv = document.createElement("div");
	
	newDiv.setAttribute("class", "chartdiv");
	newDiv.setAttribute("id", `myChart\${++cnt}`);
	
	cardBody.append(newDiv);
	
	return true;
}

function createChart(){
	
	// 랜덤 배경색 설정
	let colors = [
		'#14DF7E', 
		'#FF424F', 
		'#FFA032', 
		'#326AFF', 
		'#FF328C',
		"#006AA0"
	];
	
	let rnd = Math.floor(Math.random() * 6);
	mChartCard.style.backgroundImage = "none";
	mChartCard.style.backgroundColor = colors[rnd];	
	
	let chartType = document.querySelector("#chartType");
	
	let sur_question = document.querySelector("#sur_question");
	let stu_schyear = document.querySelector("#stu_schyear");
	let stu_gender = document.querySelector("#stu_gender");
	let stu_dep = document.querySelector("#stu_dep");
	
	console.log(sur_question);
	console.log(stu_schyear);
	console.log(stu_gender);
	console.log(stu_dep);

	if(chartType.value == "year_stu" && stu_schyear != null && stu_gender != null && stu_dep != null){
// 		chartTypeName = "radar";
		
		let paramObj = {};
		
		console.log(stu_schyear.value);
		console.log(stu_gender.value);
		console.log(stu_dep.value);
		
		paramObj.stu_schyear = stu_schyear.value;
		paramObj.stu_gender = stu_gender.value;
		paramObj.stu_dep = stu_dep.value;
		
		console.log(paramObj);
		
		let year_stu_cnt = cus_ajax("post", "/chartManage/getChartData", paramObj);
		console.log("연도별 학생 수 : ", year_stu_cnt);
		
		let year = [];
		let stu_cnt = [];

		for(let i=0;i<year_stu_cnt.length;i++){
			year.push(year_stu_cnt[i].YEAR);
			stu_cnt.push(year_stu_cnt[i].CNT);
		}
		
		console.log(year);
		console.log(stu_cnt);
		
		let chartType = document.querySelector("#chartType").value;
		
		let mychart_obj_list = document.querySelectorAll(`.chartdiv`);
//			let element2 = document.querySelector(`#myChart2`);
		
		if(mychart_obj_list != null){
			for(let i=0;i<mychart_obj_list.length;i++){
				mychart_obj_list[i].remove();
			}	
		}
		
		
		if(createElement()){
			chartTypeName = "line";
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			new ApexCharts(element, createChartSetObj(year, stu_cnt)).render();
		}
		
		if(createElement()){
			chartTypeName = "bar";
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			new ApexCharts(element, createChartSetObj(year, stu_cnt)).render();
		}
		
		
	}
	
	if(chartType.value == "coll_avg_price"){
		
// 		chartTypeName = "bar";
		
		let coll_avg_price = cus_ajax("post", "/chartManage/getCollAvgPriceChartData");
		console.log("aaaa", coll_avg_price);
		
		let col_name_arr = [];
		let coll_avg_price_arr = [];
		
		for(let i=0;i<coll_avg_price.length;i++){
			col_name_arr.push(coll_avg_price[i].COL_NAME);
			coll_avg_price_arr.push(coll_avg_price[i].COLL_AVG_PRICE);
		}
		
		console.log("col_name_arr : ", col_name_arr);
		console.log("coll_avg_price_arr : ", coll_avg_price_arr);
		
// 		apexchart_obj1.destroy();
// 		apexchart_obj2.destroy();
		
			let chartType = document.querySelector("#chartType").value;
			
			let mychart_obj_list = document.querySelectorAll(`.chartdiv`);
// 			let element2 = document.querySelector(`#myChart2`);
			
			if(mychart_obj_list != null){
				for(let i=0;i<mychart_obj_list.length;i++){
					mychart_obj_list[i].remove();
				}	
			}
			
			
			if(createElement()){
				chartTypeName = "line";
				let chartType = document.querySelector("#chartType").value;
				let element = document.querySelector(`#myChart\${cnt}`);
				new ApexCharts(element, createChartSetObj(col_name_arr, coll_avg_price_arr)).render();
			}
			
			if(createElement()){
				chartTypeName = "bar";
				let chartType = document.querySelector("#chartType").value;
				let element = document.querySelector(`#myChart\${cnt}`);
				new ApexCharts(element, createChartSetObj(col_name_arr, coll_avg_price_arr)).render();
			}
			
			console.log("설문조사 현재 옵션텍스트 : ", document.querySelector(`option[value='\${chartType.value}']`));
			
// 			let surmary = document.querySelector("#surmary"); 
// 			let stateSelText = document.querySelector(`option[value='\${chartType.value}']`);
			
// 			console.log("학과 현재 옵션텍스트: ", stateSelText.innerText);
// 			console.log("학과 현재 surmary 객체: ", surmary);
			
// 			surmary.innerHTML = stateSelText.innerText;
			
// 			selBoxReset();
			
// 			element1.remove();
// 			element2.remove();
// 			new ApexCharts(element1, createChartSetObj(col_name_arr, coll_avg_price_arr)).render();
		
		
	}
	
	if(chartType.value == "dep_price"){
		
// 		chartTypeName = "bar";
		
		let dep_price = cus_ajax("post", "/chartManage/getDepAvgPriceChartDataList");
		console.log(dep_price);
		
		let depName = [];
		let depPrice = [];
		
		for(let i=0;i<dep_price.length;i++){
			depName.push(dep_price[i].DEP_NAME);
			depPrice.push(dep_price[i].DEP_FEE);
		}
		
		let mychart_obj_list = document.querySelectorAll(`.chartdiv`);
//			let element2 = document.querySelector(`#myChart2`);
		
		for(let i=0;i<mychart_obj_list.length;i++){
			mychart_obj_list[i].remove();
		}
		
		if(createElement()){
			chartTypeName = "line";
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			new ApexCharts(element, createChartSetObj(depName, depPrice)).render();
		}
		
		if(createElement()){
			chartTypeName = "bar";
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			new ApexCharts(element, createChartSetObj(depName, depPrice)).render();
		}
		
		console.log("학과 현재 옵션객체: ", document.querySelector(`option[value='\${chartType.value}']`));
		
// 		let surmary = document.querySelector("#surmary"); 
// 		let stateSelText = document.querySelector(`option[value='\${chartType.value}']`);
		
// 		console.log("학과 현재 옵션텍스트: ", stateSelText.innerText);
// 		console.log("학과 현재 surmary 객체: ", surmary);
		
// 		surmary.innerHTML = stateSelText.innerText;
		
// 		selBoxReset();
		
	}
	
	if(chartType.value == "sur_stat" && stu_schyear != null && stu_gender != null && stu_dep != null && sur_question != null){
// 		chartTypeName = "pie";
		let paramObj = {};

		if(sur_question.value == "" || sur_question.value == null){
			sur_question.value = "surv_answer1";
		}
		
		console.log(sur_question.value);
		console.log(stu_schyear.value);
		console.log(stu_gender.value);
		console.log(stu_dep.value);
		
		paramObj.sur_question = sur_question.value; 
		paramObj.stu_schyear = stu_schyear.value;
		paramObj.stu_gender = stu_gender.value;
		paramObj.stu_dep = stu_dep.value;
		
		
		
		console.log("설문조사 ajax 파라미터 : ", paramObj);
		
		let sur_stat_score = cus_ajax("post", "/chartManage/getSurStatScore", paramObj);
		console.log("설준조사 통계 점수 : ", sur_stat_score);
		
		let question_num = [];
		let sur_score = [];
		
		for(let i=0;i<sur_stat_score.length;i++){
			question_num.push("1번문항");
			sur_score.push(sur_stat_score[i].SURV_ANSWER1);
			question_num.push("2번문항");
			sur_score.push(sur_stat_score[i].SURV_ANSWER2);
			question_num.push("3번문항");
			sur_score.push(sur_stat_score[i].SURV_ANSWER3);
		}
		
		let sur_detail_stat = cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj);
		
		let sur_detail_stat_all = [];
		
		sur_detail_stat_all.push(sur_detail_stat);
		
		if(paramObj.sur_question == "surv_answer1"){
			
			paramObj.sur_question = "surv_answer2";
			sur_detail_stat_all.push(cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj));
			
			paramObj.sur_question = "surv_answer3";
			sur_detail_stat_all.push(cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj));
			
		}else if(paramObj.sur_question == "surv_answer2"){
			
			paramObj.sur_question = "surv_answer1";
			sur_detail_stat_all.push(cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj));
			
			paramObj.sur_question = "surv_answer3";
			sur_detail_stat_all.push(cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj));
			
		}else if(paramObj.sur_question == "surv_answer3"){
			paramObj.sur_question = "surv_answer1";
			sur_detail_stat_all.push(cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj));
			
			paramObj.sur_question = "surv_answer2";
			sur_detail_stat_all.push(cus_ajax("post", "/chartManage/getSurDetailStatScore", paramObj));
		}
				
		
		
		console.log("디테일 올 : ", sur_detail_stat_all);
		
		console.log("설준조사 디테일 통계 점수 : ", sur_detail_stat);
		
		let sur_detail_question_laName = ["매우 만족", "만족", "보통", "불만족", "매우불만족"];
		let sur_detail_score = [];
		
		for(let i=0; i<sur_detail_stat.length;i++){
			sur_detail_score.push(sur_detail_stat[i].SATISFACTION);
		}
		
		
		/*
		for(let i=0;i<sur_detail_stat.length;i++){
			if(sur_detail_stat[i].SATISFACTION != 0){
				switch (sur_detail_stat[i].SATISFACTION) {
				case 1:
					sur_detail_question_laName.push("매우 불만족");
					sur_detail_score.push(sur_detail_stat[i].SATISFACTION);
					break;
				case 2:
					sur_detail_question_laName.push("불만족");
					sur_detail_score.push(sur_detail_stat[i].SATISFACTION);
					break;
				case 3:
					sur_detail_question_laName.push("중간");
					sur_detail_score.push(sur_detail_stat[i].SATISFACTION);
					break;
				case 4:
					sur_detail_question_laName.push("만족");
					sur_detail_score.push(sur_detail_stat[i].SATISFACTION);
					break;
				case 5:
					sur_detail_question_laName.push("마우 만족");
					sur_detail_score.push(sur_detail_stat[i].SATISFACTION);
					break;
			
				default:
					break;
			}
		}
			
	}
	*/	
		
		console.log("디테일 라벨이름 : ", sur_detail_question_laName);
		console.log("디테일 점수 : ", sur_detail_score);

		console.log("설문조사 전체 라벨이름 : ", question_num);
		console.log("설문조사 전체 평균 점수  :", sur_score);
		
		let chartType = document.querySelector("#chartType").value;
		
		let mychart_obj_list = document.querySelectorAll(`.chartdiv`);
//			let element2 = document.querySelector(`#myChart2`);
		
		if(mychart_obj_list != null){
			for(let i=0;i<mychart_obj_list.length;i++){
				mychart_obj_list[i].remove();
			}	
		}
		
		/*
		if(createElement()){
			chartTypeName = ""
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			new ApexCharts(element, createChartSetObj(question_num, sur_score)).render();
		}
		*/
		
		if(createElement()){
			chartTypeName = "pie"
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			new ApexCharts(element, createChartSetObj(sur_detail_question_laName, sur_detail_score)).render();
		}
		
		if(createElement()){
			chartTypeName = "rainBar";
			let chartType = document.querySelector("#chartType").value;
			let element = document.querySelector(`#myChart\${cnt}`);
			
			console.log("createChart메소드 전 sur_detail_stat_all값 : ", sur_detail_stat_all);
			
			new ApexCharts(element, createChartSetObj(sur_detail_question_laName, sur_detail_score, sur_detail_stat_all, question_num)).render();
		}
		
		console.log("설문조사 현재 옵션텍스트 : ", document.querySelector(`option[value='\${chartType.value}']`));
		
	}
	
	
	let surmary = document.querySelector("#surmary"); 
	let stateSelText = document.querySelector(`option[value='\${chartType.value}']`);
	
	console.log(stateSelText.innerText);
	
	surmary.innerText = stateSelText.innerText;
	surmary.innerHTML += "&nbsp;<img src='/resources/images/차트아이콘.png'>";
	
	let chartdiv = document.querySelectorAll(".chartdiv");
	for(let i = 0; i < chartdiv.length; i++){ chartdiv[i].style.backgroundColor = "#ffffff"; }
}
	

</script>