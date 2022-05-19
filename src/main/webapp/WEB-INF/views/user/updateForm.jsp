<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <form>
        <input type="hidden" id="id" value="${principal.user.id}">
        <div class="form-group">
            <label for="name">name:</label>
            <input type="text" value="${principal.user.name}" class="form-control" placeholder="Enter name" id="name"
                   readonly>
        </div>
        <div class="form-group">
            <label for="username">ID:</label>
            <input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter ID"
                   id="username" readonly>
        </div>
        <div class="form-group">
            <label for="password">Change Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" id="password">
        </div>

        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" value="${principal.user.phone}" class="form-control" placeholder="Enter phone" id="phone"
                   readonly>
        </div>
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" value="${principal.user.email}" class="form-control" placeholder="Enter email"
                   id="email">
        </div>
        <div class="form-group">
            <label for="address">address:</label>
            <input type="text" value="${principal.user.address}" class="form-control" placeholder="Enter address"
                   id="address" readonly>
        </div>
    </form>
    <button id="btn-update" class="btn btn-primary">Edit</button>
    <button class="btn btn-danger" onclick="index.delete(${principal.user.id})">Withdrawal</button>
</div>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>