<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<br>
<div class="container">
    <h2>주문 목록</h2>
    <b>
        BEFORE : 주문 완료&nbsp;&nbsp;&nbsp;
        CONFIRM : 주문 확정&nbsp;&nbsp;&nbsp;
        SHIPPING : 배송 중&nbsp;&nbsp;&nbsp;
        COMPLETED : 주문 확정&nbsp;&nbsp;&nbsp;
        CANCEL : 주문 취소&nbsp;&nbsp;&nbsp;
    </b>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Order Date</th>
            <th>Order Detail</th>
            <th>Order State</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders.content}">
            <tr>
                <fmt:formatDate var="date" value="${order.orderDate}" pattern="YY.MM.dd HH:mm:ss"/>
                <td>${date}</td>
                <td><a href="/orderDetail/${order.id}">detail</a></td>
                <td><b>${order.status}</b></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination justify-content-center ">
        <c:choose>
            <c:when test="${orders.first}">
                <li class="page-item disabled"><a class="page-link" href="?page=${orders.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${orders.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${orders.last}">
                <li class="page-item disabled"><a class="page-link" href="?page=${orders.number+1}">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${orders.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

</div>


<script src="/js/user.js"></script>
<%@ include file="../../layout/footer.jsp" %>