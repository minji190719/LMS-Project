<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
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
/*     overflow-x: scroll; */
   
}

tbody tr {
   display: table;
   table-layout: fixed; 
   width:100%;
}
</style>
</head>  
<div id="isj">
		<h4 class="card-title" style="display: inline-block; margin-left: 1%; font-weight: bold;">
			<i class="fa-solid fa-graduation-cap"></i>도서 목록
		</h4>
		<h4 class="card-title" style="display: inline-block; margin-left: 53%; font-weight: bold;">
			<i class="fa-solid fa-graduation-cap"></i>대출한 도서 목록
		</h4>
		<div class="row">
			<div class="col-lg-7">
				<div class="card">
				<div style="margin-left: 59%; margin-top: 30px;">
			<select id="searchSelect" class="form-control-sm input-default" style="margin: 5px; border: 1px solid gray;">
				<option value="" selected="selected">선택하세요</option>
				<option value="book_writer">저자</option>
				<option value="book_name">도서명</option>
			</select>
			<span style="margin: 5px;"><input type="text" class="form-control-sm input-default" style="border: 1px solid gray;" id="searchName" placeholder="검색어"></span>
			<i class="mdi mdi-magnify" onclick="searchWord()" style="margin: 5px;"></i>
		</div>
					<div class="card-body" style="height: 704px; overflow: scroll; overflow-x: hidden; overflow-y: hidden;">
						<div class="table-responsive">
							<table class="table table-hover" style="table-layout:fixed;">
								<thead>
									<tr style="text-align: center;">
										<th style="width: 50px;">No</th>
										<th style="">도서명</th>
										<th style="">카테고리</th>
										<th style="">저자</th>
										<th style="">출판사</th>
										<th style="">페이지수</th>
										<th style="">재고수</th>
										<th style="">대출</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty bookList}">
										<tr style="text-align: center;">
											<td colspan="8">검색 결과가 존재하지 않습니다</td>
										</tr>
									</c:if>
									<c:if test="${not empty bookList}">
										<c:forEach items="${bookList}" var="book"
											varStatus="sts">
										<c:if test="${book.book_state == 1}"> 
											<tr>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; text-align: center; width: 50px;">${sts.index + 1}</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="${book.book_name}">${book.book_name}</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="${book.book_category}">${book.book_category}</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="${book.book_writer}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${book.book_writer}</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="${book.book_company}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${book.book_company}</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${book.book_pagecnt}</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${book.book_stock}</td>
												<c:if test="${book.book_state == 1}">
													<td>
