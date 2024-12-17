<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제완료</title>
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

        .container1 {
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
            font-size: 26px;
            margin-bottom: 20px;
            background-color: #ff5722; /* 주황색 */
            color: white;
            padding: 15px;
            border-radius: 8px;
        }

        .content1 {
            text-align: center;
            font-size: 45px; /* '결제가 완료되었습니다' 문구 크게 수정 */
            margin-bottom: 30px;
            color: #333;
        }

        .content1 h3 {
            margin-top: 15px;
            font-size: 30px;
            color: #555;
        }

        .content1 .highlight {
            color: #f44336; /* 빨간색 */
            font-weight: bold;
        }

        .receipt-img {
            margin-top: 30px;
            text-align: center;
        }

        .receipt-img img {
            width: 350px;
            height: auto;
            margin: 10px 0;
        }

        .footer1 {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 30px;
        }

        .footer p {
            margin: 10px 0;
        }

        .footer span {
            font-weight: bold;
            color: #333;
        }

        .btn-close {
            display: block;
            margin: 30px auto;
            padding: 15px 30px;
            font-size: 18px;
            color: white;
            background-color: #2196F3;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-close:hover {
            background-color: #1976D2;
        }

        .highlight-yellow {
            color: #ffcc00; /* 선명한 노란색 */
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="title">결제완료</h2>

        <div class="content">
            <p><span class="highlight">결제</span>가 <span class="highlight">완료</span>되었습니다.</p>
            <h3><strong>영수증 하단의 <span class="highlight-yellow">주문번호</span>를 확인해주세요.</strong></h3>
        </div>

        <!-- 영수증 이미지 -->
        <div class="receipt-img">
            <img src="/assets/img/pay/결제완료.png" alt="영수증 이미지">
        </div>

        <!-- 자동 종료 안내 -->
        <div class="footer">
            <p>10초 후 창이 자동으로 닫힙니다...</p>
        </div>

        <!-- 닫기 버튼 -->
        <button class="btn-close" onclick="window.close()">닫기</button>
    </div>

</body>
</html>
