<%@ page language="java" contentType="text/html; carset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h2>Board</h2>
    <p>게시판 입니다.</p>
    <div>
        <a href="/board/saveForm" class="btn btn-info" role="button">Write</a>
        </br>
        </br>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Title</th>
            <th>Date</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boards.content}">

        <tr>
            <td>${board.user.username}</td>
            <td>${board.title}</td>
            <fmt:formatDate var="date" value="${board.createDate}" pattern="YY.MM.dd HH:MM"/>
            <td>${date}</td>
            <td><a href="/board/${board.id}">detail</a></td>
        </tr>
        </c:forEach>
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