<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="now" class="java.util.Date"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>albamen</title>
</head>

<script>
    function printClock() {

        var clock = document.getElementById("clock");            // 출력할 장소 선택
        var currentDate = new Date();                                     // 현재시간
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
        var amPm = 'AM'; // 초기값 AM
        var currentHours = addZeros(currentDate.getHours(),2);
        var currentMinute = addZeros(currentDate.getMinutes() ,2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);

        if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
            if(currentHours == 12){
                amPm = 'PM';
            }else{
            amPm = 'PM';
            currentHours = addZeros(currentHours - 12,2);
            }
        }

        if(currentMinute >= 55){// 50초 이상일 때 색을 변환해 준다.
            currentMinute = '<span style="color:#de1951;">'+currentMinute+'</span>'
        }
        clock.innerHTML = calendar+" "+currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"; //날짜를 출력해 줌

        setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
    }

    function addZeros(num, digit) { // 자릿수 맞춰주기
        var zero = '';
        num = num.toString();
        if (num.length < digit) {
            for (i = 0; i < digit - num.length; i++) {
                zero += '0';
            }
        }
        return zero + num;
    }
    function timeCheck(){

    }

</script>
<style>
    .paging a{
        color: black;
    }

</style>
<body>

<jsp:include page="../includes/navbar.jsp"></jsp:include>
<div>
<c:out value="${branch.bname}"/>
</div>
<body onload="printClock()">
    <div style="border:1px solid #dedede; color:#666;font-size:20px; text-align:center;" id="clock">
    </div>
</body>

<table>

<tr>
    <th>날짜</th>
    <th>출근시간</th>
    <th>퇴근시간</th>
    <th>초과시간</th>
    <th>출근상태</th>
    <th>퇴근상태</th>

</tr>
    <c:choose>
    <c:when test="${fn:length(work.work_mList)>0}">
        <c:forEach items="${work.work_mList}" var="work">
            <tr>
                <td><fmt:formatDate pattern="yyyy-MM-dd[E]" value="${work.wday}"/> </td>
                <td><fmt:formatDate pattern="a hh:mm:ss" value="${work.startTime}"/> </td>
                <td>
                    <c:choose>
                    <c:when test="${work.endTime eq null}">
                        <c:out value="-"/>
                    </c:when>
                    <c:otherwise>
                        <fmt:formatDate pattern="a hh:mm:ss" value="${work.endTime}"/>
                    </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${work.overTime eq null}">
                            <c:out value="-"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${work.overTime}"/>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <c:choose>
                        <c:when test="${work.startstatus eq 1}" >
                            정상
                        </c:when>
                        <c:otherwise>
                            지각
                        </c:otherwise>

                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${work.endstatus eq 1}" >
                            정상
                        </c:when>
                        <c:when test="${work.endstatus eq 2}" >
                            조기퇴근
                        </c:when>
                        <c:otherwise>
                            -
                        </c:otherwise>

                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <tr>
            <td colspan="5">출퇴근 기록이 없습니다.</td>
        </tr>
    </c:otherwise>
    </c:choose>
</table>
    <%--페이징--%>
    <hr>
    <p>
        total : <c:out value="${pageMaker.total}"/>,
        page: <c:out value="${pageMaker.cri.pageNum}"/>,
        amount :
        <select class="amount">
            <option name="amount" value="10">10</option>
            <option name="amount" value="20">20</option>
            <option name="amount" value="50">50</option>
        </select>
    </p>
<%--페이징--%>
    <div class="paging">
        <p>
            <c:if test="${pageMaker.prev}">
                <a href="${pageMaker.startPage-1}">Previous</a>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <a href="${num}" >${num}</a>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                <a href="${pageMaker.endPage+1}" >Next</a>
            </c:if>
        </p>
    </div>

    <form action="/member/insertWork" method="post">
        <input type="hidden" id ="mno" name="mno" value="${member.mno}"/>
        <input type="hidden" id ="bno" name="bno" value="${member.bno}"/>
        <button type = "submit" id="on" name="on">출근</button>
        <security:csrfInput/>
    </form>
    <form action="/member/updateWork" method="post">
        <input type="hidden" id = "mno1" name="mno" value="${member.mno}"/>
        <input type="hidden" id = "bno1" name="bno" value="${member.bno}"/>
        <button type = "submit" id="off" name="off" >퇴근</button>
        <security:csrfInput/>
    </form>
    <form id="actionForm"  action="/member/workList" method="get">
        <input type='hidden' name='pageNum' class='pageNum_input' value='${pageMaker.cri.pageNum }' >
        <input type='hidden' name='amount' class='amount_input' value='${pageMaker.cri.amount }' >
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            var actionForm = $("#actionForm");

            /* 페이지 당 출력 수 조절 */
            $('.amount').change(function () {
                var amount_value = $("option:selected", this).val();
                $('.amount_input').val(amount_value);
                $('.pageNum_input').val("1");
                actionForm.val($(this).attr("href"));
                actionForm.submit();
            })
            $('.amount option').each(function () {
                if($(this).val() == "${pageMaker.cri.amount }"){
                    $(this).attr("selected", "selected");
                }
            });

            /*페이징 버튼 처리 */
            $('.paging a').click(function (e) {
                e.preventDefault();
                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                actionForm.submit();
            });
        });
    </script>

</body>
</html>