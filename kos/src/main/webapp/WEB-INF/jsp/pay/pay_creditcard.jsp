<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제중입니다</title>
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
	max-width: 600px;
	margin: auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

/* 주황색 박스를 감싼 제목 */
.title-box {
	background-color: #ff5722; /* 주황색 배경 */
	color: white;
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 20px;
}

.title-box h2 {
	margin: 0;
	font-size: 24px;
	font-weight: bold;
}

.instruction {
	font-size: 18px;
	margin-bottom: 20px;
	color: #555;
}

.image-container {
	margin-bottom: 30px;
}

.image-container img {
	width: 200px;
	height: auto;
}

.action-buttons {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
}

.btn {
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 20px;
	width: 45%;
}

.btn-cancel {
	background-color: #f44336;
}

.btn:hover {
	opacity: 0.9;
}

.footer {
	margin-top: 20px;
	font-size: 14px;
	color: #888;
}
</style>
</head>
<body>

	<div class="container">
		<!-- 주황색 박스를 감싼 제목 -->
		<div class="title-box">
			<h2>결제중입니다</h2>
		</div>

		<p class="instruction">
			다음 그림과 같이 신용/체크 카드를 넣어주세요. <br> (삼성/LG페이는 핸드폰을 카드리더기에 터치해주세요.)
		</p>

		<!-- 결제 안내 이미지 -->
		<div class="image-container">
			<img src="/assets/img/pay/신용카드결제중.png" alt="카드 결제 이미지">
		</div>
		
		<div class="footer">
			<p>카드를 리더기에 삽입하거나 핸드폰을 가까이 가져다 대십시오.</p>
		</div>

		<!-- 결제 버튼 -->
		<div class="action-buttons">
			<button class="btn btn-cancel" onclick="window.history.back()">취소</button>
			<button class="btn" onclick="requestApproval()">승인요청</button>
		</div>

		
	</div>

	<script src="assets/js/jquery-3.7.1.min.js"></script>
	<script>
		function requestApproval() {
			var result = confirm("포인트 적립을 하시겠습니까?");
			if (result) {
				window.location.href = '/member/point';
			} else {
				console.log("회원 적립을 취소하였습니다.");
			}
		}
	</script>
</body>
</html>
