let index = {
    init: function () {
        $("#btn-save").on("click", () => {
            this.save();
        });
        $("#btn-wish").on("click", () => {
            this.wish();
        });
        $("#shipping").on("click", () => {
            this.shipping();
        });
        $("#completed").on("click", () => {
            this.completed();
        });
        $("#cancel").on("click", () => {
            this.cancel();
        });
        $("#refund").on("click", () => {
            this.refund();
        });
        $("#confirm").on("click", () => {
            this.confirms();
        });
        $("#requestPay").on("click", () => {
            this.requestPay();
        });
        $("#btn-review-save").on("click", () => {
            this.reviewSave();
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
            userId: $("#userId").val(),
            content: $("#content").val()
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

    cancel: function () {
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

    refund: function () {
        let data = {
            orderId: $("#orderId").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/api/order/refund",
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

    confirms: function () {
        let data = {
            orderId: $("#orderId").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/api/order/confirm",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("배송 중으로 변경 실패");
            } else {
                alert("배송 중으로 변경 완료");
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

    requestPay: function () {
        IMP.init('imp39314507');
        IMP.request_pay({
            pg: 'kcp',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Genie Market', //결제창에서 보여질 이름
            amount: $("#total").val(), //실제 결제되는 가격
            buyer_email: $("#email").val(),
            buyer_name: $("#name").val(),
            buyer_tel: $("#phone").val(),
            buyer_addr: $("#address").val(),
            buyer_postcode: ''
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                let data = {
                    cartId: $("#cartId").val(),
                    requests: $("#requests").val()
                };
                $.ajax({
                    type: "POST",
                    url: "/api/order",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=UTF-8",
                    dataType: "json"
                }).done(function (resp) {
                    location.href = "/shop/orderDetail";
                }).fail(function (error) {
                    alert(JSON.stringify(error));
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                alert(msg);
            }
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
    reviewSave: function () {
        if ($("#review-content").val() === "") {
            alert("댓글 내용을 입력해주세요.");
            $("#review-content").focus();
            return false;
        }
        let data = {
            userId: $("#userId").val(),
            itemId: $("#itemId").val(),
            content: $("#review-content").val()
        };

        $.ajax({
            type: "POST",
            url: `/api/shop/${data.itemId}/review`,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("리뷰작성이 완료되었습니다.");
            location.href = `/shop/${data.itemId}`;
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    reviewDelete: function (itemId, reviewId) {
        $.ajax({
            type: "DELETE",
            url: `/api/shop/${itemId}/review/${reviewId}`,
            dataType: "json"
        }).done(function (resp) {
            alert("리뷰삭제가 완료되었습니다.");
            location.href = `/shop/${itemId}`;
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    reviewEdit: function (itemId, reviewId) {

        if ($("#edit-review").val() === "") {
            alert("후기 내용을 입력해주세요");
            $("#edit-review").focus();
            return false;
        }
        let data = {
            content: $("#edit-review").val()
        };

        $.ajax({
            type: "POST",
            url: `/api/shop/${itemId}/review/${reviewId}`,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("리뷰수정이 완료되었습니다.");
            location.href = `/shop/${itemId}`;
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

}

index.init();