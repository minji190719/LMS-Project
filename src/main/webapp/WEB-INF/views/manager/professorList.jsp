<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="row">
	<div class="col-lg-6">
		<h4 class="card-title custom-m mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;교수 조회<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/Mprofessor/professorAllList">교수 조회</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-7">
		<div class="card" >
			<div class="card-body">
				<div class="alert alert-danger">※ 개인정보를 제공받은 목적 외의 용도로 이용하거나 이를 제3자에게 제공하는 경우 처벌을 받을 수 있습니다.</div>
				<div class="form-group row custom-right-array">
					<div class="col-3">
						<select class="form-control input-default" id="professorDepartment" onchange="searchProfessor()">
			               <option selected="selected" value="">=== 학과 선택 ===</option>
			               <option value = "전자공학과">전자공학과</option>
			               <option value = "컴퓨터공학과">컴퓨터공학과</option>
			               <option value = "실용음악과">실용음악과</option>
			               <option value = "0">기타</option>
			            </select>				
					</div>
					<div class="col-3">					
			            <select class="form-control input-default" id="professorPosition" onchange="searchProfessor()">
			               <option selected="selected" value="">=== 직책 선택 ===</option>
			               <option value = "학과장">학과장</option>
			               <option value = "명예교수">명예교수</option>
			               <option value = "정교수">정교수</option>
			            </select>
					</div>
					<div class="col-3">
						<input type="text" id="professorName" oninput="searchProfessor()" class="form-control input-default" placeholder="이름 검색">
					</div>
				</div>
				 <div class="table-responsive custom-table1">
				     <table class="table table-hover" id="EH_tableTest">
				         <thead class="custom-theader-m">
				             <tr>
				                 <th width="10%;">No</th>
				                 <th>교번</th>
				                 <th>성명</th>
				                 <th>대학</th>
				                 <th>학과</th>
				                 <th>직책</th>
				                 <th></th>
				             </tr>
				         </thead>
				         <tbody id="professorList" style="height: 544px;">
				         
<!-- 				           ajax part -->

				         </tbody>
				     </table>
				 </div>
			</div>
		</div>
	</div>
   <div class="col-lg-5">
        <div class="card"  id="lecPlanDetailBody" style="height: 792px; overflow: scroll; overflow-x:hidden; overflow-y:hidden;"><br><br>
        	<div class="card-body" style="padding-bottom: 0px; margin-left: 5%; padding-top:5px;">
				<div class="card-title">
					<h5 class="custom-m custom-bold">교수 상세 조회 / 직급 변경</h5>
				</div>
				<div class="alert alert-light">
					<span style="font-weight: bold;">직급변경시 유의사항</span> <br> <span>*
						직급변경시 합의하에 직급을 변경해 주세요 </span>
				</div>
			</div>
            <div class="card-body">
               <div class="basic-form" style="padding-left: 6%;">
                   <form id="updateForm">
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>교번</label>
                               <input type="text" id="mem_no" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>성명</label>
                               <input type="text" id="mem_name" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>대학</label>
                               <input type="text" id="col_name" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>학과</label>
                               <input type="text" id="dep_name" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>번호</label>
                               <input type="text" id="mem_tel" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>직책</label>
                               <input type="text" id="position" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>입사일</label>
                               <input type="text" id="join_date" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
                               <label>퇴사일</label>
                               <input type="text" id="leave_date" class="form-control input-default" disabled="disabled">
                           </div>
                       </div>
                       <div class="form-row">
                           <div class="form-group col-md-6">
                               <label>교수방</label>
                               <input type="text" id="roomnum" class="form-control input-default" disabled="disabled">
                           </div>
                           <div class="form-group col-md-6">
	                           <label style="color: red;">직책 변경</label>
	                           <select id="newPosition" class="form-control input-default">
					               <option selected="" value="">직급선택</option>
					               <option value = "정교수">정교수</option>
					               <option value = "명예교수">명예교수</option>
					               <option value = "학과장">학과장</option>
					           </select>
				            </div>
                       </div>
                       <div class="form-group">
