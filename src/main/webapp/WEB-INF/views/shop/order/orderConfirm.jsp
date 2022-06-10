<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<head>
    <title>주문 확인</title>
    <link rel="stylesheet" href="/css/user.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

    <style>
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .order-item {
            width: 60%;
        }

        .order-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 700px;
            background-color: rgba(0, 0, 0, 0.01);
            border: 1px solid #999999;
            border-radius: 3%;
            padding-top: 20px;
        }

        .item {
            padding-left: 10px;
            height: 210px;
        }

        .item-img, .item-name, .item-quantity, .item-price {
            float: left;
            margin-right: 40px;
        }

        .item-img {
            width: 30%;
        }

        .item-name {
            width: 10%;
        }

        .item-quantity {
            width: 10%;
        }

        .item-price {
            width: 25%;
        }

        .item-name, .item-quantity, .item-price {
            padding-top: 85px;
        }

        .info {
            margin-left: 20px;
            margin-right: 20px;
            line-height: 3;
        }

        .price {
            width: 350px;
        }

        #requestPay, #orderConfirm {
            align-items: center;
            margin-right: 10px;
            border: 2px solid #999999;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, 0.05);
            color: dimgray;
        }

        #requestPay:hover, #orderConfirm:hover {
            background-color: dimgray;
            color: white;
        }

        .sidebar {
            text-align: center;
            font-size: 17px;
            line-height: 40px;
            width: 35px;
            padding: 10px 24px 10px 8px;
            position: fixed;
            top: 40%;
            right: 5px;
            background-color: white;
            border: 1px solid dimgray;
            color: white;
        }

        .sidebar a[href] {
            word-break: break-word;
            color: dimgray;
            text-decoration: none;
        }
    </style>
</head>
<button class="btn btn-secondary" onclick="history.back()" style="margin-left: 200px">Previous Page</button>
<br><br><br>
<form>
    <div class="container">
        <%-- 주문정보 --%>
        <div class="order-item">
            <h2>주문 정보</h2>
            <hr>
            <br>
            <c:set var="total" value="0"/>
            <c:forEach var="cartItem" items="${cartItems}">
                <div class="item">
                    <div class="item-img">${cartItem.item.img}</div>
                    <div class="item-name"><b>${cartItem.item.name}</b></div>
                    <div class="item-quantity">수량 : ${cartItem.stockQuantity}</div>
                    <div class="item-price">금액 : <fmt:formatNumber value="${cartItem.item.price}"
                                                                   pattern="#,###,###,###"/>원
                    </div>
                    <c:set var="total" value="${total + (cartItem.stockQuantity * cartItem.item.price)}"/>
                </div>
                <br>
                <hr>
                <br>
            </c:forEach><br>
        </div>
        <hr>
        <%-- 배송정보 및 결제 --%>
        <div class="order-info"><br>
            <h2>배송정보</h2>
            <div class="info">
                <hr>
                이름 : ${cart.user.name}<br>
                배송 주소 : ${cart.user.address}<br>
                연락처 : ${cart.user.phone}<br>
                배송 요청 사항 : <input type="text" placeholder="배송 요청 사항을 입력하세요." id="requests"
                                  style="width: 230px; height: 35px; margin-left: 3px;">
            </div>
            <br><br>
            <hr>
            <br>
            <h2>결제</h2>
            <div class="price">
                <hr>
                <br>
                결제예정금액 : <fmt:formatNumber value="${total}" pattern="#,###,###,###"/>원
                <input type="hidden" id="total" value="${total}">
                <input type="hidden" id="email" value="${principal.user.email}">
                <input type="hidden" id="name" value="${principal.user.name}">
                <input type="hidden" id="phone" value="${principal.user.phone}">
                <input type="hidden" id="address" value="${principal.user.address}">
                <input type="hidden" id="cartId" value="${cart.id}">
            </div>
            <br><br><br>
            <div id="btn">
                <button type="button" id="requestPay">결제</button>
            </div>
        </div>

        <%-- Sidebar --%>
        <div class="sidebar">
            <a href="/"><i class="xi-home-o"></i></a>
            <a href="#"><i class="xi-cart-o"></i></a>
            <a href="#top"><i class="xi-arrow-top"></i></a>
        </div>
    </div>
</form>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>