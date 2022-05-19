let index = {
    init: function () {
        $("#btn-save").on("click", () => {
            this.save();
        });
        $("#btn-wish").on("click", () => {
            this.wish();
        });
        $("#btn-order").on("click", () => {
            this.orders();
        });
        $("#orderConfirm").on("click", () => {
            this.orderConfirm();
        });
        $("#order-in-cart").on("click", () => {
            this.cartOrders();
        });
        $("#shipping").on("click", () => {
            this.shipping();
        });
        $("#completed").on("click", () => {
            this.completed();
        });
        $("#cancel").on("click", () => {
            this.cancelOrder();
        });
        $("#payment").on("click", () => {
            this.requestPay();
        });

    },

    save: function () {
        if ($("#name").val().trim() === "") {
            alert("Name을 입력해주세요.");
            $("#name").focus();
            return false;
        }
        if ($("#img").val().trim() === "") {
            alert("Img를 입력해주세요.");
            $("#img").focus();
            return false;
        }
        if ($("#price").val().trim() === "") {
            alert("Price를 입력해주세요.");
            $("#price").focus();
            return false;
        }
        if ($("#stockQuantity").val().trim() === "") {
            alert("StockQuantity 입력해주세요.");
            $("#stockQuantity").focus();
            return false;
        }

        let data = {
            name: $("#name").val(),
            img: $("#img").val(),
            price: $("#price").val(),
            stockQuantity: $("#stockQuantity").val(),
            category: $("select[name=category] option:selected").val(),
            userId: $("#userId").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/item/save",
            data: JSON.stringify(data),

            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("아이템 등록에 실패하였습니다.");
            } else {
                alert("아이템 등록에 성공하였습니다.");
                location.href = "/shop";
            }
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    shipping: function () {

        let data = {
            orderId: $("#orderId").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/api/order/shipping",
            data: JSON.stringify(data),

            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("배송 중 으로 변경 실패");
            } else {
                alert("배송 중으로 변경 완료하였습니다.");
                location.href = "/orderDetail/" + data.orderId;
            }
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    completed: function () {
        let data = {
            orderId: $("#orderId").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/api/order/completed",
            data: JSON.stringify(data),

            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("배송 완료로 변경 실패");
            } else {
                alert("배송 완료로 변경 완료하였습니다.");
                location.href = "/orderDetail/" + data.orderId;
            }
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    cancelOrder: function () {
        let data = {
            orderId: $("#orderId").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/api/order/cancel",
            data: JSON.stringify(data),

            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("주문 취소로 변경 실패");
            } else {
                alert("주문 취소 완료");
                location.href = "/orderDetail/" + data.orderId;
            }
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    wish: function () {
        if ($("#stockQuantity").val().trim() === "") {
            alert("StockQuantity 입력해주세요.");
            $("#stockQuantity").focus();
            return false;
        }

        let data = {
            stockQuantity: $("#stockQuantity").val(),
            userId: $("#userId").val(),
            itemId: $("#itemId").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/item/wish",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("장바구니 담기 실패");
            } else {
                alert("장바구니 담기 성공");
                location.href = "/shop";
            }
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    orders: function () {
        if ($("#stockQuantity").val().trim() === "") {
            alert("OrderQuantity 입력해주세요.");
            $("#stockQuantity").focus();
            return false;
        }
        if ($("#stockQuantity") > $("#maxOrderQuantity")) {
            alert("재고 수량보다 주문이 많습니다.");
            $("#stockQuantity").focus();
            return false;
        }

        let data = {
            stockQuantity: $("#stockQuantity").val(),
            itemId: $("#itemId").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/api/order",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            location.href = "/shop/order";
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    /*
        requestPay: function () {
            IMP.init('imp39314507');
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'kakaopay',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : 'Genie Market' , //결제창에서 보여질 이름
                amount : ${orderItem.orderPrices}, //실제 결제되는 가격
                buyer_email : '${order.user.email}',
                buyer_name : '${order.user.name}',
                buyer_tel : '${order.user.phone}',
                buyer_addr : '${order.user.address}',
                buyer_postcode : ''
            }, function(rsp) {
                console.log(rsp);
                if ( rsp.success ) {
                 2   var msg = '결제가 완료되었습니다.';
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
        },
    */

    orderConfirm: function () {
        $.ajax({
            type: "POST",
            url: "/api/order",
        }).done(function (resp) {
            alert("결제 완료")
            location.href = "/shop";
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    cartOrders: function () {

        let data = {
            cartId: $("#cartId").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/item/cart/order",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"

        }).done(function (resp) {
            location.href = "/shop/order";
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    deleteAllCart: function () {
        $.ajax({
            type: "DELETE",
            url: `/api/cart`,
            dataType: "json"
        }).done(function (resp) {
            alert("장바구니가 성공적으로 비워졌습니다.");
            location.href = "/shop/cart";
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    deleteItemCart: function (itemId) {
        $.ajax({
            type: "DELETE",
            url: `/api/cart/${itemId}`,
            dataType: "json"
        }).done(function (resp) {
            alert("삭제가 완료되었습니다.");
            location.href = "/shop/cart";
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },
    deleteItem: function (itemId) {
        $.ajax({
            type: "DELETE",
            url: `/api/item/delete/${itemId}`,
            dataType: "json"
        }).done(function (resp) {
            alert("삭제가 완료되었습니다.");
            location.href = "/shop"
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

}

index.init();