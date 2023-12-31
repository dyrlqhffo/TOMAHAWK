CREATE TABLE member(
	email VARCHAR2(25) PRIMARY KEY,
	password VARCHAR2(25) NOT NULL,
	name VARCHAR2(15) NOT NULL,
	nick VARCHAR2(30) NOT NULL,
	tel CHAR(11) NOT NULL,
	admin NUMBER DEFAULT 0
)

select*from member
CREATE TABLE board(

s
	board_no NUMBER PRIMARY KEY,
	email VARCHAR2(25) NOT NULL,
	title VARCHAR2(300) NOT NULL,
	content CLOB NOT NULL,
	reg_date DATE NOT NULL,
	edit_date DATE NULL,
	hits number DEFAULT 0,
	CONSTRAINT board_fk FOREIGN KEY(email) REFERENCES member(email)
)

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

alter table shop add (shop_img CLOB null);

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
CREATE SEQUENCE toma_comments_seq NOCACHE;
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
SELECT * FROM comments;
SELECT * FROM shop;
SELECT * FROM bookmark;

delete shop where shop_no = 42

ALTER TABLE comments
MODIFY (comment_edit_date NULL);



select count(*) from board where board_type='notice';
-- findBoardList
-- findFreeBoardList
SELECT rnum, b.board_no, b.title, m.nick, TO_CHAR(b.reg_date, 'YY.MM.DD') AS reg_date,TO_CHAR(reg_date,'yyyy.MM.DD hh24:mi') as edit_date, b.hits, b.content, b.board_type  
	FROM (SELECT ROW_NUMBER() OVER(ORDER BY board_no DESC) 
	AS rnum, b.board_no, b.title, b.reg_date, b.hits, b.email, b.content, b.board_type 
	FROM board b WHERE b.board_type='free') b 
INNER JOIN member m ON b.email = m.email 
WHERE rnum between 1 AND 10;

SELECT rnum, b.board_no, b.title, m.nick, TO_CHAR(b.reg_date, 'YY.MM.DD') AS reg_date,TO_CHAR(reg_date,'yyyy.MM.DD hh24:mi') as edit_date, b.hits, b.content, b.board_type  
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
WHERE board_no = 23;

-- countHits
UPDATE board SET hits = hits + 1 WHERE board_no = 24;


SELECT b.board_no, b.title, b.content, TO_CHAR(reg_date,'YYYY.MM.DD HH24:MI:SS')
AS reg_date, b.hits, b.board_type, m.email, m.nick FROM  board b
INNER JOIN member m ON b.email = m.email
WHERE board_type = 'free' AND title = '도배4';


UPDATE board SET title = '파이팅', content = '일주일만 파이팅', board_type = 'free', edit_date = sysdate 
WHERE board_no = 24;
>>>>>>> branch 'main' of https://github.com/dyrlqhffo/TOMAHAWK.git


WHERE board_type = 'shop' AND shop_name = '역전우동';

UPDATE member SET admin=2 WHERE email='kjoonie@naver.com';
UPDATE member SET name='금동준' WHERE email='kjoonie@naver.com';


update board set title= '수면8시간 이상 필수', content = '잠은 자고 합시다' , board_type = 'notice', edit_date =sysdate 
where board_no=23;

delete from board where Board_no=2;
select from board where board_type=notice;
select board_type from board;
select id,address from MEMBER;
select board(email,title,content,reg_date,edit_date,hits,board_type) from where 

-----------------------------------------------
select email,title from board where board_type='free';
select board_type from where board;
select board_type from where board_type='free';

select board_no from board where board_type='notice';
select title,content from board where board_type='notice';

select reg_date from board where board_type='notice';
select*from board;

insert into board;

insert into board(board_no, title , content, reg_date, email, board_type) values(toma_board_seq.nextval, '지각설명회', '고양이가 출근방해', sysdate, 'hellojava@naver.com' ,'notice');

update member set admin =2 where email = 'wogjsdl1244@naver.com';
<<<<<<< HEAD
select*from member;
=======

select*from bookmark
>>>>>>> branch 'main' of https://github.com/dyrlqhffo/TOMAHAWK.git


SELECT A.TABLE_NAME AS 'member',
       A.COLUMN_NAME AS "컬럼명",
       A.DATA_TYPE AS "데이터타입",
       A.DATA_LENGTH AS "길이",
       A.NULLABLE AS "Null 여부",
       B.COMMENTS AS "Comments"
FROM   dba_tab_columns A,
       all_col_comments B
WHERE  A.OWNER = B.OWNER
AND    A.TABLE_NAME = B.TABLE_NAME
AND    A.COLUMN_NAME = B.COLUMN_NAME
AND    A.OWNER = 'LOTOSDEV'  -- DB명
ORDER BY A.TABLE_NAME
    

