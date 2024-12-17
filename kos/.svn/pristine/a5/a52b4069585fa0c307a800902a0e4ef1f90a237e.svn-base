<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 내역 확인</title>
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

.table-container {
	width: 100%;
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #ff5722;
	color: white;
}

td {
	background-color: #f7f7f7;
}

.total {
	text-align: right;
	font-size: 18px;
	margin-top: 20px;
}

.action-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
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

.btn-back {
	background-color: #f44336;
}

.btn:hover, .btn-back:hover {
	opacity: 0.9;
}
</style>
</head>
<body>

	<div class="container">
		<h2 class="title">주문 내역을 확인해주세요</h2>

		<!-- 주문 리스트 테이블 -->
		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>메뉴</th>
						<th>가격</th>
						<th>수량</th>
						<th>총 금액</th>
					</tr>
				</thead>
				<tbody id="orderList">
					<tr>
						<td>원조부대찌개</td>
						<td>10,000원</td>
						<td>2</td>
						<td>20,000원</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 총 수량과 총 금액 -->
		<div class="total">
			<p>
				<strong>총 수량:</strong> 2
			</p>
			<p>
				<strong>총 금액:</strong> 20,000원
			</p>
		</div>

		<!-- 돌아가기 및 결제하기 버튼 -->
		<div class="action-buttons">
			<button class="btn btn-back" onclick="window.history.back()">돌아가기</button>
			<button class="btn" onclick="checkout()">결제하기</button>
		</div>
	</div>

	<script src="assets/js/jquery-3.7.1.min.js"></script>

	<script>
		function checkout() {
			window.location.href = '/order/pay'; // 페이지 이동
		}
	</script>

</body>
</html>
