<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h2>${user.username}'s Information</h2><br>
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br>
    <br>
    <div class="card" style="width:400px">
        <div class="card-body">
            <p class="card-text">ID : ${user.id}</p>
            <p class="card-text">Name : ${user.name}</p>
            <p class="card-text">Username : ${user.username}</p>
            <p class="card-text">Phone : ${user.phone}</p>
            <p class="card-text">Email : ${user.email}</p>
            <p class="card-text">Address : ${user.address}</p>
            <p class="card-text">Role : ${user.role}</p>
            <fmt:formatDate var="date" value="${user.createDate}" pattern="YYYY.MM.dd"/>
            <p class="card-text">Create Date : ${date}</p>
            <c:choose>
                <c:when test="${principal.user.role == 'ADMIN'}">
                    <form>
                        <input type="hidden" id="id" value="${user.id}">
                        <select name="role">
                            <option value="user">USER</option>
                            <option value="seller">SELLER</option>
                            <option value="admin">ADMIN</option>
                        </select>
                    </form>
                    <br>
                    <button id="change-role" class="btn btn-primary">Change Role</button>
                </c:when>
                <c:otherwise></c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<br>
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
<%@ include file="../layout/footer.jsp" %>