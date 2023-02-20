<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
#fileDragArea:active {
	background: #eee;
}

.mainSlide img{
	width: 100px;
	height: 100px;
	object-fit: cover;
}

#cmntListDiv{
	margin-bottom: 400px;
}
</style>

<div class="row custom-pr100">
	<div class="col-lg-6">
		<h4 class="card-title custom-s mt-3 custom-bold">
			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;커뮤니티<br/>
		</h4>	
	</div>
	<div class="col-lg-6">	
		<div class="row page-titles" style="background: none !important;">
			<div class="col p-md-0">
				<ol class="breadcrumb custom-bold">
					<li class="breadcrumb-item"><a href="/main/home"><i class="fa-solid fa-house"></i></a></li>
					<li class="breadcrumb-item active"><a href="/community">커뮤니티</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>

			<!--커뮤니티 등록 모달 시작-->		
			<div class="bootstrap-modal">
				<!-- Button trigger modal -->
				<!--
				<button type="button" class="btn mb-1 btn-info" data-toggle="modal"
					data-target="#basicModal">글쓰기</button>
				-->
				<div class="modal fade" id="basicModal" style="display: none;" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">새로운 게시글 작성하기</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>×</span>
								</button>
							</div>
							<div class="form-validation">
								<form class="form-valide" action="#" method="post"
									id="cmntRegisterForm" novalidate="novalidate">
									<div class="modal-body">
										<input type="hidden" name="smem_no" id="smem_no"
											value="${smem_no }">
										<div class="form-group row">
											<div class="col-lg-12" style="display: flex;">
												<select class="form-control" id="cmnt_category"
													name="cmnt_category" required>
													<option value="일반" disabled="disabled" selected="selected">말머리
														선택</option>
													<option value="토론">토론</option>
													<option value="정보">정보</option>
													<option value="마켓">마켓</option>
													<option value="잡담">잡담</option>
													<option value="기타">기타</option>
												</select>
												<select class="form-control" id="cmnt_feeling"
													name="cmnt_feeling" required="required">
													<option value="" disabled="disabled" selected="selected">느낌
														선택</option>
													<option value="기쁨">기쁨</option>
													<option value="분노">분노</option>
													<option value="슬픔">슬픔</option>
													<option value="즐거움">즐거움</option>
													<option value="사랑">사랑</option>
													<option value="희망">희망</option>
												</select>
											</div>
										</div>
			
										<div class="form-group">
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input type="checkbox"
													class="form-check-input" value="1" name="cmnt_anony"
													id="cmnt_anony"> <font
													style="vertical-align: inherit;"> <font
														style="vertical-align: inherit;">익명으로 작성</font>
												</font>
												</label>
											</div>
										</div>
			
										<div class="form-group">
											<input type="text" class="form-control input-default"
												placeholder="제목을 입력하세요" name="cmnt_title" id="cmnt_title"
												style="border-left: none; border-right: none; border-top: none;"
												required="required">
										</div>
			
										<div class="form-group">
											<textarea class="form-control h-150px" rows="6" name="cmnt_content" id="cmnt_content" style="height: 114px;"placeholder="내용을 입력하세요" required="required"></textarea>
										</div>
			
										<div class="form-group">
											<input type="file" id="cmntFiles" name="cmntFiles"
												multiple="multiple" accept=".jpg,.gif,.png" class="form-control-file">
											<code>*이미지 파일만 가능</code>
										</div>
			
										<div class="alert alert-info" id="fileDragArea"
											style="height: 100px; text-align: center; align-items: center;">
											<font style="vertical-align: inherit;">사진 파일을 이곳으로 끌어오세요</font>
										</div>
										<div id="fileShowArea"
											style="display: grid; grid-template-columns: repeat(3, 1fr); overflow: scroll; overflow-x: hidden; overflow-y: hidden;"></div>
										<div class="alert alert-danger" style="display: none;" id="successMessage">등록에 성공하였습니다. 2초 뒤에 창이 닫힙니다.</div>
										<div class="alert alert-dark" style="display: none;" id="failMessage">등록에 실패했습니다. 추후에 다시 시도해주십시오. 2초 뒤에 창이 닫힙니다.</div>
									</div>
									<div class="modal-footer">
										<div class="form-group row">
											<div class="col-lg-12 ml-auto"
												style="display: flex; justify-content: space-between;">
												<button type="button" class="btn mb-1 btn-outline-danger"
													data-dismiss="modal">취소</button>
												<button type="submit" class="btn mb-1 btn-primary custom-btn-s">등록</button>
												<button type="button" onclick="autoValue()" class="btn mb-1 btn-outline-dark">자동완성</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 커뮤니티 등록모달 폼 종료 -->	

