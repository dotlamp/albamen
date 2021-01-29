<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>albamen</title>
</head>

<body>

<jsp:include page="navbar.jsp"></jsp:include>
<c:out value="${branch.bname}"/>
<table>

<tr>
    <th>번호</th>
    <th>날짜</th>
    <th>출근시간</th>
    <th>퇴근시간</th>
    <th>상태</th>

</tr>
    <c:choose>
    <c:when test="${fn:length(work.work_mList)>0}">
        <c:forEach items="${work.work_mList}" var="work">
            <tr>
                <td><c:out value='${work.wno}'/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd[E]" value="${work.wday}"/> </td>
                <td><fmt:formatDate pattern="a hh:mm:ss" value="${work.startTime}"/> </td>
                <td>
                    <c:choose>
                    <c:when test="${work.endTime eq null}">
                        <c:out value="미등록"/>
                    </c:when>
                    <c:otherwise>
                        <fmt:formatDate pattern="a hh:mm:ss" value="${work.endTime}"/>
                    </c:otherwise>
                    </c:choose>
                </td>
                <td><c:out value='${work.wstatus}'/> </td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <tr>
            <td colspan="5">출퇴근 기록이 없습니다.</td>
        </tr>
    </c:otherwise>
    </c:choose>

</body>
</html>