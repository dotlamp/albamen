<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../../includes/header.jsp" %>

    <table>
        <tr>
            <th>이름</th>
            <th>전화번호</th>
            <th>권한</th>
            <th>가입일</th>
            <th>등</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
        <tr>
            <th><c:out value="${member.name}"/></th>
            <th><c:out value="${member.tel}"/></th>
            <th>
            <c:forEach items="${member.authList}" var="auth">
            <c:out value="${auth.auth}"/>
            </c:forEach>
            </th>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}"/> </td>
        </tr>
        </c:forEach>
    </table>

<%@include file="../../includes/footer.jsp" %>

