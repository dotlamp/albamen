<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>albamen</title>

</head>

<body>
<section id="container">
    <form action="/member/register" method="post" >
        <div class="form-group has-feedback">
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" id="id" name="id" />
            <button class="idChk" type="button" id = "idChk" onclick="fn_idChk()" value="N">중복확인</button>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="password">패스워드</label>
            <input class="form-control" type="password" id="password" name="password" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="name">성명</label>
            <input class="form-control" type="text" id="name" name="name" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="tel">전화번호</label>
            <input class="form-control" type="text" id="tel" name="tel" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="cno">회사</label>
            <input type="button" value="검색" onclick="openSearch()">
            <input class="form-control" type="text" id="cname" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="cno">지점</label>
            <input class="form-control" type="text" id="bname" />
        </div>
        <div class="form-group has-feedback">
            <button class="btn btn-success" type="submit" id="submit">회원가입</button>
            <button class="cencle btn btn-danger" type="button">취소</button>
        </div>
        <input class="form-control" type="hidden" id="cno" name="cno" readonly />
        <input class="form-control" type="hidden" id="bno" name="bno" readonly />
        <security:csrfInput/>
    </form>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    function openSearch() {
        window.open("/company/search", "width=800, height=600");
    }

    $(document).ready(function(){
        // 취소
        $(".cencle").on("click", function(){
            location.href = "/";
        })

        $("#submit").on("click", function(){
            if($("#id").val()==""){
                alert("아이디를 입력해주세요.");
                $("#id").focus();
                return false;
            }
            if($("#password").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#password").focus();
                return false;
            }
            if($("#name").val()==""){
                alert("성명을 입력해주세요.");
                $("#name").focus();
                return false;
            }
            if($("#cno").val()==""){
                alert("회사를 입력해주세요.");
                $("#cno").focus();
                return false;
            }
            var idChkVal = $("#idChk").val();
            if(idChkVal == "N"){
                alert("중복확인 버튼을 눌러주세요.");
                return false;
            }else if(idChkVal == "Y"){
                if(confirm("회원가입을 하시겠습니까?")){
                    alert("가입");
                }
            }

        });
    })
    function fn_idChk(){
        $.ajax({
            url : "/member/idCheck",
            type : "get",
            dataType : "json",
            data : {"id" : $("#id").val()},
            success : function(data){
                if($("#id").val()==""){
                    alert("아이디를 입력해주세요");
                    $("#id").focus();
                    return false;
                }
                if(data == 1){
                    alert("중복된 아이디입니다.");
                }else if(data == 0){
                    if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?"));
                    $("#idChk").attr("value", "Y");
                }
            }
        })
    }
</script>
</body>

</html>