<%@ include file="communityHeader.jsp" %>

<div class="row custom-pr100" style="display: flex; justify-content: flex-end;">
	<div class="col-lg-5">
		<form id="cmntSearchForm" style="display: flex; justify-content: space-between;">
			<div style="width: 20%;">
				<select class="form-control" name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="total">제목+내용</option>
				</select>
			</div>
			<div style="width: 80%;">
				<div class="input-group icons">
					<input type="search" class="form-control-sm input-default" style="border: none; width: 80%;"
						placeholder="검색어를 입력하세요" aria-label="Search Dashboard" name="keyword">
					<div class="input-group-prepend" style="cursor: pointer;">
						<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
							id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="col-lg-1">
		<button type="button" class="btn btn-primary custom-btn-s" data-toggle="modal" data-target="#basicModal">글쓰기</button>
	</div>
</div>

<hr/>

<div class="row custom-pr100" id="cmntListDiv">
 <!--
	<div class="col-md-6 col-lg-3">
		<div class="card">
			<div class="card-header bg-white">
				<h5 class="card-title">카드 제목</h5>
				<h6 class="card-subtitle mb-2 text-muted">
					<i class="fa-regular fa-heart"></i> 0 <i
						class="fa-regular fa-comment"></i> 0
				</h6>
			</div>
			<img class="img-fluid"
				src="${pageContext.request.contextPath }/resources/images/망그곰1.png"
				alt="">
			<div class="card-body">
				<p class="card-text">카드 내용</p>
			</div>
			<div class="card-footer">
				<p class="card-text d-inline">
					<small class="text-muted">1분 전</small>
				</p>
				<a href="#" class="card-link float-right"><small>상세 보기</small></a>
			</div>
		</div>
	</div>
	-->
</div>


<script type="text/javascript">

// 자동 값 채우기
function autoValue(){
	document.querySelector("#cmnt_category").value = "정보";
	document.querySelector("#cmnt_feeling").value = "기쁨";
	document.querySelector("#cmnt_anony").checked = true;
	document.querySelector("#cmnt_title").value = "새로운 게시글 제목을 등록합니다.";
	// document.querySelector("#cmnt_content").value = "새로운 게시글 내용을 등록합니다.";
	summernote.summernote('editor.insertText', '새로운 게시글 내용을 등록합니다.');
}

//아작스 통신을 위한 csrf 인증 토큰
let header = '${_csrf.headerName}';
let token = '${_csrf.token}';


// 무한스크롤을 통해 리스트를 불러올 div
const cmntListDiv = document.querySelector("#cmntListDiv");
let firstAction = 1;

let start = 0;
let end = 0;

//스크롤 항상 위에 올려 놓기
window.onload = () =>{
	if(firstAction == 1){
		getCmntTotalList(1, 8);
		firstAction = firstAction + 1;
	}
	
	setTimeout(()=>{
   		 window.scrollTo(0,0);
 	}, 30);
	
	$.noConflict();
	
    // ▶▶▶▶▶▶▶▶▶▶▶▶▶슬릭 슬라이더
	$('.mainSlide').slick({
		  infinite: true, // 무한 여부
		  slidesToShow: 3, // 보여질 슬라이드의 개수
		  slidesToScroll: 3, // 스크롤할 슬라이드의 개수
		  prevArrow : $('.prevArrow'), 
		  nextArrow : $('.nextArrow'),
 		  autoplay: true,
		  autoplaySpeed: 2000
	});
} 

