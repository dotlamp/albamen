<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@include file="../includes/header.jsp" %>
<div>
    <p>
        매니저 :
        <a href="/company/branch/register"><input type="button" value="지점 등록"></a>
    </p>
    <p>
        지점 :
<c:forEach items="${branchList}" var="branchList">
    <form action="/company/branch/info" method="get">
        <c:out value="${branchList.bname}"/>
        <button type="submit">정보수정</button>
        <input type="hidden" name="bno" value="${branchList.bno}">
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