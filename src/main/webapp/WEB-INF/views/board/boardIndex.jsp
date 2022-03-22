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
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boards}">

        <tr>
            <td>${board.user.username}</td>
            <td>${board.title}</td>
            <td>${board.createDate}</td>
            <td><a href="#">detail</a></td>
        </tr>
        </c:forEach>


        </tbody>
    </table>
</div>

<%@ include file="../layout/footer.jsp" %>