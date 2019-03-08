-- gradeUser로 접속한 성적처리 화면입니다.

SELECT * FROM tbl_student;

DESC tbl_score;

CREATE TABLE tbl_score(
--   ID	학번	과목	점수
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);

SELECT * FROM tbl_score;

SELECT COUNT(*) FROM tbl_score;

-- 과목 테이블 생성
-- 과목번호, 과목명, 담당교수
CREATE TABLE tbl_subject(
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name NVARCHAR2(20) NOT NULL,
    su_pro NVARCHAR2(30)
);

-- 모든 칼럼에 데이터가 있을 경우 사용하는 방법
-- VALUES에는 데이터 리스트를 테이블 생성할 때 순서로 작성
INSERT INTO tbl_subject
VALUES('001', '국어', '홍길동');

-- 일부 칼럼에만 데이터가 있을 경우 사용하는 방법
-- VALUES에는 테이블명 다음에 나열된 칼럼과 일치하는 데이터만 순서대로 작성
INSERT INTO tbl_subject(su_num, su_name)
VALUES('002', '영어');

-- 테이블을 생성할 당시의 칼럼 순서를 모르거나 정확히 일치하는 칼럼과 일치되도록 데이터를 작성하는 방법
INSERT INTO tbl_subject(su_name, su_num, su_pro)
VALUES('수학', '003', '성춘향');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('004', '물리');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('005', '음악');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('006', '음악');

SELECT * FROM tbl_subject;

-- 데이터를 입력한 후 확인을 해보니 음악 데이터가 두 개가 있다.
-- 준비된 원본 데이터를 확인해 봤더니 과목번호 006은 음악이 아니고 무용이다. 
UPDATE tbl_subject SET su_name = '무용' WHERE su_num = '006';

INSERT INTO tbl_subject(su_num, su_name)
VALUES('900', '국토지리');

-- 데이터를 확인해 보니 과목번호 900 이라는 항목이 있다.
-- 그래서 이 데이터를 삭제하려고 한다.
-- DFW
DELETE FROM tbl_subject WHERE su_num = '900';

-- 성적테이블의 데이터를 확인하는데...
-- 과목칼럼의 데이터들이 과목명이 아니고, 과목번호로 되어있다.
-- 그래서 어떤 과목인지 알기가 매우 어렵다.
-- 성적테이블과 과목테이블을 join을 실행해서 조회를 하려고 한다.
SELECT SC.sc_st_num, SC.sc_subject, SU.su_name, SC.sc_score 
FROM tbl_score SC
    LEFT JOIN tbl_subject SU
        ON SC.sc_subject = SU.su_num ;

-- 성적 조회를 하면서 학생명이 없어서 누구의 점수인지 확인하기가 어렵다.
-- 학생 테이블과 join을 실행해서 조회를 하려고 한다.
SELECT SC.sc_st_num, ST.st_name, SC.sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_st_num = ST.st_num ;
        
-- 성적 테이블과 학생 테이블의 학번 칼럼이 type이 달라서 join이 실행되지 않는다.
-- 칼럼을 변경
ALTER TABLE tbl_student MODIFY st_num CHAR(5);
ALTER TABLE tbl_score MODIFY sc_st_num CHAR(5);

-- 학생 테이블과 과목 테이블을 점수테이블에 동시에 JOIN해서 VIEW하기
CREATE VIEW view_score
AS
SELECT SC.sc_st_num AS 학번, ST.st_name AS 학생이름, SC.sc_subject AS 과목번호, SU.su_name AS 과목이름, SC.sc_score AS 점수
FROM tbl_score SC

LEFT JOIN tbl_student ST
ON TRIM(SC.sc_st_num) = TRIM(ST.st_num)

LEFT JOIN tbl_subject SU
ON SC.sc_subject = SU.su_num ORDER BY sc.sc_st_num;

SELECT * FROM view_score;

-- 학번, 이름, 총점 형식의 VIEW 생성
SELECT 학번, 학생이름, SUM(점수), AVG(점수)
FROM view_score GROUP BY 학번, 학생이름 ORDER BY 학번;

-- 학번, 이름, 국어, 영어, 물리, 음악, 국토지리
SELECT 학번, 학생이름,
    SUM(DECODE(과목번호, '001', 점수)) AS 국어,
    SUM(DECODE(과목번호, '002', 점수)) AS 영어,
    SUM(DECODE(과목번호, '003', 점수)) AS 물리,
    SUM(DECODE(과목번호, '004', 점수)) AS 음악,
    SUM(DECODE(과목번호, '005', 점수)) AS 국토지리,
    SUM(점수) AS 총점
FROM view_score GROUP BY 학번, 학생이름 ORDER BY 학번;

-- 한 학생의 점수를 여러개의 레코드에 저장해두고 VIEW를 할 때 일람표 처럼 보이는 SQL
SELECT 학번, 학생이름,
    SUM(DECODE(과목번호, '001', 점수)) AS 국어,
    SUM(DECODE(과목번호, '002', 점수)) AS 영어,
    SUM(DECODE(과목번호, '003', 점수)) AS 물리,
    SUM(DECODE(과목번호, '004', 점수)) AS 음악,
    SUM(DECODE(과목번호, '005', 점수)) AS 국토지리,
    SUM(점수) AS 총점
FROM view_score GROUP BY 학번, 학생이름 ORDER BY 학번;

CREATE VIEW 성적일람표
AS
SELECT 학번, 학생이름,
    SUM(DECODE(과목번호, '001', 점수)) AS 국어,
    SUM(DECODE(과목번호, '002', 점수)) AS 영어,
    SUM(DECODE(과목번호, '003', 점수)) AS 물리,
    SUM(DECODE(과목번호, '004', 점수)) AS 음악,
    SUM(DECODE(과목번호, '005', 점수)) AS 국토지리,
    SUM(점수) AS 총점,
    RANK() OVER( ORDER BY SUM(점수) DESC) AS 순위
FROM view_score GROUP BY 학번, 학생이름 ORDER BY 순위;
-- GROUP BY를 사용해서 SQL을 작성하는 경우
-- SUM, AVG, COUNT, MAX, MIN, RANK등 통계함수로 묶이지 않은 
-- 칼럼이나 계산식들은 모두 GROUP BY에 작성해 주어야 한다.

SELECT * FROM 성적일람표 ORDER BY 학번;

INSERT INTO tbl_subject(su_num, su_name, su_pro)
VALUES ('009', '지구과학', '이몽룡');

UPDATE tbl_subject SET su_pro = '임꺽정' WHERE su_num = '009';

DELETE FROM tbl_subject WHERE su_num = '009';