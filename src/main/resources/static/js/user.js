let index = {
    init: function () {
        $("#btn-save").on("click",()=>{
            this.save();
        });
    },

    save: function () {
        let data = {
            name: $("#name").val(),
            username: $("#username").val(),
            password: $("#password").val(),
            phone: $("#phone").val(),
            email: $("#email").val(),
            address: $("#address").val()
        }

        $.ajax().done().fail();
    }
}

index.init();