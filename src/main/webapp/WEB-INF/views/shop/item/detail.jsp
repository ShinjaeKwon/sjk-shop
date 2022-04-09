<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <div> <%-- 상품 정보 --%>
        <h1>${item.name}</h1>
        ${item.img}<br>
        가격 : ${item.price} <br>
        재고 수량 : ${item.stockQuantity}<br>
        카테고리 : ${item.category.name}<br>
        등록자 이름 : ${item.user.name}<br>
    </div>
    <br>
    <c:if test="${principal.user.id eq item.user.id}">
        <button id="btn-delete" class="btn btn-danger">Delete Post</button>
    </c:if>
    <%-- 회원 주문 --%>
    <c:choose>
        <c:when test="${item.stockQuantity == 0}">
            <h2>품절</h2>
        </c:when>
        <c:otherwise>
            <form>
                <div class="form-group">
                    OrderQuantity :
                    <input type="number" min="0" max="${item.stockQuantity}" id="stockQuantity">
                    <input type="hidden" id="userId" value="${principal.user.id}">
                    <input type="hidden" id="maxOrderQuantity" value="${item.stockQuantity}">
                    <input type="hidden" id="itemId" value="${item.id}">
                </div>
            </form>
            <button id="btn-wish">Add Wish List</button>
            <button id="btn-order">Order</button>
        </c:otherwise>
    </c:choose>

</div>

<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>