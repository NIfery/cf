insert into users(user_no,user_flag,user_email,user_pwd,user_name)
values(1,1,'test@test.com','t','테스터');
insert into users(user_no,user_flag,user_email,user_pwd,user_name)
values(2,1,'test3@test.com','t','테스터3');

alter table total_funding
MODIFY total_funding_amount default 0;

create SEQUENCE second_category_seq
start with 1
increment by 1
nocache;

create SEQUENCE project_seq
start with 1
increment by 1
nocache;

create SEQUENCE total_funding_seq
start with 1
increment by 1
nocache;

create SEQUENCE funding_list_seq
start with 1
increment by 1
nocache;

alter table project
modify funding_no null;

alter table FUNDING_LIST
add SUPPORT_DATE DATE;

alter table FUNDING_LIST
MODIFY SUPPORT_DATE DATE DEFAULT sysdate NOT NULL;

alter table FUNDING_LIST
add RECEIPT_ID VARCHAR2(200);

alter table project
add confirm varchar2(10) default 'N';

update project
set confirm='Y';
commit;

alter table project
add project_regdate date default sysdate;

ALTER TABLE project ADD project_inshort VARCHAR(700);


--================= 0721 추가 =================
CREATE TABLE LIKE_PROJECT (
   LIKE_NO NUMBER, 
    PROJECT_NO NUMBER,
   USER_NO NUMBER
);

create SEQUENCE  like_seq
start with 1
increment by 1
nocache;

CREATE TABLE INFORM_PROJECT (
   INFORM_PROJECT_NO NUMBER NOT NULL, 
   PROJECT_NO NUMBER, /* 프로젝트번호 */
   USER_NO NUMBER, /* 회원번호 */
    INFORM_CHECK NUMBER DEFAULT 0
);

create SEQUENCE INFORM_PROJECT_seq
start with 1
increment by 1
nocache;

create or replace view fundingListView
as
select p.project_name, p.project_image , to_date(project_enddate, 'yyyy-mm-dd')+3 as paydate,
floor(sysdate - project_startdate) as opendate, p.project_enddate,
f.funding_amount, f.support_date,f.user_no,f.receipt_id
from project p join funding_list f
on p.project_no=f.project_no
order by f.support_date;

create or replace view likeProjectView
as
select p.project_name, p. project_inshort, u.user_name,
floor(project_enddate-sysdate) as restday, p.project_image, i.user_no, i.like_no
from project p join like_project i
on p.project_no=i.project_no
join users u on u.user_no=p.user_no;

create or replace view informProjectView
as
select p.project_name, p.project_image , floor(sysdate - project_startdate) as opendate,
i.user_no, i.project_no
from project p join inform_project i
on p.project_no=i.project_no;

--===============0810

create or replace view fundingListView
as
select p.project_name, p.project_image , to_date(project_enddate, 'yyyy-mm-dd')+3 as paydate,
floor(sysdate - project_startdate) as opendate, p.project_enddate, u.user_name, p.total_amount, p.confirm,
f.funding_amount, f.support_date,f.user_no,f.receipt_id
from project p join funding_list f
on p.project_no=f.project_no
join users u
on f.user_no = u.user_no
order by f.support_date;

create or replace view fundingCategoryView
as
select f.first_category_no, f.category_name, s.second_category_no, p.project_name, p.confirm
from project p join second_category s
on p.second_category_no=s.second_category_no
join first_category f
on f.first_category_no = s.first_category_no
order by f.first_category_no;

create or replace view downFundingView
as
select f.category_name as one, p.project_name as two, p.project_startdate as three, p.project_enddate as four, p.total_amount as five, nvl(l.funding_amount,0) as six,
u.user_name as seven, u.user_email as eight
from project p join second_category s
on p.second_category_no=s.second_category_no
join first_category f
on f.first_category_no = s.first_category_no
left join funding_list l 
on l.project_no = p.project_no
left join users u
on u.user_no = p.user_no;




--=======테스트 데이터

insert into first_category values(1,'게임');
insert into first_category values(2,'공연');
insert into first_category values(3,'디자인');
insert into first_category values(4,'만화');
insert into first_category values(5,'예술');
insert into first_category values(6,'사진');
insert into first_category values(7,'영화,비디오');
insert into first_category values(8,'푸드');
insert into first_category values(9,'음악');
insert into first_category values(10,'출판');
insert into first_category values(11,'테크');
insert into first_category values(12,'패션');
insert into first_category values(13,'저널리즘');
insert into first_category values(14,'공예');