<!-- 														<span class="label label-pill label-primary" onclick="proc3(this)" >대출</span> -->
														<input type="hidden" id="book_code" name="book_code" value="${book.book_code}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<button class="label label-pill label-dark" data-toggle="modal" data-target="#basicModal${book.book_code}">대출</button>
 														<!--Modal -->
														<div class="modal fade" id="basicModal${book.book_code}"
													style="display: none;" aria-hidden="true">
													<div class="modal-dialog" role="document">
													<form class="form-valide" id="frm${sts.index}">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" style="font-weight: bold;">대출시 주의사항</h5>
																<button type="button" class="close" data-dismiss="modal">
																	<span>×</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="card-body">
																	<div class="form-validation">
																			<input type="hidden" id="book_stock" name="book_stock" value="${book.book_stock}">
																			<div class="form-group row">
																					<input type="text" class="form-control input-default" value="사람들과 같이 쓰는 책입니다 깨끗하게 써주세요!" disabled="disabled">
																			</div>
																			<div class="form-group row">
																					<input type="text" class="form-control input-default" value="대출 기간은 대출 신청일로부터 7일입니다" disabled="disabled">
																			</div>
																			<div class="form-group row">
																				<select id="rent_bookcnt" class="form-control input-default">
																					<option selected="selected">선택</option>
												
																					<option value="1" >1</option>
																					<option value="2" >2</option>
																					<option value="3" >3</option>
																				</select>
																			</div>
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn mb-1 btn-primary custom-btn-s" onclick="proc3(this)">대출</button>
																<button type="button" class="btn mb-1 btn-outline-dark"
																	data-dismiss="modal">취소</button>
															</div>
														</div>
														</form>
													</div>
												</div>
													</td>
												</c:if>
											</tr>
										</c:if>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="card">
				<div class="card-body" style="padding-bottom: 0px; padding-top: 12px;">
					<div style="padding-left: 6%; margin-top: 10px; margin-bottom: 3px;" class="alert alert-warning">
		        		<span style="font-weight: bold;">도서관 Tip</span>
		        		<br>
		        		<span>* 도서 반납일은 대출날짜 +7일 입니다 <br>
							  * 도서 연장 신청시 반납날짜 +7일 입니다 
						</span>
		        	</div>
				</div>
					<div class="card-body" style="padding-top: 0px; padding-bottom: 0px;">
						<div class="table-responsive">
							<table class="table table-hover" style="table-layout:fixed; height: 650px;">
								<thead>
									<tr style="text-align: center;">
										<th style="width: 45px;">No</th>
										<th style="">도서명</th>
										<th style="">대출날짜</th>
										<th style="">반납날짜</th>
										<th style="">상태</th>
										<th style="">반납</th>
										<th style="">연장</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty bookRentalList}">
										<c:forEach items="${bookRentalList}" var="bookRental"
											varStatus="sts">
											<tr>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; text-align: center; width: 45px;">${sts.index + 1}</td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="<c:out value="${bookRental['BOOK_NAME']}"></c:out>"><c:out value="${bookRental['BOOK_NAME']}"></c:out> </td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="<c:out value="${bookRental['RENT_START']}"></c:out>">
												<c:out value="${bookRental['RENT_START']}"></c:out>
											 </td>
											<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; width: 105px;" title="<c:out value="${bookRental['RENT_END']}"></c:out>"><c:out value="${bookRental['RENT_END']}"></c:out> </td>
											<c:if test="${bookRental['RENT_STATE'] == 0}">
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;대출중</td>		
											</c:if>											 
											<c:if test="${bookRental['RENT_STATE'] == 1}">
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;연재중</td>		
											</c:if>											 
											<c:if test="${bookRental['RENT_STATE'] == 2}">
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반납</td>		
											</c:if>											 
												<c:if test="${bookRental['RENT_STATE'] != 2}">
													<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
														<input type="hidden" id="rent_code" name="rent_code" value="${bookRental['RENT_CODE']}">
														<button class="btn mb-1 btn-outline-danger btn-sm" style="margin-left: 18px;" onclick="proc4(this)" >반납</button>
													</td>	
												</c:if>
												<c:if test="${bookRental['RENT_STATE'] != 2}">
													<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
														<input type="hidden" id="rent_code" name="rent_code" value="${bookRental['RENT_CODE']}">
														<button class="btn mb-1 btn-outline-success btn-sm" style="margin-left: 18px;" onclick="proc5(this)" >연장</button>
													</td>	
												</c:if>
												<c:if test="${bookRental['RENT_STATE'] == 2}">
													<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
													<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
												</c:if>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty bookRentalList}">
										<tr style="text-align: center;">
											<td colspan="7" >대출한 도서가 없습니다 책좀읽자</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<script type="text/javascript">
function proc3(btn){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let book_code = $(btn).parent().parent().parent().parent().parent().parent().find("#book_code").val();
	let bookRental_cnt = $(btn).parent().parent().find("#rent_bookcnt").val();
	let bookStock = $(btn).parent().parent().find("#book_stock").val();
	
	console.log("대출 도서 번호", book_code);
	console.log("대출 도서 권수", bookRental_cnt);
	console.log("대출 도서 재고수", bookStock);
	
	if(bookStock < bookRental_cnt){
// 		alert("재고수가 부족합니다");
// 		swal('재고수가 부족합니다','', 'warning');
		swal({
			  title: "재고수가 부족합니다",   //큰 글씨
			  icon: "warning",   //info, success등 종류
			});
		return false;
	}else{
		$.ajax({
			type : "post",
			url : "/student/bookRental",
			data : {"book_code" : book_code, "bookRental_cnt" : bookRental_cnt},
			success : function(res){
				if(res == "OK"){
					$(btn).parent().parent().parent().parent().parent().modal('hide');
					$(".modal-backdrop fade show").remove();
// 					alert("대출되었습니다");
// 					swal('대출되었습니다','', 'success');
					swal({
						  title: "대출되었습니다",   //큰 글씨
						  icon: "success",   //info, success등 종류
						});
					$("#isj").load("/student/bookList #isj");
				}
			},
			beforeSend : function(xhr){
	    	    xhr.setRequestHeader(header, token);
	     	},
			dataType : "text"
		})
	}
	
}

