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
        <h2>${item.name}</h2><hr>
            🔹 가격 : ${item.price}원 <br><hr>
            🔹 재고수량 : ${item.stockQuantity}개<br>
            🔹 카테고리 : ${item.category.name}<br><hr>
            🔹 등록자 :  ${item.user.name}<br>
        </div>
    </div>
    <div class="under">
    <br>
    <%--delete 조건문 --%>
    <c:if test="${principal.user.id eq item.user.id}">
        <button id="btn-delete" class="btn btn-danger">Delete Post</button>
    </c:if>
    <%-- 회원 주문 --%>
    <form>
        <div class="form-group">
            StockQuantity :
            <input type="number" min="0" max="${item.stockQuantity}" id="stockQuantity">
            <input type="hidden" id="userId" value="${principal.user.id}">
            <input type="hidden" id="itemId" value="${item.id}">
        </div>
    </form>
        <button id="btn-wish">Add Wish List</button>
        <button id="btn-order">Order</button>
    </div>
</div>

<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>