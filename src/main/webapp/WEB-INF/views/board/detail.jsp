<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<head>
    <style>
        .sbtn {
            background-color: #9AA4FF;
            border: none;
            margin-bottom: 10px;
        }
    </style>
</head>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br><br>
    <div class="page-title">
        <div class="container">
            <h3 style="font-weight: bold; text-align: center">๐ฎ์ง๋๋ง์ผ ๊ณต์ง์ฌํญ๐ฎ</h3>
            <h6 style="text-align: center;">์ง๋๋ง์ผ์ ์๋ก์ด ์์๊ณผ ์ ์ฉํ ์ ๋ณด๋ค์ ํ๊ณณ์์ ํ์ธํ์ธ์.</h6><Br>
        </div>
    </div>
    <table class="table table-hover">
        No.<span id="id"><i>${board.id}</i></span>
        <h2>${board.title}</h2>
        <br>
        <tbody>
        <tr>
            <th>์์ฑ์</th>
            <td>${board.user.username}</td>
        </tr>
        <tr>
            <th>์์ฑ์๊ฐ</th>
            <fmt:formatDate var="date" value="${board.createDate}" pattern="YY.MM.dd HH:MM"/>
            <td>${date}</td>
        </tr>
        <tr>
            <th>์กฐํ์</th>
            <td>${board.count}</td>
        </tr>
        <tr>
            <th>๋ด์ฉ</th>
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
    <br>
    <br>
    <div class="card">
        <form>
            <input type="hidden" id="boardId" value="${board.id}">
            <input type="hidden" id="userId" value="${principal.user.id}">
            <div class="card-body">
                <textarea id="reply-content" class="form-control" rows="1"></textarea>
            </div>
            <div class="card-footer">
                <button type="button" id="btn-reply-save" class="btn btn-primary sbtn">Post Comment</button>
            </div>
        </form>
    </div>
    <br>
    <div class="card">
        <div class="card-header">Comment</div>
        <ul id="reply-box" class="list-group">
            <c:forEach var="reply" items="${board.replies}">
                <li id="reply-${reply.id}" class="list-group-item d-flex justify-content-between">
                    ๐ฎ์์ฑ์ : ${reply.user.username}
                    <div>${reply.content}</div>

                    <div class="d-flex">
                        <c:if test="${reply.user.id == principal.user.id}">
                            <div>
                                <button onclick="index.replyDelete(${board.id}, ${reply.id})" class="badge">์ญ์ 
                                </button>
                                <button id="btn-edit-reply" class="badge">์์ </button>
                                <div id="edit-reply-box" style="display: none">
                                    <form>
                                        <input type="text" id="edit-reply" value="${reply.content}">
                                    </form>
                                    <button onclick="index.replyEdit(${board.id}, ${reply.id})"
                                            style="background-color: #9AA4FF;">Edit Reply
                                    </button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $("#btn-edit-reply").click(function () {
            $("#edit-reply-box").toggle();
        });
    });
</script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>