// let sF = true;
//무한 스크롤
/*
function scrollingCmnt(){
	let scrollTop = document.documentElement.scrollTop; // 내가 지나친 높이
	let clientHeight = document.documentElement.clientHeight; // 내가 보는 높이
	let scrollHeight = document.documentElement.scrollHeight; // 문서 전체 높이

	let tuning = 300;
	
	console.log("check1:",cmntListDiv.style.height)
	console.log("check2:",cmntListDiv.children[0].getClientRects());
	console.log("check3:",cmntListDiv.children[0].getBoundingClientRect());

	console.log("scrollTop=",scrollTop);
	console.log("clientHeight=",clientHeight);
	console.log("scrollHeight=",scrollHeight);

	let imsiHeight = 800;
	if((scrollTop + clientHeight) >= (scrollHeight-tuning)){
		if(cmntListDiv.children != null){  // 앞으로 필요할 지 모름
			imsiHeight = cmntListDiv.children[0].getBoundingClientRect().height + 110;
			//alert(imsiHeight);
		}
		
	    if(!cmntListDiv.style.height){
	    	cmntListDiv.style.height = "800px";
	    }
		cmntListDiv.style.height = parseInt(cmntListDiv.style.height) + imsiHeight + "px"; // 반칙사기: 렌더링시간  
		if (sF){	
			sF = false;
			getCmntTotalList(start, end);  // 문자열더하기시간+ innerHTML 하면 화면 렌더링 시간이 길어지면, 튜닝포인트 if문이 여러번 만족 -> 곧 아작스 여러번 호출 ㅠㅠ
		}
		console.log("===================");
	}
}
*/

let sF = true;
window.addEventListener("scroll", scrollingCmnt);

function scrollingCmnt(){
	// 실제 보고 있는 높이인 innerHeight, 스크롤의 세로이동 범위를 나타내는 scrollY, 요소의 실제 높이인 offsetHeight
	if((window.innerHeight + window.scrollY) >= (document.body.offsetHeight)){
		sF = false;
		getCmntTotalList(start, end);
	}
}


function getCmntTotalList(startNum, endNum){
	let url = "/community/getCmntTotalList/" + startNum + "/" + endNum;
	let xhr = new XMLHttpRequest();
	xhr.open("get", url, true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = JSON.parse(xhr.responseText);
			console.log(data);
			if(data.cmntList.length < 8){
				let str = template_getCmntTotalList(data);	
				str += "<div class='col-lg-12 custom-bold custom-s' style='text-align: center; font-size: 2em;'>더이상 조회할 데이터가 없습니다.</div>";
				cmntListDiv.style.height = parseInt(cmntListDiv.style.height.replace("px", "")) + 1000 + "px";
				cmntListDiv.innerHTML += str;
				window.removeEventListener('scroll', scrollingCmnt);
			}else if(data.cmntList.length == 0){
				let str = "<div class='col-lg-12 custom-bold custom-s' style='text-align: center; font-size: 2em;'>더이상 조회할 데이터가 없습니다.</div>";
				cmntListDiv.style.height = parseInt(cmntListDiv.style.height.replace("px", "")) + 200 + "px";
				cmntListDiv.innerHTML += str;
				window.removeEventListener('scroll', scrollingCmnt);
			}else{
				start = parseInt(startNum) + 8;
				end = parseInt(endNum) + 8;
				let str = template_getCmntTotalList(data);	
				cmntListDiv.innerHTML += str;
			}	
			
			setTimeout(() => {
				sF = true;	
			}, 1000);
			
		}
	};
	xhr.send();
}

