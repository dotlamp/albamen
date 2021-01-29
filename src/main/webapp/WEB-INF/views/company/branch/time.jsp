<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<form action="/company/branch/time" method="post">
    <p>
    스케쥴명:<input type="text" name="tname">
        <input type="hidden" id="bno" name="bno" value="${branch.bno}">
    </p>
    <p>
    근무시간:<input type="time" name="startTime" value="09:00"> ~ <input type="time" name="endTime" value="18:00">
    </p>
    <p>
    휴식시간:<input type="time" name="breakStartTime" value="12:00"> ~ <input type="time" name="breakEndTime" value="13:00">
    </p>
    <security:csrfInput/>
    <input type="submit" value="추가하기">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
            var bno = $('#bno').val();
            $.ajax({
                type: "get",
                url: "./timeList" + bno,
                dataType: 'json',
                success: function (data) {
                    if (data == 1) {
                        $("#idchk").text("중복된 아이디 입니다.");
                        $("#idchk").css("color", 'red');
                        $("#membercheck").attr("disabled", true);
                    } else {
                        if (idJ.test(id)) {
                            $("#idchk").text("");
                            /*                            $("#idchk").css("color", 'blue');*/
                            $("#membercheck").attr("disabled", false);
                        } else if (id == '') {
                            $("#idchk").text("아이디를 입력해주세요");
                            $("#idchk").css("color", 'red');
                            $("#membercheck").attr("disabled", true);
                        } else {
                            $("#idchk").text("사업자등록번호 입력해주세요");
                            $("#idchk").css("color", 'red');
                            $("#membercheck").attr("disabled", true);
                        }
                    }
                }
            })
        })
    });
</script>