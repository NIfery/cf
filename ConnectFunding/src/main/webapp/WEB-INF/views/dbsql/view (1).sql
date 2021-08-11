create SEQUENCE board2_seq
START with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE comments_seq
START with 1
INCREMENT by 1
NOCACHE;


alter table board2 modify BOARD_DOWNCOUNT NUMBER default 0;
alter table board2 modify BOARD_REGDATE DATE default sysdate;
alter table board2 modify BOARD_READCOUNT NUMBER default 0;
alter table board2 modify DELFLAG VARCHAR2(30) default 'N';

alter table comments modify comment_regdate date default sysdate;
alter table comments modify COMMENT_STEP NUMBER default 0;
alter table comments modify COMMENT_SORTNO NUMBER default 0;
alter table comments modify COMMENT_DELFLAG VARCHAR2(50) default 'N';

create or replace view Count
as
select count(*)as count, BOARD_NO
from comments
GROUP by board_no;

create or replace view ShowProfile
as
select c.user_nickname as nickname,u.user_profile as profile from
comments c join users u
on c.User_nickname = u.user_nickname;

create or replace view Userboard
as
select b.*,u.user_profile,u.user_name
from board2 b join users u
on b.user_nickname = u.user_nickname;