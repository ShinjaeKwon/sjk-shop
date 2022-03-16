<%@ include file="../layout/header.jsp" %>

<div class="container">
    <form>
        <div class="form-group">
            <label for="name">name:</label>
            <input type="text" class="form-control" placeholder="Enter name" id="name">
        </div>
        <div class="form-group">
            <label for="username">ID:</label>
            <input type="text" class="form-control" placeholder="Enter ID" id="username">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" id="password">
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" placeholder="Enter phone" id="phone">
        </div>
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" placeholder="Enter email" id="email">
        </div>
        <div class="form-group">
            <label for="address">address:</label>
            <input type="text" class="form-control" placeholder="Enter address" id="address">
        </div>
    </form>
    <button id="btn-save" class="btn btn-primary">Sign Up</button>
</div>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>