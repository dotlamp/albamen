<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- jQuery UI CSS파일  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <link rel="stylesheet" href="/webjars/sweetalert2/8.18.1/dist/sweetalert2.min.css">
    <style>
        .resume-section {
            min-width: 90%;
        }
    </style>
</head>
<body id="page-top">

<jsp:include page="navbar.jsp"></jsp:include>

<div class="container-fluid p-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
        <div class="w-100">
            <div class="row">
                <div class="col text-left">
                    <h3 class="mb-3">근무자 관리</h3>
                </div>
                <div class="col text-right">
                    <i class="fas fa-circle fa-sm text-success"></i> 정상  <i class="fas fa-circle fa-sm text-warning"></i> 지각 <i class="fas fa-circle fa-sm text-danger"></i> 미출근 <i class="far fa-circle fa-sm text-success"></i> 퇴근 <i class="far fa-circle fa-sm"></i> 출근전
                </div>
            </div>

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between">
                <div class="resume-content">
                    <div class="subheading mb-2">오늘 근무</div>
                </div>
                <div class="resume-date text-md-right">
                    <span>현재시간:</span>
                    <span id="clock" >현재시간 : </span>
                </div>
            </div>

            <%--
                        <div class="row mt-2 mb-3">
                            <div class="col text-left">
                                <i class="fas fa-circle fa-sm text-success"></i> 정상 : 1 <i class="fas fa-circle fa-sm text-warning"></i> 지각 : 1 <i class="fas fa-circle fa-sm text-danger"></i> 미출근 : 1 <i class="far fa-circle fa-sm text-success"></i> 퇴근 : 1 <i class="far fa-circle fa-sm"></i> 출근전 : 1
                            </div>
                        </div>
            --%>

            `
                <div class="col-2">
                    <div class="card border-success mb-3">
                        <div class="card-header border-success"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man2.png" style="width: 25px;"> 김ㅇㅇ (지각)</div>
                        <div class="card-body text-secondary">
                            <a class="font-weight-bold text-secondary">09:30 - 12:00 (2:30)</a>
                            <a class="text-danger">09:38 - 12:04 (2:26)</a>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man2.png" style="width: 25px;"> 김ㅇㅇ</div>
                        <div class="card-body text-secondary">
                            <a class="font-weight-bold text-dark">09:30 - 16:30 (7:00)</a>
                            <a class="text-white">09:28 - (근무중)</a>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card text-white bg-danger mb-3">
                        <div class="card-header"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man.png" style="width: 25px;"> 이ㅇㅇ</div>
                        <div class="card-body text-dark">
                            <a class="font-weight-bold text-dark">09:30 - 16:30 (7:00)</a>
                            <a class="text-white">(미출근)</a>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-header"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man2.png" style="width: 25px;"> 박ㅇㅇ</div>
                        <div class="card-body text-secondary">
                            <a class="font-weight-bold text-dark">11:00 - 14:00 (3:00)</a>
                            <a class="text-white">09:32 - (근무중)</a>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man.png" style="width: 25px;"> 정ㅇㅇ</div>
                        <div class="card-body text-secondary">
                            <a class="font-weight-bold text-dark">16:30 - 21:00 (4:30)</a>
                            <a class="text-white">출근전</a>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="m-0 mt-4">

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between mt-4">
                <div class="resume-content">
                    <div class="subheading mb-3">내일 근무(예정)</div>
                </div>
                <div class="resume-date text-md-right">
                    <span class="text-primary">2019-12-21</span>
                </div>
            </div>

            <div class="row">
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col pr-0"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man2.png" style="width: 25px;"> 김ㅇㅇ</div>
                                <div class="col-1 text-right ml-2">
                                    <button class="btn m-0 p-0" onclick="updatebtn()"><i class="fa fa-pen fa-sm text-secondary"></i></button>
                                </div>
                                <div class="col-1 text-right mr-2">
                                    <button class="btn m-0 p-0" onclick="delbtn();"><i class="fa fa-times fa-sm text-secondary"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">09:30 - 16:30 (7:00)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col pr-0"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man.png" style="width: 25px;"> 이ㅇㅇ</div>
                                <div class="col-1 text-right ml-2">
                                    <button class="btn m-0 p-0" onclick="updatebtn()"><i class="fa fa-pen fa-sm text-secondary"></i></button>
                                </div>
                                <div class="col-1 text-right mr-2">
                                    <button class="btn m-0 p-0" onclick="delbtn();"><i class="fa fa-times fa-sm text-secondary"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">09:30 - 16:30 (7:00)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col pr-0"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man2.png" style="width: 25px;"> 박ㅇㅇ</div>
                                <div class="col-1 text-right ml-2">
                                    <button class="btn m-0 p-0" onclick="updatebtn()"><i class="fa fa-pen fa-sm text-secondary"></i></button>
                                </div>
                                <div class="col-1 text-right mr-2">
                                    <button class="btn m-0 p-0" onclick="delbtn();"><i class="fa fa-times fa-sm text-secondary"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">11:00 - 14:00 (3:00)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col pr-0"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man.png" style="width: 25px;"> 정ㅇㅇ</div>
                                <div class="col-1 text-right ml-2">
                                    <button class="btn m-0 p-0" onclick="updatebtn()"><i class="fa fa-pen fa-sm text-secondary"></i></button>
                                </div>
                                <div class="col-1 text-right mr-2">
                                    <button class="btn m-0 p-0" onclick="delbtn();"><i class="fa fa-times fa-sm text-secondary"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">16:30 - 21:00 (5:30)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col pr-0"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man.png" style="width: 25px;"> 김ㅇㅇ</div>
                                <div class="col-1 text-right ml-2">
                                    <button class="btn m-0 p-0" onclick="updatebtn()"><i class="fa fa-pen fa-sm text-secondary"></i></button>
                                </div>
                                <div class="col-1 text-right mr-2">
                                    <button class="btn m-0 p-0" onclick="delbtn();"><i class="fa fa-times fa-sm text-secondary"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">16:30 - 21:00 (5:30)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col pr-0"><img class="img-fluid img-profile rounded-circle mx-auto" src="static/img/man2.png" style="width: 25px;"> 김ㅇㅇ</div>
                                <div class="col-1 text-right ml-2">
                                    <button class="btn m-0 p-0" onclick="updatebtn()"><i class="fa fa-pen fa-sm text-secondary"></i></button>
                                </div>
                                <div class="col-1 text-right mr-2">
                                    <button class="btn m-0 p-0" onclick="delbtn();"><i class="fa fa-times fa-sm text-secondary"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">16:30 - 21:00 (5:30)</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">근무 시간 변경</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="part" aria-label="Checkbox for following text input">
                        </div>
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with checkbox" value="Part A. 09:00 - 13:00 (4시간)" readonly>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="part" aria-label="Checkbox for following text input">
                        </div>
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with checkbox" value="Part B. 09:00 - 15:00 (6시간)" readonly>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="part" aria-label="Checkbox for following text input">
                        </div>
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with checkbox" value="Part C. 12:00 - 15:00 (3시간)" readonly>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="part" aria-label="Checkbox for following text input">
                        </div>
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with checkbox" value="Part D. 15:00 - 21:00 (6시간)" readonly>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="part" aria-label="Checkbox for following text input">
                        </div>
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with checkbox" value="Part E. 17:00 - 21:00 (4시간)" readonly>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="part" id="custom" aria-label="Checkbox for following text input">
                        </div>
                    </div>
                    <input type="text" class="form-control" name="part" id="customtext" aria-label="Text input with checkbox" value="직접입력" readonly>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="changework()">확인</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">직접입력</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row text-left mb-2">
                    <div class="col pr-0">
                        시작시간
                    </div>
                    <div class="col-1"></div>
                    <div class="col ml-3">
                        종료시간
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="text" id="start" class="timepicker form-control w-100" autocomplete="off">
                    </div>
                    <div class="col-1">-</div>
                    <div class="col">
                        <input type="text" id="end" class="timepicker2 form-control w-100" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="customday()">확인</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="/webjars/sweetalert2/8.18.1/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

    $(document).on("click", ".modal-body", function () {
        $('.timepicker').timepicker({
            timeFormat: 'HH:mm p',
            interval: 60,
            minTime: '9',
            maxTime: '10:00pm',
            defaultTime: '9',
            startTime: '9:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

        $('.timepicker2').timepicker({
            timeFormat: 'HH:mm p',
            interval: 60,
            minTime: '9',
            maxTime: '10:00pm',
            defaultTime: '12:00pm',
            startTime: '12:00pm',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
    });

    function delbtn(){
        swal.fire({
            title: "근무 일정 삭제",
            text: "해당 근무 일정을 삭제하시겠습니까?",
            type: "warning",
            showCancelButton: true,
            allowEscapeKey: false,
            allowOutsideClick: false,
        }).then(function (result) {

            if (result.dismiss === "cancel") { // 취소면 그냥 나감
                return false;
            }

        });
    }

    $("#custom").change(function(){
        if($("#custom").is(":checked")){
            /*
            $('input[type=checkbox]').prop("checked", false);
            $('#custom').prop("checked", true);
            */
            $('#exampleModal2').modal();
            $('#exampleModal2').modal('show');
        }
    });

    function updatebtn() {
        $('#exampleModalCenter').modal();
        $('#exampleModalCenter').modal('show');
    }

    function customday(){
        var start = $('#start').val().split(" ");
        var end = $('#end').val().split(" ");

        var sTime =  start[0].split(":");
        var eTime = end[0].split(":");

        var time = Number(eTime[0])-Number(sTime[0]);

        $('#exampleModal2').modal("hide");
        $('#customtext').val(start[0]+"-"+end[0]+" ("+time+"시간)");
    }

    function changework(){
        var st = $(":input:radio[name=part]:checked").val();

        if(st==undefined||st==""||st==null){
            Swal.fire('','변경하실 파트타임을 선택해주세요.','error');
            return false;
        }

        Swal.fire('','수정되었습니다.','success');

        setTimeout(function() {
            swal.close();

            $('#exampleModalCenter').modal("hide");
            $('#customtext').val("직접입력");
            $('input[type=radio]').prop("checked", false);
        }, 1000);
    }
    //현재시간
    var clockTarget = document.getElementById("clock");

    function clock() {
        var date = new Date();

        // date Object를 받아오고
        var month = date.getMonth();

        // 달을 받아옵니다
        var clockDate = date.getDate();

        // 몇일인지 받아옵니다
        var day = date.getDay();

        // 요일을 받아옵니다.
        var week = ['일', '월', '화', '수', '목', '금', '토'];

        // 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다.
        var hours = date.getHours();

        // 시간을 받아오고
        var minutes = date.getMinutes();

        // 분도 받아옵니다.
        var seconds = date.getSeconds();

        // 초까지 받아온후

        clockTarget.innerText =(month+1)+"월  "+clockDate+"일  "+ week[day]+"요일  " +(( hours < 10 ) ? "0" + hours : hours) + " : " + (( minutes < 10 ) ? "0" + minutes : minutes) + " : " + ((seconds < 10) ? "0" + seconds : seconds);
    }
    function init() {

        clock();

        // 최초에 함수를 한번 실행시켜주고
        setInterval(clock, 1000);

        // setInterval이라는 함수로 매초마다 실행을 해줍니다.

        // setInterval은 첫번째 파라메터는 함수이고 두번째는 시간인데 밀리초단위로 받습니다. 1000 = 1초

    }

    init();
</script>
</body>

</html>
