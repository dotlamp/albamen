<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>albamen</title>

    <!-- Bootstrap core CSS -->
    <link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/resume.min.css" rel="stylesheet">

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
                <p class="mt-1">사업장 1 <i class="fas fa-caret-down mr-2"></i></p><%-- <i class="fa fa-sync ml-2 fa-sm"></i> --%>
            </div>
            <div class="col p-0 text-right">
                <c:if  test="${sessionScope.member.id != null}">
                    ${sessionScope.member.name}
                </c:if>
            </div>
        </div>

    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse text-left text-white">
        <ol>
            <li>
                <a href="workCheck">출퇴근</a>
            </li>
            <li>
                <a href="update">회원수정</a>
            </li>
        </ol>
    </div>
    <div>
        <c:choose>
            <c:when test="${sessionScope.member.id == null}">
                <a href="/">LOGIN</a>
            </c:when>
            <c:otherwise>
                <a href="/logoutMember">LOGOUT</a>

            </c:otherwise>
        </c:choose>

    </div>
</nav>

<!-- Bootstrap core JavaScript -->
<script src="static/vendor/jquery/jquery.min.js"></script>
<script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="static/js/resume.min.js"></script>

</body>

</html>
