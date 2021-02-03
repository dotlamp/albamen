<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<form action="/company/branch/time" method="post">
    <p>
    스케쥴명:<input type="text" name="tname">
        <input type="hidden" id="bno" name="bno" value="${branch.bno}">
    </p>
    <p>
    근무시간:<input type="time" name="startTime" value="09:00"> ~ <input type="time" name="endTime" value="18:00">
    </p>
    <p>
    휴식시간:<input type="time" name="breakStartTime"> ~ <input type="time" name="breakEndTime">
    </p>
    <s:csrfInput/>
    <input type="submit" id="timeAdd" value="추가하기">
</form>
<hr>
<c:if test="${!empty timeList}">
<table>
    <table>
    <tr>
        <th>구분</th>
        <th>근무시간</th>
        <th>휴게시간시간</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach items="${timeList}" var="timeList">
        <tr>
            <td style="display: none"><c:out value="${timeList.tno}"/></td>
            <td style="display: none"><c:out value="${timeList.bno}"/></td>
            <td><c:out value="${timeList.tname}"/></td>
            <td><c:out value="${timeList.startTime}"/>~<c:out value="${timeList.endTime}"/></td>
            <td><c:out value="${timeList.breakStartTime}"/>~<c:out value="${timeList.breakEndTime}"/></td>
            <td><input type="button" value="remove" onclick="remove('${timeList.tno}');"></td>
            <td><input type="button" id="modify" value="modify X" onclick="modify('${timeList.tno}');"></td>
        </tr>
    </c:forEach>
</table>
</c:if>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    function remove(s){
        $.ajax({
            url: '/company/branch/removeTime',
            type: 'post',
            dataType: 'text',
            data: {tno: s},
            beforeSend: function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (data) {
                // console.log("success");
            },
            error: function () {
                // console.log("error");
            }
        });//ajax
        location.href = location.href;
    }
    function modify(s) {

    }
</script>