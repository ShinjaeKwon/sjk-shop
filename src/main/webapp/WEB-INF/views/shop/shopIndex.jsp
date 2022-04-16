<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<head>
    <title>지니마켓 상품 페이지</title>
    <link rel="stylesheet" href="/css/user.css">
    <style>
        .upd {
            text-align: center;
        }

        #additem, .sbtn {
            background-color: #9AA4FF;
            border: none;
        }

        .sbtn {
            margin-bottom: 30px;
        }
    </style>
</head>


<div class="container">
    <div class="upd">
        <h1>Genie Market Shop</h1>
        <p>상품은 매주 일요일마다 업데이트됩니다!</p>
        <c:if test="${principal.user.role == 'ADMIN' || principal.user.role == 'SELLER'}">
            <a id="additem" href="/shop/saveItem" class="btn btn-info" role="button">Add Item</a>
        </c:if>
        <a class="btn btn-warning" role="button" href="/shop/cart">My Cart</a>
        <a class="btn btn-primary" role="button" href="/shop/orderList/${principal.user.id}">My Orders</a>
    </div>
    <br><br>

    <%-- 상품 한개 --%>
    <div class="shopitem">
        <ul style="list-style: none; text-align: center;">
            <c:forEach var="item" items="${items.content}">
                <li>
                    <div>
                            ${item.img}
                        <h4>${item.name}</h4>
                        <h6>가격 : ${item.price}원</h6>
                        <a href="/shop/${item.id}" class="btn btn-primary sbtn">상세상품보기</a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <%-- 상품 한개 --%>
    <br>
    <ul class="pagination justify-content-center ">
        <c:choose>
            <c:when test="${items.first}">
                <li class="page-item disabled"><a class="page-link" href="?page=${items.number-1}">이전 페이지</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${items.number-1}">이전 페이지</a></li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${items.last}">
                <li class="page-item disabled"><a class="page-link" href="?page=${items.number+1}">다음 페이지</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${items.number+1}">다음 페이지</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<%@ include file="../layout/footer.jsp" %>