insert into users(user_no,user_flag,user_email,user_pwd,user_name)
values(1,1,'test@test.com','t','�׽���');
insert into users(user_no,user_flag,user_email,user_pwd,user_name)
values(2,1,'test3@test.com','t','�׽���3');

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


--================= 0721 �߰� =================
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
   PROJECT_NO NUMBER, /* ������Ʈ��ȣ */
   USER_NO NUMBER, /* ȸ����ȣ */
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




--=======�׽�Ʈ ������

insert into first_category values(1,'����');
insert into first_category values(2,'����');
insert into first_category values(3,'������');
insert into first_category values(4,'��ȭ');
insert into first_category values(5,'����');
insert into first_category values(6,'����');
insert into first_category values(7,'��ȭ,����');
insert into first_category values(8,'Ǫ��');
insert into first_category values(9,'����');
insert into first_category values(10,'����');
insert into first_category values(11,'��ũ');
insert into first_category values(12,'�м�');
insert into first_category values(13,'���θ���');
insert into first_category values(14,'����');

insert into second_category values(second_category_seq.nextval,'����� ����',1);
insert into second_category values(second_category_seq.nextval,'���� ����',1);
insert into second_category values(second_category_seq.nextval,'���� ����',1);
insert into second_category values(second_category_seq.nextval,'ī�� ����',1);
insert into second_category values(second_category_seq.nextval,'���� �佺Ƽ��',1);

insert into second_category values(second_category_seq.nextval,'����',2);
insert into second_category values(second_category_seq.nextval,'������',2);
insert into second_category values(second_category_seq.nextval,'����',2);

insert into second_category values(second_category_seq.nextval,'��ǰ ������',3);
insert into second_category values(second_category_seq.nextval,'�׷��� ������',3);
insert into second_category values(second_category_seq.nextval,'����,����',3);

insert into second_category values(second_category_seq.nextval,'�׷��� ���',4);
insert into second_category values(second_category_seq.nextval,'����',4);
insert into second_category values(second_category_seq.nextval,'��ȭå',4);
insert into second_category values(second_category_seq.nextval,'��ȭ ���ҽ�',4);

insert into second_category values(second_category_seq.nextval,'��������',5);
insert into second_category values(second_category_seq.nextval,'����,�ǱԾ�',5);
insert into second_category values(second_category_seq.nextval,'������ ��Ʈ',5);
insert into second_category values(second_category_seq.nextval,'����',5);
insert into second_category values(second_category_seq.nextval,'�Ϸ���Ʈ���̼�',5);
insert into second_category values(second_category_seq.nextval,'��������',5);
insert into second_category values(second_category_seq.nextval,'ȥ�ո�ü',5);
insert into second_category values(second_category_seq.nextval,'ȸȭ',5);
insert into second_category values(second_category_seq.nextval,'���� �佺Ƽ��',5);

insert into second_category values(second_category_seq.nextval,'�ι�����',6);
insert into second_category values(second_category_seq.nextval,'��������',6);
insert into second_category values(second_category_seq.nextval,'�ڿ�����',6);
insert into second_category values(second_category_seq.nextval,'��������',6);

insert into second_category values(second_category_seq.nextval,'�ؿ�ȭ',7);
insert into second_category values(second_category_seq.nextval,'��ť���͸�',7);
insert into second_category values(second_category_seq.nextval,'��������',7);
insert into second_category values(second_category_seq.nextval,'����ȭ',7);
insert into second_category values(second_category_seq.nextval,'�ִϸ��̼�',7);
insert into second_category values(second_category_seq.nextval,'�����',7);
insert into second_category values(second_category_seq.nextval,'��ȭ��,���',7);

insert into second_category values(second_category_seq.nextval,'����ŷ',8);
insert into second_category values(second_category_seq.nextval,'����',8);
insert into second_category values(second_category_seq.nextval,'�����',8);
insert into second_category values(second_category_seq.nextval,'�丮å',8);
insert into second_category values(second_category_seq.nextval,'�� Ǫ��',8);
insert into second_category values(second_category_seq.nextval,'Ǫ�� �佺Ƽ��',8);

insert into second_category values(second_category_seq.nextval,'��������',9);
insert into second_category values(second_category_seq.nextval,'��ũ,����ƽ',9);
insert into second_category values(second_category_seq.nextval,'��',9);
insert into second_category values(second_category_seq.nextval,'����',9);
insert into second_category values(second_category_seq.nextval,'���� ����',9);
insert into second_category values(second_category_seq.nextval,'�� ����',9);
insert into second_category values(second_category_seq.nextval,'�߶��',9);
insert into second_category values(second_category_seq.nextval,'Ʈ��Ʈ',9);
insert into second_category values(second_category_seq.nextval,'Ŭ����',9);
insert into second_category values(second_category_seq.nextval,'���ְ�',9);
insert into second_category values(second_category_seq.nextval,'���� �佺Ƽ��',9);

insert into second_category values(second_category_seq.nextval,'����',10);
insert into second_category values(second_category_seq.nextval,'��Ʈ��,����',10);
insert into second_category values(second_category_seq.nextval,'����,������',10);
insert into second_category values(second_category_seq.nextval,'�׸�å',10);
insert into second_category values(second_category_seq.nextval,'����',10);

insert into second_category values(second_category_seq.nextval,'�ϵ����',11);
insert into second_category values(second_category_seq.nextval,'����Ʈ����',11);
insert into second_category values(second_category_seq.nextval,'��',11);
insert into second_category values(second_category_seq.nextval,'��',11);