<!--                            <label>파일</label> -->
                           <div id="fileLocation">
                           
<!--                            파일 리스트 들어올 곳 -->

                           </div>
                       </div>
                    </form>
                   	<div class="custom-right-array">
                       <button type="button" class="btn mb-1 btn-primary custom-btn-m" onclick="positionChange()" >직급변경</button>&nbsp;&nbsp;&nbsp;&nbsp;
                   	</div>	
               </div>
            </div>
        </div>
     </div>
</div>	

<script type="text/javascript">
	window.onload = function(){
		getProfessorListData();
	}
	
function getProfessorListData(){
	const header = $("meta[name='_csrf_header']").attr('content');
	const token = $("meta[name='_csrf']").attr('content');
	
	const professorList = $("#professorList");
	
	$.ajax({
		url : "/Mprofessor/getProfessorList",
		type : "post",
		beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
		},
		success : function(res){
			console.log("교수 리스트 : ", res);
			$(professorList).html(drawTable(res));
		},
		dataType : "json"
	})
}
	
function drawTable(res){
	let tableElement = ``;
	
	for(let i=0;i<res.length;i++){
		tableElement += `<tr style="text-align: center;">
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; width:70px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${i+1}</td>
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].MEM_NO}</td>
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].MEM_NAME}</td>
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].COL_NAME}</td>
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${res[i].DEP_NAME}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].DEP_NAME}</td>`;
// 		tableElement += `<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">\${res[i].MEM_TEL}</td>`;							
 							
		tableElement +=	`<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${res[i].POSITION}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].POSITION}</td>`;
						
			  let formatDate = new Date(res[i].JOIN_DATE);
			  let dateFormat1 = formatDate.getFullYear() +'-' + ( (formatDate.getMonth()+1) < 9 ? "0" + (formatDate.getMonth()+1) : (formatDate.getMonth()+1) )+
								'-' + ( (formatDate.getDate()) <= 9 ? "0" + (formatDate.getDate()) : (formatDate.getDate()) );
			
// 	  	tableElement +=	   ` <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${dateFormat1}">&nbsp;&nbsp;&nbsp;&nbsp;\${dateFormat1}</td>`;
	  	
	  					if(res[i].LEAVE_DATE == null){
// 	  						tableElement += `<td>-</td>`;
	  					}else{
	  						 let formatDate2 = new Date(res[i].LEAVE_DATE);
	  						 let dateFormat2 = formatDate2.getFullYear() +'-' + ( (formatDate2.getMonth()+1) < 9 ? "0" + (formatDate2.getMonth()+1) : (formatDate2.getMonth()+1) )+
	  											'-' + ( (formatDate2.getDate()) <= 9 ? "0" + (formatDate2.getDate()) : (formatDate2.getDate()) );
// 	  						tableElement += `<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="\${dateFormat2}">&nbsp;&nbsp;&nbsp;&nbsp;\${dateFormat2}</td>`;					
	  					}
	  					
	  	
// 	  	tableElement += `<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${res[i].ROOMNUM}</td>`;
		tableElement +=	`
						 <td><span id="\${res[i].MEM_NO}" name="spanBtn" class="label label-pill label-dark" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; cursor: pointer; "onclick="detail(\${res[i].MEM_NO},this)" >보기</span></td>
						`;
							
							
		tableElement +=	`</tr>`;
	}
	return tableElement;
}

