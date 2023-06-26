CREATE TABLE member(
	email VARCHAR2(25) PRIMARY KEY,
	password VARCHAR2(25) NOT NULL,
	name VARCHAR2(15) NOT NULL,
	nick VARCHAR2(30) NOT NULL,
	tel CHAR(11) NOT NULL,
	admin NUMBER DEFAULT 0
)

CREATE TABLE board(
	board_no NUMBER PRIMARY KEY,
	email VARCHAR2(25) NOT NULL,
	title VARCHAR2(300) NOT NULL,
	content CLOB NOT NULL,
	reg_date DATE NOT NULL,
	edit_date DATE NULL,
	hits number DEFAULT 0,
	CONSTRAINT board_fk FOREIGN KEY(email) REFERENCES member(email)
)
select * from BOARD;
ALTER TABLE board ADD board_type VARCHAR(25);
insert into BOARD(board_no,email,title,content,reg_date,edit_date,board_type)
values(toma_board_seq.nextval,'hellojava@naver.com','안녕','안녕하세요 오늘 소개 할 식당은 ~~~~입니다 여기는 맛있어요!',sysdate,sysdate,'review');
insert into BOARD(board_no,email,title,content,reg_date,edit_date,board_type)
values(toma_board_seq.nextval,'hellojava@naver.com','안녕2','하이',sysdate,sysdate,'free');
insert into BOARD(board_no,email,title,content,reg_date,edit_date)
values(toma_board_seq.nextval,'hellojava@naver.com','안녕3','하이',sysdate,sysdate);
insert into BOARD(board_no,email,title,content,reg_date,edit_date)
values(toma_board_seq.nextval,'hellojava@naver.com','안녕4','하이',sysdate,sysdate);

CREATE TABLE report(
	report_no NUMBER PRIMARY KEY,
	board_no NUMBER NOT NULL,
	email VARCHAR2(25) NOT NULL,
	report_type VARCHAR2(90) NOT NULL,
	CONSTRAINT FK_BOARD_TO_REPORT FOREIGN KEY (board_no) REFERENCES board(board_no),
	CONSTRAINT FK_MEMBER_TO_REPORT FOREIGN KEY(email) REFERENCES member(email)
)

CREATE TABLE shop(
	shop_no NUMBER PRIMARY KEY,
	shop_name VARCHAR2(90) NOT NULL,
	shop_type VARCHAR2(45) NOT NULL,
	shop_address VARCHAR2(150) NOT NULL,
	email VARCHAR2(25) NOT NULL,
	CONSTRAINT shop_fk FOREIGN KEY(email) REFERENCES member(email)
)

DROP TABLE COMMENT;

SELECT * FROM COMMENT

CREATE TABLE comments(
	comment_no NUMBER PRIMARY KEY,
	email VARCHAR2(25) NOT NULL,
	board_no NUMBER NOT NULL,
	shop_no NUMBER NOT NULL,
	comment_content CLOB NOT NULL,
	comment_date DATE NOT NULL,
	comment_edit_date DATE NOT NULL,
	score NUMBER NULL,
	CONSTRAINT FK_MEMBER_TO_COMMENT FOREIGN KEY(email) REFERENCES member(email),
	CONSTRAINT FK_BOARD_TO_COMMENT FOREIGN KEY(board_no) REFERENCES board(board_no),
	CONSTRAINT FK_SHOP_TO_COMMENT FOREIGN KEY (shop_no) REFERENCES shop(shop_no)
)

CREATE TABLE bookmark(
	bookmark_no NUMBER PRIMARY KEY,
	shop_no NUMBER NOT NULL,
	email VARCHAR2(25) NOT NULL,
	CONSTRAINT FK_SHOP_TO_BOOKMARK FOREIGN KEY (shop_no)REFERENCES shop(shop_no),
	CONSTRAINT FK_MEMBER_TO_BOOKMARK FOREIGN KEY (email)REFERENCES member(email)
)

CREATE SEQUENCE toma_board_seq NOCACHE;
CREATE SEQUENCE toma_report_seq NOCACHE;
CREATE SEQUENCE toma_shop_seq NOCACHE;
CREATE SEQUENCE toma_comment_seq NOCACHE;
CREATE SEQUENCE toma_bookmark_seq NOCACHE;

DROP SEQUENCE toma_board_seq;
DROP SEQUENCE toma_report_seq;
DROP SEQUENCE toma_shop_seq;
DROP SEQUENCE toma_comment_seq;
DROP SEQUENCE toma_bookmark_seq;

SELECT b.board_no,b.title,m.nick,TO_CHAR(reg_date,'YYYY.MM.DD') as reg_date,b.hits
FROM (SELECT row_number() over(ORDER BY board_no DESC) as rnum,board_no,title,reg_date,hits,email FROM board) b
INNER JOIN member m ON b.email=m.email


SELECT b.board_no,b.title,m.nick,TO_CHAR(reg_date,'YYYY.MM.DD') as reg_date,b.hits
FROM (SELECT row_number() over(ORDER BY board_no DESC) as rnum,board_no,title,reg_date,hits,email FROM board) b
INNER JOIN member m ON b.email=m.email
where rnum between 1 and 5

SELECT s.shop_no,s.shop_name,s.shop_type,s.shop_address,m.email
FROM (SELECT row_number() over(ORDER BY shop_no DESC) as rnum,shop_no,shop_name,shop_type,shop_address,email FROM shop)s
INNER JOIN member m ON s.email=m.email
where rnum between 1 and 5

SELECT shop_no,shop_name,shop_type,shop_address,email
FROM (SELECT row_number() over(ORDER BY shop_no DESC) as rnum,shop_no,shop_name,shop_type,shop_address,email FROM shop)
where rnum between 1 and 5

SELECT * FROM board;
SELECT * FROM member;
SELECT * FROM report;
SELECT * FROM comment_1;
SELECT * FROM shop;
SELECT * FROM bookmark;
