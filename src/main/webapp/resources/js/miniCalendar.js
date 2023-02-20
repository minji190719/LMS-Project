let MiniCalendar = (function(e){

	


}());


let MiniCalendar = function(el, data){

			"use strict";

    	    function constructor(el, data){
    	        if(typeof(el) != 'object'){
    	            return;
    	        }
    	        this.date = new Date();   // 현재 캘린더 날짜(주단위로 뽑기용)
    	        this.el = el;             // 미니캘린더 element
    	        this.tagDraw(data)
    	        new Promise((resolve, reject)=>{
    	        	this.init(resolve, reject);
    	        }).then((data)=>{
    	        	this.event = data;    // event Data
	    	        this.drawCal_week(this.el,this.date);
    	        })
    	        el.style.fontWeight = "bold";
    	        el.style.color = "black";
    	        
    	        el.querySelector(".prevBtn").addEventListener('click', calendar.prev.bind(calendar));
    			el.querySelector(".nextBtn").addEventListener("click", calendar.next.bind(calendar));
    	        
    	        return this;
    	    }
    	    
    	   function tagDraw(data){
    	    	let text ='';
    	    	text += '<div class="col-2 prevBtn text-center" style="cursor:pointer;height:50px;">';
    	    	text += '&lt;';
    	    	text += '</div>';
    	    	text += '<div class="col-8">';
    	    	text += '<div class="col-12 text-center" style="font-size:40px;">주간일정<img src="/resources/images/icon/일정.png" style="width:50px;height:50px;"></div>';
    	    	text += '    <div class="col-12 text-center mb-3" style="font-size:25px;"><span class="yearField">2023</span>.<span class="monthField">2</span></div>';
    	    	text += '    <div class="col-12">';
    	    	text += '        <div class="row pt-3" style="font-size: 25px;">';
    	    	text += '            <div class="col cal-day">일</div>';
    	    	text += '            <div class="col cal-day">월</div>';
    	    	text += '            <div class="col cal-day">화</div>';
    	    	text += '            <div class="col cal-day">수</div>';
    	    	text += '            <div class="col cal-day">목</div>';
    	    	text += '            <div class="col cal-day">금</div>';
    	    	text += '            <div class="col cal-day">토</div>';
    	    	text += '        </div>';
    	    	text += '        <div class="row weekField pt-3 mb-5" style="font-size: 25px;">';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '            <div class="col cal-date"></div>';
    	    	text += '        </div>';
    	    	text += '        <div class="row">';
    	    	text += '        	<div class="calInfo col"></div>';
    	    	text += '        </div>';
    	    	text += '    </div>';
    	    	text += '</div>';
    	    	text += '<div class="col-2 nextBtn text-center" style="cursor:pointer;height:50px;">';
    	    	text += '    &gt;';
    	    	text += '</div>';
    	    	this.el.innerHTML = text;
    	    }
    	    
    	    function init(resolve, reject){
    			let calJson = {
    					CLDR_CATEGORY:'0',
    					CLDR_START:null
    			}
    			$.ajax({
	  				  url: "/calendar/showList",
	  				  type: "POST",
	  				  data:JSON.stringify(calJson),
	  				  dataType: "JSON",
	  				  contentType:"application/json;charset=utf-8",
	  				  beforeSend : function(xhr){
	  			        xhr.setRequestHeader(header, token);
	  			      },
	  				  success : function(data){
	  					  resolve(data);
	  				  },
	  				  error : function(request,status,error){
	  				  }
  				});
    	       }
    	   function dateFormat(date, state){
    	    	let str='';
    	    	let year='';
    	    	let month='';
    	    	let day='';
    	    	if(state == 0){
	    	    	year = date.getYear() + 1900;
	    	    	month = date.getMonth()+1;
	    	    	day = date.getDate();
	    	    	str = year + "-" + month + "-" + day;
    	    	}else if(state == 1){
    	    		day = date.getDate();
    	    		str = day;
    	    	}
    	    	
    	    	return str;
    	    }
    	    
    	    function toDayDraw(){
    	    	let field = this.el.querySelector(".calInfo");
    			field.innerHTML = "";
    			let text='';
    			let tag='';
    			
    	    	this.event.forEach((value,i)=>{
    	    		let today = this.dateFormat(new Date(this.today));
    	    		
    	    		// 주 시작
    	    		
    	    		// 주 끝
    	    		if(this.start < value.start && this.end > value.start){
    	    			console.log(new Date(value.start).getDay())
    	    			
    	    			tag='<div class="circleDiv"></div>';
    	    			
	    	    		text+='<div class="mb-3" style="font-size:20px;">';
						text+='<span class="text-black">'+this.dateFormat(new Date(value.start),1)+'일. '+value.title+'</span>';
	    	    		text+='</div>';
	    	    		
	    	    		this.el.querySelector(".weekField").children[new Date(value.start).getDay()].innerHTML+=tag;
    	    		}
    	    	})
    	    	field.innerHTML = text;
    	    	console.log("event3333 : ",this.event)
    	    }
    	    
    	   function drawCal_month(){
    	    	console.log("this.date : ", this.date)
    	    }
    	    
    	   function  drawCal_week(el,date){
    	    	this.drawCal_month();
    	        this.day = date.getDay();        // 현재 요일
    	        this.today = new Date(date);     // 오늘 날짜
    	        this.month = date.getMonth()+1;  // 현재 달
    	        this.year = date.getYear()+1900; // 현재 년도

    	        let tmpDate = new Date(date);
    	        this.start = new Date(tmpDate.setDate(tmpDate.getDate()-this.day));
    	        tmpDate = new Date(this.start);
    	        this.end = new Date(tmpDate.setDate(this.start.getDate()+6));

    	        let tmpStart;
    	        let text=''; 
    	        for(let i=0; i<=6; i++){
    	            text='';
    	            let tmpTag = el.querySelector(".weekField").children[i]; // for문 현재 태그
    	            
    	            tmpStart = new Date(this.start);
    	            let nowDate = new Date(tmpStart.setDate(tmpStart.getDate() + i));
    	            let toDayCheck = new Date();
    	            
    	            if(this.dateFormat(nowDate,0) == this.dateFormat(toDayCheck,0)){
    	                text="class='cal-today'";
    	            }
    	            if(nowDate.getMonth() != date.getMonth()){
    	                text = "class = 'fontAnotherMonth'";
    	            }
    	            if(nowDate.getDay() == this.start.getDay()){
    	            	let sun = el.querySelectorAll(".cal-day");
    	            	sun[0].classList.add("cal-sun");
    	            	console.log("tmpTag : ", tmpTag)
    	            	tmpTag.classList.add("cal-sun");
    	            }
    	            
    	            
    	            console.log("i , this.end.getDay(),  nowDate()", i, this.end.getDay(), nowDate.getDay())
    	            
    	            if(nowDate.getDay() == this.end.getDay()){
    	            	let sun = el.querySelectorAll(".cal-day");
    	            	sun[6].classList.add("cal-sat");
    	            	console.log("i : " , i)
    	            	console.log("tmpTag : ", tmpTag)
    	            	tmpTag.classList.add("cal-sat")
    	            }
    	            
    	            tmpTag.innerHTML='<div '+text+'><span>'+nowDate.getDate()+'</span></div>';
    	        }
    	        el.querySelector(".monthField").innerText = this.month;
    	        el.querySelector(".yearField").innerText = this.year;
    	        
    	        this.toDayDraw();

    	        console.log("day : " + this.day)
    	        console.log("today : " + this.today)
    	        console.log("month : " + this.month)
    	        console.log("start : " + this.start)
    	        console.log("end : " + this.end)
    	    }

    	   function  prev(){
    	        this.date = new Date(this.date.setDate(this.date.getDate()-7));
    	        console.log("prev: ", this.date)
    	        this.drawCal_week(this.el, this.date);
    	        console.log("prev")
    	    }
    	    
    	    function next(){
    	        this.date = new Date(this.date.setDate(this.date.getDate()+7));
    	        console.log("next: ", this.date)
    	        this.drawCal_week(this.el, this.date);
    	        console.log("next")
    	    }
    	}


    	
    	