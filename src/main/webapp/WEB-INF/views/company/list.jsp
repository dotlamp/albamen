<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <style>
        .resume-section {
            min-width: 95%;
        }
    </style>
    <title>albamen - company list</title>
</head>

<body>
    <table>
        <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>상호</th>
            <th>대표자</th>
            <th>가입일</th>
            <th>지점</th>
        </tr>
        <c:forEach items="${companylist}" var="company">
        <tr>
            <td><c:out value='${company.cno}'/></td>
            <td><c:out value='${company.id}'/> </td>
            <td><c:out value='${company.name}'/> </td>
            <td><c:out value='${company.ceo}'/> </td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${company.regDate}"/> </td>
            <c:forEach items="${branchList}" var="branch">
            <c:if test="${company.cno eq branch.cno}">
            <td>
                <a class="move" href="<c:out value="${branch.bno}"/>">
                    <c:out value="${branch.bname}"/>
                </a>
            </td>
            </c:if>
            </c:forEach>
        </tr>
        </c:forEach>
    </table>
    <%--페이징--%>
    <div class="page">
        <ul>
            <c:if test="${pageMaker.prev}">
                <li>
                    <a href="${pageMaker.startPage-1}">Previous</a>
                </li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li>
                    <a href="${num}" >${num}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                <li>
                    <a href="${pageMaker.endPage+1}" >Next</a>
                </li>
            </c:if>
        </ul>
    </div>
</body>
<%--actionForm--%>
<form id="actionForm"  action="/company/list" method="post">
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    <input type='hidden' name='amount' class='amount_input' value='${pageMaker.cri.amount }' >
    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
    <input type='hidden' name='pageNum' class='pageNum_input' value='${pageMaker.cri.pageNum }' >
</form>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        var actionForm = $("#actionForm");
        $('.move').click(function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
            actionForm.attr("action", "/company/branch");
            actionForm.submit();
        })

        $('.page').click(function (e) {
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        })
    });
</script>