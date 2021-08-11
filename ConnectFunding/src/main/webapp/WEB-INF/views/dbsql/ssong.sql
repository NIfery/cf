ALTER TABLE users ADD user_nickname varchar2(100);

alter table users add user_intro varchar2(500);

alter table users add user_profile varchar2(300);

alter table notice drop column NOTICE_COUNT;

/* ¹è¼ÛÁö */
CREATE TABLE DELIVERY (
    DEL_NO NUMBER NOT NULL ENABLE, 
	DEL_RECEIVER VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	DEL_ADDRESS VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	DEL_ZIPCODE VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	DEL_HP VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	USER_NO NUMBER
);

create sequence  DELIVERY_SEQ
increment by 1
start with 1
nocache;

CREATE TABLE FOLLOW (
    FOLLOWING VARCHAR2(50),     
    FOLLOWING_USER_NO NUMBER,
    USER_NO NUMBER,
    FOLLOW_CHECK NUMBER DEFAULT 0,
    ADD_DAY DATE DEFAULT sysdate
); 

create sequence  notice_seq
increment by 1
start with 1
nocache;