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
    <th>번호</th>
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
                <td><c:out value='${work.wno}'/></td>
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
                        <c:when test="${work.addTime eq null}">
                            <c:out value="-"/>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate pattern="a hh:mm:ss" value="${work.addTime}"/>
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

    <form action="/member/insertWork" method="post">
        <input type="text" id ="mno" name="mno" value="${member.mno}"/>
        <input type="text" id ="bno" name="bno" value="${member.bno}"/>
        <button type = "submit" id="on" name="on">출근</button>
        <security:csrfInput/>
    </form>
    <form action="/member/updateWork" method="post">
        <input type="text" id = "mno1" name="mno" value="${member.mno}"/>
        <input type="text" id = "bno1" name="bno" value="${member.bno}"/>
        <button type = "submit" id="off" name="off" >퇴근</button>
        <security:csrfInput/>
    </form>


</body>
</html>