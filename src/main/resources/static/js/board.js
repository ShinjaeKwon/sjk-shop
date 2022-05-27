let index = {
    init: function () {
        $("#btn-save").on("click", () => {
            this.save();
        });
        $("#btn-delete").on("click", () => {
            this.deleteById();
        });
        $("#btn-update").on("click", () => {
            this.update();
        });
        $("#btn-reply-save").on("click", () => {
            this.replySave();
        });
    },

    save: function () {
        if ($("#title").val().trim() === "") {
            alert("제목을 입력해주세요.");
            $("#title").focus();
            return false;
        }
        if ($("#content").val().trim() === "") {
            alert("내용을 입력해주세요.");
            $("#content").focus();
            return false;
        }
        let data = {
            title: $("#title").val(),
            content: $("#content").val()
        };
        $.ajax({
            type: "POST",
            url: "/api/board",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("글쓰기가 완료되었습니다.");
            location.href = "/board"
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    deleteById: function () {
        let id = $("#id").text();
        $.ajax({
            type: "DELETE",
            url: "/api/board/" + id,
            dataType: "json"
        }).done(function (resp) {
            alert("삭제가 완료되었습니다.");
            location.href = "/board"
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    update: function () {
        if ($("#title").val().trim() === "") {
            alert("제목을 입력해주세요.");
            $("#title").focus();
            return false;
        }
        if ($("#content").val().trim() === "") {
            alert("내용을 입력해주세요.");
            $("#content").focus();
            return false;
        }
        let id = $("#id").val();
        let data = {
            title: $("#title").val(),
            content: $("#content").val(),
        };
        $.ajax({
            type: "PUT",
            url: "/api/board/" + id,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("글수정이 완료되었습니다.");
            location.href = "/board"
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    replySave: function () {
        if ($("#reply-content").val() === "") {
            alert("댓글 내용을 입력해주세요.");
            $("#reply-content").focus();
            return false;
        }
        let data = {
            userId: $("#userId").val(),
            boardId: $("#boardId").val(),
            content: $("#reply-content").val()
        };

        $.ajax({
            type: "POST",
            url: `/api/board/${data.boardId}/reply`,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("댓글작성이 완료되었습니다.");
            location.href = `/board/${data.boardId}`;
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    replyDelete: function (boardId, replyId) {
        $.ajax({
            type: "DELETE",
            url: `/api/board/${boardId}/reply/${replyId}`,
            dataType: "json"
        }).done(function (resp) {
            alert("댓글삭제 완료되었습니다.");
            location.href = `/board/${boardId}`;
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    replyEdit: function (boardId, replyId) {

        if ($("#edit-reply").val() === "") {
            alert("댓글 내용을 입력해주세요.");
            $("#reply-content").focus();
            return false;
        }
        let data = {
            content: $("#edit-reply").val()
        };

        $.ajax({
            type: "POST",
            url: `/api/board/${boardId}/reply/${replyId}`,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("댓글수정이 완료되었습니다.");
            location.href = `/board/${boardId}`;
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

}

index.init();