<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<head>
    <title>주문 상세보기</title>
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

        .button button {
            margin-right: 200px;
        }
    </style>
</head>
<button class="btn btn-secondary" onclick="history.back()" style="margin-left: 200px">Previous Page</button>
<br><br><br>
<fmt:formatDate var="date" value="${order.orderDate}" pattern="YY.MM.dd HH:mm:ss"/>
<form>
    <div class="container">
        <%-- 주문정보 --%>
        <div class="order-item">
            <h2>주문 정보</h2>
            <hr>
            <br>
            <c:set var="total" value="0"/>
            <c:forEach var="orderItem" items="${order.orderItems}">
                <div class="item">
                    <div class="item-img"><a href="/shop/${orderItem.item.id}">${orderItem.item.img}</a></div>
                    <div class="item-name"><b>${orderItem.item.name}</b></div>
                    <div class="item-quantity">수량 : ${orderItem.orderQuantity}</div>
                    <div class="item-price">금액 : <fmt:formatNumber value="${orderItem.orderPrices}"
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
                이름 : ${order.user.name}<br>
                배송 주소 : ${order.user.address}<br>
                연락처 : ${order.user.phone}<br>
                주문 요청 사항 : ${order.requests}<br>
            </div>
            <hr>
            <div class="button">
                <input type="hidden" value="${order.id}" id="orderId">
                <c:if test="${order.status == 'BEFORE'}">
                    <button id="confirm">Confirm Order</button>
                    <br><br>
                    <button id="refund">Refund Order</button>
                    <br><br>
                </c:if>
                <c:if test="${order.status == 'CONFIRM'}">
                    <button id="cancel">Cancel Order</button>
                    <br><br>
                </c:if>
                <c:if test="${principal.user.role == 'ADMIN' || principal.user.role == 'SELLER'}">
                    <c:if test="${order.status == 'CONFIRM' || order.status == 'COMPLETED'}">
                        <button id="shipping">Change to Shipping</button>
                    </c:if>
                    <c:if test="${order.status == 'SHIPPING'}">
                        <button id="completed">Change to Completed</button>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</form>
<script src="/js/item.js"></script>
<%@ include file="../layout/footer.jsp" %>