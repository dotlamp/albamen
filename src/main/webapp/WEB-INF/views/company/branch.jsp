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
    <title>albamen - branch </title>
</head>

<body>
    <table>
        <tr>
            <th>지점명</th>
            <th>전화번호</th>
            <th>우편번호</th>
            <th>주소</th>
            <th>관리자</th>
            <th>전화번호</th>
            <th>등록일</th>
        </tr>
        <tr>
            <td><c:out value="${branch.bname}"/> </td>
            <td><c:out value="${branch.btel}"/> </td>
            <td><c:out value="${branch.post}"/> </td>
            <td><c:out value="${branch.address}"/> </td>
            <td><c:out value="${branch.manager}"/> </td>
            <td><c:out value="${branch.mtel}"/> </td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${branch.regDate}"/> </td>
        </tr>
    </table>
</body>

</html>

