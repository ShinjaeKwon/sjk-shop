<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<div class="container">
    <h2>주문 완료</h2>
    <hr>
    <h2>구매자 정보</h2>

    주문자 이름 : ${order.user.name}<br>
    연락처 : ${order.user.phone}<br>
    배송 주소 : ${order.user.address}<br>
    주문 요청 사항 : ${order.requests}<br>
    <hr>
    <h2>상품 정보</h2>
    <c:forEach var="orderItem" items="${orderItemList}">
        ${orderItem.item.img}
        상품 이름 : ${orderItem.item.name}<br>
        주문 수량 : ${orderItem.orderQuantity}<br>
        주문 총 가격 :<fmt:formatNumber value="${orderItem.orderPrices}" pattern="#,###,###,###"/>원<br>
        <br>
    </c:forEach>
    <hr>

    <hr>
    <a href="/shop">Shop Main Page</a>
</div>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>