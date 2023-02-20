<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<style>
.custom-table1 td{
	text-align: left !important;
}

.custom-table1 tbody tr td:first-child {
	text-align: center !important;
}

.input-group-text {
	width : 80px;
}
</style>
<div class="row justify-content-center">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;취업훈련기관<br />
		</h4>
	</div>
	<div class="col-lg-5 eTitle">
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i
							class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/employ/company">취업훈련기관</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="row empoloyCompany">
	<div class="col-lg-11" style="margin: auto;" id="firstDiv">
		<div class="card">
			<div class="card-body">
				<div class="form-group row custom-right-array">
					<div class="col-3">
						<select id="ecomCategory" onchange="btnSearch()"
							class="form-control input-default">
							<option selected="selected" value="">=== 구분 ===</option>
							<option value="1">평생교육시설</option>
							<option value="2">지정직업훈련시설</option>
							<option value="3">학원</option>
							<option value="0">기타</option>
						</select>
					</div>
					<div class="col-3">
						<input type="text" id="searchCompany" class="form-control input-default">
					</div>
					<div class="col-1">
						<button type="button" onclick="btnSearch()" class="btn mb-1 btn-primary custom-btn-s" style="margin-top: 3px;">검색</button>
					</div>
				</div>
				<div class="table-responsive custom-table1">
					<table class="table table-hover">
						<thead class="custom-theader-s">
							<tr>
								<th style="width: 100px;">No</th>
								<th>기관</th>
								<!--                                     <th>분류</th> -->
							</tr>
						</thead>
						<tbody id="ajaxPartForList" style="height: 600px;">

							<!--                                for ajax -->

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	window.onload = function(){
		getAllEmpList();
	}
	
	
	
	
	function getAllEmpList(category){
		var ajaxPartForList = $("#ajaxPartForList");
		
		
		$.ajax({
			url : "/employ/companyList",
			method : "GET",
			data : {"ecom_category": category},
			dataType : "json",
			success : function (res){
				console.log(res)
				ajaxPartForList.html(getList(res));
			}
		})
		
	}
	

	const getList = res => {
		let str = "";

		if (res.length == 0){
			str += "<tr><td colspan='3'>등록된 훈련기관이 존재하지 않습니다!!</td></tr>";
		}else{

			for(var i = 0; i < res.length; i++){

				str += `<tr>`;
				str += `<td style="width: 100px;">\${i + 1}</td>`
				str += '<td>';
				str +=      '<input type="hidden" id="'+res[i].ecom_code+'" value="'+res[i].ecom_name+'">';
				str += 		'<h3 style="color: green; cursor:pointer;" onclick="btnCompanyInfo(this)">'+res[i].ecom_name+'</h3>&nbsp;&nbsp;&nbsp;&nbsp;<br> 전화번호 : '+res[i].ecom_tel+'<br><br>';
				str += 		'<p>주소 : '+res[i].ecom_locate+'&nbsp;&nbsp;&nbsp';
				str += 			'<input type="hidden" id="hiddenLocate" name="'+ res[i].ecom_x +'" value="'+ res[i].ecom_y + '">';
// 				str +=    	  	'<span class="label label-info" style="cursor: pointer;" onclick="goToMap(this)" >지도보기</span>';
				str +=          '<img alt="" src="${pageContext.request.contextPath }/resources/images/mapIcon.png" onclick="goToMap(this)" style="cursor: pointer;"  width="1.5%" >';
				str +=      '</p>';
				str += '</td>';
// 				str += '<td>';
				
// 				if(res[i].ecom_category == 0){
// 					str += "기타";
// 				}else if(res[i].ecom_category == 1){
// 					str += "평생교육시설";
// 				}else if(res[i].ecom_category == 2){
// 					str += "지정직업훈련시설";
// 				}else{
// 					str += "학원";
// 				}
				
// 				str += '</td>';
				str += `</tr>`;
			}
		}
		return str;
	}
	
	function btnSearch(){
		var ecomCategory = $("#ecomCategory").val();
		getAllEmpList(ecomCategory);
		
	}
	
	
	function btnCompanyInfo(bthis){
		
		var ecom_code = $(bthis).parent().children()[0].id;
		var subDiv = $("#subDiv");
		var firstDiv = $("#firstDiv");
		var row = $(".empoloyCompany");
		var str = "";
		let eTitle = $(".eTitle");
		
		subDiv.remove();
		firstDiv.attr("class","col-lg-8");
		eTitle.attr("class", "col-lg-6")
		
		$.ajax({ 
			url : "/employ/getOneCompany",
			method : "GET",
			data : {"ecom_code" : ecom_code},
			success : function(res){
				console.log(res.ecom_url);
				str += '<div class="col-lg-4" style="margin: auto;" id="subDiv">';
				str +=		'<div class="card" style="height: 783px; ">';
				str += 			'<div class="card-body">';
				str += 				`<h4 class="card-title">\${res.ecom_name}</h4><br>
							            <div class="basic-form">
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">회사분류</span>
				                                </div>`;
				                                if(res.ecom_category == 0){
			    str +=                             '<input id="ecom_category" type="text" value="기타" class="form-control">'
				                                }
				                                if(res.ecom_category == 1){
			    str +=                             '<input id="ecom_category" type="text" value="평생교육시설" class="form-control">'
				                                }
				                                if(res.ecom_category == 2){
			    str +=                             '<input id="ecom_category" type="text" value="지정직업훈련시설" class="form-control">'
				                                }
				                                if(res.ecom_category == 3){
			    str +=                             '<input id="ecom_category" type="text" value="학원" class="form-control">'
				                                }
			    str +=                 		`</div>
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">회사위치</span>
				                                </div>
			                                	<input id="ecom_locate" value="\${res.ecom_locate}" type="text" class="form-control">
			                           		</div>
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">전화번호</span>
				                                </div>
			                                	<input id="ecom_tel" value="\${res.ecom_tel}" type="text" class="form-control">
			                           		</div>
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">회사소개</span>
				                                </div>
			                                	<input id="ecom_intro" value="\${res.ecom_intro}" type="text" class="form-control">
			                           		</div>
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">수당</span>
				                                </div>
			                                	<input id="ecom_pay" type="text" value="\${res.ecom_pay}" class="form-control">
			                           		</div>
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">기간</span>
				                                </div>
			                                	<input id="ecom_period" type="text" value="\${res.ecom_period}" class="form-control">
			                           		</div>
								            <div class="input-group mb-3">
				                                <div class="input-group-prepend">
				                                	<span class="input-group-text">내용</span>
				                                </div>
			                                	<textarea id="ecom_content" type="text" class="form-control" style="height:150px;">\${res.ecom_content}</textarea>
			                           		</div>
							            </div>
							            <br/><br/>
							            <div style="display:flex; justify-content: space-between;">
							            	<button type="button" onclick="btnClose()" class="btn mb-1 btn-outline-dark">닫기</button>
											<button type="button" class="btn btn-primary custom-btn-s" style="float:left;" onclick="btnGoPage('\${res.ecom_url}')">홈페이지로 이동</button>
										</div>`;
				str += 			 '</div>';
				str += 		'</div>';
				str += '</div>';
			
				row.append(str);
			}
		})	
	}
	
	function btnClose(){
		$("#subDiv").remove();
		$("#firstDiv").attr("class","col-lg-11");
	}
	
	
	function btnGoPage(link){
		console.log(link)
     	swal("해당 페이지로 이동합니다!",{
            buttons:{
               select:"확인",
               cancel:"취소"
            }
        }).then((value)=>{
        	switch(value){
        	case "select" : 
				window.open(link);
				break;
			default:
				break;
        	}
		})
	}
	
	function goToMap(gthis){
		console.log($(gthis).parent().parent().children()[0].value);
		console.log($(gthis).parent().children()[0].name);
		console.log($(gthis).parent().children()[0].value);
		var name = $(gthis).parent().parent().children()[0].value
		var x = $(gthis).parent().children()[0].name;
		var y = $(gthis).parent().children()[0].value;
		
		var pop = window.open("about:blank","content","menubar=no,top=100,left=1000, width=500,height=500");
		
		pop.location.href = "/employ/empCompanyMap?ecom_x="+ x +"&ecom_y="+ y +"&ecom_name="+name;
	}
	
	


</script>
</html>