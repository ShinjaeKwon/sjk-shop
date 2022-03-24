<%@ page language="java" contentType="text/html; carset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br><br>
    <table class="table table-hover">
        No.<span id="id"><i>${board.id}</i></span>
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
    <c:choose>
        <c:when test="${principal.user.id eq board.user.id}">
            <a href="/board/${board.id}/updateForm" class="btn btn-success">Edit Post</a>
            <button id="btn-delete" class="btn btn-danger">Delete Post</button>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <div class="card">
        <div class="card-body"><textarea class="form-control" rows="1"></textarea></div>
        <div class="card-footer">
            <button class="btn btn-primary">Post Comment</button>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header">Comment</div>
        <ul id="comment--box" class="list-group">

            <li id="comment--1" class="list-group-item d-flex justify-content-between">
                <div>댓글 내용</div>
                <div class="d-flex">
                    <div class="font-italic">User : xxx &nbsp;</div>
                    <button class="badge">Delete</button>
                </div>
            </li>

        </ul>
    </div>
</div>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>