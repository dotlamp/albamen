<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@include file="../includes/header.jsp" %>
<div>
    <p>
        <a href="/company/branch/register"><input type="button" value="지점 등록"></a>
    </p>

    <p> 지점 :
<c:forEach items="${branchList}" var="branchList">
    <form action="/company/branch/" method="post">
        <input type="hidden" name="cno" value="${branchList.cno}">
        <input type="hidden" name="bno" value="${branchList.bno}">
        <s:csrfInput/>
        <input type="submit" value="${branchList.bname}">
    </form>
</c:forEach>
    </p>
</div>
<div>
    <p>
        관리자 :
        <a href="/company/list">기업리스트</a>
    </p>
</div>




<%@include file="../includes/footer.jsp" %>

