<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    .sbtn {
        background-color: #9AA4FF;
        border: none;
    }
</style>
<h3 style="text-align: center; font-weight: bold;">🔮지니마켓 회원가입🔮</h3>
<h6 style="text-align: center">지니마켓의 회원이 되어주셔서 감사합니다!</h6>
<hr>
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
            address:
            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" readonly>
            <input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" readonly>
            <span id="guide" style="color:#999;display:none"></span>
            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소">
            <input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" style="display: none">

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample4_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            var roadAddr = data.roadAddress;
                            var extraRoadAddr = '';

                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }

                            document.getElementById('sample4_postcode').value = data.zonecode;
                            document.getElementById("sample4_roadAddress").value = roadAddr;
                            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                            if (roadAddr !== '') {
                                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                            } else {
                                document.getElementById("sample4_extraAddress").value = '';
                            }

                            var guideTextBox = document.getElementById("guide");
                            if (data.autoRoadAddress) {
                                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                guideTextBox.style.display = 'block';

                            } else if (data.autoJibunAddress) {
                                var expJibunAddr = data.autoJibunAddress;
                                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                guideTextBox.style.display = 'block';
                            } else {
                                guideTextBox.innerHTML = '';
                                guideTextBox.style.display = 'none';
                            }
                        }
                    }).open();
                }
            </script>
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
            <input type="text" id="account" placeholder="숫자만 입력해주세요">
        </div>
    </form>
    <button id="btn-save" class="btn btn-primary sbtn">Sign Up</button>
</div>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>