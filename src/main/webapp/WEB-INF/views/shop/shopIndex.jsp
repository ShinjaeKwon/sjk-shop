<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h2>Shop</h2>
    <p>상점 입니다.</p>
    <a href="/shop/saveItem" class="btn btn-info" role="button">Add Item</a>
    <a class="btn btn-warning" role="button" href="/shop/cart/${principal.user.id}">My Cart</a>
    <a class="btn btn-primary" role="button" href="/shop/orderList/${principal.user.id}">My Orders</a>

    <br><br>

    <div>
        <ul style="list-style: none;">
            <c:forEach var="item" items="${items.content}">
                <li>
                    <div>${item.img}
                        <h4>${item.name}</h4>
                        <a href="/shop/${item.id}" class="btn btn-primary">상세상품보기</a>
                    </div>
                </li>
                <br>
            </c:forEach>
        </ul>
    </div>
    <br>
    <ul class="pagination justify-content-center ">
        <c:choose>
            <c:when test="${items.first}">
                <li class="page-item disabled"><a class="page-link" href="?page=${items.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${items.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${items.last}">
                <li class="page-item disabled"><a class="page-link" href="?page=${items.number+1}">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${items.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<%@ include file="../layout/footer.jsp" %>