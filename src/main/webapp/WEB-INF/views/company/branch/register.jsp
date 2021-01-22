<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>albamen - branch register</title>
</head>

<body>
    <section id="container">
        <form action="/company/branch/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<sec:authentication property="principal.username"/>" />
            <div class="form-group has-feedback">
                <label class="control-label" for="bname">지점명</label>
                <input class="form-control" type="text" id="bname" name="bname" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="btel">지점 전화번호</label>
                <input class="form-control" type="text" id="btel" name="btel" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="manager">관리자</label>
                <input class="form-control" type="text" id="manager" name="manager" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="mtel">관리자 전화번호</label>
                <input class="form-control" type="text" id="mtel" name="mtel" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="post">우편번호</label>
                <input class="form-control" type="text" id="post" name="post" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="address">주소</label>
                <input class="form-control" type="text" id="address" name="address" />
            </div>
            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="submit">등록</button>
                <button class="cencle btn btn-danger" type="button">취소</button>
            </div>
        </form>
    </section>
</body>

</html>
