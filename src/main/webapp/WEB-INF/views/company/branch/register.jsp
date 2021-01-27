<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>albamen - branch register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

</head>

<body>
    <section id="container">
        <form action="/company/branch/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<sec:authentication property="principal.username"/>" />
            <div class="form-group has-feedback">
                <label class="control-label" for="bname">지점명</label>
                <input class="form-control" type="text" id="bname" name="bname" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="btel">지점 전화번호</label>
                <input class="form-control" type="text" id="btel" name="btel" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="manager">관리자</label>
                <input class="form-control" type="text" id="manager" name="manager" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="mtel">관리자 전화번호</label>
                <input class="form-control" type="text" id="mtel" name="mtel" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="sample6_postcode">주소</label>
                <input type="text" id="sample6_postcode" name ="post" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample6_address" style="width:300px" name="address" placeholder="주소"><br>

            </div>
            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="submit">등록</button>
                <button class="cencle btn btn-danger" type="button">취소</button>
            </div>
        </form>
    </section>

</body>

</html>
