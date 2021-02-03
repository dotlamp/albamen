<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <hr>
    <footer>
        <s:authorize access="isAuthenticated()">
                권한 : <s:authentication property="authorities"/>
        </s:authorize>
    </footer>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<script src="/resources/vendor/jquery/jquery.min.js"></script>--%>