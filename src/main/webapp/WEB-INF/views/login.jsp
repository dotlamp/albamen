<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
</head>
<body>

    <div class="layer">
        <form class="content" method="post" action="/login">
            <h1 style="color: #bd5d38" class="mb-3">ALBAMEN</h1>
            <div class="form-group text-left">
                <label for="id">아이디</label>
                <input type="text" class="form-control" id="id" name="username">
                <small class="form-text text-muted"><strong style="color: red"><c:out value="${error}"/></strong></small>
            </div>
            <div class="form-group text-left">
                <label for="password">패스워드</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember-me">
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                <a href="#" class="ml-3">Forgot Password?</a>
            </div>
            <a href="/member/register">Create an Account [member]</a>
            <a href="/company/register">Create an Account [company]</a>
            <button type="submit" class="btn w-100 text-white mb-3" style="background-color:#bd5d38">login</button>
            <security:csrfInput/>
<%--            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        </form>
    </div>

</body>

</html>
