<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .layer {
            position: absolute;
            text-align: center;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }
        .layer .content {
            display: inline-block;
            vertical-align: middle
        }
        .layer .blank {
            display: inline-block;
            width: 0;
            height: 100%;
            vertical-align: middle
        }
    </style>
</head>
<script type="text/javascript">

    $(document).ready(function(){
        $("#logoutBtn").on("click", function(){
            var id = $("#m.id").val();
            var password = $("#m.password").val();
            if(id==""){
                alert("아이디를 입력하세요.");
                $("#m.id").focus();
                return;
            }
            if(password=="") {
                alert("비밀번호를 입력하세요.");
                $("#m.password").focus();
                return;
            }
            location.href="logoutMember";
        });

        $("#updateBtn").on("click", function(){
            location.href="update";
        });

    });
</script>
<body>

<div class="layer">
    <form class="content" method="post" action="/loginMember">
        <h1 style="color: #bd5d38" class="mb-3">ALBAMEN</h1>
        <c:if test="${member == null}">
            <div class="form-group text-left">
                <label for="id">Email address</label>
                <input type="text" class="form-control" id="id" aria-describedby="emailHelp" name="id">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group text-left">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                <a href="#" class="ml-3">Forgot Password?</a>
            </div>
            <button type="submit" class="btn w-100 text-white mb-3" style="background-color:#bd5d38">login</button>

            <a href="/join">Create an Account</a>
        </c:if>
        <c:if test="${member != null }">
            <div>
                <p>${member.id}님 환영 합니다.</p>
            </div>
            <div>
                <button type="button" id="updateBtn">회원정보수정</button>
                <button type="button" id="logoutBtn">로그아웃</button>
            </div>
        </c:if>
        <c:if test="${msg == false}">
            <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
        </c:if>
    </form>
    <span class="blank"></span>
</div>
</body>

</html>
