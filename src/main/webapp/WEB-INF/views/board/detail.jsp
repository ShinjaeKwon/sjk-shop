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
            <h3 style="font-weight: bold; text-align: center">🔮지니마켓 공지사항🔮</h3>
            <h6 style="text-align: center;">지니마켓의 새로운 소식과 유용한 정보들을 한곳에서 확인하세요.</h6><Br>
        </div>
    </div>
    <table class="table table-hover">
        No.<span id="id"><i>${board.id}</i></span>
        <h2>${board.title}</h2>
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
                    🔮작성자 : ${reply.user.username}
                    <div>${reply.content}</div>

                    <div class="d-flex">
                        <c:if test="${reply.user.id == principal.user.id}">
                            <div>
                                <button onclick="index.replyDelete(${board.id}, ${reply.id})" class="badge">삭제
                                </button>
                                <button id="btn-edit-reply" class="badge">수정</button>
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