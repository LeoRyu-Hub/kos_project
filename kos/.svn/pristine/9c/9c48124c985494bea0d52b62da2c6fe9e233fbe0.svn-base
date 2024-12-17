<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>추천 메뉴</title>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
}

.container {
	width: 100%;
	max-width: 800px;
	margin: auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.title {
	text-align: center;
	font-size: 24px;
	margin-bottom: 20px;
	background-color: #ff5722; /* 주황색 배경 */
	color: white; /* 글자색 흰색 */
	padding: 10px;
	border-radius: 8px;
}

.description {
	text-align: center;
	font-size: 25px;
	margin-bottom: 20px;
}

.menu-list {
	display: flex;
	justify-content: space-around;
	margin-bottom: 30px;
}

.menu-item {
	text-align: center;
	max-width: 200px;
	border: 1px solid #ddd; /* 메뉴 항목 구분을 위한 테두리 */
	border-radius: 8px;
	padding: 10px;
	background-color: #fff; /* 메뉴 항목의 배경색 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 메뉴 항목에 미세한 그림자 추가 */
	transition: transform 0.2s ease; /* 마우스 오버 시 효과 */
}

.menu-item:hover {
	transform: scale(1.05); /* 메뉴 항목에 마우스 오버 시 크기 확대 효과 */
}

.menu-item img {
	width: 100%; /* 이미지가 div 너비에 맞도록 설정 */
	height: 200px; /* 일정한 높이로 맞추기 */
	object-fit: cover; /* 이미지가 비율에 맞게 잘리도록 설정 */
	border-radius: 8px;
	margin-bottom: 10px;
}

.menu-item p {
	font-size: 16px;
	color: #333;
	margin: 0;
}

.menu-price {
	font-size: 18px;
	color: #ff5722; /* 빨간색으로 가격 표시 */
	margin-top: 5px;
}

.action-buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
}

.btn {
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 20px;
}

.btn-skip {
	background-color: #f44336;
}

.btn-skip:hover, .btn:hover {
	opacity: 0.9;
}
</style>
</head>
<body>

	<div class="container">
		<h2 class="title">결제 전에 이런 메뉴는 어떠세요?</h2>
		<p class="description">다음 메뉴들도 추천드려요!</p>

		<div class="menu-list">
			<!-- 추천 메뉴 1 -->
			<div class="menu-item">
				<img src="/assets/img/menu/side/치즈떡.jpg" alt="추천 메뉴 1">
				<p>치즈떡사리</p>
				<p class="menu-price">2,000원</p>
			</div>
			<!-- 추천 메뉴 2 -->
			<div class="menu-item">
				<img src="/assets/img/menu/side/치즈.jpg" alt="추천 메뉴 2">
				<p>치즈</p>
				<p class="menu-price">2,000원</p>
			</div>
			<!-- 추천 메뉴 3 -->
			<div class="menu-item">
				<img src="/assets/img/menu/side/베이컨.jpg" alt="추천 메뉴 3">
				<p>베이컨</p>
				<p class="menu-price">5,000원</p>
			</div>
		</div>

		<div class="action-buttons">
			<button class="btn">주문 담기</button>
			<button class="btn btn-skip" onclick="skipRecommendations()">건너뛰기</button>
		</div>
	</div>
	<script src="assets/js/jquery-3.7.1.min.js"></script>

	<script>
		function skipRecommendations() {
			window.location.href = '/order/list'; // 페이지 이동
		}
	</script>

</body>
</html>
