<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<head>
    <style>
        .border1 {
            border: 3px solid #999999;
            padding: 15px;
            width: 430px;
            margin-left: 30%;
        }
        .border1 h3 {
            text-align: center;
        }
        .shopitem {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
        }
        .border {
            border-color: dimgrey;
            border-style: outset;
            margin-bottom: 10px;
            margin-left: 30px;
            margin-top: 10px;
            padding: 0 20px;
            text-align: center;
            flex: none;
        }
    </style>
</head>


<div class="container">
    <h2 style="text-align: center;">🔮주문 완료🔮</h2>
    <hr>

    <div class="border1">
        <h3>구매자 정보</h3>
        ▷ 주문자 이름 : ${order.user.name} 님<br>
        ▷ 연락처 : ${order.user.phone}<br>
        ▷ 배송 주소 : ${order.user.address}<br>
        ▷ 주문 요청 사항 : ${order.requests}<br>
    </div>

    <div class="shopitem">
        <div class="border">
            <br>
            <h3>상품 정보</h3>
            <c:forEach var="orderItem" items="${order.orderItems}">
                ${orderItem.item.img}
            <div class="name" style="text-align: left;"> ▶ 상품 이름 : ${orderItem.item.name}<br>
                ▶ 주문 수량 : ${orderItem.orderQuantity}개<br></div>
            <br>
        </div>
        </c:forEach>
    </div>
    <br>
    <br>
    <hr>
    <div class="total" style="text-align: center; font-weight: bold;"> ✔ 주문 총 가격 :<fmt:formatNumber value="${order.prices}" pattern="#,###,###,###"/>원<br></div>
    <hr><br>
    <a href="/shop" style="background-color: #9AA4FF; color: #333333; padding: 10px 20px; border-radius: 5px; font-weight: bolder; margin-left: 43%;">Shop Main Page</a>
</div><br>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>