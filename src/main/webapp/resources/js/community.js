// 파일을 드래그할 div, 드래그한 파일을 보여줄 div
const fileDragArea = document.querySelector("#fileDragArea");
const fileShowArea = document.querySelector("#fileShowArea");
// 파일
const cmntFiles = document.querySelector("#cmntFiles");

// 파일을 모으는 배열
const cmntFileArray = [];



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


// 수정폼
cmntUpdateForm.addEventListener("submit", function(event){
	event.preventDefault();
	let files = cmntFiles.files;
	console.log("input type 파일을 통해 들어온 데이터");
	console.log(files);
	
	let formData = new FormData(cmntUpdateForm);
	console.log(formData);
	
	if(files.length > 0){
		for(let i = 0; i < files.length; i++){
			formData.append("files", files[i]); // 같은 이름으로 append하면 배열이 된다.
		};		
	}
	
	console.log("cmntFileArray 출력");
	console.log(cmntFileArray.length);
	if(cmntFileArray.length > 0){
		for(let i = 0; i < cmntFileArray.length; i++){
			formData.append("files", cmntFileArray[i]); // 같은 이름으로 append하면 배열이 된다.
			console.log("드래그 파일을 통해 들어온 데이터");
			console.log(cmntFileArray[i]);
		};		
	}
	

	let xhr = new XMLHttpRequest();
	xhr.open("post", "/community/update", true);
	xhr.setRequestHeader(header, token);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let no = cmnt_no.cmnt_no;
			console.log(cmnt_no.cmnt_no);
			   swal({
				   title: "성공",
				   text: "성공적으로 게시글이 수정되었습니다.",
				   icon: "success",
		           buttons:{
		              select:"확인"
		           }
		        }).then((value)=>{		        
					location.href = "/community/detail/" + no;
		        });
		}
	}
	xhr.send(formData);
})