insert into second_category values(second_category_seq.nextval,'모바일 게임',1);
insert into second_category values(second_category_seq.nextval,'보드 게임',1);
insert into second_category values(second_category_seq.nextval,'비디오 게임',1);
insert into second_category values(second_category_seq.nextval,'카드 게임',1);
insert into second_category values(second_category_seq.nextval,'게임 페스티벌',1);

insert into second_category values(second_category_seq.nextval,'무용',2);
insert into second_category values(second_category_seq.nextval,'뮤지컬',2);
insert into second_category values(second_category_seq.nextval,'연극',2);

insert into second_category values(second_category_seq.nextval,'제품 디자인',3);
insert into second_category values(second_category_seq.nextval,'그래픽 디자인',3);
insert into second_category values(second_category_seq.nextval,'건축,공간',3);

insert into second_category values(second_category_seq.nextval,'그래픽 노블',4);
insert into second_category values(second_category_seq.nextval,'웹툰',4);
insert into second_category values(second_category_seq.nextval,'만화책',4);
insert into second_category values(second_category_seq.nextval,'만화 리소스',4);

insert into second_category values(second_category_seq.nextval,'공공예술',5);
insert into second_category values(second_category_seq.nextval,'조소,피규어',5);
insert into second_category values(second_category_seq.nextval,'디지털 아트',5);
insert into second_category values(second_category_seq.nextval,'전시',5);
insert into second_category values(second_category_seq.nextval,'일러스트레이션',5);
insert into second_category values(second_category_seq.nextval,'행위예술',5);
insert into second_category values(second_category_seq.nextval,'혼합매체',5);
insert into second_category values(second_category_seq.nextval,'회화',5);
insert into second_category values(second_category_seq.nextval,'예술 페스티벌',5);

insert into second_category values(second_category_seq.nextval,'인물사진',6);
insert into second_category values(second_category_seq.nextval,'공간사진',6);
insert into second_category values(second_category_seq.nextval,'자연사진',6);
insert into second_category values(second_category_seq.nextval,'동물사진',6);

insert into second_category values(second_category_seq.nextval,'극영화',7);
insert into second_category values(second_category_seq.nextval,'다큐멘터리',7);
insert into second_category values(second_category_seq.nextval,'뮤직비디오',7);
insert into second_category values(second_category_seq.nextval,'단편영화',7);
insert into second_category values(second_category_seq.nextval,'애니메이션',7);
insert into second_category values(second_category_seq.nextval,'웹드라마',7);
insert into second_category values(second_category_seq.nextval,'영화제,행사',7);

insert into second_category values(second_category_seq.nextval,'베이킹',8);
insert into second_category values(second_category_seq.nextval,'음료',8);
insert into second_category values(second_category_seq.nextval,'간편식',8);
insert into second_category values(second_category_seq.nextval,'요리책',8);
insert into second_category values(second_category_seq.nextval,'펫 푸드',8);
insert into second_category values(second_category_seq.nextval,'푸드 페스티벌',8);

insert into second_category values(second_category_seq.nextval,'전자음악',9);
insert into second_category values(second_category_seq.nextval,'포크,어쿠스틱',9);
insert into second_category values(second_category_seq.nextval,'록',9);
insert into second_category values(second_category_seq.nextval,'힙합',9);
insert into second_category values(second_category_seq.nextval,'재즈 음악',9);
insert into second_category values(second_category_seq.nextval,'팝 음악',9);
insert into second_category values(second_category_seq.nextval,'발라드',9);
insert into second_category values(second_category_seq.nextval,'트로트',9);
insert into second_category values(second_category_seq.nextval,'클래식',9);
insert into second_category values(second_category_seq.nextval,'연주곡',9);
insert into second_category values(second_category_seq.nextval,'음악 페스티벌',9);

insert into second_category values(second_category_seq.nextval,'잡지',10);
insert into second_category values(second_category_seq.nextval,'아트북,도감',10);
insert into second_category values(second_category_seq.nextval,'문학,에세이',10);
insert into second_category values(second_category_seq.nextval,'그림책',10);
insert into second_category values(second_category_seq.nextval,'번역',10);

insert into second_category values(second_category_seq.nextval,'하드웨어',11);
insert into second_category values(second_category_seq.nextval,'소프트웨어',11);
insert into second_category values(second_category_seq.nextval,'앱',11);
insert into second_category values(second_category_seq.nextval,'웹',11);

