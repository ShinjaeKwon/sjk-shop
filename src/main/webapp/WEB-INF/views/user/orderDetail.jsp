<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br>
    <fmt:formatDate var="date" value="${order.orderDate}" pattern="YY.MM.dd HH:mm:ss"/>
    주문 시간 : ${date} <br>
    주문 상태 : ${order.status}<br>
    <c:forEach var="orderItem" items="${order.orderItems}">
        상품 이름 : ${orderItem.item.name}<br>
        주문 수량 : ${orderItem.orderQuantity}<br>
        총가격 : <fmt:formatNumber value="${orderItem.orderPrices}" pattern="#,###,###,###"/>원
        <br>
    </c:forEach>
    <br>
    <br>
    주문자 이름 : ${order.user.name}<br>
    연락처 : ${order.user.phone}<br>
    주소 : ${order.user.address}<br>
    <br><br><br>
    <div>
        <input type="hidden" value="${order.id}" id="orderId">
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
<script src="/js/item.js"></script>
<%@ include file="../layout/footer.jsp" %>