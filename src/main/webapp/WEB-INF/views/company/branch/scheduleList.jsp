<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:if test="${!empty scList}">
    <table>
        <tr>
            <th>근무자</th>
            <th>근무시간</th>
            <th>휴게시간</th>
            <th>상태</th>
            <th></th>
        </tr>
        <c:forEach items="${scList}" var="schedule">
            <c:forEach items="${schedule.timeList}" var="timeList">
            <c:forEach items="${schedule.memberList}" var="memberList">
        <tr>

                <td><c:out value="${memberList.name}"/></td>
                <td><c:out value="${timeList.startTime}"/>~<c:out value="${timeList.endTime}"/></td>
                <td><c:out value="${timeList.breakStartTime}"/>~<c:out value="${timeList.breakEndTime}"/></td>
            <td><c:if test="${schedule.sstatus eq 1}">근무</c:if><c:if test="${schedule.sstatus eq 0}">휴가</c:if></td>
            <td><input type="button" value="remove" onclick="remove('${memberList.bno}', '${schedule.sno}');"></td>
            <td><input type="button" id="modify" value="modify X" onclick="modify('${memberList.bno}', '${schedule.sno}');"></td>
<%--                <td style="display: none"><c:out value="${schedule.tno}"/></td>--%>
<%--                <td style="display: none"><c:out value="${schedule.bno}"/></td>--%>
        </tr>
            </c:forEach>
            </c:forEach>
        </c:forEach>
    </table>
    </c:if>
    <c:if test="${empty scList}">
    <div>
        해당 날짜에 근무자 없습니다.
    </div>
    </c:if>

