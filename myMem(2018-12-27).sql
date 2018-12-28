-- 여기는 myMem 화면입니다.

CREATE TABLE tbl_score(
    g_id	    NUMBER		    PRIMARY KEY,
    g_stname	NVARCHAR2(50)	NOT NULL,	
    g_subject	NVARCHAR2(10)	NOT NULL,	
    g_score	    NUMBER		
);

DESC tbl_score;

SELECT COUNT(*) FROM tbl_score;
SELECT * FROM tbl_score;

SELECT g_stname AS 이름, SUM(g_score) AS 총점 FROM tbl_score GROUP BY g_stname;

-- SQL에서 SELECT는 for 명령과 거의 유사
-- SELECT g_stname, SUM(g_stname) FROM tbl_score group by g_stname;
-- =>> 위의 명령문에서는 invalid number라는 오류 발생
--     CAUSE : SUM이라는 함수에 문자열값들을 넣어서 
--     ACTION : SUM(g_score)로... 

-- 학생별로 점수를 한 줄에 나열하는 SQL을 작성
-- 이름 국어 영어 수학 ... <<< 이런 순서로
-- 1. 학생별 : 학생이름 칼럼으로 그룹을 묶어라
SELECT g_stname
FROM tbl_score
GROUP BY g_stname;

-- 2. 점수를 한줄에 나열
SELECT g_stname, 국어, 영어, 수학, 과학, 역사
FROM tbl_score
GROUP BY g_stname;
-- 위의 SQL에서 국어,영어,수학 등 점수의 칼럼은 tbl_score에 존재하지않는다.
-- 때문에 어디에선가 점수를 계산해서 변수(칼럼)에 저장하는 부분이 필요하다.
-- 점수를 계산하는 코드를 오라클의 함수를 이용해서 작성한다.
SELECT g_subject,
    DECODE(g_subject, '국어', g_score, 0) AS 국어,
    DECODE(g_subject, '수학', g_score, 0) AS 수학,
    DECODE(g_subject, '영어', g_score, 0) AS 영어,
    DECODE(g_subject, '과학', g_score, 0) AS 과학,
    DECODE(g_subject, '미술', g_score, 0) AS 미술,
    DECODE(g_subject, '국사', g_score, 0) AS 국사
FROM tbl_score;

SELECT g_subject,
    SUM(DECODE(g_subject, '국어', g_score, 0)) AS 국어,
    SUM(DECODE(g_subject, '수학', g_score, 0)) AS 수학,
    SUM(DECODE(g_subject, '영어', g_score, 0)) AS 영어,
    SUM(DECODE(g_subject, '과학', g_score, 0)) AS 과학,
    SUM(DECODE(g_subject, '미술', g_score, 0)) AS 미술,
    SUM(DECODE(g_subject, '국사', g_score, 0)) AS 국사
FROM tbl_score GROUP BY g_subject;

SELECT g_stname,
    SUM(DECODE(g_subject, '국어', g_score, 0)) AS 국어,
    SUM(DECODE(g_subject, '수학', g_score, 0)) AS 수학,
    SUM(DECODE(g_subject, '영어', g_score, 0)) AS 영어,
    SUM(DECODE(g_subject, '과학', g_score, 0)) AS 과학,
    SUM(DECODE(g_subject, '미술', g_score, 0)) AS 미술,
    SUM(DECODE(g_subject, '국사', g_score, 0)) AS 국사
FROM tbl_score  GROUP BY g_stname;

CREATE VIEW 성적일람표
AS
SELECT g_stname,
    SUM(DECODE(g_subject, '국어', g_score, 0)) AS 국어,
    SUM(DECODE(g_subject, '수학', g_score, 0)) AS 수학,
    SUM(DECODE(g_subject, '영어', g_score, 0)) AS 영어,
    SUM(DECODE(g_subject, '과학', g_score, 0)) AS 과학,
    SUM(DECODE(g_subject, '미술', g_score, 0)) AS 미술,
    SUM(DECODE(g_subject, '국사', g_score, 0)) AS 국사
FROM tbl_score  GROUP BY g_stname;

SELECT * FROM 성적일람표;

SELECT * FROM tbl_iolist 
WHERE ROWNUM < 10;

SELECT * FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- 거래처별로 거래금액이 얼마인가 알고싶다.
SELECT I.io_dcode, D.d_name, D.d_ceo, SUM(I.io_price * I.io_quan) AS 거래금액 
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code GROUP BY I.io_dcode, D.d_name, D.d_ceo;
-- 이 SQL은 거래처별로 단순히 거래금액을 합산한 결과

-- 거래처별로 매입금액과 매출금액이 얼마인지 알고싶다.
SELECT I.io_dcode, D.d_name, D.d_ceo, 
    SUM(DECODE(I.io_inout, '매입', I.io_price * I.io_quan,0)) AS 매입금액,
    SUM(DECODE(I.io_inout, '매출', I.io_price * I.io_quan,0)) AS 매출금액 
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code GROUP BY I.io_dcode, D.d_name, D.d_ceo;

SELECT g_stname FROM tbl_score GROUP BY g_stname ORDER BY g_stname;

CREATE TABLE tbl_student(
    s_number	CHAR(10)		PRIMARY KEY,
    s_name	    NVARCHAR2(30)	NOT NULL	
);

SELECT COUNT(*) FROM tbl_student;
DESC tbl_student;
SELECT * FROM tbl_student;

SELECT *
FROM tbl_score G
LEFT JOIN tbl_student S
ON G.g_stname = S.st_name;

ALTER TABLE tbl_student RENAME COLUMN st_name to st_num;
ALTER TABLE tbl_student RENAME COLUMN s_name to st_name;

ALTER TABLE tbl_score ADD g_stnum CHAR(5);
DESC tbl_score;

UPDATE tbl_score SC SET SC.g_stnum = (SELECT st_num FROM tbl_student ST WHERE SC.g_stname = ST.st_name); 

ALTER TABLE tbl_score MODIFY(g_stnum CHAR(10));

SELECT * FROM tbl_score
LEFT JOIN tbl_student
on tbl_score.g_stnum = tbl_student.st_num where tbl_student.st_name is null;

ALTER TABLE tbl_score DROP COLUMN g_stname;

SELECT SC.g_stnum, ST.st_name
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.g_stnum = ST.st_num;

CREATE TABLE tbl_subject(
    sb_code	CHAR(10)		PRIMARY KEY,
    sb_name	NVARCHAR2(30)	NOT NULL	
);

INSERT INTO tbl_subject
VALUES('B0001', '국어');
INSERT INTO tbl_subject
VALUES('B0002', '영어');
INSERT INTO tbl_subject
VALUES('B0003', '수학');
INSERT INTO tbl_subject
VALUES('B0004', '과학');
INSERT INTO tbl_subject
VALUES('B0005', '국사');
INSERT INTO tbl_subject
VALUES('B0006', '미술');

SELECT * FROM tbl_subject;

ALTER TABLE tbl_score ADD g_sbcode CHAR(10);

UPDATE tbl_score SC SET SC.g_sbcode = (SELECT SB.sb_code FROM tbl_subject SB WHERE SC.g_subject = SB.sb_name);

SELECT SC.g_sbcode, SB.sb_code, SC.g_subject, SB.sb_name
FROM tbl_score SC
LEFT JOIN tbl_subject SB
ON SC.g_sbcode = SB.sb_code ;
