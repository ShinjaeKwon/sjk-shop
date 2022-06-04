<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<head>
    <style>
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        section.notice {
            padding: 80px 0;
        }

        .page-title {
            margin-bottom: 60px;
        }

        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }

        #board-search .search-window {
            padding: 15px 0;
            background-color: #f9f7f9;
        }

        #board-search .search-window .search-wrap {
            position: relative;
            /*   padding-right: 124px; */
            margin: 0 auto;
            width: 80%;
            max-width: 564px;
        }

        #board-search .search-window .search-wrap input {
            height: 40px;
            width: 100%;
            font-size: 14px;
            padding: 7px 14px;
            border: 1px solid #ccc;
        }

        #board-search .search-window .search-wrap input:focus {
            border-color: #333;
            outline: 0;
            border-width: 1px;
        }

        #board-search .search-window .search-wrap .btn {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            width: 108px;
            padding: 0;
            font-size: 16px;
        }

        .board-table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .board-table th {
            text-align: center;
        }

        .board-table .th-num {
            width: 100px;
            text-align: center;
        }

        .board-table .th-date {
            width: 200px;
        }

        .board-table th, .board-table td {
            padding: 14px 0;
        }

        .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }

        .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }

        .board-table tbody th p {
            display: none;
        }

        .btn {
            display: inline-block;
            padding: 0 30px;
            font-size: 15px;
            font-weight: 400;
            background: transparent;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            text-transform: uppercase;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            -ms-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
        }

        .btn-dark {
            background: #555;
            color: #fff;
        }

        .btn-dark:hover, .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
        }

        .btn-dark {
            background: #555;
            color: #fff;
        }

        .btn-dark:hover, .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
        }

        /* reset */

        * {
            list-style: none;
            text-decoration: none;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .clearfix:after {
            content: '';
            display: block;
            clear: both;
        }

        .container {
            width: 1100px;
            margin: 0 auto;
        }

        .blind {
            position: absolute;
            overflow: hidden;
            clip: rect(0 0 0 0);
            margin: -1px;
            width: 1px;
            height: 1px;
        }

        .write {
            background: #555;
            color: #fff;
            padding: 10px;
            position: absolute;
            left: 78%;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul, li {
            list-style: none;
        }

        .notify-wrap {
            position: relative;
            background: #dcdddd;
        }

        .notify-wrap-inner {
            height: 40px;
            line-height: 40px;
            padding: 0 20px;
            margin: 0 30px;
            background: #dcdddd;
            text-align: center;
        }

        .ellipsis {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .notify-scroll {
            display: inline-block;
            animation: text-scroll 35s linear infinite;
        }

        @keyframes text-scroll {
            from {
                transform: translateX(20%);
                -moz-transform: translateX(20%);
                -webkit-transform: translateX(20%);
                -o-transform: translateX(20%);
                -ms-transform: translateX(20%);
            }
            to {
                transform: translateX(-100%);
                -moz-transform: translateX(-100%);
                -webkit-transform: translateX(-100%);
                -o-transform: translateX(-100%);
                -ms-transform: translateX(-100%);
            }
    </style>
</head>
<section class="notify-wrap">
    <div class="notify-wrap-inner ellipsis">
        <div class="notify-scroll">
            <ul>
                <li>
                    <a href="javascript:void(0)">[공지] 6월 15일 수요일 오후 11:30 부터 목요일 오전 12:30 까지 서버 점검이 있습니다.</a>
                </li>
            </ul>
        </div>
    </div>
</section>
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3 style="font-weight: bold;">🔮지니마켓 공지사항🔮</h3>
            <h6 style="text-align: center;">지니마켓의 새로운 소식과 유용한 정보들을 한곳에서 확인하세요.</h6>
        </div>
    </div>
    <div>
        <a href="/board/saveForm" class="write" role="button">Write</a>
        </br>
        </br>
    </div>
    <br>
    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-writer">작성자</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-count">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="board" items="${boards.content}">
                    <tr>
                        <td><span id="id">${board.id}</span></td>
                        <td>${board.user.username}</td>
                        <td><a href="/board/${board.id}">${board.title}</a></td>
                        <fmt:formatDate var="date" value="${board.createDate}" pattern="YY.MM.dd HH:MM"/>
                        <td>${date}</td>
                        <td>${board.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <br>
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
</section>

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