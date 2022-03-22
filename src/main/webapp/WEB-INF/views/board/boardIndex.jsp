<%@ page language="java" contentType="text/html; carset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h2>Board</h2>
    <p>게시판 입니다.</p>
    <div>
        <a href="/board/saveForm" class="btn btn-info" role="button">Write</a>
        </br>
        </br>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Title</th>
            <th>Date</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td>John</td>
            <td>안녕zdddddasdasdasdasdasda</td>
            <td>xxxx:xxxx:xxxx</td>
            <td><a href="#">detail</a></td>
        </tr>

        <tr>
            <td>Mary</td>
            <td>Moe</td>
            <td>mary@example.com</td>
            <td><a href="#">detail</a></td>
        </tr>

        <tr>
            <td>July</td>
            <td>Dooley</td>
            <td>july@example.com</td>
            <td><a href="#">detail</a></td>
        </tr>

        </tbody>
    </table>
</div>

<%@ include file="../layout/footer.jsp" %>