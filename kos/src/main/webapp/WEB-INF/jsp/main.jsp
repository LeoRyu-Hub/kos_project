<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 페이지</title>
<style>
</style>
<link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/assets/css/plugins.min.css" />
<link rel="stylesheet" href="/assets/css/kaiadmin.min.css" />
<link rel="stylesheet" href="/assets/css/demo.css" />
<link rel="stylesheet" href="/assets/css/main1.css" />
<link rel="stylesheet" href="/assets/css/menudetail.css" />
<link rel="stylesheet" href="/assets/css/order.css" />
</head>
<body>
	<div class="container">
		<!-- Header Section -->
		<div class="header" onclick="goHome()">
			<h1>수흥 부대찌개</h1>
		</div>
		<!-- Category Section -->
		<div class="categories">
			<button class="category-button" onclick="showMenu('01', 1)">찌개류</button>
			<button class="category-button" onclick="showMenu('02', 1)">사리류</button>
			<button class="category-button" onclick="showMenu('03', 1)">음료/주류</button>
		</div>
		<!-- Menu Section -->
		<div id="menu" class="menu"></div>
		<!-- 등록한 메뉴가 동적으로 추가 되는곳 -->
		<!-- 페이지네이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center" id="menuPaging">
			</ul>
		</nav>
		<!-- Order List Section -->
		<div class="order-list" style="gap: 20px;">
			<!-- Order Box -->
			<div class="order-box" id="orderList">
				<h3>담은 목록</h3>
				<!-- 내가담음 메뉴가 동적으로 추가 되는곳 -->
			</div>
			<!-- Time Box -->
			<div class="time-box" style="margin-left: 1px;">
				<div style="display: flex; justify-content: space-between; align-items: center; width: 100%; margin-bottom: 20px;">
					<p style="margin: 0; font-size: 16px;">
						남은 시간: <span id="timer" class="red-text">0초</span>
					</p>
					<button type="button" class="reset-button" style="background-color: #f44336; margin-left: 10px;" onclick="resetMenu()">초기화</button>
				</div>
				<div style="text-align: center; width: 100%; border-top: 1px solid #ccc; padding-top: 10px;">
					<p style="margin: 10px 0; font-size: 18px; font-weight: bold;">
						내가 담은 메뉴 : <span id='totalCnt'>0</span> 개
					</p>
					<button type='button' onclick="order()" class="order-button" style="padding: 10px 15px; font-size: 16px;">
						<span id="totalPrice" style="font-size: 20px;"> 0 원</span><br>주문하기
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 메뉴 상세정보 모달창 -->
	<div class="modal fade" id="detailmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<form id="orderform">
				<input type="hidden" id="modalMenuCode" name="menuCode">
				<div class="modal-content" style="width: 650px">
					<div class="modal-header">
						<button type="button" class="btn-close" onclick="closeModal()" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<h2 id="menuName1" class="menu-title"></h2>
						<img src="" id="menuImage1" class="modal-menu-image">
						<p class="price" id="modalMenuPrice"></p>
						<div class="quantity-controls">
							<button type="button" class="quantity-button" onclick="decreaseQuantity1()">-</button>
							<span id="qty1" class="quantity-display">1</span>
							<button type="button" class="quantity-button" onclick="increaseQuantity1()">+</button>
						</div>
						<p class="description" id="menuDetail1"></p>
					</div>
					<div class="modal-footer border-top-0 d-flex justify-content-center">
						<button type="button" class="btn-cls" onclick="closeModal()">닫기</button>
						<button type="button" class="btn-add" onclick="addCart()">주문 담기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 주문목록 모달창 -->
	<div class="modal fade" id="orderListModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 650px">
				<div class="modal-header">
					<button type="button" class="btn-close" onclick="closeModal()" aria-label="Close"></button>
				</div>
				<div class="modal-body">
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
								<tbody id="checkoutOrderList">
								</tbody>
							</table>
						</div>
						<!-- 총 수량과 총 금액 -->
						<div class="total">
							<p>
								<strong>총 수량:</strong> <span id="orderTotalQty"> </span>
							</p>
							<p>
								<strong>총 금액:</strong> <span id="orderTotalPrice"> </span>
							</p>
						</div>
						<!-- 돌아가기 및 결제하기 버튼 -->
						<div class="action-buttons">
							<button type="button" class="btn-cls" onclick="closeModal()">돌아가기</button>
							<button type="button" class="btn-add" onclick="checkout()">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 요청사항 음성 인식 모달창 -->
	<div class="modal fade" id="requestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content" style="width: 650px">
	            <div class="modal-header">
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <div class="container">
	                    <p class="instruction">
	                        음성으로 요청사항을 말씀해주세요.<br>
	                    </p>
	                    <div class="button-container">
	                        <button class="btn-start" onclick="startVoiceRecognition()">음성 인식 시작</button>
	                    </div>
	                    <div class="form-group">
	                        <textarea id="requestText" class="form-control" rows="4" readonly placeholder="음성 인식 결과가 여기에 표시됩니다."></textarea>
	                    </div>
	                    <div class="action-buttons">
	                        <button type='button' class="btn-cls" onclick ="passRequest()">건너뛰기</button>
	                        <button type='button' class="btn-add" onclick="submitRequest()">제출</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>


	<!-- 결제수단 선택, 포인트 적립 모달창 -->
	<div class="modal fade" id="checkout" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 650px">
				<div class="modal-header">
					<button type="button" class="btn-close" onclick="closeModal()" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<!-- 포인트 조회/사용 섹션 -->
						<div class="section">
							<h3>
								<strong>포인트 조회 및 사용</strong>
							</h3>
							<div class="input-group">
								<form id="checkoutForm">
									<label for="phone-number">핸드폰 번호 입력</label>
									<div style="display: flex; gap: 10px;">
										<input type="text" id="memberPhone" name="memberPhone" placeholder="핸드폰 번호를 입력해주세요" maxlength="11" onclick="setWhere('phone')" required>
										<button type="button" onclick="checkMember()">조회</button>
									</div>
								</form>
								<div style="margin-top: 10px;">
									<span>잔여 포인트: <strong><span id="point">0</span><span> P</span></strong><span id="join"></span></span>
									<!-- 잔여 포인트 표시 -->
								</div>
								<form id="usePointform">
									<label for="points">사용할 포인트</label>
									<div style="display: flex; gap: 10px;">
										<input type="text" id="usePoint" name="point" placeholder="사용할 포인트 입력" onclick="setWhere('point')" required> <input type="hidden" id="pointPhone" name="memberPhone">
										<button type="button" onclick="setUsePoint()">사용하기</button>
									</div>
								</form>
							</div>
							<!-- 키패드 -->
							<div class="keypad-container">
								<div class="keypad">
									<button type="button" class="number" onclick="insertNo(1)">1</button>
									<button type="button" class="number" onclick="insertNo(2)">2</button>
									<button type="button" class="number" onclick="insertNo(3)">3</button>
									<button type="button" class="number" onclick="insertNo(4)">4</button>
									<button type="button" class="number" onclick="insertNo(5)">5</button>
									<button type="button" class="number" onclick="insertNo(6)">6</button>
									<button type="button" class="number" onclick="insertNo(7)">7</button>
									<button type="button" class="number" onclick="insertNo(8)">8</button>
									<button type="button" class="number" onclick="insertNo(9)">9</button>
									<button type="button" class="clear" onclick="clearNo()">C</button>
									<button type="button" class="number" onclick="insertNo(0)">0</button>
									<button type="button" class="del" onclick="delNo()">DEL</button>
								</div>
							</div>
						</div>
						<!-- 결제수단 선택 섹션 -->
						<div class="section">
							<h3>
								<strong> 결제 수단 선택</strong>
							</h3>
							<div class="payment-methods">
								<div class="payment-item" onclick="creditCard()">
									<img src="/assets/img/paymentMethod/신용카드.png" alt="신용카드"> 신용카드
								</div>
								<div class="payment-item">
									<img src="/assets/img/paymentMethod/앱카드,바코드.png" alt="계좌이체"> 앱카드/바코드
								</div>
								<div class="payment-item">
									<img src="/assets/img/paymentMethod/카카오페이.png" alt="카카오페이"> 카카오페이
								</div>
							</div>
						</div>
						<!-- 결제 금액 정보 -->
						<div class="payment-info">
							<div>
								<span>주문금액:</span> <span id="checkoutTotalPrice" class="total-price"></span>
							</div>
							<div>
								<span>할인액:</span> <span class="discount price-text" id="discountPrice"> 0 </span> <span class="price-text"> 원</span>
							</div>
							<div>
								<span>총결제금액:</span> <span class="total-price" id="payPrice"> 0 </span> <span class="total-price"> 원</span>
							</div>
						</div>
						<!-- 결제 관련 버튼 -->
						<div class="action-buttons">
							<button type="button" class="btn-cls" onclick="closeModal()">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 신용카드 결제 모달창 -->
	<div class="modal fade" id="creditCardModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 650px">
				<div class="modal-header">
					<button type="button" class="btn-close" onclick="closeModal()" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<h2 class="title">결제중입니다</h2>
						<p class="instruction">
							다음 그림과 같이 신용/체크 카드를 넣어주세요. <br> (삼성/LG페이는 핸드폰을 카드리더기에 터치해주세요.)
						</p>
						<div class="image-container">
							<img src="/assets/img/pay/신용카드결제중.png" alt="카드 결제 이미지">
						</div>
						<div class="action-buttons">
							<button class="btn-cls" onclick="closeModal()">취소</button>
							<button class="btn-add" onclick="requestPay()">승인요청</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 결제완료 모달창 -->
	<div class="modal fade" id="endPayModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 650px">
				<div class="modal-header">
					<button type="button" class="btn-close" onclick="lastClose()" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container1">
						<h2 class="title">결제 완료</h2>
						<div class="contents">
							<p class="complete-message">
								<span class="highlight">결제</span>가 <span class="highlight">완료</span>되었습니다.
							</p>
							<h3>
								<strong>영수증 하단의 <span class="highlight-yellow">주문번호</span>를 확인해주세요.
								</strong>
							</h3>
						</div>
						<!-- 영수증 이미지 -->
						<div class="receipt-img">
							<img src="/assets/img/pay/결제완료.png" alt="영수증 이미지">
						</div>
						<!-- 자동 종료 안내 -->
						<div class="footer1">
							<p>
								<span id=lastTime>10</span>초 후 창이 자동으로 닫힙니다...
							</p>
						</div>
						<!-- 닫기 버튼 -->
						<div>
							<button class="btn-clss" onclick="lastClose()">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 포인트 적립 유뮤 모달창 -->
	<div class="modal fade" id="earnYNModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 650px">
				<div class="modal-header"></div>
				<div class="modal-body">
					<div class="container">
						<p class="instruction">
							포인트 적립을 하시겠습니까?<br> 적립예정 포인트 : <span id="earnPoint"> P</span>
						</p>
						<div class="action-buttons">
							<button class="btn-cls" onclick="earnN()">아니요</button>
							<button class="btn-add" onclick="earnY()">예</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--전화번호 입력 안했을 시 키패드 모달창 -->
	<div class="modal fade" id="keyPadModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 700px">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 650px">
				<div class="modal-header"></div>
				<div class="modal-body">
					<div class="container">
						<!-- 포인트 조회/사용 섹션 -->
						<div class="section" style="text-align: center; font-family: Arial, sans-serif; margin-top: 20px;">
							<div style="margin-top: 20px;">
								<span style="font-size: 1.5em; font-weight: bold;">적립예정 포인트: <strong> <span id="earnPoint2" >0</span> <span> P</span>
								</strong>
								</span>
							</div>
							<!-- 잔여 포인트 표시 -->
							<form id = "newJoinForm">
							<div style="margin-top: 20px; display: flex; justify-content: center; gap: 10px;">
								<input type="text" name='memberPhone' id='newPhone' placeholder="전화번호 입력" style="width: 300px; height: 40px; font-size: 1.2em; text-align: center; border: 2px solid #ccc; border-radius: 8px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
							</div>
							<input type="hidden" id="newPoint" name="point">
							</form>
						</div>
						<!-- 키패드 -->
						<div class="keypad-container">
							<div class="keypad">
								<button type="button" class="number" onclick="insertPhone(1)">1</button>
								<button type="button" class="number" onclick="insertPhone(2)">2</button>
								<button type="button" class="number" onclick="insertPhone(3)">3</button>
								<button type="button" class="number" onclick="insertPhone(4)">4</button>
								<button type="button" class="number" onclick="insertPhone(5)">5</button>
								<button type="button" class="number" onclick="insertPhone(6)">6</button>
								<button type="button" class="number" onclick="insertPhone(7)">7</button>
								<button type="button" class="number" onclick="insertPhone(8)">8</button>
								<button type="button" class="number" onclick="insertPhone(9)">9</button>
								<button type="button" class="clear" onclick="clearPhone()">C</button>
								<button type="button" class="number" onclick="insertPhone(0)">0</button>
								<button type="button" class="del" onclick="delPhone()">DEL</button>
							</div>
							<div class="action-buttons">
								<button class="btn-cls" onclick="pass()">건너뛰기</button>
								<button class="btn-add" onclick="earn()">적립하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id='hiddenform'>
		<input type='hidden' id='categoryCode' name='categoryCode' value='01'> <input type='hidden' id='currentPage' name='currentPage' value='1'>
	</form>
	<form id='hiddenjoinForm'>
		<input type='hidden' id='joinPhone' name='memberPhone'>
	</form>
	<form id='hiddenPointForm'>
		<input type='hidden' id='earnPointPhone' name='memberPhone'> <input type='hidden' id='earnPoint1' name='point'>
	</form>
	<form id='hiddenOrderForm'>
		<input type='hidden' id='earnYN' name='earnYN' value='N'>
		<input type='hidden' id='orderMemberPhone' name='memberPhone'>
		<input type='hidden' id='earnPrice' name='earnPrice' value='0'>
		<input type='hidden' id='discountYN' name='discountYN' value='N'>
		<input type='hidden' id='orderDiscountPrice' name='discountPrice' value='0'>
		<input type='hidden' id='orderPrice' name='orderPrice'>
		<input type='hidden' id='orderPayPrice' name='payPrice'>
		<input type='hidden' id='paymentmethodCode' name='paymentmethodCode' value='A01'>
		<input type='hidden' id='orderRequest' name='request'value='없음'>
		<div id="orderSaveTable">
		</div>
	</form>
	<!-- JS Files -->
	<script src="/assets/js/common.js"></script>
	<script src="/assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="/assets/js/core/popper.min.js"></script>
	<script src="/assets/js/core/bootstrap.min.js"></script>
	<script src="/assets/js/paging.js"></script>
	<script>
	function goHome(){
		window.location.href = "/home";
	}
	
	<!-- 화면 실행 시 '찌개류' 메뉴 노출 -->
	$(document).ready(function() {
		 $(`.category-button[onclick="showMenu('01')"]`).addClass('active');
		 searchList(1);
	});
	
	function searchList(pg){
		$('#currentPage').val(pg);
		call_server(hiddenform, '/main/setlist', setList);
	}
	
	<!-- 메뉴 리스트 세팅 -->
	function setList(data){
		var list = data.menuList;
		$('#menu').empty();
		var str = '';
		for (var i = 0; i<list.length; i++){
			str+= "<div class=\"menu-item\" onclick=\"viewdetail('" + list[i].menuCode+ "')\">";
			str+= "<img src=\"" + list[i].menuUrl + "\" alt=\""+list[i].menuName+"\" class=\"menu-image\">"
			str+= "<h2>" + list[i].menuName +  "</h2>"
			str+="<p>" +"<strong>"+ "가격 :" + list[i].menuPrice + "원"  +"</strong>" +"</p>"
			str+= "</div>"
		}
		$('#menu').append(str);
		setPaging(menuPaging,data.startPage, data.endPage,'searchList');
	}
	
	<!-- 카테고리별 리스트 세팅 -->
	function showMenu(cd, pg) { //카테고리 코드와, 페이지번호 파라미터로 받기
		$('#currentPage').val(pg); //페이지번호 세팅
	    $('#categoryCode').val(cd); //카테고리번호세팅
	    $('.category-button').removeClass('active'); // 모든 버튼에서 active 제거
	    $(`.category-button[onclick="showMenu('${cd}')"]`).addClass('active'); // 클릭한 버튼에 active 추가
	    call_server(hiddenform, '/main/setlist', setList);
	}
	
	<!-- 메뉴상세 조회-->
	function viewdetail(cd){
		$('#modalMenuCode').val(cd);
		call_server(orderform, '/main/getInfo', setDetail);
	}
	
	var time = 120;
	var menuPrice = 0; //가격 합계금액 구하기 위한 전역변수 저장
	var menuName = '';
	var menuCode = '';
	
	<!-- 모달창에 세팅-->
	function setDetail(data) {
	    $('#menuImage1').attr('src', data.menuUrl);
	    $('#menuName1').html('<strong>' + data.menuName + '</strong>');
	    $('#modalMenuPrice').html('<strong>' + data.menuPrice + '</strong>' +'원');
	    menuPrice = data.menuPrice;
	    menuName = data.menuName;
	    menuCode = data.menuCode;
	    $('#qty1').text('1');
	    $('#menuDetail1').text(data.menuDetail);
	    $('#detailmodal').modal('show');
	}
	
	
	<!-- 모달창 수량증가함수 -->
	function increaseQuantity1(){
	    var qty = 1;
	    qty = parseInt($('#qty1').text());  
	    qty++;  
	    $('#qty1').text(qty);
	    totalPrice1(qty);
	}
	<!-- 모달창 수량감소함수 -->
	function decreaseQuantity1(){
	    var qty = 1;
	    qty = parseInt($('#qty1').text());
	    if(qty>1){
	    	qty--;  
	    	$('#qty1').text(qty);
	    }else{
	    	return;
	    }
	    totalPrice1(qty);
	}
	
	<!--  모달창 합계가격(수량X가격)세팅해주는 함수 -->
	function totalPrice1(qty){
		$('#modalMenuPrice').html('<strong>' + menuPrice*qty + '</strong>' +'원');
	}
	
	<!-- 장바구니 추가 함수-->
	var totalCnt=0;
	var cartIdx=0;
	var totalPrice=0;
	
	function addCart(){ 
		var str = '';
		var qty = $('#qty1').text();
		
		//중복메뉴 담을 시 수량추가
		for(var i=0;i<cartIdx;i++){ 
			if($('#listMenuCode'+i)){  //해당 id가 존재하느냐
				if($('#listMenuCode'+i).val()==menuCode){ //존재하는데 같으면 
					var q = $('#cartQty'+i).text(); //추가하라
					q=+q;
					totalCnt+=q
					totalPrice +=(menuPrice*q);
					updateTotalCnt();
					updateTotalPrice();
					$('#cartQty'+i).text(Number(qty)+Number(q));
					$('#detailmodal').modal('hide');
					return;
				}
			}
		}
		
		str+= "<div class=\"order-item\">";
		str+="<button type =\"button\" onclick=\"removeCart(this, "+cartIdx+")\" class=\"remove-button\">"+"X"+"</button>";
		str+="<p>"+"<strong>" + menuName +"</strong>"+"</p>";
		str+="<p>"; 
		str+="<strong>"+ "수량: "+"</strong>"; 
		str+="<button type=\"button\" class=\"quantity-button\" onclick=\"decreaseQuantity('" + cartIdx + "')\">" + "-" + "</button>";
		str+="<span id=\"cartQty" + cartIdx + "\" class=\"quantity-display\">" + qty + "</span>";
		str+="<button type=\"button\" class=\"quantity-button\" onclick=\"increaseQuantity('" + cartIdx + "')\">" + "+" + "</button>";
		str+="</p>";
		str+="<p id=\"cartPrice" + cartIdx + "\">" + "<strong>" + "가격: " +  (menuPrice*qty) + "원" + "</strong>" +"</p>";
		str+="<input type='hidden' id='menuPrice"+cartIdx+"' value='"+menuPrice+"'>"; 
		str+="<input type='hidden' id='listMenuCode"+cartIdx+"' value='"+menuCode+"'>"; 
		str+="<input type='hidden' id='menuName"+cartIdx+"' value='"+menuName+"'>"; 
		str+="</div>";
		$('#orderList').append(str);
		$('#detailmodal').modal('hide');
		cartIdx++;
		
		qty = +qty; //qty 숫자로 변환
		totalCnt+=qty;
		totalPrice +=(menuPrice*qty);
		updateTotalCnt();
		updateTotalPrice();
		time=120; //타이머 초기화
		
	}
	
	<!-- 모달창 닫기 -->
	function closeModal(){
		time=120;
		$('#detailmodal').modal('hide');
		$('#orderListModal').modal('hide');
		$('#checkout').modal('hide');
		$('#creditCardModal').modal('hide');
		$('#endPayModal').modal('hide');
		$('#memberPhone').val('');
		$('#point').text('0');
		$('#join').text('');
		$('#joinButton').remove();
		$('#usePoint').val('');
		$('#discountPrice').text('0');
		$('#payPrice').text(totalPrice);
	}
	
	<!-- 담은목록 수량증가함수 -->
	function increaseQuantity(idx){
	    var qty = 0;
	    var price = 0;
	    qty = parseInt($('#cartQty' + idx).text()); //동적으로 생성된 id를 찾기 위해서는 이렇게 찾아야함
	    price = parseInt($('#menuPrice' + idx).val());
	    totalPrice +=price;
	    qty++;  
	    totalCnt++;
	    $('#cartQty' + idx).text(qty);
	    $('#cartPrice'+idx).html("<strong>가격 : "+(qty*price)+"원</strong>"); //장바구니에서 표시되는 가격
	    updateTotalCnt();
	    updateTotalPrice();
	}
	<!-- 담은목록 수량감소함수 -->
	function decreaseQuantity(idx){
	    var qty = 1;
	    var price = 0;
	    qty = parseInt($('#cartQty' + idx).text()); //동적으로 생성된 id를 찾기 위해서는 이렇게 찾아야함
	    price = parseInt($('#menuPrice' + idx).val()); //장바구니 합계가격 계산하기위해 받아옴
	    if(qty>1){
	    	qty--;  
	    	totalCnt--;
	    	totalPrice -=price;
	    	$('#cartQty' + idx).text(qty); 
	    	$('#cartPrice'+idx).html("<strong>가격 : "+(qty*price)+"원</strong>"); //장바구니에서 표시되는 합계가격
	    	updateTotalCnt();
	    	updateTotalPrice();
	    }else{
	    	return;
	    }
	}
	
	<!-- 담은목록 삭제하는 함수-->
	function removeCart(obj, idx){
		var qty = $('#cartQty'+idx).text();
		var price = parseInt($('#menuPrice' + idx).val());
		totalPrice -= (price*qty); 
		totalCnt -= qty;
		updateTotalCnt();
		updateTotalPrice();
		$(obj).parent().remove();
	}
	
	<!-- 담은목록 초기화 버튼 -->
	function resetMenu(){
		$('#orderList').empty();
		var str='';
		str ="<h3>" + "담은 목록" + "</h3>";
		$('#orderList').append(str);
		totalCnt=0;
		totalPrice=0;
		updateTotalCnt();
		updateTotalPrice();
		time=120;
	}
	
	<!-- 내가 담은 수량 업데이트 -->
	function updateTotalCnt(){
		$('#totalCnt').text(totalCnt);
		$('#orderTotalQty').text(totalCnt + "개");
	}
	
	<!-- 총 결제금액 업데이트-->
	var earnPoint = '';
	function updateTotalPrice(){
		$('#totalPrice').text(totalPrice + " 원"); //첫화면 총 결제금액
		$('#orderTotalPrice').text(totalPrice+ " 원");	 //주문 리스트 총 결제금액
		$('#orderPrice').val(totalPrice); //주문정보히든폼에 들어가는 주문금액
		$('#orderPayPrice').val(totalPrice); //주문정보히든폼에 들어가는 주문금액
		$('#checkoutTotalPrice').text(totalPrice+ " 원"); //최종 총 주문 금액
		$('#payPrice').text(totalPrice);
		earnPoint = totalPrice*0.01;
	}
	
	<!-- 타이머 -->
	$(document).ready(function(){
		timer();
	});
	
	function timer(){
		var all_timer = setInterval(function(){
            $('#timer').text(time + '초');
            time --;
            if (time == 0) {
                clearInterval(all_timer);
              //  window.location.href = "/home"; 	//시간초과시 홈 화면으로
            }
        }, 1000);
	}
	
	<!-- 주문하기 넘어가는 모달 -->
	function order(){
		var str='';
		
		$('#checkoutOrderList').empty();
		
		for(var i=0;i<cartIdx;i++){
			if($('#listMenuCode'+i) && $('#listMenuCode'+i).val()!=undefined){ //있으면 메뉴목록 나오는 모달에 추가
				
				var price = $('#menuPrice'+i).val();
				var qty = $('#cartQty'+i).text();
				var menuName = $('#menuName'+i).val();
				var menuCode = $('#listMenuCode'+i).val();
				qty = Number(qty); //숫자로변환
				str="<tr>"
				str+="<td>" + menuName + "</td>"
				str+="<td>" + price + " 원" + "</td>"
				str+="<td>" + qty + " 개"+ "</td>"
				str+="<td>" + price*qty + " 원" + "</td>"
				str+="</tr>"
				$('#checkoutOrderList').append(str);
				$('#orderListModal').modal('show');
				
				//밑의 코드는 주문정보를 서버에 보내는 폼에 넣기 위한 코드
				var stro='';
				stro+="<input type='hidden' id='orderMenuCode' name='orderlist["+i+"].menuCode' value='" + menuCode + "'>";
				stro+="<input type='hidden' id='orderQty' name='orderlist["+i+"].qty' value='" + qty + "'>";
				$('#orderSaveTable').append(stro);
			}
		}
	}
	
	<!-- 주문리스트에서 > '결제하기' 버튼 요청사항 입력 모달 생성-->
	function checkout(){
		$('#orderListModal').modal('hide');
		$('#requestModal').modal('show');
	}
	
	
	function submitRequest(){
			$('#requestModal').modal('hide');
			$('#checkout').modal('show');
		}
	
	<!-- 번호입력 -->
	function insertNo(no){
		
		if(currentInput=='phone'){ //핸드폰번호 입력
		  var phoneNo = $('#memberPhone').val();
		  if (phoneNo.length < 11) { //11자리까지 입력
		      $('#memberPhone').val(phoneNo + no);
		  }
		}else if(currentInput=='point'){
			var point = $('#usePoint').val();
			$('#usePoint').val(point + no);
			var point1 = $('#usePoint').val(); //사용할 포인트
			var myPoint = $('#point').text(); //보유 포인트
			myPoint = +myPoint;
			if(myPoint < point1){ //보유포인트보다 사용할 포인트가 많을 경우 
				$('#usePoint').val(myPoint); //내가 가진 포인트 전부 사용 
			}
		}
	}
	
	function clearNo(){
		if(currentInput=='phone'){ 
			$('#memberPhone').val('');
		}else if(currentInput=='point'){
			$('#usePoint').val('');
		}
	}
	
	function delNo(){
		if(currentInput=='phone'){ //핸드폰번호 입력
			var no = $('#memberPhone').val();
			no = no.slice(0, -1);
			$('#memberPhone').val(no);
		}else if(currentInput=='point'){
			var point = $('#usePoint').val();
			point = point.slice(0, -1);
			$('#usePoint').val(point);
		}
	}
	
	
	<!-- 서버 호출하여 회원 포인트 조회-->
	var currentInput=''; //키패드로 어디에 입력 할 지 정하는 변수
	var memberPhone='';
	function checkMember(){
		var phoneNo = $('#memberPhone').val();
		if (phoneNo.length == 11){ //번호가 11자리일 경우만 데이터 전송
			call_server(checkoutForm,'/main/serchMember', setPoint);
			currentInput = 'point';
		}else
			alert('입력한 번호를 확인해주세요.');
	}
		
	<!-- 포인트 셋팅 -->
	function setPoint(data){
		if(data.memberPhone==null){ //회원이 아닐경우
			$('#point').text("0");
			$('#join').text(" (등록된 회원이 아닙니다. 회원가입 하시겠습니까?) ");
			var str='';	
			str += "<input type=\"button\" id=\"joinButton\"value=\"가입하기\" onclick=\"joinMember()\" />"
			$('#join').append(str);
		}else{  //회원일 경우
			$('#point').text(data.point);
			$('#join').text("");
			$('#joinButton').remove();
			$('#pointPhone').val(data.memberPhone);
			memberPhone = $('#memberPhone').val(); //포인트 적립시 사용자가 번호를 입력 할 경우 나중에 번호 입력을 생략하기 위해 전역변수에 저장
		}		
	}
	
	<!-- 회원가입 함수 -->
	function joinMember(){
		call_server(checkoutForm,'/main/joinMember', cbSave);
	}
	
	<!-- 회원가입 완료-->
	function cbSave(){
		$('#join').text(" (가입이 왼료되었습니다.) ");
		$('#joinButton').remove();
		memberPhone = $('#memberPhone').val();
	}
	
	<!-- 키패드 어디에 입력할지 결정 -->
	//var currentInput='';
	function setWhere(type){
		currentInput = type;
	}
	
	<!-- 포인트 '사용하기' 버튼 -->
	function setUsePoint(){
		call_server(usePointform, '/main/usePoint', finishPoint);
	}
	
	<!-- 포인트 사용 성공 시 -->
	function finishPoint(){
		$('#discountYN').val('Y'); //히든오더폼 데이터
		var currenPoint = $('#point').text(); //가지고 있던 포인트
		var usePoint = $('#usePoint').val(); //사용할 포인트
		$('#point').text(currenPoint-usePoint); 
		$('#usePoint').val('');
		$('#discountPrice').text(usePoint);
		$('#orderDiscountPrice').val(usePoint); //히든오더폼 데이터
		$('#orderPayPrice').val(totalPrice-usePoint);//히든오더폼 데이터
		$('#payPrice').text(totalPrice-usePoint); 
		earnPoint=(totalPrice-usePoint)*0.01; // 적립예정포인트
	}
	
	<!-- 결제수단 신용카드 선택 -->
	function creditCard(){
		closeModal();
		$('#creditCardModal').modal('show');
	}
	 
	<!-- 승인요청(적립예정포인트 세팅)-->
	function requestPay(){
		closeModal();
		$('#earnYNModal').modal('show');
		$('#earnPoint').text(earnPoint + "P");
	}
	
	<!-- 포인트 적립 '예' -->
	function earnY(){
		$('#earnYNModal').modal('hide');
		$('#earnPointPhone').val(memberPhone);
		$('#earnPoint1').val(earnPoint);
		if (memberPhone !== ""){ //앞에서 핸드폰 번호 입력 했을시
			call_server(hiddenPointForm,'/main/earnpoint', cbSave1 );	
		}else{ //앞에서 입력한 핸드폰 번호가 없을 시 키패드 노출
			$('#earnPoint2').text(earnPoint); //키패드에 나오른 적립예상 포인트
			$('#newPoint').val(earnPoint); //서버로 넘어가는 적립예상 포인트
			$('#keyPadModal').modal('show');
		}  
	}
	
	<!-- 회원번호를 입력, 저장 했을경우 -->
	function cbSave1(){ //결제하기
		$('#earnYN').val('Y');
		$('#orderMemberPhone').val(memberPhone);
		$('#earnPrice').val(earnPoint);
		call_server(hiddenOrderForm,'/main/insertOrder', finish);
	}
	
	<!-- 마무리 -->
	function finish(){
		$('#earnYNModal').modal('hide');
		$('#keyPadModal').modal('hide');
		$('#endPayModal').modal('show');
		lastTimer(); //마지막 10초타이머
	}
	
	<!-- 포인트 적립 '아니요' -->  //결제하기
	function earnN(){
		$('#earnYN').val('N');
		call_server(hiddenOrderForm,'/main/insertOrder', finish);
	}
	
	<!-- 건너뛰기 버튼 --> //결제하기
	function pass(){
		$('#earnYN').val('N');
		call_server(hiddenOrderForm,'/main/insertOrder', finish);
	}
	
	
	<!-- 적립하기 버튼, 마지막 신규번호 입력후 포인트 테이블에 저장하기 위해 서버로 번호 전송 --> 
	function earn(){ 
		var phoneNo = $('#newPhone').val();
		if (phoneNo.length == 11){ //번호가 11자리일 경우만 데이터 전송(원래 존재하는 회원번호 입력 시 포인트 저장안되는 오류 수정필요)
			memberPhone = $('#newPhone').val();
			call_server(newJoinForm,'/main/joinMember', cbSave1);
		}else{
			alert('입력한 번호를 확인해주세요.');
		}
	}
	
	<!-- 마지막 10초 타이머 -->
	function lastTimer(){
		var time=10;
		var all_timer = setInterval(function(){
            $('#lastTime').text(time);
            time --;
            if (time == 0) {
                clearInterval(all_timer);
              //  window.location.href = "/home"; 
            }
        }, 1000);
	}
	
	<!-- 마지막 모달 닫기 버튼 -->
	function lastClose(){
		$('#endPayModal').modal('hide');
		window.location.href = "/main"; 
	}
	
	<!-- 마지막 신규 번호 입력 --> 
	function insertPhone(no){
		  var phoneNo = $('#newPhone').val();
		  if (phoneNo.length < 11){
		      $('#newPhone').val(phoneNo + no);
		  }
	}
	
	function clearPhone(){
			$('#newPhone').val('');
	}
	
	function delPhone(){
			var no = $('#newPhone').val();
			no = no.slice(0, -1);
			$('#newPhone').val(no);
	}
	
	//포인트 사용하기 후 취소(돌아가기) 할 경우 포인트가 사용되는 오류 해결
	//마지막에 번호 입력 했을 때 원래 있는 번호 입력 할 경우 포인트 적립 안되는 오류 해결
	//포인트 입력 2번이상 할 경우 마지막 포인트만 할인들어가는 오류
	//결제수단 하드코딩
	
	<!--음성인식 코드-->
	function startVoiceRecognition(){
		$('#requestText').val('');
		$.ajax({
		        url: '/order/getSpeech',  
		        type: 'GET',
		        success: function(data) {
		            if (data) {
						successRequest(data);
		            } else {
		                console.log("에러발생");
		            }
		    	},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
	}
	
	<!--음성인식 성공시 호출하는 함수-->
	function successRequest(data){
		console.log(data);
		$('#orderRequest').val(data);
		$('#requestText').val(data);
	}
	
	
	function passRequest(){
		$('#requestModal').modal('hide');
		$('#checkout').modal('show');
		}
	</script>
</body>
</html>
