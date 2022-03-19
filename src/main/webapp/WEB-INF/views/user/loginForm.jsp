<%@ include file="../layout/header.jsp" %>

<div class="container">
    <form action="#" method="post">
        <div class="form-group">
            <label for="username">ID:</label>
            <input type="text" name="username" class="form-control" placeholder="Enter ID" id="username">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" id="password">
        </div>

        <div class="form-group form-check">
            <label class="form-check-label">
                <input name="remember" class="form-check-input" type="checkbox"> Remember me
            </label>
        </div>
        <button type="btn-login" class="btn btn-primary">Sign In</button>
    </form>

</div>

<%@ include file="../layout/footer.jsp" %>