<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<style>
    .sbtn {
        background-color: #9AA4FF;
        border: none;
    }
</style>
<div class="container">
    <form action="/auth/loginProc" method="post">
        <c:if test="${param.error != null }">
            <script type="text/javascript" charset="utf-8">
                alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            </script>
        </c:if>
        <div class="form-group">
            <label for="username">ID:</label>
            <input type="text" name="username" class="form-control" placeholder="Enter ID" id="username">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" id="password">
        </div>

        <button type="btn-login" class="btn btn-primary sbtn">Sign In</button>
    </form>

</div>

<%@ include file="../layout/footer.jsp" %>