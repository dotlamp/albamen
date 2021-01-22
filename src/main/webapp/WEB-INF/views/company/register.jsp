<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>albamen - company register</title>
</head>

<body>
    <section id="container">
        <form action="/company/register" method="post" >
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="cStatus" value="0"/>
            <div class="form-group has-feedback">
                <label class="control-label" for="name">상호</label>
                <input class="form-control" type="text" id="name" name="name" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="ceo">대표</label>
                <input class="form-control" type="text" id="ceo" name="ceo" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="id">아이디(사업자등록번호)</label>
                <input class="form-control" type="text" id="id" name="id" />
                <span id="idchk" style="color: red"></span>
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="pw1">패스워드</label>
                <input class="form-control" type="password" id="pw1" name="password" />
                <span id="pwchk" style="color: red"></span>
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="pw2">패스워드 확인</label>
                <input class="form-control" type="password" id="pw2" />
            </div>

            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="submit">회원가입</button>
                <button class="cencle btn btn-danger" type="button">취소</button>
            </div>
        </form>
    </section>
</body>

</html>

<script>
    // var idJ =  /^[0-9][0-9]{9,10}$/;
    var idJ =  /^[0-9][0-9]{0,10}$/;
    var pwJ = /^[A-Za-z0-9]{0,12}$/;
    var nameJ = /^[가-힣]{2,5}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

    $(document).ready(function () {
        $("#id").blur(function() {
            if ($("#id").val() == '') {
                $("#idchk").text("아이디를 입력하세요");
                $("#idchk").css("color", 'red');
            } else if (idJ.test($('#id').val()) != true) {
                $("#idchk").text("사업자등록번호 입력해주세요");
                $("#idchk").css("color", 'red');
            } else if ($('#id').val() != '') {
                var id = $('#id').val();
                $.ajax({
                    type: "get",
                    url: "./idChk?id=" + id,
                    dataType: 'json',
                    success: function (data) {
                        if (data == 1) {
                            $("#idchk").text("중복된 아이디 입니다.");
                            $("#idchk").css("color", 'red');
                            $("#membercheck").attr("disabled", true);
                        } else {
                            if (idJ.test(id)) {
                                $("#idchk").text("");
                                /*                            $("#idchk").css("color", 'blue');*/
                                $("#membercheck").attr("disabled", false);
                            } else if (id == '') {
                                $("#idchk").text("아이디를 입력해주세요");
                                $("#idchk").css("color", 'red');
                                $("#membercheck").attr("disabled", true);
                            } else {
                                $("#idchk").text("사업자등록번호 입력해주세요");
                                $("#idchk").css("color", 'red');
                                $("#membercheck").attr("disabled", true);
                            }
                        }
                    }
                })
            }
        })
    });
    $('#pw1').blur(function() {
        if (pwJ.test($('#pw1').val())) {
            console.log('true');
            $('#pwchk').text('');
        } else {
            console.log('false');
            $('#pwchk').text('1~12자의 숫자 , 문자로만 사용 가능합니다.');
            $('#pwchk').css('color', 'red');
        }
    });
    $('#pw2').blur(function() {
        if ($('#pw1').val() != $(this).val()) {
            $('#pwchk').text('비밀번호가 일치하지 않습니다.');
            $('#pwchk').css('color', 'red');
        } else {
            $('#pwchk').text('');
        }
    });
</script>