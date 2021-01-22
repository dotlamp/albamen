<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <title>albamen - branch </title>
</head>
<body>
<div>
<sec:authorize access="isAnonymous()">
    <a href="/login">login</a>
</sec:authorize>
    <a href="/">home</a>
    <a href="/member">member</a>
    <a href="/company">company</a>
</div>
<sec:authorize access="isAuthenticated()">
    <div>
    <p>principal : <sec:authentication property="principal"/></p>
    <p>id : <sec:authentication property="principal.username"/></p>
    <p>id : <sec:authentication property="name"/></p>
    <p>auth : <sec:authentication property="authorities"/></p>
    </div>
    <div>
    <c:out value='${company}' />
        <hr>
    <c:forEach items="${company.branchList}" var="branch">
        <c:if test="${not empty branch.bname}">
        <form action="/company/branch" method="post">
            <s:csrfInput/>
<%--            <input type="hidden" name="_csrf" value="${CSRF_TOKEN}" />--%>
            <input type="hidden" name="bno" value="<c:out value='${branch.bno}'/>">
            <button type="submit"><c:out value="${branch.bname}"/></button>
        </form>
        </c:if>
    </c:forEach>
        <hr>
    <c:forEach items="${company.authList}" var="auth">
        <c:out value="${auth.auth}"/>
    </c:forEach>
    </div>

    <hr>
    <sec:authorize access="hasRole('ROLE_MANAGER')">
        <a href="/company/branch/register"><button>branchRegister</button></a>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="/company/list"><button>comanylist</button></a>
        <a href="/company/auth"><button>authList</button></a>
    </sec:authorize>
    <form action="/company/logout" method="post">
        <input type="hidden"name="${_csrf.parameterName}"value="${CSRF_TOKEN}"/>
        <button type="submit">logout</button>
    </form>
</sec:authorize>

</body>

</html>

