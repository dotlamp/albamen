<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</head>

<body>
    <table>
        <tr>
            <th>이름</th>
        </tr>
        <c:forEach items="${list}" var="company">
        <tr>
            <td><a class="getmove" href="<c:out value="${company.cno}" />"><c:out value="${company.name}"/></a> </td>
        </tr>
        </c:forEach>
    </table>
    <form id="actionForm" method="post"></form>
</body>

</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        var actionForm = $("#actionForm");
        $('.getmove').click(function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='cno' value='"+ $(this).attr("href")+"'>");
        })
    })
</script>