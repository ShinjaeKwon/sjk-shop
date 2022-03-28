<%@ page language="java" contentType="text/html; carset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h2>Shop</h2>
    <p>상점 입니다.</p>
    <table class="table table-striped">
        <thead>
        <tr>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%--        <c:forEach var="item" items="${items.content}">--%>
        <tr>
            <td>${item.image}이미지</td>
        </tr>
        <tr>
            <td>${item.name}이름</td>
        </tr>
        <tr>
            <td>${item.price}가격</td>
        </tr>
        <tr>
            <td><a href="#">detail</a></td>
        </tr>
        <%--        </c:forEach>--%>

        </tbody>
    </table>
    <ul class="pagination justify-content-center ">
        <c:choose>
            <c:when test="${boards.first}">
                <li class="page-item disabled"><a class="page-link" href="?page=${boards.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${boards.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${boards.last}">
                <li class="page-item disabled"><a class="page-link" href="?page=${boards.number+1}">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${boards.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<%@ include file="../layout/footer.jsp" %>