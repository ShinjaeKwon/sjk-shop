<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <div class="container">
        <form action="/search" class="needs-validation" novalidate method="get">
            <div class="form-group" style="width: 50%; margin-left: 20%">
                <input name="keyword" type="text" class="form-control" placeholder="게시글 검색어를 입력해주세요." required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">게시글 검색어를 입력해주세요.</div>
                <br>
                <button type="submit" class="btn btn-primary">검색</button>
            </div>

        </form>
    </div>
</div>

<script>
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

<%@ include file="../layout/footer.jsp" %>