function detail(memNo,e){
	
	let clickBg = document.querySelector(".clickBg");
	if(clickBg){
		clickBg.classList.remove("clickBg");
	}
	e.parentElement.parentElement.classList.add("clickBg");
	
	console.log("디테일 mem_no값 : ", memNo);
	
	const header = $("meta[name='_csrf_header']").attr('content');
	const token = $("meta[name='_csrf']").attr('content');
	
	const objmem_no = $("#mem_no");
	const objmem_name = $("#mem_name");
	const objcol_name = $("#col_name");
	const objdep_name = $("#dep_name");
	const objmem_tel = $("#mem_tel");
	const objposition = $("#position");
	const objjoin_date = $("#join_date");
	const objleave_date = $("#leave_date");
	const objroomnum = $("#roomnum");
	
	let mem_no = memNo; 

	$.ajax({
		url : "/Mprofessor/getProfessorDetail",
		type : "post",
		data : {"mem_no" : mem_no},
		beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
		},
		success : function(res){
			console.log("교수 디테일 : ", res);
			
			$(objmem_no).val(res.MEM_NO);
			$(objmem_name).val(res.MEM_NAME);
			$(objcol_name).val(res.COL_NAME);
			$(objdep_name).val(res.DEP_NAME);
			$(objmem_tel).val(res.MEM_TEL);
			$(objposition).val(res.POSITION);
			
			let today = new Date(res.JOIN_DATE);
			let dateFormat2 = today.getFullYear() +'-' + ( (today.getMonth()+1) <= 9 ? "0" + (today.getMonth()+1) : (today.getMonth()+1) )+
								'-' + ( (today.getDate()) <= 9 ? "0" + (today.getDate()) : (today.getDate()) );
			 
			$(objjoin_date).val(dateFormat2);
			
			if(res.LEAVE_DATE == null){
				$(objleave_date).val("-");
			}else{
				let today2 = new Date(res.LEAVE_DATE);
				let dateFormat3 = today2.getFullYear() +'-' + ( (today2.getMonth()+1) <= 9 ? "0" + (today2.getMonth()+1) : (today2.getMonth()+1) )+
									'-' + ( (today2.getDate()) <= 9 ? "0" + (today2.getDate()) : (today2.getDate()) );
				$(objleave_date).val(dateFormat3);
			}
			
			$(objroomnum).val(res.ROOMNUM);
		},
		dataType : "json"
	})

}

function positionChange(){
	const header = $("meta[name='_csrf_header']").attr('content');
	const token = $("meta[name='_csrf']").attr('content');
	
	const professorList = $("#professorList");
	const objfrm = $("#updateForm");
	let objmem_no = $(objfrm).find("#mem_no").val();
// 	alert(objmem_no);
	let objposition = $(objfrm).find("#newPosition").val();
// 	alert(objposition);
	
	  swal("직책을 변경하시겠습니까?",{
            buttons:{
               select:"확인",
               cancel:"취소"
            }
         }).then((value)=>{
            console.log(value)
            
            switch(value){
            case "select":
            	$.ajax({
        			url : "/Mprofessor/positionChange",
        			type : "post",
        			data : {"objmem_no" : objmem_no, "objposition" : objposition},
        			beforeSend : function(xhr){
        		        xhr.setRequestHeader(header, token);
        			},
        			success : function(res){
        				console.log("직책변경 값 : ",res);
        				if(res != "NG"){
//         					alert("직책이 성공적으로 변경되었습니다");
        					
        					swal({
        						  title: "직책이 성공적으로 변경되었습니다",   //큰 글씨
        						  icon: "success",   //info, success등 종류
        						});
        					
        					getProfessorListData();
        					detail(objmem_no);
        					
        				}
        				
        			},
        			dataType : "text"
        		})
               break;
            default:
               break;
            }
         })
	
// 	if(confirm("직책을 변경하시겠습니까?")){
		
// 	}
	
}

function searchProfessor(){
	const header = $("meta[name='_csrf_header']").attr('content');
	const token = $("meta[name='_csrf']").attr('content');
	
	let professorDepartment = $("#professorDepartment").val();
	let professorPosition = $("#professorPosition").val();
	let professorName = $("#professorName").val();
	
	const professorList = $("#professorList");
	
	$.ajax({
		url : "/Mprofessor/getProfessorList",
		type : "post",
		data : {"professorDepartment" : professorDepartment, "professorPosition" : professorPosition,
			"professorName" : professorName},
		beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
		},
		success : function(res){
			$(professorList).html(drawTable(res));
		},
		dataType : "json"
	})
	
}

</script>
</html>