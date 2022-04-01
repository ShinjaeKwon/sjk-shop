let index = {
    init: function () {
        $("#btn-save").on("click", () => {
            this.save();
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
            category: $("select[name=category] option:selected").val()
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

}

index.init();