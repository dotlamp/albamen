<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp" %>

    <table>
        <tr>
            <th>지점명</th>
            <th>전화번호</th>
            <th>우편번호</th>
            <th>주소</th>
            <th>등록일</th>
        </tr>
        <tr>
            <td><c:out value="${branch.bname}"/> </td>
            <td><c:out value="${branch.btel}"/> </td>
            <td><c:out value="${branch.post}"/> </td>
            <td><c:out value="${branch.address}"/> </td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${branch.regDate}"/> </td>
        </tr>
    </table>
    <div>
        <button type="button" onclick="goBack();">뒤로가기</button>
    </div>
<%@include file="../includes/footer.jsp" %>

<script>
    function goBack() {
        window.history.back();
    }
</script>