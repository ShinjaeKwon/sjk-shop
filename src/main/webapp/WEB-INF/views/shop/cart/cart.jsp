<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>
<head>
    <style>
        .sbtn {
            background-color: #9AA4FF;
            border: none;
            margin-bottom: 10px;
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

        .shopitem {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
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
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <button class="btn btn-danger" onclick="index.deleteAllCart()">Delete All Items</button>
    <br>
    <br>
    <div class="border"
         style="border: 3px solid #9AA4FF; width: 250px; text-align: center; margin-right: auto; margin-left: auto;">
        장바구니 안에 물건 총 수량 : ${cart.count}개<br>
        주문자 : ${cart.user.name}님<br></div>
    <br>
    <form method="post" action="/order/confirm">
        <div class="shopitem">
            <c:forEach var="cartItem" items="${cartItems}">
                <c:if test="${cartItem.stockQuantity > 0}">
                    <div class="border">
                        <div id="img">${cartItem.item.img}</div>
                        <h5>상품 이름 : ${cartItem.item.name}</h5>
                        <h6>가격 : ${cartItem.item.price}원</h6>
                        <h6>수량 : ${cartItem.stockQuantity}개</h6>
                        <h6>총 가격 : <fmt:formatNumber value="${cartItem.item.price * cartItem.stockQuantity}"
                                                     pattern="#,###,###,###"/>원<br></h6>
                        <button type="button" onclick="index.deleteItemCart(${cartItem.item.id})"
                                style="background-color: #f44336">
                            Delete
                        </button>
                        <br><br>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <input type="hidden" id="cartId" value="${cart.id}">
        <input type="submit" value="주문"
               style="background-color: #9AA4FF; border:2px solid #C9C9C9;border: none; border-radius: 3px; padding: 8px;">
    </form>

</div>

<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>