<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../../layout/header.jsp" %>

<script>
    function requestPay() {
        IMP.init('imp39314507');
        IMP.request_pay({
            pg: 'kcp',
            pay_method: 'kakaopay',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Genie Market', //결제창에서 보여질 이름
            amount: ${orderItem.orderPrices}, //실제 결제되는 가격
            buyer_email: '${order.user.email}',
            buyer_name: '${order.user.name}',
            buyer_tel: '${order.user.phone}',
            buyer_addr: '${order.user.address}',
            buyer_postcode: ''
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    }
</script>

<div class="container">
    <button class="btn btn-secondary" onclick="history.back()">Previous Page</button>
    <br>
    <c:forEach var="order" items="${orders}">
        <c:if test="${order.status == 'BEFORE'}">
            <c:forEach var="orderItem" items="${order.orderItems}">
                상품 이름 : ${orderItem.item.name}<br>
                주문 수량 : ${orderItem.orderQuantity}<br>
                총가격 : <fmt:formatNumber value="${orderItem.orderPrices}" pattern="#,###,###,###"/>원
                <br>
            </c:forEach>
            <br>
            <br>
        </c:if>
        주문 총 가격 : ${order.prices}
    </c:forEach>
    <input type="hidden" id="orderPrices" value="${order}">
    <button onclick="requestPay()">Payment</button>
    <button id="orderConfirm">Order Confirm</button>
</div>
<script src="/js/item.js"></script>
<%@ include file="../../layout/footer.jsp" %>