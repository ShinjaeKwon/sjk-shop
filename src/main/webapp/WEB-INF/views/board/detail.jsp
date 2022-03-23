<%@ page language="java" contentType="text/html; carset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <table class="table table-hover">

        <h1>${board.title}</h1>
        <br>
        <tbody>
        <tr>
            <th>작성자</th>
            <td>${board.user.username}</td>
        </tr>
        <tr>
            <th>작성시간</th>
            <fmt:formatDate var="date" value="${board.createDate}" pattern="YY.MM.dd HH:MM"/>
            <td>${date}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.count}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3">
                ${board.content}
            </td>
        </tr>
        </tbody>
    </table>

    <button id="btn-update" class="btn btn-success">Edit Post</button>
    <button id="btn-delete" class="btn btn-danger">Delete Post</button>
</div>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>