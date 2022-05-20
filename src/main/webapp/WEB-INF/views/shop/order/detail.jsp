<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<div class="container">
    <h2>주문 완료</h2>
    <hr>
    <c:forEach var="orderItem" items="${order.orderItems}">
        ${orderItem.item.img}
        상품 이름 : ${orderItem.item.name}<br>
        주문 수량 : ${orderItem.orderQuantity}<br>
        <br>
    </c:forEach>
    <br>
    <br>
    주문 총 가격 :<fmt:formatNumber value="${order.prices}" pattern="#,###,###,###"/>원<br>
    <a href="/shop">Shop Main Page</a>
</div>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>