function proc4(btn){
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let rent_code = $(btn).parent().find("#rent_code").val();
	console.log(rent_code);
	
    swal("반납하시겠습니까?",{
        buttons:{
           select:"확인",
           cancel:"취소"
        }
     }).then((value)=>{
        console.log(value)
        
        switch(value){
        case "select":
        	$.ajax({
    			type : "post",
    			url : "/student/bookReturn",
    			data : {"rent_code" : rent_code},
    			success : function(res){
    				if(res == "OK"){
//     					swal("반납되었습니다");
    					swal({
    						  title: "반납되었습니다",   //큰 글씨
    						  icon: "success",   //info, success등 종류
    						});
//     					swal('반납되었습니다','', 'success');
    						$("#isj").load("/student/bookList #isj");
    				}
    			},
    			beforeSend : function(xhr){
    	    	    xhr.setRequestHeader(header, token);
    	     	},
    			dataType : "text"
    		})
           break;
        default:
           break;
        }
     })
	
	
// 	if(confirm("반납하시겠습니까?")){
// 		$.ajax({
// 			type : "post",
// 			url : "/student/bookReturn",
// 			data : {"rent_code" : rent_code},
// 			success : function(res){
// 				if(res == "OK"){
// // 					swal("반납되었습니다");
// 					swal({
// 						  title: "반납되었습니다",   //큰 글씨
// 						  icon: "success",   //info, success등 종류
// 						});
// // 					swal('반납되었습니다','', 'success');
// 						$("#isj").load("/student/bookList #isj");
// 				}
// 			},
// 			beforeSend : function(xhr){
// 	    	    xhr.setRequestHeader(header, token);
// 	     	},
// 			dataType : "text"
// 		})
// 	}
	
}

function proc5(btn){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	let rent_code = $(btn).parent().find("#rent_code").val();
	console.log("연장할 도서 rent_code", rent_code);
	
    swal("연장하시겠습니까?",{
        buttons:{
           select:"확인",
           cancel:"취소"
        }
     }).then((value)=>{
        console.log(value)
        
        switch(value){
        case "select":
        	$.ajax({
    			type : "post",
    			url : "/student/prolongBook",
    			data : {"rent_code" : rent_code},
    			success : function(res){
    				if(res == "OK"){
//     					alert("연장되었습니다");
//     					swal('연장되었습니다','', 'success');
    					swal({
    						  title: "연장되었습니다",   //큰 글씨
    						  icon: "success",   //info, success등 종류
    						});
    						$("#isj").load("/student/bookList #isj");
    				}
    			},
    			beforeSend : function(xhr){
    	    	    xhr.setRequestHeader(header, token);
    	     	},
    			dataType : "text"
    		})
           break;
        default:
           break;
        }
     })
	
// 	if(confirm("연장하시겠습니까?")){
// 		$.ajax({
// 			type : "post",
// 			url : "/student/prolongBook",
// 			data : {"rent_code" : rent_code},
// 			success : function(res){
// 				if(res == "OK"){
// // 					alert("연장되었습니다");
// // 					swal('연장되었습니다','', 'success');
// 					swal({
// 						  title: "연장되었습니다",   //큰 글씨
// 						  icon: "success",   //info, success등 종류
// 						});
// 						$("#isj").load("/student/bookList #isj");
// 				}
// 			},
// 			beforeSend : function(xhr){
// 	    	    xhr.setRequestHeader(header, token);
// 	     	},
// 			dataType : "text"
// 		})
	
// 	}
	
}

function searchWord(){
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	const objSelectCol = $("#searchSelect"); 
	const objSearchWord = $("#searchName"); 
	
	let selectCol = $(objSelectCol).val();
	let serachWord = $(objSearchWord).val();
	
	console.log("컬럼 : ", selectCol);
	console.log("단어: ", serachWord);
	
	if(selectCol == ""){
		selectCol = "book_name";
	}
	
	$("#isj").load("/student/bookList?selectCol="+selectCol+"&serachWord="+serachWord+" #isj");
	
}

</script>	