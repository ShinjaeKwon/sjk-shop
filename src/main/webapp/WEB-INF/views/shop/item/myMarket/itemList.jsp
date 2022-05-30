<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../../layout/header.jsp" %>


<div class="container">
    <h2>My Item</h2>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Item ID</th>
            <th>Item Detail</th>
            <th>StockQuantity</th>
            <th>Add StockQuantity</th>
            <th>Sub StockQuantity</th>
            <th>Orders</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
            <tr>
                <td>${item.id}</td>
                <td><a href="/shop/${item.id}">detail</a></td>
                <td>${item.stockQuantity}</td>
                <td>
                    <form id="addQuantity" method="POST" action="/api/item/addStockQuantity/${item.id}">
                        <input type="number" value="1" min="1" max="999999" name="addStock" id="addStock" required>&nbsp;
                        <input type="submit" id="postAdd" value="Add StockQuantity"></input>
                    </form>

                <td>
                    <form id="subQuantity" method="POST" action="/api/item/subStockQuantity/${item.id}">
                        <input type="number" value="1" min="1" max="999999" name="subStock" id="subStock" required>&nbsp;
                        <input type="submit" id="postSub" value="Sub StockQuantity"></input>
                    </form>
                </td>
                <td><a href="/shop/${item.id}/orders">Orders</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>


<script src="/js/user.js"></script>
<%@ include file="../../../layout/footer.jsp" %>