<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<%@include file="../../includes/header.jsp" %>

    <c:if test="${!empty timeList}">
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
                <td><input type="button" class="selectTime" value="선택"></td>
        </tr>
        </c:forEach>
    </table>
    </c:if>

<%@include file="../../includes/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {

        $(".selectTime").click(function (e) {
            var btn = $(this);
            var tr = btn.parent().parent();
            var td = tr.children();
            opener.document.getElementById('tno').value = td.eq(0).text();
            opener.document.getElementById('tname').value = td.eq(2).text();
            window.close();
        });
    });
</script>
