<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar"%>

<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH)+1;
    int day = cal.get(Calendar.DATE);
%>
    <style>
        .resume-section {
            min-width: 95%;
        }
        .sun{
            color:red;
        }

        .sat{
            color:blue;
        }

        .gray{
            color:#D8D8D8;
        }

        .today{
            background-color: #d3d9df;
        }

        .table thead tr > td{
            padding: 2px;
        }

        #calendar_table td{
            width: 150px;
        }

        #calendar_table tr{
            height: 120px;
        }
    </style>
<%@include file="../../includes/header.jsp" %>

<div>
    <form action="/company/branch/time" method="get">
        <input type="hidden" id="bno" name="bno" value="${branch.bno}">
        <input type="submit" value="근무시간관리">
    </form>
</div>

<body id="page-top" <%--onload="buildCalendar();"--%>>
<div class="container-fluid p-0">
    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
        <div class="w-100">
            <div class="col text-left">
                <h3 class="mb-3">2</h3>
                <hr class="bg-warning">
                <div class="row p-1">
                    <div class="col text-left">
                        <button class="btn btn-dark ml-3" onclick="getToday();"> TODAY </button>
                    </div>
                    <div class="col text-center">
                        <button class="btn btn-outline-warning mr-2" onclick="prevmonth();"> < </button>
                        <a class="fa-lg" id="yyyymm"><t id="thisYear"><%=year%></t>년 <t id="thisMonth"><%=month%>월</t></a>
                        <button class="btn btn-outline-warning ml-2" onclick="nextmonth();"> > </button>
                    </div>
                    <div class="col text-right">
                        <button class="btn btn-dark" onclick="monthly();"> MONTH </button>
                        <button class="btn btn-dark" onclick="weekly(<%=year%>,<%=month%>,<%=day%>,null);"> WEEK </button>
                    </div>
                </div>
            </div>
            <div class="row pr-1 pl-1 mt-3">
                <div class="col">
                    <table class="table" border="0" cellspacing="1" cellpadding="1" class="w-100" id="calendar">
                        <thead class="bg-warning">
                        <tr>
                            <td>
                                <div align="center"><a class="text-danger">일</a></div>
                            </td>
                            <td>
                                <div align="center"><a class="text-dark">월</a></div>
                            </td>
                            <td>
                                <div align="center"><a class="text-dark">화</a></div>
                            </td>
                            <td>
                                <div align="center"><a class="text-dark">수</a></div>
                            </td>
                            <td>
                                <div align="center"><a class="text-dark">목</a></div>
                            </td>
                            <td>
                                <div align="center"><a class="text-dark">금</a></div>
                            </td>
                            <td>
                                <div align="center"><a class="text-info">토</a></div>
                            </td>
                        </tr>
                        </thead>
                        <tbody id="calendar_table">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>

<form action="/company/branch/schedule" method="post">
    <input type="date" id=sday" name="sday" value="">
    <input type="hidden" id="mno" name="mno">
    <input type="text" id="name" name="name" readonly>
    <input type="button" value="멤버선택" onclick="memberList(${branch.bno})">
    <input type="hidden" id="tno" name="tno">
    <input type="text" id="tname" name="tname" readonly>
    <input type="button" value="근무시간선택" onclick="timeList(${branch.bno})">
    <input type="radio" name="sstatus" value="1" checked>근무
    <input type="radio" name="sstatus" value="0">휴가
    <input type="hidden" name="bno" value="${branch.bno}">
    <s:csrfInput/>
    <input type="submit" name="addSchedule" value="일정추가">
</form>

근무자 확인 :
<input type="date" id="scDay" onchange="scList();">
<div id="scList">

