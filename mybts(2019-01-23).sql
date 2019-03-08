-- 여기는 mybts화면입니다.

-- 도서정보 관리를 위한 TABLE을 생성
CREATE TABLE tbl_books(
    id NUMBER PRIMARY KEY,
    tb_name nVARCHAR2(50) NOT NULL,
    tb_company nVARCHAR2(50),
    tb_author nVARCHAR2(50),
    tb_price NUMBER
);

DROP TABLE tbl_books;

CREATE SEQUENCE SEQ_BOOKS START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_books
VALUES(SEQ_BOOKS.NEXTVAL, '열혈자바', '오렌지미디어', '윤성우', 30000);

INSERT INTO tbl_books
VALUES(SEQ_BOOKS.NEXTVAL, '모바일 웹/앱', '생능출판', '박성진', 20000);

commit;

SELECT * FROM tbl_books;