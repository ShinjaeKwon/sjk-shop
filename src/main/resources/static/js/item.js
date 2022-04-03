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
            url: "/item/order",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },


}

index.init();