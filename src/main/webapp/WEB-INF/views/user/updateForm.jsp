<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<head>
    <style>
        .container {
            border: 2px solid #999999;
            border-radius: 5px;
        }

        .sbtn {
            background-color: #9AA4FF;
            border: none;
        }
    </style>
</head>
<Br>
<h2 style="text-align: center">🔮 MY PAGE 🔮</h2><Br>
<div class="container"><br>
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

        <div class="form-group">
            <label for="account">account:</label>
            <select name="bank_name">
                <option value="">은행명을 선택하세요</option>
                <option value="경남은행">경남은행</option>
                <option value="광주은행">광주은행</option>
                <option value="국민은행">국민은행</option>
                <option value="기업은행">기업은행</option>
                <option value="농협중앙회">농협중앙회</option>
                <option value="농협회원조합">농협회원조합</option>
                <option value="대구은행">대구은행</option>
                <option value="도이치은행">도이치은행</option>
                <option value="부산은행">부산은행</option>
                <option value="산업은행">산업은행</option>
                <option value="상호저축은행">상호저축은행</option>
                <option value="새마을금고">새마을금고</option>
                <option value="수협중앙회">수협중앙회</option>
                <option value="신한금융투자">신한금융투자</option>
                <option value="신한은행">신한은행</option>
                <option value="신협중앙회">신협중앙회</option>
                <option value="외환은행">외환은행</option>
                <option value="우리은행">우리은행</option>
                <option value="우체국">우체국</option>
                <option value="전북은행">전북은행</option>
                <option value="제주은행">제주은행</option>
                <option value="카카오뱅크">카카오뱅크</option>
                <option value="케이뱅크">케이뱅크</option>
                <option value="하나은행">하나은행</option>
                <option value="한국씨티은행">한국씨티은행</option>
                <option value="HSBC은행">HSBC은행</option>
                <option value="SC제일은행">SC제일은행</option>
            </select>
            <input type="text" id="account" placeholder="계좌번호를 입력해주세요">
        </div>
        🏧 현재 등록 계좌 :
        ${principal.user.account}<br><br>
    </form>
    <button id="btn-update" class="btn btn-primary sbtn">Edit</button>
    <button class="btn btn-danger" style="border: none" onclick="index.delete(${principal.user.id})">Withdrawal</button>
    <br><br>
</div>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>