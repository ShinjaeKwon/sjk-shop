<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<head>
    <title>상품 상세 정보</title>
    <link rel="stylesheet" href="/css/user.css">
    <style>
        #item_img {
            display: block;
            position: relative;
            margin-left: 200px;
            margin-top: 80px;
            max-width: 400px;
            max-height: 400px;
        }

        .all_item {
            display: block;
            position: relative;
            margin-left: 700px;
            line-height: 1.8;
            letter-spacing: 3px;
            top: -220px;
        }

        .under {
            margin-top: -210px;
            margin-left: 700px;
            padding-bottom: 50px;
        }
    </style>
</head>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <div class="item"> <%-- 상품 정보 --%>
        <div id="item_img">
            ${item.img}<br>
        </div>
        <div class="all_item">
            <h2>${item.name}</h2>
            <hr>
            🔹 가격 : ${item.price}원 <br>
            <hr>
            🔹 카테고리 : ${item.category.name}<br>
            <hr>
            🔹 등록자 : ${item.user.name}<br>
        </div>
    </div>
    <div class="under">
        <br>
        <c:if test="${principal.user.id eq item.user.id}">
            <button onclick="index.deleteItem(${item.id})" class="btn btn-danger">Delete Item</button>
        </c:if>
        <form method="post" action="/order/confirm">
            <div class="form-group">
                StockQuantity :
                <input type="number" name="stockQuantity" value="0" min="1" max="${item.stockQuantity}"
                       id="stockQuantity" required>
                <input type="hidden" name="itemId" id="itemId" value="${item.id}">
            </div>
            <input type="submit" value="주문">
            <button id="btn-wish">Add Wish List</button>
        </form>
    </div>
</div>

<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>