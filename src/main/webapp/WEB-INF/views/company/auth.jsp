<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <style>
        .resume-section {
            min-width: 95%;
        }
    </style>
    <title>albamen - company list</title>
</head>

<body>
    <table>
        <tr>
            <th>회사번호</th>
            <th>이름</th>
            <th>권한</th>
        </tr>
        <c:forEach items="${company}" var="company">
        <tr>
            <td><c:out value='${company.cno}'/></td>
            <td><c:out value='${company.name}'/></td>
            <td>
<%--                <c:forEach items="${company.authList}" var="auth" varStatus="status">--%>
<%--                    ${auth['auth']}--%>
<%--                </c:forEach>--%>
                <c:if test="${company.hasAuth('ADMIN')}">관리자</c:if>
                <c:if test="${company.hasAuth('MANAGER')}">매니저</c:if>
            </td>
            <td>

            </td>
        </tr>
        </c:forEach>
    </table>
</body>

</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
