<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<head>
    <title>상품 상세 정보</title>
    <link rel="stylesheet" href="/css/user.css">
    <style>
        * {
            box-sizing: border-box;
        }

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

        .container {
            position: relative;
            margin-top: 300px;
        }

        #item_img {
            position: absolute;
            top: -100%;
        }

        .previous {
            position: absolute;
            top: -120%;
        }

        .review {
            font-family: Arial;
            margin: 0 auto; /* Center website */
            max-width: 800px; /* Max width */
            padding: 20px;
        }

        .heading {
            font-size: 25px;
            margin-right: 25px;
        }

        .fa {
            font-size: 25px;
        }

        .checked {
            color: orange;
        }

        /* Three column layout */
        .side {
            float: left;
            width: 15%;
            margin-top: 10px;
        }

        .middle {
            margin-top: 10px;
            float: left;
            width: 70%;
        }

        /* Place text to the right */
        .right {
            text-align: right;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* The bar container */
        .bar-container {
            width: 100%;
            background-color: #f1f1f1;
            text-align: center;
            color: white;
        }

        /* Individual bars */
        .bar-5 {
            width: 60%;
            height: 18px;
            background-color: #04AA6D;
        }

        .bar-4 {
            width: 30%;
            height: 18px;
            background-color: #2196F3;
        }

        .bar-3 {
            width: 10%;
            height: 18px;
            background-color: #00bcd4;
        }

        .bar-2 {
            width: 4%;
            height: 18px;
            background-color: #ff9800;
        }

        .bar-1 {
            width: 15%;
            height: 18px;
            background-color: #f44336;
        }

        /* Responsive layout - make the columns stack on top of each other instead of next to each other */
        @media (max-width: 400px) {
            .side, .middle {
                width: 100%;
            }

            .right {
                display: none;
            }
        }

        #sbtn {
            background-color: #9AA4FF;
            border: none;
            margin-bottom: 10px;
        }
    </style>
</head>

<div class="container">
    <button class="btn btn-secondary previous" onclick="history.back()">Previous Page</button>
    <div class="item"> <%-- 상품 정보 --%>
        <div id="item_img">
            ${item.img}<br>
        </div>
        <div class="all_item">
            <h2>${item.name}</h2>
            <hr>
            가격 : ${item.price}원 <br>
            <hr>
            카테고리 : ${item.category.name}<br>
            <hr>
            등록자 : ${item.user.name}<br>
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
                <input type="submit" value="주문">
            </div>

            <button type="button" id="btn-wish sbtn">Add Wish List</button>
        </form>
    </div>
</div>
<div class="review">
    <span class="heading">사용자 평점</span>
    <span class="fa fa-star checked"></span>
    <span class="fa fa-star checked"></span>
    <span class="fa fa-star checked"></span>
    <span class="fa fa-star checked"></span>
    <span class="fa fa-star"></span>
    <p>리뷰수 : 113 / 사용자 총 평점 4.1/5</p>
    <hr style="border:3px solid #f1f1f1">

    <div class="row">
        <div class="side">
            <div>★★★★★</div>
        </div>
        <div class="middle">
            <div class="bar-container">
                <div class="bar-5"></div>
            </div>
        </div>
        <div class="side right">
            <div>150</div>
        </div>
        <div class="side">
            <div>★★★★</div>
        </div>
        <div class="middle">
            <div class="bar-container">
                <div class="bar-4"></div>
            </div>
        </div>
        <div class="side right">
            <div>63</div>
        </div>
        <div class="side">
            <div>★★★</div>
        </div>
        <div class="middle">
            <div class="bar-container">
                <div class="bar-3"></div>
            </div>
        </div>
        <div class="side right">
            <div>15</div>
        </div>
        <div class="side">
            <div>★★</div>
        </div>
        <div class="middle">
            <div class="bar-container">
                <div class="bar-2"></div>
            </div>
        </div>
        <div class="side right">
            <div>6</div>
        </div>
        <div class="side">
            <div>★</div>
        </div>
        <div class="middle">
            <div class="bar-container">
                <div class="bar-1"></div>
            </div>
        </div>
        <div class="side right">
            <div>20</div>
        </div>
    </div>
</div>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>