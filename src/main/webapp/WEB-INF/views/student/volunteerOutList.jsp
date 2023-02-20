<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;교외 봉사내역<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/volunteer/outList">교외 봉사내역</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>


<div id="newWay">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="form-group row">
						<div class="col-lg-11">						
							<div class="alert alert-primary">
								 전체 누적 봉사시간&nbsp;&nbsp;  ${totalTime }   / 72  시간&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="alert alert-success">
								 교외 누적 봉사시간&nbsp;&nbsp;  ${time}   / 36  시간&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="col-lg-1">
							<div class="btn btn-primary custom-btn-s" data-toggle="modal" data-target="#modalGrid" 
							style="width: 100%; height: 87%; text-align: center; display: flex; align-items: center; justify-content: center;">
								봉사 신청
							</div>
						</div>
					</div>
					<div class="table-responsive custom-table1">
						<table class="table table-hover" style="text-align: center;">
							<thead class="custom-theader-s">
								<tr>
									<th style="width: 50px;">No</th>
									<th style="width: 80px;">년도</th>
									<th style="width: 80px;">학기</th>
									<th style="width: 150px;">시작일자</th>
									<th>종료일자</th>
									<th>기관명</th>
									<th>취득시간</th>
									<th>신청상태</th>
									<th>신청일자</th>
									<th>취득일자</th>
									<th>활동내용</th>
									<th>반려사유</th>
								</tr>
							</thead>
							<tbody style="height: 750px;">
								<c:set value="${list }" var="volList"></c:set>
								<c:choose>
									<c:when test="${empty volList }">
										<tr>
											<td colspan="12">봉사내역이 존재하지 않습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${volList }" var="vol" varStatus="status">
											<tr>
												<th style="width: 50px;">${status.index + 1 }</th>
												<td style="width: 80px;">${vol.volo_year }</td>
												<td style="width: 80px;">${vol.volo_semester }</td>
												<td style="width: 150px;"><fmt:formatDate value="${vol.volo_start }" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;&nbsp;~</td>
												<td><fmt:formatDate value="${vol.volo_end }" pattern="yyyy/MM/dd"/></td>
												<td>${vol.volo_company }</td>
												<td>${vol.volo_time }  시간</td>
												<c:choose>
													<c:when test="${vol.volo_state == 1 }">
														<td>&emsp;<span class="badge badge-success">승인</span> </td>
													</c:when>
													<c:when test="${vol.volo_state == 0 }">
														<td>&emsp;<span class="badge badge-dark">대기</span> </td>
													</c:when>
													<c:otherwise>
														<td>&emsp;<span class="badge badge-danger">반려</span></td>
													</c:otherwise>
												</c:choose>
												<td>&emsp;<fmt:formatDate value="${vol.volo_regidate }" pattern="yyyy/MM/dd"/></td>
												<td>&emsp;<fmt:formatDate value="${vol.volo_date }" pattern="yyyy/MM/dd"/></td>
												<td>
<!-- 												활동내용 모달파트 -->
													<div class="bootstrap-modal">
												        <!-- Button trigger modal -->
<!-- 												        <span class="label label-pill label-secondary" style="cursor: pointer;">Secondary</span> -->
												  &emsp;<span class="custom-btn-s label label-pill label-secondary" style="cursor: pointer;"  data-toggle="modal" data-target="#basicModal${status.index}">내용</span>
<%-- 												        <button type="button" class="btn mb-1 btn-rounded" style="background-color: #004130; color:white;" data-toggle="modal" data-target="#basicModal${status.index}">활동내용</button> --%>
												        <!-- Modal -->
												        <div class="modal fade" id="basicModal${status.index}" style="display: none;" aria-hidden="true">
												            <div class="modal-dialog" role="document">
												                <div class="modal-content">
												                    <div class="modal-header">
												                        <h5 class="modal-title">활동내용</h5>
												                        <button type="button" class="close" data-dismiss="modal"><span>×</span>
												                        </button>
												                    </div>
												                    <div class="modal-body">${vol.volo_content}</div>
												                    <div class="modal-footer">
												                        <button type="button" class="btn mb-1 btn-outline-dark" data-dismiss="modal">닫기</button>
												                    </div>
												                </div>
												            </div>
												        </div>
												    </div>
												</td>
												<c:choose>
													<c:when test="${vol.volo_state == 0 }">