insert into second_category values(second_category_seq.nextval,'의류',12);
insert into second_category values(second_category_seq.nextval,'잡화',12);
insert into second_category values(second_category_seq.nextval,'주얼리',12);
insert into second_category values(second_category_seq.nextval,'액세서리',12);
insert into second_category values(second_category_seq.nextval,'아동복',12);
insert into second_category values(second_category_seq.nextval,'펫 스타일',12);
insert into second_category values(second_category_seq.nextval,'뷰티',12);

insert into second_category values(second_category_seq.nextval,'오디오 저널',13);
insert into second_category values(second_category_seq.nextval,'비디오 저널',13);
insert into second_category values(second_category_seq.nextval,'출판 저널',13);
insert into second_category values(second_category_seq.nextval,'웹 저널',13);

insert into second_category values(second_category_seq.nextval,'캔들',14);
insert into second_category values(second_category_seq.nextval,'조향',14);
insert into second_category values(second_category_seq.nextval,'도예',14);
insert into second_category values(second_category_seq.nextval,'섬유,자수',14);
insert into second_category values(second_category_seq.nextval,'목공예',14);
insert into second_category values(second_category_seq.nextval,'가죽공예',14);
insert into second_category values(second_category_seq.nextval,'금속공예',14);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트1','테스트프로젝트1입니다.','테스트프로젝트1 내용입니다.','test.jpg',1000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,3000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트2','테스트프로젝트2입니다.','테스트프로젝트2 내용입니다.','test.jpg',2000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,455130,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트3','테스트프로젝트3입니다.','테스트프로젝트3 내용입니다.','test.jpg',3000000,to_date('21/05/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,2);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,0,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트4','테스트프로젝트4입니다.','테스트프로젝트4 내용입니다.','test.jpg',400000,to_date('21/06/24','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,4);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,20000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트5','테스트프로젝트5입니다.','테스트프로젝트5 내용입니다.','test.jpg',1000000,to_date('21/07/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,6);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,4500000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트6','테스트프로젝트6입니다.','테스트프로젝트6 내용입니다.','test.jpg',1000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,3000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트7','테스트프로젝트7입니다.','테스트프로젝트7 내용입니다.','test.jpg',2000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,40000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트8','테스트프로젝트8입니다.','테스트프로젝트8 내용입니다.','test.jpg',3000000,to_date('21/05/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,2);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,0,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트9','테스트프로젝트9입니다.','테스트프로젝트9 내용입니다.','test.jpg',400000,to_date('21/06/24','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,4);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,200000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트10','테스트프로젝트10입니다.','테스트프로젝트10 내용입니다.','test.jpg',1000000,to_date('21/07/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,6);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,4500,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트11','테스트프로젝트11입니다.','테스트프로젝트11 내용입니다.','test.jpg',1000000,to_date('21/07/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,320500,project_seq.currval,1);

Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,second_category_no) 
values(project_seq.nextval,'테스트프로젝트2','테스트프로젝트2입니다.','테스트프로젝트2 내용입니다.','test.jpg',2000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,455130,project_seq.currval,1);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO) 
values (project_seq.nextval,'SRPG 도트 생존게임 <좀비 세대>','엔디잉 바뀌는 생존 SRPG게임!','테스트 내용','ttt4.jpg',50000,to_date('21/07/30','RR/MM/DD'),to_date('21/07/31','RR/MM/DD'),3,6);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO)
values (project_seq.nextval,'바이러스 샘플을 확보하라','아거게임스가 새로 출시하는 보드게임','테스트 내용','ttt3.jpg',50000,to_date('21/08/01','RR/MM/DD'),to_date('21/08/02','RR/MM/DD'),1,1);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO)
values (project_seq.nextval,'식물이 있는 우리, 타이페이식물원','안녕하세요, 그림작가 김제희입니다.','테스트 내용','ttt2.jpg',1000,to_date('21/08/11','RR/MM/DD'),to_date('21/08/12','RR/MM/DD'),1,1);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO)
values (project_seq.nextval,'야간 자유 괴담','야간 자유 괴담','테스트 내용','ttt1.jpeg',1000,to_date('21/08/11','RR/MM/DD'),to_date('21/08/12','RR/MM/DD'),1,1);

select * from users;
select * from first_category;
select * from second_category;
select * from project;
select * from total_funding;
select * from funding_list;

commit;