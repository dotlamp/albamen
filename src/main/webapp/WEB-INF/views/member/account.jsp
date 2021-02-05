<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<%@include file="../includes/header.jsp" %>

<c:if test="${!empty account}">
<table>
    <table>
    <tr>
        <th>은행</th>
        <th>계좌번호</th>
        <th></th>
    </tr>
        <tr>
            <td><c:out value="${account.bank}"/></td>
            <td><c:out value="${account.account}"/></td>
            <td><input type="button" value="remove" onclick="remove('${member.mno}');"></td>
        </tr>
</table>
</c:if>
<c:if test="${empty account}">
    <form action="/member/account" method="post">
        <p>
            은행명:<input type="text" name="bank">
            <input type="hidden" id="mno" name="mno" value="${member.mno}">
        </p>
        <p>
            계좌번호:<input type="text" name="account">
        </p>
        <s:csrfInput/>
        <input type="submit" value="추가하기">
    </form>
</c:if>

<%@include file="../includes/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    function remove(m){
        $.ajax({
            url: '/member/removeAccount',
            type: 'post',
            dataType: 'text',
            data: {mno: m},
            beforeSend: function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (data) {
                // console.log("success");
            },
            error: function () {
                // console.log("error");
            }
        });//ajax
        location.href = location.href;
    }
</script>