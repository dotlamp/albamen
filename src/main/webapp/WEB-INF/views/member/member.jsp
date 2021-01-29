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

<%@include file="../includes/header.jsp" %>
member
<a href="/member/list">회원리스트</a>
<a href="/member/workList">출퇴근리스트</a>

<s:authentication property="name"/>님
<%@include file="../includes/footer.jsp" %>

</body>

</html>