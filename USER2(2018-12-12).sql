-- 여기는 user2 접속 화면입니다. 

CREATE TABLE tbl_test1(
    str_num CHAR(4) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

SELECT * FROM tbl_test1;

DROP TABLE tbl_users;

CREATE TABLE tbl_users(
    str_num CHAR(3) PRIMARY KEY,
    str_name nVARCHAR2(20),
    str_tel nVARCHAR2(15)
);

INSERT INTO tbl_users
VALUES('001','홍길동','010-1342-1392');
INSERT INTO tbl_users
VALUES('002','성춘향','010-3949-7932');
INSERT INTO tbl_users
VALUES('003','이몽룡','010-3743-1346');
INSERT INTO tbl_users
VALUES('004','홍길동','010-2633-1239');
INSERT INTO tbl_users
VALUES('005','단군','010-7234-4826');

SELECT * FROM tbl_users;

INSERT INTO tbl_test1
VALUES('001',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('002',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('003',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('004',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('005',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

SELECT * FROM tbl_test1;

SELECT * FROM tbl_users ORDER BY str_num;

-- 학생의 점수를 관리하는 table을 설계하는 데
-- 가장 일반적인 방법으로 table을 만들면

-- 학번, 이름, 국어, 영어, 수학, 총점, 평균

-- 필요한 칼럼을 모두 포함하는 테이블을 생성할 수 있다.

-- 학번, 이름, 전화번호, 주소, 국어, 영어, 수학, 총점, 평균

-- 하지만 database 적인 관점에서는 한 개의 테이블에
-- 필요한 칼럼을 모두 나열하는 것은 매우 바람직 하지 않다.
-- DB관점에서는 필요한 정보들끼리 테이블을 별도로 생성을 해서 
-- DATA를 관리한다.

-- 학생정보는 : tbl_users 테이블에 있고
-- 점수정보는 : tbl_test1 테이블에 있게 하는 것이 좋다.

-- 하지만, 이렇게 테이블을 분리하면
-- 점수 정보를 보면서 학생정보를 같이 조회하고 싶을 때
-- 어려움이 발생한다.

-- 그래서 표준 SQL에는 두개의 테이블을 연결(JOIN)해서
-- 마치 1개의 테이블처럼 데이터를 볼 수 있는 기능을 제공한다.

-- 두 개의 테이블 정보를 모두 보고싶다. "그냥"
SELECT * FROM tbl_test1, tbl_users;

-- 두 개의 테이블을 조회(read, select)할 때
-- 나뉘어진 다수의 table을 묶어서(join) 보여주는 기법
-- >> join 이라고한다.
-- join중에서 가장 단순한 보편적인 join으로
-- << equal join >> 이라고 한다.
SELECT * FROM tbl_test1, tbl_users WHERE tbl_test1.str_num = tbl_users.str_num ;

-- 원하는 칼럼만 나열하기
SELECT tbl_test1.str_num, tbl_users.str_name, tbl_test1.intKor, tbl_test1.intEng, tbl_test1.intMath FROM tbl_test1, tbl_users 
WHERE tbl_test1.str_num = tbl_users.str_num;

-- 테이블에 별명 붙이기(TABLE명 뒤에는 AS를 쓰지않는다.)
SELECT T.str_num, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T, tbl_users U
WHERE T.str_num = U.str_num;

-- 오라클 9 이상에서 사용하는 전용 EQ JOIN
SELECT T.str_num, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T
NATURAL JOIN tbl_users U;

SELECT T.str_num AS 학번, U.str_name AS 이름, T.intKor AS 국어, T.intEng AS 영어, T.intMath AS 수학, 
    (T.intKor + T.intEng + T.intMath) AS 총점, (T.intKor + T.intEng + T.intMath)/ 3 AS 평균
FROM tbl_test1 T , tbl_users U
WHERE T.str_num = U.str_num;

-- test1 테이블에 점수만 하나 추가한다.
INSERT INTO tbl_test1
VALUES('006',90,90,100);

SELECT * FROM tbl_test1;

SELECT T.str_num, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T
LEFT JOIN tbl_users U
        ON T.str_num = U.str_num;

-- 복잡한 SQL문(SELECT)의 설정사항을
-- TABLE처럼 등록하고, TABLE을 SELECT하는 방법으로
-- 사용할 수 있다.
-- << VIEW >>
CREATE VIEW myJoin
AS
SELECT T.str_num AS Tnum, U.str_num AS Unum, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T , tbl_users U
WHERE T.str_num = U.str_num(+);

SELECT * FROM myJoin;

DROP VIEW myJoin;

SELECT * FROM myJoin WHERE Tnum = '002';

SELECT * FROM myJoin ORDER BY Tnum;

-- DCL 명령
-- 지금 현재 tbl_users, tbl_test1 테이블에 데이터를 추가했다.
-- 하지만 아직 물리적 저장 공간에는 적용이 안 된 상태이다.
-- 현재 데이터는 오라클의 임시 저장영역에 저장이 되어 있다.
-- 임시 저장영역에 저장된 데이터를 물리적 저장 공간에 저장하는 
-- 키워드를 학습
COMMIT; -- 모든 저장내용을 물리적 저장 공간에 반영하라.

SELECT * FROM tbl_test1;

DELETE FROM tbl_test1 WHERE tbl_test1.str_num = '006';

SELECT * FROM tbl_test1;



        
