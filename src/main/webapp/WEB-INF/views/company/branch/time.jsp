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
<div id="timeList"></div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
            var formData = new FormData();
            formData.append("timeList", timeList);
            var bno = $('#bno').val();
            $.ajax({
                type: "get",
                url: "/company/branch/timeList?bno=" + bno,
                dataType: 'text',
                data: formData,
                contentType: false,
                success: function (data) {
                    console.log(data)
                    var contents = html.find("div").html();
                },
                error: function (error) {
                    alert(error)
                }
            })
    });
</script>