<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="layout/header.jsp" %>

<style>
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

    #img {
        padding-top: 10px;
    }
</style>

<div class="container">
    <h3 style="text-align: left;">✔ 베스트 상품 </h3>
    <hr>
    <br>
    <c:forEach var="item" items="${items}">
        <div class="border">
            <div id="img">${item.img}</div>
            <h4>${item.name}</h4>
            <h6>가격 : ${item.price}원</h6>
            <a id="sbtn" href="/shop/${item.id}" class="btn btn-primary">상세상품보기</a>
        </div>
    </c:forEach>
</div>

<%@ include file="layout/footer.jsp" %>