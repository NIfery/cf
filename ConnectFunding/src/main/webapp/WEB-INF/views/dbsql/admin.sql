create table admin
(
admin_no number not null,
admin_id varchar2(50) not null,
admin_pwd varchar2(100) not null,
admin_position varchar2(50) not null,
admin_name varchar2(50) not null,
regdate date default sysdate
);

create sequence admin_seq
increment by 1
start with 1
nocache;

create table position
(
	authCode           varchar2(30)  primary key,  --권한코드
	authName          varchar2(100)  not null, --권한명
    authLevel       number(3),   --레벨 순위  --1(ADMIN), 2(ASSISTANT), 3(STAFF)     
	regdate		date  default sysdate
);

INSERT INTO position VALUES ('ADMIN','관리자', 1, SYSDATE);
INSERT INTO position VALUES ('FUNDING_CHECK_Admin','펀딩심사자', 2, SYSDATE);
INSERT INTO position VALUES ('QnA_Admin','문의담당자', 3, SYSDATE);



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