function template_getCmntTotalList(data){

	let cmntList = data.cmntList;
	let cmntFileList = data.cmntFileList;
	console.log("cmntList");
	console.log(cmntList);
	console.log("cmntFileList");
	console.log(cmntFileList);
	
	let str ="";
	
	for(let i = 0; i < cmntList.length; i++){	
		let smem_no = cmntList[i].smem_no;
		let cmnt_anony = cmntList[i].cmnt_anony;
		if(cmnt_anony > 0){
			smem_no = "익명의 한국대생";
		}
		let cmnt_report = cmntList[i].cmnt_report;
		
		str += "<div class='col-md-3 col-lg-3'>";
		str +=	"<div class='card'>";
	  	str +=			"<div class='card-header bg-white'>";
	  	str +=          "<span class='badge badge-dark'>" + cmntList[i].cmnt_category + "</span>";
	  	str +=          "<span class='badge badge-light'>" + cmntList[i].cmnt_feeling + "</span>&nbsp;";
	  	
	  	if(cmnt_report == "DISPOSED"){
			str +=			"<h5 class='card-title' style='display:inline-block;'>게시 중단</h5>";
			str +=			"<h6 class='card-subtitle mb-2 text-muted'>게시 중단&nbsp;&nbsp;";
			str +=				"<i class='fa-regular fa-heart'></i>&nbsp;0&nbsp;";
			str +=				"<i class='fa-regular fa-comment'></i>&nbsp;0&nbsp;";
			str +=				"<i class='fa-regular fa-eye'></i> &nbsp;0&nbsp;";
			str +=			"</h6>";	  		
	  	}else{
			str +=			"<h5 class='card-title' style='display:inline-block;'>"+ cmntList[i].cmnt_title +"</h5>";
			str +=			"<h6 class='card-subtitle mb-2 text-muted'>";
			str +=              smem_no + "&nbsp;&nbsp;";
			str +=				"<i class='fa-regular fa-heart'></i>&nbsp;" + cmntList[i].cmnt_like + "&nbsp;";
			str +=				"<i class='fa-regular fa-comment'></i>&nbsp;" + cmntList[i].reply_count + "&nbsp;";
			str +=				"<i class='fa-regular fa-eye'></i> &nbsp;" + cmntList[i].cmnt_count + "&nbsp;";
			str +=			"</h6>";	  		  		
	  	}
		str +=		"</div>";
		
	
		let imgStr = "";
		for(let j = 0; j < cmntFileList.length; j++){
			if(!cmntFileList[j]){
				continue;
			}else if(cmntList[i].cmnt_no == cmntFileList[j].cmnt_no){
				imgStr +=		"<img class='img-fluid' style='object-fit: cover; height : 350px;'";
				imgStr +=			"src='${pageContext.request.contextPath }" + cmntFileList[j].file_path + "' ";
				imgStr +=			"alt='" + cmntFileList[j].file_originnm + "' width='100%' height='100%'>";
				break;
			}
		}
		
		if(imgStr == ""){				
			imgStr +=		"<img class='img-fluid' style='object-fit: cover; height : 350px; min-height: 350px;'";
			imgStr +=			"src='${pageContext.request.contextPath }/resources/images/community/community_default.jpg'";
			imgStr +=			"alt='한국대생의커뮤니티'>";	
		}
		
	  	if(cmnt_report == "DISPOSED"){
			imgStr = "<img class='img-fluid' style='object-fit: cover; height : 350px;' src='https://via.placeholder.com/1000x1000.png?text=Stop%20Publishing'/>";
			str += imgStr;
			
			str +=		"<div class='card-body'>";
			str +=			"<p class='card-text'>게시 중단</p>";
			str +=		"</div>";
			str +=		"<div class='card-footer'>";
			str +=			"<p class='card-text d-inline'>";
			
			let date = cmntList[i].cmnt_date;
			date = formatTime(date);
			
			str +=				"<small class='text-muted'>"+ date +"</small>";
			str +=			"</p>";
			str +=			"<a href='#' class='card-link float-right'><small>조회 불가</small></a>";
			str +=		"</div>";
			str +=	"</div>";
			str += "</div>";
		}else{			
			str += imgStr;
					
			let cmnt_content = cmntList[i].cmnt_content;
			cmnt_content = cmnt_content.replace(/<\/?("[^"]*"|'[^']*'|[^>])*(>|$)/gi, "");
			if(cmnt_content == null){
				cmnt_content = "";
			}
			if(cmnt_content != null || cmnt_content.length > 20){				
				cmnt_content = cmnt_content.substring(0, 20) + "...";
			}
			
			str +=		"<div class='card-body'>";
			str +=			"<p class='card-text'>"+ cmnt_content +"</p>";
			str +=		"</div>";
			str +=		"<div class='card-footer'>";
			str +=			"<p class='card-text d-inline'>";
			
			let date = cmntList[i].cmnt_date;
			date = formatTime(date);
			
			str +=				"<small class='text-muted'>"+ date +"</small>";
			str +=			"</p>";
			str +=			"<a href='${pageContext.request.contextPath}/community/detail/" + cmntList[i].cmnt_no + "' class='card-link float-right'><small>상세 보기</small></a>";
			str +=		"</div>";
			str +=	"</div>";
			str += "</div>";
		}
			
	};
		
	 return str;


	//alert(cmntListDiv.children.length);
//	let ggg = Math.ceil(cmntListDiv.children.length / 4)+2;
//	alert(ggg);
//	cmntListDiv.style.height = (ggg*cmntListDiv.children[0].getBoundingClientRect().height) + "px";

}

// window의 dragover, drop 시의 빌트인 기능을 막음
const builtInBlock = () => { event.preventDefault(); }
window.addEventListener("dragover", builtInBlock);
window.addEventListener("drop", builtInBlock);

// 파일을 드래그할 div, 드래그한 파일을 보여줄 div
const fileDragArea = document.querySelector("#fileDragArea");
const fileShowArea = document.querySelector("#fileShowArea");
// 파일
const cmntFiles = document.querySelector("#cmntFiles");

// 파일을 모으는 배열
const cmntFileArray = [];

// 커뮤니티 새글 등록 폼
const cmntRegisterForm = document.querySelector("#cmntRegisterForm");

// 등록 성공 메시지
const successMessage =  document.querySelector("#successMessage");
const failMessage =  document.querySelector("#failMessage");

// 새글 등록
cmntRegisterForm.addEventListener("submit", function(event){
	event.preventDefault();
	let files = cmntFiles.files;
	console.log(files);
	
	var formData = new FormData(cmntRegisterForm);
	
	if(files.length > 0){
		for(let i = 0; i < files.length; i++){
			formData.append("files", files[i]); // 같은 이름으로 append하면 배열이 된다.
		};		
	}
	
	console.log("cmntFileArray 출력");
	if(cmntFileArray.length > 0){
		for(let i = 0; i < cmntFileArray.length; i++){
			formData.append("files", cmntFileArray[i]); // 같은 이름으로 append하면 배열이 된다.
		};		
	}
	

	let xhr = new XMLHttpRequest();
	xhr.open("post", "/community/register", true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			let check = xhr.responseText;
			if(check == 0){				
				failMessage.style.display = "block";
				successMessage.style.display = "none";
			}else if(check == 1){
				successMessage.style.display = "block";
				failMessage.style.display = "none";
				
			setTimeout(function() {
				// document.querySelector(".close").click();
				location.href = "/community";
			}, 2000);
			

			}
			
			
		}
	}
	xhr.send(formData);
})

