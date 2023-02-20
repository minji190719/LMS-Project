<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	
<!-- 커스텀 스타일시트 -->
<link
	href="${pageContext.request.contextPath }/resources/bootstrap/css/style.css"
	rel="stylesheet">

<style>
.inputSize {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<div class="container">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title col-12 text-center">
				<span>강의계획서</span>
			
			</h4>
			<hr>
			<span>교과목 정보</span>
			<table border="1" style="width: 100%" class="table text-center">
				<tbody>
					<tr>
						<td>교과목명</td>
						<td><input type="text" class="inputSize" readonly
							value="${dataMap.LOL_NAME }"></td>
						<td>개설학과</td>
						<td><input type="text" class="inputSize" readonly value="컴퓨터공학과"></td>
					</tr>
					<tr>
						<td>과목번호</td>
						<td><input type="text" class="inputSize" readonly
							value="${dataMap.LOL_CODE }"></td>
						<td>학점</td>
						<td><input type="text" class="inputSize" readonly value="${dataMap.LOL_CREDIT }학점"></td>
					</tr>
					<tr>
						<td>시작학기</td>
						<td><input type="text" class="inputSize" readonly value="1학기"></td>
						<td>학점 및 평가</td>
						<td><input type="text" class="inputSize" readonly
							value="2 / GRADE"></td>
					</tr>
					<tr>
						<td>담당교수</td>
						<td><input type="text" class="inputSize" readonly value="${dataMap.MEM_NAME }"></td>
						<td>교수소속</td>
						<td><input type="text" class="inputSize" readonly
							value="공과 컴퓨터융합"></td>
					</tr>
					<tr>
						<td>담당교수 e-mail</td>
						<td><input type="text" class="inputSize" readonly
							value="${dataMap.MEM_EMAIL }"></td>
						<td>학과전화</td>
						<td><input type="text" class="inputSize" readonly
							value="${dataMap.MEM_TEL }"></td>
					</tr>
				</tbody>
			</table>

			<span>교과목 개요</span>
			<table border="1" style="width: 100%" class="table">
				<tr>
					<td colspan='4'>1. 수업개요</td>
				</tr>
				<tr>
					<td colspan='4'>클라우드 환경을 이해하기 위하여 내부 매커니즘과 네트워크, 모델에 대해 학습하고 클라우드 컴퓨팅이 제공하는 서비스와 비즈니스적 경제적 측면에 관해 이해하고, 클라우드 아키텍처를 설계하는 것을 목적으로 한다.</td>
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
					<td>35%</td>
					<td>35%</td>
					<td>20%</td>
					<td>10%</td>
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
					<th>내용</th>
				</tr>
				<tr>
					<td>1</td>
					<td>클라우드 컴퓨팅의 정의</td>
				</tr>
				<tr>
					<td>2</td>
					<td>클라우드 제공 모델</td>
				</tr>
				<tr>
					<td>3</td>
					<td>클라우드 컴퓨팅 배포 모델</td>
				</tr>
				<tr>
					<td>4</td>
					<td>클라우드 핵심기술</td>
				</tr>
				<tr>
					<td>5</td>
					<td>컴퓨팅 서비스</td>
				</tr>
				<tr>
					<td>6</td>
					<td>스토리지 서비스</td>
				</tr>
				<tr>
					<td>7</td>
					<td>RDS</td>
					<td>구분</td>
				</tr>
				<tr>
					<td>8</td>
					<td>중간평가</td>
				</tr>
				<tr>
					<td>9</td>
					<td>NoSQL</td>
				</tr>
				<tr>
					<td>10</td>
					<td>네트워크 인프라 서비스</td>
				</tr>
				<tr>
					<td>11</td>
					<td>네트워크 연결 서비스</td>
				</tr>
				<tr>
					<td>12</td>
					<td>사용자 서비스</td>
				</tr>
				<tr>
					<td>13</td>
					<td>관리 및 보안 서비스</td>
				</tr>
				<tr>
					<td>14</td>
					<td>클라우드 기반의 AI서비스</td>
				</tr>
				<tr>
					<td>15</td>
					<td>기말평가</td>
				</tr>
			</table>
		</div>
	</div>

</div>
<script>
</script>



