<%-- 														<td> <a href="" class="label label-danger" onclick="outDelete(${vol.volo_code})">취소하기</a> </td> --%>
														<td> 
															&emsp;&emsp;<span class="btn mb-1 btn-outline-danger btn-sm" id="cancle" onclick="deleteRegister(${vol.volo_code})" style="cursor: pointer;">취소하기</span> 
														</td>
													</c:when>
													<c:otherwise>
														<td>&emsp;&emsp;${vol.volo_reject }</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="bootstrap-modal">
                 <!-- Button trigger modal -->
                 <!-- <button type="button" class="btn mb-1 btn-primary custom-btn-s" style="float: right;" data-toggle="modal" data-target="#modalGrid">신청하기</button>  -->
                 <!-- Modal -->
                 <div class="modal fade" id="modalGrid" style="display: none;" >
                     <div class="modal-dialog modal-dialog-centered modal-lg" role="document" role="document">
                         <div class="modal-content" style="width: 200%;">
                             <div class="modal-header">
                                 <h5 class="modal-title">교외봉사 신청하기</h5>
                                 <button type="button" class="close" data-dismiss="modal"><span>×</span>
                                 </button>
                             </div>
                             <div class="modal-body">
				               <div class="card-body">
				                   <div class="form-validation">
				                       <form id="volRegisterForm" class="form-valide" method="post" enctype="multipart/form-data" >
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label" for="val-username">학번 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <input type="text" class="form-control input-default" id="smem_no" readonly="readonly" name="smem_no" aria-required="true" aria-describedby="val-username-error" value="${id }">
				                               </div>
				                           </div>
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label">시작일자 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <input type="date" class="form-control input-default" id="volo_start" name="volo_start" placeholder="yyyy/mm/dd" aria-required="true" >
				                               </div>
				                           </div>
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label">종료일자 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <input type="date" class="form-control input-default" id="volo_end" name="volo_end" placeholder="yyyy/mm/dd" >
				                               </div>
				                           </div>
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label" >총 활동 시간 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <input type="text" class="form-control input-default" id="volo_time" name="volo_time" placeholder="0" >
				                               </div>
				                           </div>
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label" >기관명 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <input type="text" class="form-control input-default" id="volo_company" name="volo_company" placeholder="" >
				                               </div>
				                           </div>
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label" for="val-suggestions">활동내용 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <textarea class="form-control input-default" id="volo_content" name="volo_content" rows="10" placeholder="활동내용을 기입해주세요" ></textarea>
				                               </div>
				                           </div>
				                           <div class="form-group row is-invalid">
				                               <label class="col-lg-4 col-form-label" >첨부파일 <span class="text-danger">*</span>
				                               </label>
				                               <div class="col-lg-6">
				                                   <input type="file" id="volo_files" name="volo_files" multiple="multiple">
				                               </div>
				                           </div>
<!-- 							                           <div class="form-group row"> -->
<!-- 							                               <div class="col-lg-8 ml-auto"> -->
<!-- 							                                   <button type="button" class="btn btn-primary btn sweet-success" onclick="forAlert()">신청하기</button> -->
<!-- 							                               </div> -->
<!-- 							                           </div> -->
				                             <div class="modal-footer">
				                                 <button type="button" id="register" class="btn mb-1 btn-primary custom-btn-s" onclick="registerModal()" >신청하기</button>
				                                 <button type="button" class="btn mb-1 btn-outline-dark" onclick="eh_autoValue()" >자동완성</button>
				                                 <button type="button" class="btn mb-1 btn-outline-dark" onclick="closeModal()" data-dismiss="modal">닫기</button>
				                             </div>
				                       </form>
				                   </div>
				               </div>
                         </div>
                     </div>
                 </div>
             </div>
		</div>
	</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
