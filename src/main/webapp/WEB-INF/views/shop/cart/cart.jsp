<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br>
    <br>
    장바구니 안에 물건 총 수량 : ${cart.count}<br>
    주문자 : ${cart.user.name}<br>
    <form>
        <div>
            <ul>
                <c:forEach var="cartItem" items="${cart.cartItems}">
                    <li>
                        <div>

                            <h5>상품 이름 : ${cartItem.item.name}</h5>
                                ${cartItem.item.img}
                                수량 : ${cartItem.stockQuantity}<br>
                            총 가격 :
                            <fmt:formatNumber value="${cartItem.item.price * cartItem.stockQuantity}"
                                              pattern="#,###,###,###"/> <br>
                        </div>

                        <button type="button" onclick="index.deleteItemCart(${cartItem.item.id})">
                            Delete
                        </button>
                    </li><br>
                </c:forEach>
            </ul>
        </div>
        <input type="hidden" id="cartId" value="${cart.id}">
    </form>
    <button onclick="index.deleteAllCart()">Delete All Items</button>
    <button id="order-in-cart">Order</button>

</div>

<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>