// fileDragArea에 dragover 시 빌트인 기능을 막음
fileDragArea.addEventListener("dragover", ()=>{
  event.preventDefault();
});

// 파일 추가 혹은 파일 드래그시 그 겉을 둘러싸는 박스를 만드는 함수
function dramImgBox(){
	let iDiv = document.createElement("div");
	iDiv.setAttribute("class", "alert alert-primary alert-dismissible fade show");
	iDiv.setAttribute("style", "display:inline-block;");

	let iBtn = document.createElement("button");
	iBtn.setAttribute("type", "button");
	iBtn.setAttribute("class", "class");
	iBtn.setAttribute("class", "close");
	iBtn.setAttribute("data-dismiss", "alert");
	iBtn.setAttribute("aria-label", "close");

	let iSpan = document.createElement("span");
	iSpan.textContent = "x";
	iSpan.setAttribute("class", "closeSpan");
	
	iBtn.appendChild(iSpan);
	iDiv.appendChild(iBtn);
	fileShowArea.appendChild(iDiv);
	return iDiv;
}

// 파일 드래그 칸에 drop 시 이미지와 이미지정보를 화면에 출력
fileDragArea.addEventListener("drop", ()=>{
  event.preventDefault();
  let dragFiles = event.dataTransfer.files;
  console.log(dragFiles);
  for(let i = 0; i < dragFiles.length; i++){
    let fileReader = new FileReader();
    fileReader.readAsDataURL(dragFiles[i]); // 바이너리 파일을 읽어들임
    fileReader.onload = () =>{
    
		let iDiv = dramImgBox();
		
		let myImg = document.createElement("img");
		myImg.src = fileReader.result;
		console.log(fileReader.result);
		myImg.width = 80;
		myImg.height = 80;
 		iDiv.appendChild(myImg);
		
		let uuid = self.crypto.randomUUID();

		let myImgInfo = document.createElement("p");
		myImgInfo.textContent = dragFiles[i].name;
		myImgInfo.value = uuid + dragFiles[i].name;
		iDiv.appendChild(myImgInfo);
 		
		console.log(decodeURI(fileReader.result));
		console.log(dragFiles[i].name);
		console.log(dragFiles[i].size);
		console.log(dragFiles[i].type);

		cmntFileArray.push(base64toFile(fileReader.result, dragFiles[i].name));
    }
  }
});

// 파일 타입에서 파일을 추가할 경우 이미지와 이미지정보를 화면에 출력
cmntFiles.addEventListener("change", function(){
	console.log(cmntFiles.files);
	
	for(let i = 0; i < cmntFiles.files.length; i++){
		let fileReader = new FileReader();
		fileReader.readAsDataURL(cmntFiles.files[i]);
		fileReader.onload = () =>{

			let iDiv = dramImgBox();
			let myImg = document.createElement("img");
			myImg.src = fileReader.result;
			console.log(fileReader.result);
			myImg.width = 80;
			myImg.height = 80;
			iDiv.appendChild(myImg);

			let uuid = self.crypto.randomUUID();			
			
			let myImgInfo = document.createElement("p");
			myImgInfo.textContent = cmntFiles.files[i].name;
			myImgInfo.value = uuid + cmntFiles.files[i].name;
			iDiv.appendChild(myImgInfo);
			
		}
	}
})

