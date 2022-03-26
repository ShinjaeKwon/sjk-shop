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
        <form>
            <input type="hidden" id="boardId" value="${board.id}">
            <input type="hidden" id="userId" value="${principal.user.id}">
            <div class="card-body">
                <textarea id="reply-content" class="form-control" rows="1"></textarea>
            </div>
            <div class="card-footer">
                <button type="button" id="btn-reply-save" class="btn btn-primary">Post Comment</button>
            </div>
        </form>
    </div>
    <br>
    <div class="card">
        <div class="card-header">Comment</div>
        <ul id="reply-box" class="list-group">
            <c:forEach var="reply" items="${board.replies}">
                <li id="reply-${reply.id}" class="list-group-item d-flex justify-content-between">
                    <div>${reply.content}</div>
                    <div class="d-flex">
                        <div class="font-italic">Username : ${reply.user.username}&nbsp;</div>
                        <c:choose>
                            <c:when test="${reply.user.id == principal.user.id}">
                                <button onclick="index.replyDelete(${board.id}, ${reply.id})" class="badge">Delete
                                </button>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>