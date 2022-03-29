<%@ page language="java" contentType="text/html; carset=UTF-8" pageEncoding="UTF-8" %>

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


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>