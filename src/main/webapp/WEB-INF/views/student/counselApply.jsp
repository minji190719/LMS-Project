<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;상담 신청<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/mypage/List">상담 신청</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div id="page">
	<div class="row">
		<div class="col-lg-7">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-s custom-bold">
							상담 신청 가능 목록
						</h5>
					</div>
					<div class="form-group row custom-right-array">
						<div class="col-2">
							<span>
								<input type="date" class="form-control input-default " id="searchDate" value="">
							</span>
						</div>
						<div class="col-3">						
							<select id="searchSelect" class="form-control input-default ">
								<option value="" selected="selected">=== 주제 선택 ===</option>
								<option value="대인관계">대인관계</option>
								<option value="학업">학업</option>
								<option value="진로">진로</option>
							</select>
						</div>
						<div class="col-2 custom-right-array">	
							<span>
								<input type="text" class="form-control input-default" id="searchName" placeholder="교수명 입력" value="">
							</span>
							<i class="fa-solid fa-magnifying-glass custom-s" onclick="search()" style="padding-top: 15px; padding-left: 15px;"></i>
						</div>
					</div>
					<div class="table-responsive custom-table1">
						<table class="table table-hover" id="tableTest">
							<thead class="custom-theader-s">
								<tr style="text-align: center;">
									<th style="width: 50px;">No.</th>
									<th>교수명</th>
									<th>상담 가능일</th>
									<th>상담 가능 시간</th>
									<th>상담 분야</th>
								</tr>
							</thead>
							<tbody class="n_list" id="ajaxRegiVolList" style="height: 575px;">
								<c:set value="${counselListName}" var="counselListName"></c:set>
								<c:forEach items="${counselList}" var="counselList"
									varStatus="sts">
									<tr onclick="counseDetail(this)"
										style="text-align: center; cursor: pointer;">
										<input type="hidden" id="cnsl_code" name="cnsl_code" value="${counselList.cnsl_code}"></input>
											
										<td style="width: 50px;">${sts.index + 1}</td>
										<td>${counselListName[sts.index].mem_name}</td>
										<td>${counselList.cnsl_date}</td>
										<td>${counselList.cnsl_time}</td>
										<td>${counselList.cnsl_kind}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-5">
			<div class="card" id="lecPlanDetailBody">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-s custom-bold">
							상담 신청
						</h5>
					</div>
					<div style="" class="alert alert-warning">
						<span style="font-weight: bold;">상담 신청 시 주의사항</span> <br> <span>*
							자세한 상담을 위하여 정확한 정보를 입력하시기 바랍니다.<br> * 원활한 상담 신청을 위하여 개인정보가
							저장 및 기록됩니다.
						</span>
					</div>
				</div>
				<div class="card-body">
					<div class="basic-form" style="padding-left: 6%;">
						<form id="updateForm">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>교수명</label> <input type="text" id="professorName"
										value="" class="form-control input-default"
										disabled="disabled"> <input type="hidden"
										id="cnsl_code" name="cnsl_code" value="">
								</div>
								<div class="form-group col-md-6">
									<label>상담분야</label> <input type="text" id="cnsl_kind"
										class="form-control input-default" disabled="disabled">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>가능날짜</label> <input type="text" id="cnsl_date"
										name="cnsl_date" class="form-control input-default"
										disabled="disabled">
								</div>
								<div class="form-group col-md-6">
									<label>가능시간</label> <input type="text" id="cnsl_time"
										name="cnsl_time" class="form-control input-default"
										disabled="disabled">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>상담주제</label> <input type="text" id="cnsla_sub"
										name="cnsla_sub" class="form-control input-default">
								</div>
								<div class="form-group col-md-6">
									<label>상담유형</label><br> <select id="cnsla_type"
										class="form-control input-default" name="cnsla_type">
										<option selected="selected" value="">선택하세요</option>
										<option value="0">대면</option>
										<option value="1">비대면</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-lg-12">
									<label>상담내용</label>
									<textarea rows="5" cols="30" id="cnsla_content"
										name="cnsla_content" class="form-control input-default"></textarea>
								</div>
							</div>
							<br/>
							<br/>
							<div class="form-row custom-right-array">
								<button type="button" class="btn mb-1 btn-primary custom-btn-s"
									onclick="proc()">신청</button>
								<button type="button" class="btn mb-1 btn-outline-dark"
									onclick="autoValue(this)">자동완성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function autoValue(btn){
// 	alert("aaa");
	$(btn).parent().parent().parent().find("#cnsla_sub").val("상담주제");
	$(btn).parent().parent().parent().find("#cnsla_type").val("1");
	$(btn).parent().parent().parent().find("#cnsla_content").val("상담내용");

}

