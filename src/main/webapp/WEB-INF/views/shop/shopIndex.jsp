<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<head>
    <title>지니마켓 상품 페이지</title>
    <link rel="stylesheet" href="/css/user.css">
    <style>
        .upd {
            text-align: center;
        }

        #additem {
            background-color: #9AA4FF;
            border: none;
        }

        #sbtn {
            background-color: #9AA4FF;
            border: none;
            margin-bottom: 10px;
        }

        .border {
            border-color: dimgrey;
            border-style: outset;
            margin-bottom: 10px;
            margin-left: 50px;
            margin-top: 10px;
            padding: 0 20px;
            text-align: center;
            flex: none;
        }

        .shopitem {
            display: flex;
            flex-wrap: wrap;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
        }

        #img {
            padding-top: 10px;
        }
    </style>
</head>


<div class="container">
    <div class="upd"><br>
        <h1>Genie Market Shop</h1>
        <p>상품은 매주 일요일마다 업데이트됩니다!</p>
        <a id="additem" href="/shop/saveItem" class="btn btn-info" role="button">Add Item</a>
        <a class="btn btn-info" href="/shop/cart">Cart</a>
    </div>
    <br><br>
    <br>
    <br>
    <h3 style="text-align: left;">✔ 신상품</h3>
    <hr>
    <br>
    <%-- 상품 한개 --%>
    <div class="shopitem">
        <c:forEach var="item" items="${items.content}">
            <div class="border">
                <div id="img">${item.img}</div>
                <h4>${item.name}</h4>
                <h6>가격 : ${item.price}원</h6>
                <a id="sbtn" href="/shop/${item.id}" class="btn btn-primary">상세상품보기</a>
            </div>
        </c:forEach>
    </div>

    <br>
    <ul class="pagination justify-content-center ">
        <c:choose>
            <c:when test="${items.first}">
                <li class="page-item disabled"><a class="page-link" href="?page=${items.number-1}">이전 페이지</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${items.number-1}">이전 페이지</a></li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${items.last}">
                <li class="page-item disabled"><a class="page-link" href="?page=${items.number+1}">다음 페이지</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${items.number+1}">다음 페이지</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
    <div class="container">
        <form action="/searchItem" class="needs-validation" novalidate method="get">
            <div class="form-group" style="width: 50%; margin-left: 20%">
                <input name="keyword" type="text" class="form-control" placeholder="상품 검색어를 입력해주세요." required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">게시글 검색어를 입력해주세요.</div>
                <button type="submit" class="btn btn-primary">검색</button>
            </div>

        </form>
    </div>
    <%-- 상품 한개 --%>
    <br><br><br><br>
    <h3 style="text-align: left;">✔ 베스트 상품 </h3>
    <hr>
    <br>

</div>


<%@ include file="../layout/footer.jsp" %>