create table member(
	email varchar2(25) primary key,
	password varchar2(25) not null,
	name varchar2(15) not null,
	nick varchar2(30) not null,
	tel char(11) not null,
	admin number default 0
)

create table board(
	board_no number primary key,
	email varchar2(25) not null,
	title varchar2(300) not null,
	content clob not null,
	reg_date date not null,
	edit_date date null,
	hits number default 0,
	board_like number default 0,
	CONSTRAINT board_fk FOREIGN KEY(email) REFERENCES member(email)
)

create table report(
	report_no number not null,
	board_no number not null,
	email varchar2(25) not null,
	report_type varchar2(90) not null,
	CONSTRAINT FK_BOARD_TO_REPORT FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO),
	CONSTRAINT FK_MEMBER_TO_REPORT FOREIGN KEY(EMAIL)REFERENCES MEMBER(EMAIL)
)

create table shop(
	shop_no number primary key,
	shop_name varchar2(90) not null,
	shop_type varchar2(45) not null,
	shop_address varchar2(150) not null
)

create table comment_1(
	comment_no number primary key,
	email varchar2(25) not null,
	board_no number not null,
	shop_no number not null,
	comment_content clob not null,
	comment_date date not null,
	comment_edit_date date not null,
	score number null,
	CONSTRAINT FK_MEMBER_TO_COMMENT FOREIGN KEY(email) REFERENCES MEMBER(email),
	CONSTRAINT FK_BOARD_TO_COMMENT FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO),
	CONSTRAINT FK_SHOP_TO_COMMENT FOREIGN KEY (SHOP_NO) REFERENCES SHOP(SHOP_NO)
)

create table bookmark(
	bookmark_no number primary key,
	shop_no number not null,
	email varchar2(25) not null,
	CONSTRAINT FK_SHOP_TO_BOOKMARK FOREIGN KEY (SHOP_NO)REFERENCES SHOP(SHOP_NO),
	CONSTRAINT FK_MEMBER_TO_BOOKMARK FOREIGN KEY (EMAIL)REFERENCES MEMBER(EMAIL)
)


