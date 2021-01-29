<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>albamen</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/resume.min.css" rel="stylesheet">

    <style>
        ul, li, ol{
            list-style:none;
        }
        ol > li {
            margin-top:20%;
            margin-bottom: 20%;
        }
        a{
            color: white;
        }
    </style>
</head>
<script type="text/javascript">


</script>

<body id="page-top">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger m-0" href="#page-top">
        <div class="row mt-2">
            <div class="col text-left">
                <p class="mt-1"> <c:out value="${member.name}"/>님</p>
            </div>
        </div>

    </a>
    <div class="collapse navbar-collapse text-left text-white">
        <ol>
            <li>
                <a href="workList">출퇴근</a>
            </li>
            <li>
                <a href="update">회원수정</a>
            </li>
        </ol>
    </div>
    <div class="collapse navbar-collapse text-center text-white">
            <s:authorize access="isAnonymous()">
                <button type="submit" style="width: 116px; height: 56px; font-size: 20px; background-color: #ffe8a1; font-weight: bolder; color: chocolate;border-color: darksalmon;"><a href="/login">LOGIN</a></button>
            </s:authorize>
            <s:authorize access="isAuthenticated()">
                <form action="/logout" method="post" style="padding-left: 60px;">
                    <button type="submit" style="width: 116px; height: 56px; font-weight: bolder; font-size: 20px;background-color: #ffe8a1; color: chocolate; border-color: darksalmon;" >LOGOUT</button>
                    <s:csrfInput/>
                </form>
            </s:authorize>
    </div>
</nav>

<!-- Bootstrap core JavaScript -->
<script src="/static/vendor/jquery/jquery.min.js"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="/static/js/resume.min.js"></script>

</body>

</html>
