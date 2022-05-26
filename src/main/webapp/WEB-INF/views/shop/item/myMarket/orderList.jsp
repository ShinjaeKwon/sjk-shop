<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../../layout/header.jsp" %>


<div class="container">
    <h2>주문 목록</h2>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Order Detail</th>
            <th>Order State</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.id}</td>
                <fmt:formatDate var="date" value="${order.orderDate}" pattern="YY.MM.dd HH:mm:ss"/>
                <td>${date}</td>
                <td><a href="/orderDetail/${order.id}">detail</a></td>
                <td><b>${order.status}</b></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>


<script src="/js/user.js"></script>
<%@ include file="../../../layout/footer.jsp" %>