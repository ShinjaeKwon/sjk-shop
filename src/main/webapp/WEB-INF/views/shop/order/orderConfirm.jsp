<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <hr>
    <form>
        <h2>구매자 정보</h2>
        이름 : ${cart.user.name}<br>
        배송 주소 : ${cart.user.address}<br>
        연락처 : ${cart.user.phone}<br>
        배송 요청 사항 : <input type="text" placeholder="배송 요청 사항을 입력하세요." id="requests">
        <hr>
        <h2>주문 정보</h2>
        <c:set var="total" value="0"/>
        <c:forEach var="cartItem" items="${cart.cartItems}">
            ${cartItem.item.img}<br>
            <b>${cartItem.item.name}</b><br>
            주문 수량 : ${cartItem.stockQuantity}
            <c:set var="total" value="${total + (cartItem.stockQuantity * cartItem.item.price)}"/>
            <hr>
        </c:forEach>
        <br>
        <h2>결제 정보</h2>
        총 결제 금액 : <fmt:formatNumber value="${total}" pattern="#,###,###,###"/>원
        <input type="hidden" id="total" value="${total}">
        <input type="hidden" id="email" value="${principal.user.email}">
        <input type="hidden" id="name" value="${principal.user.name}">
        <input type="hidden" id="phone" value="${principal.user.phone}">
        <input type="hidden" id="address" value="${principal.user.address}">
        <input type="hidden" id="cartId" value="${cart.id}">
    </form>

    <button id="requestPay">Payment</button>
    <button id="orderConfirm">Order Confirm</button>
</div>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>