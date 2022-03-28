let index = {
    init: function () {
        $("#btn-save").on("click", () => {
            this.save();
        });
        $("#btn-update").on("click", () => {
            this.update();
        });
    },

    save: function () {
        if($("#name").val().trim() === ""){
            alert("name을 입력해주세요.");
            $("#name").focus();
            return false;
        }
        if($("#username").val().trim() === ""){
            alert("ID 입력해주세요.");
            $("#username").focus();
            return false;
        }
        if($("#password").val().trim() === ""){
            alert("변경할 Password을 입력해주세요.");
            $("#password").focus();
            return false;
        }
        if($("#phone").val().trim() === ""){
            alert("Phone 입력해주세요.");
            $("#phone").focus();
            return false;
        }
        if($("#address").val().trim() === ""){
            alert("Email을 입력해주세요.");
            $("#email").focus();
            return false;
        }
        if($("#address").val().trim() === ""){
            alert("address 입력해주세요.");
            $("#address").focus();
            return false;
        }

        let data = {
            name: $("#name").val(),
            username: $("#username").val(),
            password: $("#password").val(),
            phone: $("#phone").val(),
            email: $("#email").val(),
            address: $("#address").val()
        };

        $.ajax({
            type: "POST",
            url: "/auth/joinProc",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            if (resp.status === 500) {
                alert("회원가입에 실패하였습니다.");
            } else {
                alert("회원가입이 완료되었습니다.");
                location.href = "/";
            }
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    update: function () {
        if($("#password").val().trim() === ""){
            alert("Password을 입력해주세요.");
            $("#password").focus();
            return false;
        }
        if($("#address").val().trim() === ""){
            alert("Email을 입력해주세요.");
            $("#email").focus();
            return false;
        }
        if($("#address").val().trim() === ""){
            alert("Address 입력해주세요.");
            $("#address").focus();
            return false;
        }
        let data = {
            id: $("#id").val(),
            name: $("#name").val(),
            username: $("#username").val(),
            password: $("#password").val(),
            phone: $("#phone").val(),
            email: $("#email").val(),
            address: $("#address").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/user",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json"
        }).done(function (resp) {
            alert("회원수정이 완료되었습니다.");
            location.href = "/";
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    checkId: function () {
    let id = $('#username').val();
    $.ajax({
        url: '/user/idCheck', //Controller에서 인식할 주소
        type: 'POST', //POST 방식으로 전달
        data: {id: id},
        success: function () {
            console.log("처리 성공 시 변경되는 내용");
        },
        error: function () {
            alert("에러입니다");
        }
     });
    }
}

index.init();
