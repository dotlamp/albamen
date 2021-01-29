<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>albamen</title>
</head>

<body>
<table>
<tr>
    <th>번호</th>
    <th>아이디</th>
    <th>이름</th>
    <th>전화번호</th>
    <th>가입일</th>
    <th>m.cno</th>
    <th>ano</th>
    <th>회사명</th>

</tr>
    <tr>
        <td><c:out value='${member.mno}'/></td>
        <td><c:out value='${member.id}'/> </td>
        <td><c:out value='${member.name}'/> </td>
        <td><c:out value='${member.tel}'/> </td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}"/> </td>
        <td><c:out value='${member.cno}'/> </td>
        <c:forEach items="${member.authList}" var="auth">
            <td><c:out value='${auth.ano}'/> </td>
        </c:forEach>
        <td><c:out value='${company.name}'/> </td>

<%--        <c:forEach items="${company}" var="company">--%>
<%--            <c:if test="${member.cno eq company.cno}">--%>
<%--                <td>--%>
<%--                    <c:out value="${company.name}"/>--%>
<%--                </td>--%>
<%--            </c:if>--%>
<%--        </c:forEach>--%>

    </tr>
<c:out value='${member}'/>
<c:out value='${company}'/>
</body>
</html>