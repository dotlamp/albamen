<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>albamen</title>
</head>

<body>
<nav>
    <div>
        <s:authorize access="isAnonymous()">
            <a href="/login">login</a>
        </s:authorize>
        <s:authorize access="isAuthenticated()">
            <form action="/logout" method="post">
                <s:authentication property="name"/>님
                <button type="submit">logout</button>
                <s:csrfInput/>
            </form>
        </s:authorize>
    </div>
    <div>

    </div>
    <div>
        <a href="/">home</a>
        <a href="/member">member</a>
        <a href="/company">company</a>
    </div>
</nav>
<hr>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<hr>
<footer>
    <s:authorize access="isAuthenticated()">
        권한 : <s:authentication property="authorities"/>
    </s:authorize>
</footer>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>