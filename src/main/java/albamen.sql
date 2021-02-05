/* albamen 유저 추가 */
use mysql;
select host, user from user;
create user 'albamen'@localhost identified by 'albamen';
grant all privileges on albamen.* to 'albamen'@localhost identified by 'albamen';
/* albamen 유저 삭제 */
delete from user where user = 'albamen';

/*mysql 8.0*/
use mysql;
select host, user from user;
create user 'albamen'@localhost identified by 'albamen';
grant all privileges on *.* to 'albamen'@localhost;

show databases;
create database albamen;
use albamen;
show tables;
select * from member;


/* member */
create table member( /*회원*/
                       mno int auto_increment  comment '회원시퀀스' ,
                       id varchar(30) not null  comment '회원아이디(이메일)' ,
                       password varchar(500) not null  comment '비밀번호' ,
                       name varchar(10) not null  comment '이름' ,
                       tel varchar(12) not null  comment '휴대폰' ,
                       regDate datetime default now() comment '가입일' ,
                       mStatus int not null default 0 comment '상태(0입사대기/1입사/2퇴사)' ,
                       cno int comment '회사번호' ,
                       bno int comment '지점번호' ,
                       constraint member_mno_pk primary key (mno),
                       constraint member_id_uk unique key (id)
);
ALTER TABLE member convert to charset utf8;
/* company */
create table company( /*회사테이블*/
                        cno int auto_increment comment '회사시퀀스' ,
                        id varchar(20) not null  comment '사업자번호' ,
                        password varchar(500) not null comment '비밀번호',
                        name varchar(20) not null comment '상호',
                        ceo varchar(20) not null comment '대표자',
                        regDate datetime default now() comment '가입일' ,
                        cStatus int not null default 0 comment '0가입대기1가입2탈퇴' ,
                        constraint company_cno_pk primary key (cno),
                        constraint company_id_uk unique key (id)
);
ALTER TABLE company convert to charset utf8;
/* branch */
create table branch( /* 회사 지점 테이블*/
                       bno int auto_increment  comment '번호',
                       cno int comment '회사시퀀스(회사테이블)' ,
                       bname varchar(20) not null comment '지점명',
                       btel varchar(12) not null comment '전화번호',
                       post varchar(10) not null comment '우편번호',
                       address varchar(20) not null comment '주소',
                       regDate datetime default now() comment '등록일',
                       constraint branch_cno_pk primary key (bno),
                       constraint branch_cno_fk foreign key(cno) references company(cno)
);
ALTER TABLE branch convert to charset utf8;
/* auth */
create  table auth(
                      ano int auto_increment comment '번호',
                      mno int comment '회원시퀀스',
                      cno int comment '회사시퀀스',
                      auth varchar(20) not null ,
                      constraint auth_ano_pk primary key (ano),
                      constraint auth_mno_fk foreign key (mno) references member(mno),
                      constraint auth_cno_fk foreign key (cno) references company(cno)
);
/* persistent_logins */
create table persistent_logins(
                      username varchar(64) not null,
                      series varchar(64) primary key,
                      token varchar(64) not null,
                      last_used timestamp not null
);
/* attach */
create table attach( /*첨부파일 테이블*/
                       fno int auto_increment comment '첨부파일번호' ,
                       uuid varchar(20) not null  comment '파일명',
                       path varchar(50) not null comment '저장경로' ,
                       uploadDate datetime default now() comment '업로드일' ,
                       type int comment '0사업자등록증1근로계약서' ,
                       mno int comment '회원시퀀스(회원테이블)' ,
                       cno int comment '회사시퀀스(회사테이블)' ,
                       constraint attach_fno_pk primary key (fno),
                       constraint attach_mno_fk foreign key (mno) references member(mno),
                       constraint attach_cno_fk foreign key (cno) references company(cno)
);
/* salary */
create table member_salary(/*회원급여테이블*/
                              bno int not null  comment '지점시퀀스' ,
                              mno int not null  comment '회원시퀀스' ,
                              wday datetime comment '근무일' ,
                              wTime datetime comment '근무시간' ,
                              salary int comment '당일급여액' ,
                              payday datetime comment '급여일' ,
                              pstatus int comment '0미지급1지급' ,
                              constraint member_salary_bno_pk primary key (bno),
                              constraint member_salary_bno_fk foreign key (bno) references member(bno),
                              constraint member_salary_mno_fk foreign key (mno) references member(mno)
);
/* salary_info*/
create table salary_info(/*계좌정보*/
                            si_no int auto_increment comment '계좌정보시퀀스' ,
                            bank varchar(20) not null  comment '은행명' ,
                            account varchar(20) not null  comment '계좌번호' ,
                            mno int comment '회원시퀀스' ,
                            constraint salary_info_no_pk primary key (si_no),
                            constraint salary_info_mno_fk foreign key (mno) references member(mno)
);
/* time_schdule */
create table time_schedule(/*근무시간*/
                              tno int auto_increment comment '근무시간시퀀스' ,
                              tname varchar(20) comment '근무명',
                              bno int comment '회사시퀀스(회사테이블)',
                              startTime time comment '출근시간' ,
                              endTime time comment '퇴근시간' ,
                              breakStartTime time comment '휴게시간' ,
                              breakEndTime time comment '휴게시간' ,
                              constraint time_schedule_tno_pk primary key (tno),
                              constraint time_schedule_cno_fk foreign key (bno) references company(cno)
);
/* schedule_management */
create table schedule_management(/*일정관리*/
                                    sno int auto_increment comment '일정관리시퀀스' ,
                                    sday date comment '지정일',
                                    tno int comment '근무시간시퀀스(근무시간테이블)' ,
                                    mno int comment '회원시퀀스(회원테이블)' ,
                                    sstatus int comment '0휴가1근무',
                                    constraint schedule_management_sno_pk primary key (sno),
                                    constraint schedule_management_tno_fk foreign key (tno) references time_schedule(tno),
                                    constraint schedule_management_mno_fk foreign key (mno) references member(mno)
);
/* work_managemanet */
create table work_management(/*당일근무여부*/
                                wno int auto_increment comment '당일근무여부시퀀스',
                                wDay date comment '출근일',
                                mno int comment '회원시퀀스(회원테이블)',
                                bno int comment '회사시퀀스(회사테이블)',
                                startTime time comment '출근시간',
                                endTime time comment '퇴근시간',
                                overTime time comment '초과시간',
                                startStatus int comment '0결근1정상2지각',
                                endStatus int comment '0미퇴근1정상',
                                constraint work_management_wno_pk primary key (wno),
                                constraint work_management_mno_fk foreign key (mno) references member(mno),
                                constraint work_management_cno_fk foreign key (bno) references company(cno)
);


drop table work_management;
drop table schedule_management;
drop table time_schedule;
drop table salary_info;
drop table member_salary;
drop table attach;
drop table persistent_logins;
drop table auth;
drop table branch;
drop table company;
drop table member;


