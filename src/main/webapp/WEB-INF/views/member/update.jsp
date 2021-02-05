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
<script type="text/javascript">
    $(document).ready(function(){
        // 취소
        $(".cencle").on("click", function(){

            location.href = "workList";

        })

        $("#submit").on("click", function(){

            if($("#password").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#password").focus();
                return false;
            }

            if($("#tel").val()==""){
                alert("전화번호를 입력해주세요.");
                $("#tel").focus();
                return false;
            }
            if(confirm("회원정보수정을 하시겠습니까?")){
               alert("회원정보수정");
             }

        });
    })


</script>
<body>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<section id="container">
    <form action="/member/updateMember" method="post" >
        <div class="form-group has-feedback">
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" id="id" name="id" value="${member.id}" readonly />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="password">패스워드</label>
            <input class="form-control" type="password" id="password" name="password" value=""/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="name" >성명</label>
            <input class="form-control" type="text" id="name" name="name" value="${member.name}" readonly/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="tel">전화번호</label>
            <input class="form-control" type="text" id="tel" name="tel" value="${member.tel}"/>
        </div>

        <div class="form-group has-feedback">
            <label class="control-label" for="regDate">입사일</label>
           <fmt:formatDate var ="regDate" value="${member.regDate}" pattern="yyyy-MM-dd"/>
            <input class="form-control" type="text" id="regDate" value="${regDate}" readonly/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="mstatus" >상태</label>
            <c:choose>
                <c:when test="${member.mstatus==0}"><input class="form-control" type="text" id="mstatus" value="입사대기" readonly/></c:when>
                <c:when test="${member.mstatus==1}"><input class="form-control" type="text" id="mstatus" value="입사" readonly/></c:when>
                <c:when test="${member.mstatus==2}"><input class="form-control" type="text" id="mstatus" value="퇴사" readonly/></c:when>
            </c:choose>

        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="cno" >회사명</label>
            <input class="form-control" type="text" id="cno" value="${company.name}" readonly/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="bno" >지점명</label>
            <c:forEach items="${company.branchList}" var="branch">
            <input class="form-control" type="text" id="bno" value="${branch.bname}" readonly/>
            </c:forEach>
        </div>
        <div>
            <div class="form-group has-feedback">
                <label class="control-label" for="bank" >은행</label>
                <input class="form-control" type="text" id="bank" name= "bank" value="${account.bank}" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="account" >계좌번호</label>
                <input class="form-control" type="text" id="account" name="account" value="${account.account}" />
            </div>

        </div>
        <div class="form-group has-feedback">
            <button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
            <button class="cencle btn btn-danger" type="button">취소</button>
        </div>
        <security:csrfInput/>
    </form>

</body>

</html>