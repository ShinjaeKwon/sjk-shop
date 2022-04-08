<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

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
                            총 가격 :
                            <fmt:formatNumber value="${cartItem.item.price * cartItem.stockQuantity}"
                                              pattern="#,###,###,###"/> <br>
                        </div>
                        <button>Delete</button>
                    </li>
                    <br>
                </c:forEach>
            </ul>
        </div>
        <input type="hidden" id="userId" value="${principal.user.id}">
        <button id="delete-all-cart" onclick="index.deleteAllCart(${principal.user.id})">Delete All Items</button>
        <button>Order</button>
    </form>


</div>

<script src="/js/item.js"></script>
<%@ include file="../layout/footer.jsp" %>