insert into second_category values(second_category_seq.nextval,'�Ƿ�',12);
insert into second_category values(second_category_seq.nextval,'��ȭ',12);
insert into second_category values(second_category_seq.nextval,'�־�',12);
insert into second_category values(second_category_seq.nextval,'�׼�����',12);
insert into second_category values(second_category_seq.nextval,'�Ƶ���',12);
insert into second_category values(second_category_seq.nextval,'�� ��Ÿ��',12);
insert into second_category values(second_category_seq.nextval,'��Ƽ',12);

insert into second_category values(second_category_seq.nextval,'����� ����',13);
insert into second_category values(second_category_seq.nextval,'���� ����',13);
insert into second_category values(second_category_seq.nextval,'���� ����',13);
insert into second_category values(second_category_seq.nextval,'�� ����',13);

insert into second_category values(second_category_seq.nextval,'ĵ��',14);
insert into second_category values(second_category_seq.nextval,'����',14);
insert into second_category values(second_category_seq.nextval,'����',14);
insert into second_category values(second_category_seq.nextval,'����,�ڼ�',14);
insert into second_category values(second_category_seq.nextval,'�����',14);
insert into second_category values(second_category_seq.nextval,'���װ���',14);
insert into second_category values(second_category_seq.nextval,'�ݼӰ���',14);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ1','�׽�Ʈ������Ʈ1�Դϴ�.','�׽�Ʈ������Ʈ1 �����Դϴ�.','test.jpg',1000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,3000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ2','�׽�Ʈ������Ʈ2�Դϴ�.','�׽�Ʈ������Ʈ2 �����Դϴ�.','test.jpg',2000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,455130,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ3','�׽�Ʈ������Ʈ3�Դϴ�.','�׽�Ʈ������Ʈ3 �����Դϴ�.','test.jpg',3000000,to_date('21/05/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,2);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,0,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ4','�׽�Ʈ������Ʈ4�Դϴ�.','�׽�Ʈ������Ʈ4 �����Դϴ�.','test.jpg',400000,to_date('21/06/24','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,4);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,20000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ5','�׽�Ʈ������Ʈ5�Դϴ�.','�׽�Ʈ������Ʈ5 �����Դϴ�.','test.jpg',1000000,to_date('21/07/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,6);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,4500000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ6','�׽�Ʈ������Ʈ6�Դϴ�.','�׽�Ʈ������Ʈ6 �����Դϴ�.','test.jpg',1000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,3000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ7','�׽�Ʈ������Ʈ7�Դϴ�.','�׽�Ʈ������Ʈ7 �����Դϴ�.','test.jpg',2000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,40000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ8','�׽�Ʈ������Ʈ8�Դϴ�.','�׽�Ʈ������Ʈ8 �����Դϴ�.','test.jpg',3000000,to_date('21/05/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,2);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,0,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ9','�׽�Ʈ������Ʈ9�Դϴ�.','�׽�Ʈ������Ʈ9 �����Դϴ�.','test.jpg',400000,to_date('21/06/24','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,4);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,200000,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ10','�׽�Ʈ������Ʈ10�Դϴ�.','�׽�Ʈ������Ʈ10 �����Դϴ�.','test.jpg',1000000,to_date('21/07/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,6);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,4500,project_seq.currval,1);

insert into total_funding(funding_no)
values(total_funding_seq.nextval);
Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,FUNDING_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ11','�׽�Ʈ������Ʈ11�Դϴ�.','�׽�Ʈ������Ʈ11 �����Դϴ�.','test.jpg',1000000,to_date('21/07/14','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,total_funding_seq.currval,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,320500,project_seq.currval,1);

Insert into PROJECT(PROJECT_NO,PROJECT_NAME,project_summary,project_content,PROJECT_IMAGE,
TOTAL_AMOUNT,PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,second_category_no) 
values(project_seq.nextval,'�׽�Ʈ������Ʈ2','�׽�Ʈ������Ʈ2�Դϴ�.','�׽�Ʈ������Ʈ2 �����Դϴ�.','test.jpg',2000000,to_date('21/07/04','RR/MM/DD'),
to_date('22/07/14','RR/MM/DD'),1,1);
insert into FUNDING_LIST(funding_list_no,funding_amount,project_no,user_no)
values(funding_list_seq.nextval,455130,project_seq.currval,1);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO) 
values (project_seq.nextval,'SRPG ��Ʈ �������� <���� ����>','������ �ٲ�� ���� SRPG����!','�׽�Ʈ ����','ttt4.jpg',50000,to_date('21/07/30','RR/MM/DD'),to_date('21/07/31','RR/MM/DD'),3,6);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO)
values (project_seq.nextval,'���̷��� ������ Ȯ���϶�','�ưŰ��ӽ��� ���� ����ϴ� �������','�׽�Ʈ ����','ttt3.jpg',50000,to_date('21/08/01','RR/MM/DD'),to_date('21/08/02','RR/MM/DD'),1,1);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO)
values (project_seq.nextval,'�Ĺ��� �ִ� �츮, Ÿ�����̽Ĺ���','�ȳ��ϼ���, �׸��۰� �������Դϴ�.','�׽�Ʈ ����','ttt2.jpg',1000,to_date('21/08/11','RR/MM/DD'),to_date('21/08/12','RR/MM/DD'),1,1);

Insert into PROJECT (PROJECT_NO,PROJECT_NAME,PROJECT_SUMMARY,PROJECT_CONTENT,PROJECT_IMAGE,TOTAL_AMOUNT,
PROJECT_STARTDATE,PROJECT_ENDDATE,USER_NO,SECOND_CATEGORY_NO)
values (project_seq.nextval,'�߰� ���� ����','�߰� ���� ����','�׽�Ʈ ����','ttt1.jpeg',1000,to_date('21/08/11','RR/MM/DD'),to_date('21/08/12','RR/MM/DD'),1,1);

select * from users;
select * from first_category;
select * from second_category;
select * from project;
select * from total_funding;
select * from funding_list;

commit;