<script type="text/javascript">

		const registerForm = document.getElementById("volRegisterForm");
		const volo_file = document.querySelector("#volo_files");
		const register = document.querySelector("#register");
		const cancle = document.querySelector("#cancle");
		
		
		
		function closeModal(){
			registerForm.reset();
		}
		
		function registerModal(){
// 			console.log($(pthis).parent().parent().attr("id"));
// 			var thisBtn = $(pthis).parent().parent().attr("id")
			
			
			let files = volo_file.files;
// 			var files = file[0];
			console.log("파일사이즈 : " + files.length);
// 			if(files.length == 0){
// 				alert("파일이 첨부되지 않았습니다. 다시 시도해주세요!");
// 				return false;
// 			}
			let formData = new FormData(registerForm);

			for(let i = 0; i < files.length; i++){
				formData.append("volo_rfiles",files[i]);
			}
			
			var token = $("meta[name='_csrf']").attr('content');
			var modalGrid = $("#modalGrid")
			$.ajax({
				type : "POST",
				url : "/volunteer/outRegister",
				data : formData,
				contentType : false,
				processData : false,
				headers : {
					"X-CSRF-TOKEN" : token
				},
				success : function(data){
					modalGrid.modal('hide');
					$(".modal-backdrop").remove();
// 					alert(data);
					swal("", data, "success");
					
	   				swal({
	 					  title: "신청 성공", 
	 					  text : "교외 봉사 신청이 완료되었습니다",
	 					  icon: "success",
				          buttons:{
					              select:"확인"
					      }
	 				})	
					
					
					registerForm.reset();
					$("#newWay").load("/volunteer/outList #newWay");
// 					location.href = "/volunteer/outList";
				}
			})
			
			
		}
	

	function deleteRegister(aa){
	   swal({
		   title: "신청 취소",
		   text: "정말 교외봉사 신청을 취소하시겠습니까?\n신청 취소시 되돌릴 수 없습니다.",
		   icon: "warning",
           buttons:{
              select:"확인",
              cancel:"취소"
           }
        }).then((value)=>{
        	switch(value){
        		case "select" : 
						var volo_code = {"volo_code" : aa};
						console.log(volo_code);
						$.ajax({
							url : "/volunteer/outDelete",
							type : "get",	
							data : volo_code,
							success : function(data){
								swal({
									   title: "신청 취소 완료",
									   text: "취소에 성공하였습니다.",
									   icon: "success",
							           buttons:{
							              select:"확인"
							           }
							        }).then((value) => {							        	
										$("#newWay").load("/volunteer/outList #newWay"); 
							        })
							}
						})
        			break;
        		default:
        			break;
        	}
        })
	}

	
	
	function eh_autoValue(){
		
		var volo_start = $("#volo_start");
		var volo_end = $("#volo_end");
		var volo_time = $("#volo_time");
		var volo_company = $("#volo_company");
		var volo_content = $("#volo_content");
		
		volo_start.val("2023-01-25");
		volo_end.val("2023-01-25");
		volo_time.val("6");
		volo_company.val("한밭도서관");
		volo_content.val(`지난번에 했었던 도서관 봉사를 너무 재미있게 해서\n
						  서구에 있는 둔산 도서관에서 다시 도서관 봉사를 하게 되었다.\n 
						  아파트 상가 근처에 작은 교회와 함께 있는 도서관이었다.\n
				          말 그대로 정말 작고 정겨운 도서관이었지만, 생각외로 많은 책들을 볼 수 있었다.\n
				          도착한 후 도서관 안과 바깥 전체를 쓸고 닦고 청소하였다.\n
				          작은 도서관인지라 그렇게 힘든 일은 아니었다.\n
				          청소를 다 끝마친 후에는 도서관 사서선생님이 직접 원두를 내려 커피를 타주셨다.\n
				          이 날엔 시험때문에 2시간밖에 잠을 못잤는데 커피를 먹고 피로가 풀리는듯해\n
				          기분도 좋았고 굉장히 감사했다.\n
				          청소를 한 후 시간이 많이 남아 \n
				          날씨가 좋아 햇빛도 따사로이 흐르고, 따뜻한 원두커피냄새를 맡으며 책을 읽을 수 있어서 기분이 정말 좋았다.\n
				          비록 짧은시간이라 많은 일을 도와드리진 못했지만\n
				          좋은 곳에서 내 자신도 돌아볼 수 있었던 날이었던 것같다.`);
	
	}
	
	

	
</script>
</html>

