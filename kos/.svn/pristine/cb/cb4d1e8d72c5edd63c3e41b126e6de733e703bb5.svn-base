<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포인트 적립하기</title>
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
	background-color: #ff5722;
	color: white;
	padding: 10px;
	border-radius: 8px;
}

.section {
	margin-bottom: 20px;
}

.section h3 {
	font-size: 18px;
	color: #333;
	margin-bottom: 10px;
}

.input-group {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.input-group input[type="text"], .input-group input[type="number"] {
	width: calc(100% - 110px);
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.input-group button {
	width: 100px;
	padding: 10px;
	color: white; /* 텍스트 색상은 흰색으로 */
	cursor: pointer;
	border: none;
	border-radius: 5px;
	background-color: #2196F3; /* 기본 배경은 파란색 */
}

.input-group button:hover {
	background-color: #1976D2; /* 호버 시 더 어두운 파란색 */
	opacity: 0.9; /* 호버 시 살짝 투명도 감소 */
}

.input-group button:focus {
	outline: none; /* 클릭 시 테두리 제거 */
}

.keypad-container {
	position: relative;
	width: 100%;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-top: 2px solid #ddd;
	border-radius: 10px 10px 0 0;
	margin-top: 20px;
}

.keypad {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 10px;
	padding: 15px;
}

.keypad button {
	font-size: 20px;
	padding: 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: all 0.2s ease;
}

.keypad .number {
	background-color: #2196F3; /* 숫자 버튼은 파란색 */
	color: white;
}

.keypad .number:hover {
	background-color: #555; /* 숫자 버튼 호버 시 배경 색상 */
	transform: scale(1.1); /* 클릭했을 때 살짝 확대되는 효과 */
}

.keypad .number:active {
	background-color: #777; /* 눌렀을 때 색상 */
	transform: scale(0.95); /* 눌렸을 때 버튼 크기 축소 효과 */
}

.keypad .clear {
	background-color: #FF9800; /* C 버튼은 주황색 */
	color: white;
}

.keypad .clear:hover {
	background-color: #f57c00; /* C 버튼 hover 시 어두운 주황색 */
}

.keypad .del {
	background-color: #f44336; /* DEL 버튼은 빨간색 */
	color: white;
}

.keypad .del:hover {
	background-color: #d32f2f; /* DEL 버튼 hover 시 어두운 빨간색 */
}

.action-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.btn-skip, .btn-redeem {
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	width: 45%;
	cursor: pointer;
}

.btn-skip {
	background-color: #f44336;
}

.btn:hover {
	opacity: 0.9;
}
</style>
</head>
<body>

	<div class="container">
		<h2 class="title">포인트 적립하기</h2>

		<!-- 포인트 적립 섹션 -->
		<div class="section">
			<h3>
				적립 예정 포인트: <strong>200P</strong>
			</h3>
			<div class="input-group">
				<label for="phone-number">핸드폰 번호 입력</label>
				<div style="display: flex; gap: 10px;">
					<input type="text" id="phone-number" placeholder="핸드폰 번호를 입력해주세요"
						maxlength="11" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
					<button>조회</button>
				</div>
			</div>

			<!-- 키패드 -->
			<div class="keypad-container">
				<div class="keypad">
					<button class="number">1</button>
					<button class="number">2</button>
					<button class="number">3</button>
					<button class="number">4</button>
					<button class="number">5</button>
					<button class="number">6</button>
					<button class="number">7</button>
					<button class="number">8</button>
					<button class="number">9</button>
					<button class="clear">C</button>
					<button class="number">0</button>
					<button class="del">DEL</button>
				</div>
			</div>
		</div>

		<!-- 버튼 -->
		<div class="action-buttons">
			<button class="btn-skip">건너뛰기</button>
			<button class="btn-redeem" onclick="complite()">적립하기</button>
		</div>
	</div>
	<script src="assets/js/jquery-3.7.1.min.js"></script>
	<script>
		function complite() {
			window.location.href = '/pay/end'
		}
	</script>
</body>
</html>
