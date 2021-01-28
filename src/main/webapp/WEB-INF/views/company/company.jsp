<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@include file="../includes/header.jsp" %>
<div>
    <p>
        <a href="/company/branch/register"><input type="button" value="지점 등록"></a>

<c:forEach items="${branchList}" var="branchList">
    <a class="branchModify" href="<c:out value="${branchList.bno}"/>">
        <input type="button" value="${branchList.bname} 수정">
    </a>
</c:forEach>
    </p>
    <p>
    지점 :
<c:forEach items="${branchList}" var="branchList">
    <a class="branchInfo" href="<c:out value="${branchList.bno}"/>">
        <c:out value="${branchList.bname}"/>
    </a>
</c:forEach>
    </p>
</div>
<div>
    <p>
        관리자 :
        <a href="/company/list">기업리스트</a>
    </p>
</div>

<form id="actionForm"  action="/company/list" method="get">
</form>


<%@include file="../includes/footer.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        var actionForm = $("#actionForm");
        /* 지점 페이지 이동 */
        $('.branchModify').click(function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/company/branch/info");
            actionForm.submit();
        })
        $('.branchInfo').click(function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/company/branch/member");
            actionForm.submit();
        })
    });
</script>