function counseDetail(tr){
	
	let clickBg = document.querySelector(".clickBg");
	if(clickBg){
		clickBg.classList.remove("clickBg");
	}
	tr.classList.add('clickBg');
	
	let cnsl_code = $(tr).find("#cnsl_code").val();
	
	let updateForm = $("#updateForm");
	
	let professorName = $(updateForm).find("#professorName");
	let post_cnsl_code = $(updateForm).find("#cnsl_code");
	let cnsl_kind = $(updateForm).find("#cnsl_kind");
	let cnsl_date = $(updateForm).find("#cnsl_date");
	let cnsl_time = $(updateForm).find("#cnsl_time");
	
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	$.ajax({
		url : "/student/counselApplyDetail",
    	type : "post",
    	data : {"cnsl_code" : cnsl_code},
    	success : function(result){
    		console.log("디테일 : ", result);
		
    		if(result != null){
    			$(professorName).val(result.mem_name);
    			$(cnsl_kind).val(result.cnsl_kind);
    			$(cnsl_date).val(result.cnsl_date);
    			$(cnsl_time).val(result.cnsl_time);
    			$(post_cnsl_code).val(result.cnsl_code)
    		}
    		
        },
        beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
        },
        dataType : "json"
	})
}

function search(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let searchName = $("#searchName").val();
	let searchDate = $("#searchDate").val();
	let searchSelect = $("#searchSelect").val();
	
	console.log(searchName);
	console.log(searchDate);
	console.log(searchSelect);
	
	$.ajax({
		url : "/student/counselApplySearch",
    	type : "post",
    	data : {"searchName" : searchName, "searchDate" : searchDate,
    			"searchSelect" : searchSelect
    		},
    	success : function(result){
    		console.log(result);
    		drawHTML(result);
        },
        beforeSend : function(xhr){
    	    xhr.setRequestHeader(header, token);
        },
        dataType : "json"
	})
	
}

function proc(btn){
	
	   swal({
		   title: "신청",
		   text: "상담을 신청하시겠습니까?",
		   icon: "info",
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
       		
       		let form = $("#updateForm");
       		
       		let cnsl_code = $(form).find("#cnsl_code").val();
       		let cnsla_type = $(form).find("#cnsla_type").val();
       		let cnsla_sub = $(form).find("#cnsla_sub").val();
       		let cnsla_content = $(form).find("#cnsla_content").val(); 
       		let cnsl_date = $(form).find("#cnsl_date").val();
       		let cnsla_time = $(form).find("#cnsl_time").val();
       		
       		$.ajax({
       			url : "/student/counselApply.do",
       			type : "post",
       			data : {"cnsl_code" : cnsl_code, "cnsla_type" : cnsla_type,
       				"cnsla_sub" : cnsla_sub, "cnsla_content" : cnsla_content,
       				"cnsl_date" : cnsl_date, "cnsla_time" : cnsla_time},
       			success : function(result){
       			if(result == "OK"){
//        				alert("상담 신청이 완료 되었습니다");
       				
							swal({
							   title: "신청 완료",
							   text: "상담 신청에 성공하였습니다.",
							   icon: "success",
					           buttons:{
					              select:"확인"
					           }
					        }).then((value) => { 
       						swal("상담 신청 내역 페이지로 이동하시겠습니까?",{
       	       		            buttons:{
       	       		               select:"확인",
       	       		               cancel:"취소"
       	       		            }
       	       		         }).then((value)=>{
       	       		            console.log(value)
       	       		            
       	       		            switch(value){
       	       		            case "select":
       	       		            	location.href = "/student/counselList.do";
       	       		               break;
       	       		            default:
       	       		            	$("#page").load("/student/counselApply.do #page");
       	       		               break;
       	       		            }
       	       		         })
       					});
       				
//        				if(confirm("상담 신청 내역 페이지로 이동하시겠습니까?")){
//        					location.href = "/student/counselList.do";
//        				}else{
//        					$("#page").load("/student/counselApply.do #page");	
//        				}
       				
       			}
       		},
       		beforeSend : function(xhr){
       				xhr.setRequestHeader(header, token);
       		},
       		dataType : "text"
       		})
              break;
           default:
        	   $("#page").load("/student/counselApply.do #page");
              break;
           }
        })
	
	
    
}
   
