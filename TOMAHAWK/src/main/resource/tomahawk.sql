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





select sysdate from dual



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
	shop_address VARCHAR2(150) NOT NULL
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

drop table board


SELECT b.board_no,b.title,m.nick,TO_CHAR(reg_date,'YYYY.MM.DD') as reg_date,b.hits
FROM (SELECT row_number() over(ORDER BY board_no DESC) as rnum,board_no,title,reg_date,hits,email FROM board) b
INNER JOIN member m ON b.email=m.email


SELECT b.board_no,b.title,m.nick,TO_CHAR(reg_date,'YYYY.MM.DD') as reg_date,b.hits
FROM (SELECT row_number() over(ORDER BY board_no DESC) as rnum,board_no,title,reg_date,hits,email FROM board) b
INNER JOIN member m ON b.email=m.email
where rnum between 1 and 5

SELECT * FROM board;
SELECT * FROM member;
SELECT * FROM report;
SELECT * FROM comment_1;
SELECT * FROM shop;
SELECT * FROM bookmark;


-- findBoardList
-- findFreeBoardList
SELECT rnum, b.board_no, b.title, m.nick, TO_CHAR(b.reg_date, 'YY.MM.DD') AS reg_date, b.hits, b.content, b.board_type  
	FROM (SELECT ROW_NUMBER() OVER(ORDER BY board_no DESC) 
	AS rnum, b.board_no, b.title, b.reg_date, b.hits, b.email, b.content, b.board_type 
	FROM board b WHERE b.board_type='free') b 
INNER JOIN member m ON b.email = m.email 
WHERE rnum between 1 AND 10;

-- findTotalFreeBoardCount
SELECT COUNT(*) FROM board WHERE board_type = 'free';

-- findBoardByNo
SELECT b.board_no, b.title, b.content, TO_CHAR(reg_date,'YYYY.MM.DD HH24:MI:SS')
AS reg_date, b.hits, b.board_type, m.email, m.nick FROM  board b
INNER JOIN member m ON b.email = m.email 
WHERE b.board_no = 10;

-- addBoard
INSERT INTO board(board_no, title, content, reg_date, email, board_type) 
VALUES(toma_board_seq.nextval, '지옥의 월요일', '새로운 한 주가 시작됩니다', sysdate, 'kjoonie7@naver.com', 'free');

-- deleteBoardByNo
DELETE FROM board WHERE board_no = 25;

-- updateBoard
UPDATE board SET title = '파이팅', content = '일주일만 파이팅', board_type = 'free', edit_date = sysdate 
WHERE board_no = 24;

-- countHits
UPDATE board SET hits = hits + 1 WHERE board_no = 24;






UPDATE member SET admin=2 WHERE email='kjoonie@naver.com';
UPDATE member SET name='금동준' WHERE email='kjoonie@naver.com';