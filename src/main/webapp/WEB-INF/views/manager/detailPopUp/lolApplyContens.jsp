<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>	
<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/common/common.min.js"></script>

<style>
input{
	border : none;
	box-sizing : border-box;
	width : 100%;
}
</style>


<div class="container-fluid">
<div class="row justify-content-center">
	<div class="col-lg-11">
   <div class="card">
      <div class="card-body">
         <h4 class="card-title col-12 text-center">
            <span>개설신청내용</span>         
         </h4>
         <hr>
         <span>교과목 정보</span>
         <div class="table-responsive">
         <table border="1" style="width: 100%" class="table text-center">
            <tbody>
               <tr>
                  <td>교과목명</td>
                  <td><input type="text" class="inputSize" readonly
                     value="${dataMap['LOL_NAME']}"></td>
                  <td>개설학과</td>
                  <td><input type="text" class="inputSize" readonly value="${dataMap['DEP_NAME']}"></td>
               </tr>
               <tr>
                  <td>과목번호</td>
                  <td><input type="text" class="inputSize" readonly
                     value="${dataMap['LOL_CODE']}"></td>
                  <td>학점</td>
                  <td><input type="text" class="inputSize" readonly value="${dataMap['LOL_CREDIT']}학점"></td>
               </tr>
               <tr>
                  <td>시작학기</td>
                  <td><input type="text" class="inputSize" readonly value="${dataMap['LOL_SEMESTER']}학기"></td>
                  <td>평점</td>
                  <td><input type="text" class="inputSize" readonly
                     <c:choose>
					         <c:when test = "${dataMap['LP_SCORE'] eq  0} ">value=""</c:when>
					         <c:otherwise>
					            value="${dataMap['LP_SCORE']}"
					         </c:otherwise>
				      	</c:choose> >
				   </td>
               </tr>
               <tr>
                  <td>담당교수</td>
                  <td><input type="text" class="inputSize" readonly value="${dataMap['MEM_NAME']}"></td>
                  <td>연구실번호</td>
                  <td><input type="text" class="inputSize" readonly
                     value="${dataMap['ROOMNUM']}호"></td>
               </tr>
               <tr>
                  <td>담당교수 e-mail</td>
                  <td><input type="text" class="inputSize" readonly
                     value="${dataMap['MEM_EMAIL']}"></td>
                  <td>학과전화</td>
                  <td><input type="text" class="inputSize" readonly
                     value="${dataMap['DEP_TEL']}"></td>
               </tr>
            </tbody>
         </table>

         <span>교과목 개요</span>
         <table border="1" style="width: 100%" class="table">
            <tr>
               <td colspan='4'>1. 수업개요</td>
            </tr>
            <tr>
               <td colspan='4'>${dataMap['LP_CONTENT']}</td>
            </tr>
            <tr>
               <td colspan='4'>2. 평가방법</td>
            </tr>
            <tr>
               <td>중간</td>
               <td>기말</td>
               <td>과제</td>
               <td>출결</td>
            </tr>
            <tr>
               <td>${(dataMap.LP_TEST_REF)/2 }%</td>
               <td>${(dataMap.LP_TEST_REF)/2 }%</td>
               <td>${dataMap.LP_TASK_REF }%</td>
               <td>${dataMap.LP_ATTEND_REF }%</td>
            </tr>
         </table>

         <span>교재 및 참고문헌</span>
         <table border="1" style="width: 100%" class="table">
            <tr>
               <td>${dataMap.LP_BOOK }</td>
            </tr>
         </table>

         <span>주차별 강의 계획</span>
         <table border="1" style="width: 100%" class="table">

            <tr>
               <th>주차</th>
               <th width="75%">내용</th>
            </tr>
            <tr>
               <td>1</td>
               <td>${dataMap.LP_WEEK1 }</td>
            </tr>
            <tr>
               <td>2</td>
               <td>${dataMap.LP_WEEK2 }</td>
            </tr>
            <tr>
               <td>3</td>
               <td>${dataMap.LP_WEEK3 }</td>
            </tr>
            <tr>
               <td>4</td>
               <td>${dataMap.LP_WEEK4 }</td>
            </tr>
            <tr>
               <td>5</td>
               <td>${dataMap.LP_WEEK5 }</td>
            </tr>
            <tr>
               <td>6</td>
               <td>${dataMap.LP_WEEK6 }</td>
            </tr>
            <tr>
               <td>7</td>
               <td>${dataMap.LP_WEEK7 }</td>
            </tr>
            <tr>
               <td>8</td>
               <td>${dataMap.LP_WEEK8 }</td>
            </tr>
            <tr>
               <td>9</td>
               <td>${dataMap.LP_WEEK9 }</td>
            </tr>
            <tr>
               <td>10</td>
               <td>${dataMap.LP_WEEK10 }</td>
            </tr>
            <tr>
               <td>11</td>
               <td>${dataMap.LP_WEEK11 }</td>
            </tr>
            <tr>
               <td>12</td>
               <td>${dataMap.LP_WEEK12 }</td>
            </tr>
            <tr>
               <td>13</td>
               <td>${dataMap.LP_WEEK13 }</td>
            </tr>
            <tr>
               <td>14</td>
               <td>${dataMap.LP_WEEK14 }</td>
            </tr>
            <tr>
               <td>15</td>
               <td>${dataMap.LP_WEEK15 }</td>
            </tr>
         </table>
	</div>


      </div>
   </div>

</div>

	</div>
</div>
