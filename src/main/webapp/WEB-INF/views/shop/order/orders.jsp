<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>


<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br>
    <c:forEach var="order" items="${orders}">
        <c:if test="${order.status == 'BEFORE'}">
            <c:forEach var="orderItem" items="${order.orderItems}">
                상품 이름 : ${orderItem.item.name}<br>
                주문 수량 : ${orderItem.orderQuantity}<br>
                총가격 : <fmt:formatNumber value="${orderItem.orderPrices}" pattern="#,###,###,###"/>원
                <br>
            </c:forEach>
            <br>
            <br>
        </c:if>
    </c:forEach>
    <button id="orderConfirm">Order Confirm</button>
</div>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>