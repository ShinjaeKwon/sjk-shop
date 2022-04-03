<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <form>
        Name
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter name" id="name">
        </div>
        <div class="form-group">
            Image
            <textarea class="form-control summernote" rows="5" id="img"></textarea>
        </div>
        <div class="form-group">
            Price
            <input type="text" class="form-control" placeholder="Enter price" id="price">
        </div>
        <div class="form-group">
            StockQuantity
            <input type="number" min="0" max="999" class="form-control" id="stockQuantity">
        </div>
        Category
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <select name="category">
            <c:forEach var="category" items="${categories}">
                <option value="${category.name}">${category.name}</option>
            </c:forEach>
        </select>
        <input type="hidden" id="userId" value="${principal.user.id}">
    </form>
    <br><br>
    <button id="btn-save" class="btn btn-primary">Add Item</button>
</div>

<script>
    $('.summernote').summernote({
        height: 150,
        maximumImageFileSize: 1572864
    });
</script>
<script src="/js/item.js"></script>
<%@ include file="../layout/footer.jsp" %>