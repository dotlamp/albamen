<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../../includes/header.jsp" %>

    <table>
        <tr>
            <th>지점명</th>
            <th>전화번호</th>
            <th>우편번호</th>
            <th>주소 <input type="button" onclick="sample6_execDaumPostcode()" value="주소변경"></th>
            <th>등록일</th>
        </tr>
        <form action="/company/branch/modify" method="post">
        <tr>
            <td><input type="text" name="bname" value="<c:out value="${branch.bname}"/>"/> </td>
            <td><input type="text" name="btel" value="<c:out value="${branch.btel}"/>"/></td>
            <td><input readonly type="text" id="sample6_postcode" name="post" value="< c:out value="${branch.post}"/>"/></td>
            <td><input type="text" id="sample6_address" name="address" value="<c:out value="${branch.address}"/>"/></td>
            <td><input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${branch.regDate}"/>"/></td>
            <input type="hidden" name="c no" value="<c:out value='${branch.cno}'/>"/>
            <input type="hidden" name="bno" value="<c:out value='${branch.bno}'/>"/>
           <s:csrfInput/>
        </tr>
        <tr>
            <td><button type="submit">정보수정하기</button></td>
            <td><button type="button" onclick="goBack();">뒤로가기</button></td>
        </tr>
        </form>
    </table>
    <div>
    </div>
<%@include file="../../includes/footer.jsp" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_address").focus();

            }
        }).open();
    }

</script>