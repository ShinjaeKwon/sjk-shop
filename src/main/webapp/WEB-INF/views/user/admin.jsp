<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>


<div class="container">
    <h2>User Management</h2>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Username</th>
            <th>Role</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users.content}">
            <tr>
                <td>${user.name}</td>
                <td>${user.username}</td>
                <td>${user.role}</td>
                <td><a href="user/detail/${user.id}">detail</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination justify-content-center ">
        <c:choose>
            <c:when test="${users.first}">
                <li class="page-item disabled"><a class="page-link" href="?page=${users.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${users.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${users.last}">
                <li class="page-item disabled"><a class="page-link" href="?page=${users.number+1}">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${users.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<br>
<div class="container">
    <h2>Category Management</h2>
    <form>
        <input type="text" width="30" id="category">
        <button id="btn-category-save" class="btn btn-primary">Add Category</button>
    </form>

    <h4>Category List</h4>
    <ul>
        <c:forEach var="category" items="${categories}">
            <li>${category.name}</li>
        </c:forEach>
    </ul>


</div>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>