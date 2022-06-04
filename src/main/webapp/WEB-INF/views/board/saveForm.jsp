<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<head>
    <link rel="stylesheet" href="/css/user.css">
    <style>
        .sbtn {
            background-color: #9AA4FF;
            border: none;
            margin-bottom: 10px;
        }
    </style>
</head>
<h3 style="text-align: center">글 작성</h3>
<hr>
<div class="container">
    <form>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter title" id="title">
        </div>

        <div class="form-group">
            <textarea class="form-control summernote" rows="5" id="content"></textarea>
        </div>
    </form>
    <button id="btn-save" class="btn btn-primary sbtn">Writing</button>
</div>

<script>
    $('.summernote').summernote({
        tabsize: 2,
        height: 300
    });
</script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>