</div>
<div class="modal fade bd-example-modal-lg" id="confirmmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">

                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">근무타입</th>
                            <th scope="col">이름</th>
                            <th scope="col">근무일정</th>
                            <th scope="col">총 근무시간</th>
                            <th scope="col">상태</th>
                            <th scope="col">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="bg-warning">
                            <th scope="row">매니저</th>
                            <td>Larry</td>
                            <td>13:30~21:30</td>
                            <td>8시간</td>
                            <td>근무중</td>
                            <td>
                                -
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><t class="type"></t> C</th>
                            <td>Larry</td>
                            <td>16:30~22:00</td>
                            <td>5시간30분</td>
                            <td>예정</td>
                            <td>
                                <button class="btn m-0 p-0 mr-2"><i class="fa fa-pen fa-sm text-secondary" onclick="updatebtn()"></i></button>
                                <button class="btn m-0 p-0"><i class="fa fa-times fa-sm text-secondary" onclick="delbtn();"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../../includes/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/static/js/LunarCalendar.js"></script>
<script>

    function memberList(s) {
        window.open("/company/branch/member?bno="+s, "width=800, height=600");
    }
    function timeList(s) {
        window.open("/company/branch/timeList?bno="+s, "width=800, height=600");
    }
    function scList() {
        var bno = $('#bno').val();
        var scDay = $('#scDay').val();
        $.ajax({
            url: '/company/branch/scheduleList',
            type: 'post',
            dataType: 'text',
            data: {bno: bno, sday: scDay},
            beforeSend: function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (data) {
                $('#scList').html(data);
            },
            error: function () {
                // console.log("error");
            }
        }); //ajax
    }

    function prevmonth() {

        if($("#thisMonth").text().indexOf('월')==-1){
            weekly(null,null,null,"prev");
        }else{
            var month = $("#thisMonth").text().replace("월","");
            month = Number(month) - 1;

            var year = $("#thisYear").text();
            if(month<1){
                year = Number(year) - 1;
                month = 12;
            }

            $("#thisYear").text(year);
            $("#thisMonth").text(month+"월");

            buildCalender(new Date(year+"-"+month))
        }
    }
    function nextmonth() {
        if($("#thisMonth").text().indexOf('월')==-1){
            weekly(null,null,null,"next");
        }else{
            var month = $("#thisMonth").text().replace("월","");
            month = Number(month) + 1;

            var year = $("#thisYear").text();
            if(month>12){
                year = Number(year) + 1;
                month = 1;
            }

            $("#thisYear").text(year);
            $("#thisMonth").text(month+"월");

            buildCalender(new Date(year+"-"+month))
        }
    }
    function getToday(){

        var month = $("#thisMonth").text();

        var today = new Date();

        if(month.indexOf('월')!=-1){
            $("#thisYear").text(today.getFullYear());
            $("#thisMonth").text((today.getMonth()+1)+"월");
            buildCalender(today);
        }else{
            weekly(today.getFullYear(),today.getMonth()+1,today.getDate(),null);
        }

    }

    function getFormatDate(date) {
        var year = date.getFullYear();              //yyyy
        var month = (1 + date.getMonth());          //M
        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
        var day = date.getDate();                   //d
        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
        return year + '' + month + '' + day;
    }

    function buildCalender(day){
        $( '#calendar_table').empty();
        // 현재 날짜와 현재 달에 1일의 날짜 객체 생성
        var date = new Date(day);
        var y = date.getFullYear();
        var m = date.getMonth();
        var d = date.getDate();

        if(y==new Date().getFullYear()&&m==new Date().getMonth()){
            d = new Date().getDate();
        }

        //현재 년(y)월(m)의 1일(1)의 요일
        var theDate = new Date(y,m,1);
        //요일
        var theDay = theDate.getDay();

        //현재 월의 마지 막 일
        //1월부터 12월까지의 마지막 일 배열
        var last = [31,28,31,30,31,30,31,31,30,31,30,31];
        //현재월의 마지막 일
        var lastDate;

        //윤년 계산
        if(y%4==0&&y%100!=0||y%400===0){
            last[1] = 29;
        }

        lastDate = last[m];

        //달력에 필요한 행의 개수
        //theDay(빈 칸의 수), lastDate(월의 전체 일수)
        var row = Math.ceil((theDay+lastDate)/7);

        var calendar = "";
        //달력에 표기되는 일의 초기값!
        var dNum = 1;
        for(var i=1;i<=row;i++){ //행 만들기
            calendar+="<tr style='max-height:35px'>";
            for(var k=1;k<=7;k++){ //열 만들기
                //월 1일 이전 + 월 마지막일 이후 = 빈 칸
                if(i==1&&k<=theDay||dNum>lastDate){
                    calendar += "<td>&nbsp;</td>";
                }else{
                    var tdClass="";
                    if(m==new Date().getMonth()&&dNum==new Date().getDate())
                        tdClass = "today";
                    else
                        tdClass ="";

                    if(k==1)
                        tdClass +=" sun";

                    if(k==7)
                        tdClass +=" sat";

                    tdClass += " m"+(m+1)+"_"+dNum;

                    var solarHolidays = ["0101","0301","0505","0606","0815","1003","1009","1225"] //양력휴일
                    var solarHolidaysText = ["새해","삼일절","어린이날","현충일","광복절","개천절","한글날","크리스마스"];
                    var lunaHolidays = ["0101","0102","0408","0814","0815","0816"] //음력휴일, 설전날도 추가되어야함(12월 마지막일 *매번 다름)
                    var lunaHolidaysText = ["설날","설날연휴","부처님오신날","추석연휴","추석","추석연휴"] //음력휴일, 설전날도 추가되어야함(12월 마지막일 *매번 다름)

                    //대체 공휴일 입력구간. 임시휴일이나 대체공휴일이 있을 경우 배열에 넣어주면 됨. yyyymmdd 입력
                    var alternativeHolidays = ['20200127','20220912','20230124','20240212','20240506','20251008','20270209','20330202','20340221','20350918','20360130'];
                    var setLunaToSolar = []; //당해년도 음력을 양력으로

                    for(var j=0;j<lunaHolidays.length;j++){
                        setLunaToSolar.push(lunarcalendar(y+lunaHolidays[j]));
                    }

                    var holiday = "";

                    for(var j=0;j<alternativeHolidays.length;j++){
                        if(alternativeHolidays[j]==y+((m+1).toString().length!=1?m+1:'0'+(m+1)).toString()+(dNum.toString().length!=1?dNum:'0'+dNum).toString()){
                            tdClass = " sun";
                            tdClass += " m"+(m+1)+"_"+dNum;
                            holiday = "<a class='fa-sm'> 대체 공휴일</a>"
                        }
                    }

                    for(var j=0;j<setLunaToSolar.length;j++){
                        if(j==0){
                            var t1 = (lunarcalendar(y+'0101')-1).toString().length!=4?'0'+(lunarcalendar(y+'0101')-1):(lunarcalendar(y+'0101')-1);
                            var t2 = ((m+1).toString().length!=1?m+1:'0'+(m+1)).toString()+(dNum.toString().length!=1?dNum:'0'+dNum).toString();
                            if(t1==t2){
                                tdClass = " sun";
                                tdClass += " m"+(m+1)+"_"+dNum;
                                holiday = "<a class='fa-sm'> 설날연휴</a>"
                            }
                        }
                        if(setLunaToSolar[j]==((m+1).toString().length!=1?m+1:'0'+(m+1)).toString()+(dNum.toString().length!=1?dNum:'0'+dNum).toString()){
                            tdClass = " sun";
                            tdClass += " m"+(m+1)+"_"+dNum;
                            holiday = "<a class='fa-sm'> "+lunaHolidaysText[j]+"</a>";
                        }
                    }

                    for(var j=0;j<solarHolidays.length;j++){
                        if(solarHolidays[j]==((m+1).toString().length!=1?m+1:'0'+(m+1)).toString()+(dNum.toString().length!=1?dNum:'0'+dNum).toString()){
                            tdClass = " sun";
                            tdClass += " m"+(m+1)+"_"+dNum;
                            holiday =  "<a class='fa-sm'> "+ solarHolidaysText[j]+"</a>";
                        }
                    }

                    calendar +="<td class='"+tdClass+"' style='cursor:pointer;' onclick='details("+y+","+(m+1)+","+dNum+","+k+");'>"
                        +dNum+holiday+"</td>";
                    dNum++;
                }
            }
            calendar += "</tr>";
        }
        $("#calendar_table").append(calendar);

        if(d!=1){
            $(".m"+(m+1)+"_"+(d-1)).append("<br><t class='fa-sm gray'>A</t><br><t class='fa-sm gray'>B</t>");
            $(".m"+(m+1)+"_"+d).append("<br><t class='fa-sm text-dark font-weight-bold'>C</t>");
        }else{
            $(".m"+(m+1)+"_"+d).append("<br><t class='fa-sm text-dark'>D</t>");
        }

        $(".m"+(m+1)+"_"+(d+1)).append("<br><t class='fa-sm text-dark'>E</t>")
    }

    buildCalender(new Date());

    function details(y,m,d,k){

        $('#confirmmodal').modal();
        $('#confirmmodal').modal('show');

        $( '#title' ).html(y+"년 "+m+"월 "+d+"일 근무일정");

        if(k==1||k==7){
            $( '.type' ).html("주말");
        }else{
            $( '.type' ).html("평일");
        }
    }

    function weekly(year,month,day,type){
        $( '#calendar_table').empty();
        var currentDay = new Date(year+'-'+month+'-'+day);

        if(type=="prev"){
            year = $("#thisYear").text();
            var str = $("#thisMonth").text();
            month = str.substring(1, 3);
            day = str.substring(4, 6);

            currentDay = new Date(year+'-'+month+'-'+day);
            currentDay.setDate(currentDay.getDate()-7);
        }else if(type=="next"){
            year = $("#thisYear").text();
            var str = $("#thisMonth").text();
            month = str.substring(1, 3);
            day = str.substring(4, 6);

            currentDay = new Date(year+'-'+month+'-'+day);
            currentDay.setDate(currentDay.getDate()+7);
        }
        var theYear = currentDay.getFullYear();
        var theMonth = currentDay.getMonth();
        var theDate  = currentDay.getDate();
        var theDayOfWeek = currentDay.getDay();

        var thisWeek = [];

        for(var i=0; i<7; i++) {
            var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
            var yyyy = resultDay.getFullYear();
            var mm = Number(resultDay.getMonth()) + 1;
            var dd = resultDay.getDate();

            mm = String(mm).length === 1 ? '0' + mm : mm;
            dd = String(dd).length === 1 ? '0' + dd : dd;

            //thisWeek[i] = yyyy + '-' + mm + '-' + dd;
            thisWeek[i] = mm + '/' + dd;
        }

        $('#thisYear').html(yyyy);
        $('#thisMonth').html(mm);
        //$('#thieWeek').html(getWeekNo(currentDay) +"째주");

        var calendar = "";
        calendar+="<tr style='height:600px'>";
        for(var k=0;k<thisWeek.length;k++){ //열 만들기
            var tdClass="";
            if(Number(mm)==new Date().getMonth()+1&&Number(thisWeek[k].substring(thisWeek[k].length-2,thisWeek[k].length))==new Date().getDate())
                tdClass = "today";
            else
                tdClass ="";

            if(k==0)
                tdClass +=" sun";

            if(k==6)
                tdClass +=" sat";


            tdClass += " m"+Number(mm)+"_"+Number(thisWeek[k].substring(thisWeek[k].length-2,thisWeek[k].length));

            // 해당 주에 전월 데이터 or 당월 데이터가 포함된경우 달/일 표시해줘야함
            /*
                        calendar +="<td class='"+tdClass+"' style='cursor:pointer;' onclick='details("+yyyy+","+mm+","+dd+","+(k+1)+");'>"
                           +thisWeek[k]+"</td>";
            */
            calendar +="<td class='"+tdClass+"' style='cursor:pointer;' onclick='details("+yyyy+","+mm+","+dd+","+(k+1)+");'>"
                + Number(thisWeek[k].substring(thisWeek[k].length-2,thisWeek[k].length))+"</td>";
        }

        calendar += "</tr>";

        $("#calendar_table").append(calendar);

        $("#thisMonth").html("["+thisWeek[0]+"-"+thisWeek[thisWeek.length-1]+"]");
    }

    function monthly(){
        var month = $("#thisMonth").text();
        var now = new Date();
        if(month.indexOf('월')==-1){
            $("#thisMonth").text((now.getMonth()+1)+"월");
            buildCalender(now);
        }
    }

</script>