function drawHTML(result){
	const pageBlock = $("#page");
	$(pageBlock).empty();
	
	let searchPage = ``;
	
		searchPage += 
			`<div class="row">
		<div class="col-lg-7">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-s">
							상담 신청 가능 목록
						</h5>
					</div>
					<div class="form-group row custom-right-array">
						<div class="col-2">
							<span>
								<input type="date" class="form-control input-default " id="searchDate" value="">
							</span>
						</div>
						<div class="col-3">						
							<select id="searchSelect" class="form-control input-default ">
								<option value="" selected="selected">=== 주제 선택 ===</option>
								<option value="대인관계">대인관계</option>
								<option value="학업">학업</option>
								<option value="진로">진로</option>
							</select>
						</div>
						<div class="col-2 custom-right-array">	
							<span>
								<input type="text"
								class="form-control input-default "
								style="border: 1px solid gray;" id="searchName" placeholder="교수명"
								value="">
							</span>
							<i class="fa-solid fa-magnifying-glass custom-s" onclick="search()" style="padding-top: 15px; padding-left: 15px;"></i>
						</div>
					</div>
					<div class="table-responsive custom-table1">
						<table class="table table-hover" id="tableTest">
							<thead class="custom-theader-s">
								<tr style="text-align: center;">
									<th style="width: 50px;">No.</th>
									<th>교수명</th>
									<th>상담 가능일</th>
									<th>상담 가능 시간</th>
									<th>상담 분야</th>
								</tr>
							</thead>
							<tbody class="n_list" id="ajaxRegiVolList" style="height: 575px;">`;
	                  				if(result.length <= 0){
	                  					searchPage += `<tr style="text-align: center; cursor: pointer;">
	                  										<td colspan="5">검색 결과가 존재 하지 않습니다</td>
	                  								  </tr>`;
	                  				}else{
	                  					for(let i=0;i<result.length;i++){
	                						searchPage += `
	    										<tr onclick="counseDetail(this)" style="text-align: center; cursor: pointer;">
	    										<input type="hidden" id="cnsl_code" name="cnsl_code" value="\${result[i].cnsl_code}">
	    											<td style="width: 50px;">\${i+1}</td>
	    											<td>&nbsp;&nbsp;\${result[i].mem_name}</td>
	    											<td>&nbsp;&nbsp;&nbsp;&nbsp;\${result[i].cnsl_date}</td>
	    											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${result[i].cnsl_time}</td>
	    											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${result[i].cnsl_kind}</td>
	    										</tr>
	    									`;
	                					}
	                  				}
                					
					searchPage += `
						</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-5">
			<div class="card" id="lecPlanDetailBody">
				<div class="card-body">
					<div class="card-title">
						<h5 class="custom-s">
							상담 신청
						</h5>
					</div>
					<div style="" class="alert alert-warning">
						<span style="font-weight: bold;">상담 신청 시 주의사항</span> <br> <span>*
							자세한 상담을 위하여 정확한 정보를 입력하시기 바랍니다.<br> * 원활한 상담 신청을 위하여 개인정보가
							저장 및 기록됩니다.
						</span>
					</div>
				</div>
				<div class="card-body">
					<div class="basic-form" style="padding-left: 6%;">
						<form id="updateForm">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>교수명</label> <input type="text" id="professorName"
										value="" class="form-control input-default"
										disabled="disabled"> <input type="hidden"
										id="cnsl_code" name="cnsl_code" value="">
								</div>
								<div class="form-group col-md-6">
									<label>상담분야</label> <input type="text" id="cnsl_kind"
										class="form-control input-default" disabled="disabled">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>가능날짜</label> <input type="text" id="cnsl_date"
										name="cnsl_date" class="form-control input-default"
										disabled="disabled">
								</div>
								<div class="form-group col-md-6">
									<label>가능시간</label> <input type="text" id="cnsl_time"
										name="cnsl_time" class="form-control input-default"
										disabled="disabled">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>상담주제</label> <input type="text" id="cnsla_sub"
										name="cnsla_sub" class="form-control input-default">
								</div>
								<div class="form-group col-md-6">
									<label>상담유형</label><br> <select id="cnsla_type"
										class="form-control input-default" name="cnsla_type">
										<option selected="selected" value="">선택하세요</option>
										<option value="0">대면</option>
										<option value="1">비대면</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-lg-12">
									<label>상담내용</label>
									<textarea rows="5" cols="30" id="cnsla_content"
										name="cnsla_content" class="form-control input-default"></textarea>
								</div>
							</div>
							<br/>
							<br/>
							<div class="form-row custom-right-array">
								<button type="button" class="btn mb-1 btn-primary custom-btn-s"
									onclick="proc()">신청</button>
								<button type="button" class="btn mb-1 btn-outline-dark"
									onclick="autoValue(this)">자동완성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>`;

	$(pageBlock).html(searchPage);
	
}

</script>

</html>










