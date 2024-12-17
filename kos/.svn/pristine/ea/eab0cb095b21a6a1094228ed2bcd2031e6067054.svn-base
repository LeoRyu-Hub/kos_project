<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제수단 선택</title>
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

.payment-info {
	display: flex;
	justify-content: space-between;
	font-size: 18px;
	color: #333;
	margin-top: 20px;
}

.payment-info span {
	font-weight: bold;
}

.payment-info .total-price {
	color: #ff5722;
}

.payment-methods {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
}

.payment-methods .payment-item {
	border: 2px solid #ddd;
	border-radius: 8px;
	padding: 10px;
	transition: border-color 0.3s ease, transform 0.2s ease;
}

.payment-methods .payment-item:hover {
	border-color: #ff5722;
	transform: scale(1.05);
}

.payment-methods img {
	width: 80px;
	height: 80px;
	cursor: pointer;
	border-radius: 8px;
}

.action-buttons {
	display: flex;
	justify-content: center; /* 버튼을 수평 중앙 정렬 */
	margin-top: 30px;
}

.btn {
	color: white;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 20px;
	width: 45%;
}

.btn-cancel {
	background-color: #f44336;
}

.btn-pay {
	background-color: #4caf50;
}

.btn:hover {
	opacity: 0.9;
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
</style>
</head>
<body>

	<div class="container">
		<h2 class="title">결제수단 선택</h2>

		<!-- 포인트 조회/사용 섹션 -->
		<div class="section">
			<h1>포인트 조회 및 사용</h1>
			<div class="input-group">
				<label for="phone-number">핸드폰 번호 입력</label>
				<div style="display: flex; gap: 10px;">
					<input type="text" id="phone-number" placeholder="핸드폰 번호를 입력해주세요"
						maxlength="11" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
					<button>조회</button>
				</div>
				<div style="margin-top: 10px;">
					<span>잔여 포인트: <strong>5000원</strong></span>
					<!-- 잔여 포인트 표시 -->
				</div>
				<label for="points">사용할 포인트</label>
				<div style="display: flex; gap: 10px;">
					<input type="text" id="points" placeholder="사용할 포인트  입력" min="0"
						value="0" required>
					<button>사용</button>
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

		<!-- 결제수단 선택 섹션 -->
		<div class="section">
			<h1>결제 수단 선택</h1>
			<div class="payment-methods">
				<div class="payment-item">
					<img src="/assets/img/paymentMethod/신용카드.png" alt="신용카드"
						onclick="creditCard()">
				</div>
				<div class="payment-item">
					<img src="/assets/img/paymentMethod/앱카드,바코드.png" alt="계좌이체">
				</div>
				<div class="payment-item">
					<img src="/assets/img/paymentMethod/카카오페이.png" alt="카카오페이">
				</div>
			</div>
		</div>

		<!-- 결제 금액 정보 -->
		<div class="payment-info">
			<div>
				<span>주문금액:</span> <span class="total-price">20,000원</span>
			</div>
			<div>
				<span>할인액:</span> <span class="discount">0원</span>
			</div>
			<div>
				<span>총결제금액:</span> <span class="discount">20,000원</span>
			</div>
		</div>

		<!-- 결제 관련 버튼 -->
		<div class="action-buttons">
			<button class="btn btn-cancel">취소</button>
		</div>
	</div>

	<script src="assets/js/jquery-3.7.1.min.js"></script>
	<script>
		function creditCard() {
			window.location.href = "/pay/creditcard"; // 페이지 이동
		}
	</script>

</body>
</html>