// base64를 파일데이터로 변환
function base64toFile(base64_data, fileName) {
	let arr = base64_data.split(','),
	mime = arr[0].match(/:(.*?);/)[1],
	bstr = atob(arr[1]),
	n = bstr.length,
	u8arr = new Uint8Array(n);

	while(n--){
			u8arr[n] = bstr.charCodeAt(n);
	}
	return new File([u8arr], fileName, {type:mime});
}	

// 오라클 시간 데이터를 넘기면 '~분 전/ ~시간 전'과 같은 형태로 바꿔주는 함수
function formatTime(oracleDate){
	
	let writeDate = oracleDate;
	writeDate =  writeDate.replaceAll("-","").replaceAll(":", "").replaceAll(".","").replaceAll(" ","");
	let wYear = writeDate.substr(0,4);
	let wMonth = writeDate.substr(4,2);
	let wDay = writeDate.substr(6,2);
	let wHours = writeDate.substr(8,2);
	let wMinutes = writeDate.substr(10,2);
	
	let nowDate = new Date(); 
	let nYear = nowDate.getFullYear();
	let nMonth = nowDate.getMonth()+1;                            
	let nDay = nowDate.getDate();        
	let nHours = nowDate.getHours();     
	let nMinutes = nowDate.getMinutes(); 
	
	let write = new Date(wYear, wMonth, wDay, wHours, wMinutes);
	let now = new Date(nYear, nMonth, nDay, nHours, nMinutes);

    const betweenTime = Math.floor((now.getTime() - write.getTime()) / 1000 / 60);
    
    if (betweenTime < 1) return "방금 전";
    if (betweenTime < 60) {
      return `\${betweenTime}분전`;
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
      return `\${betweenTimeHour}시간 전`;
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) {
      return `\${betweenTimeDay}일 전`;
    }

    return `\${Math.floor(betweenTimeDay / 365)}년 전`;
}

//---------------------------------------------------------------------------------파일 searchForm

const cmntSearchForm = document.querySelector("#cmntSearchForm");

cmntSearchForm.addEventListener("submit", function(){
    event.preventDefault();
    searchCmnt();
})

cmntSearchForm.children[1].children[0].children[1].addEventListener("click", function(){
    searchCmnt();
})

function searchCmnt(){
	let searchType = cmntSearchForm.searchType.value;
	let keyword = cmntSearchForm.keyword.value;
	
	let map = {
			searchType : searchType,
			keyword : keyword
	};

	let xhr = new XMLHttpRequest();
	xhr.open("post", "community/search", true);
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("잘 왔어요");
			console.log(xhr.responseText);
			let data = JSON.parse(xhr.responseText);
			let str = template_getCmntTotalList(data);
			cmntListDiv.innerHTML = str;
		}
	}
	xhr.send(JSON.stringify(map));
}

//--------------------------------------------------------------- 썸머노트

let summernote;	

summernote = $("#cmnt_content");

$("#cmnt_content").summernote({
		    height: 130,        // 에디터 높이
		    minHeight: 130,    // 최소 높이
		    maxHeight: 150,    // 최대 높이(null 제한없음)
		    focus: false,        // 에디터 로딩후 포커스를 맞출지 여부
		    lang: "ko-KR",      // 한글 설정
		    toolbar: [
		                ['fontname', ['fontname']],     // 글꼴 설정
		                ['fontsize', ['fontsize']],    // 글자 크기 설정
		                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		                ['color', ['forecolor','color']],    // 글자색
		                ['table', ['table']],    // 표만들기
		                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
		                ['height', ['height']],    // 줄간격
		                ['insert',['picture','link','video']],    // 그림첨부, 링크만들기, 동영상첨부
		                ['view', ['fullscreen', 'codeview', 'help']]    // 코드보기, 확대해서보기, 도움말
		    ],
		    placeholder : "내용을 입력해주십시오. 이미지를 드래그하여 첨부할 수도 있습니다.",
		      // 추가한 글꼴
		    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		     // 추가한 폰트사이즈
		    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	
</script>