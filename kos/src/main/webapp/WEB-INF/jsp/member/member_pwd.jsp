<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>4자리 비밀번호 입력</title>
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

.popup-container {
	width: 100%;
	max-width: 400px;
	margin: auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.popup-header {
	text-align: center;
	font-size: 20px;
	margin-bottom: 20px;
	background-color: #ff5722;
	color: white;
	padding: 10px;
	border-radius: 8px;
}

.input-group {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.input-group input[type="password"] {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: center;
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

.popup-footer {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.popup-footer button {
	background-color: #4caf50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 45%;
}

.popup-footer .cancel {
	background-color: #f44336;
}

.popup-footer button:hover {
	opacity: 0.9;
}

</style>
</head>
<body>


		<div class="popup-header">
			<h3>비밀번호를 입력하세요</h3>
		</div>

		<div class="input-group">
			<input type="password" id="password" placeholder="4자리 비밀번호 입력" maxlength="4" required readonly>
		</div>

		<div class="keypad-container">
			<div class="keypad">
				<button class="number" onclick="addNumber(1)">1</button>
				<button class="number" onclick="addNumber(2)">2</button>
				<button class="number" onclick="addNumber(3)">3</button>
				<button class="number" onclick="addNumber(4)">4</button>
				<button class="number" onclick="addNumber(5)">5</button>
				<button class="number" onclick="addNumber(6)">6</button>
				<button class="number" onclick="addNumber(7)">7</button>
				<button class="number" onclick="addNumber(8)">8</button>
				<button class="number" onclick="addNumber(9)">9</button>
				<button class="clear" onclick="clearPassword()">C</button>
				<button class="number" onclick="addNumber(0)">0</button>
				<button class="del" onclick="removeLast()">DEL</button>
			</div>
		</div>

		<div class="popup-footer">
			<button class="cancel" onclick="closePopup()">취소</button>
			<button onclick="submitPassword()">확인</button>
		</div>
	</div>

	<script>

	</script>

</body>
</html>
