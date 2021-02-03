<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@include file="../../includes/header.jsp" %>
<%--------------------------------------------------------------------------------------------------------------------%>


<h1><c:out value="${branch.bname}"/></h1>

<%--지점 정보 수정 --%>
    <form action="/company/branch/modify" method="get">
        <input type="hidden" name="bno" value="${branch.bno}">
        <input type="submit" value="정보수정">
    </form>
<%--지점 회원 리스트 --%>
    <form action="/company/branch/member" method="get">
        <input type="hidden" name="bno" value="${branch.bno}">
        <input type="submit" value="회원관리(x)">
    </form>
<%--schedule--%>
    <form action="/company/branch/schedule" method="get">
        <input type="hidden" name="bno" value="${branch.bno}">
        <input type="submit" value="근무일정관리">
    </form>
<%--------------------------------------------------------------------------------------------------------------------%>
<%@include file="../../includes/footer.jsp" %>

