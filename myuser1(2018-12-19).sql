-- 여기는 myuser1 화면입니다.

CREATE TABLE EMP_TABLE(
    EMPNO       CHAR(6)         PRIMARY KEY ,
    EMPNAME     NVARCHAR2(20)   NOT NULL,
    EMPBIRTH    CHAR(8) ,
    DEPTNO      CHAR(3)         NOT NULL,
    HREDATE     CHAR(10)        NOT NULL
);

SELECT * FROM EMP_TABLE;

INSERT INTO EMP_TABLE
VALUES('170001','홍길동','880212','001','180323');

INSERT INTO EMP_TABLE
VALUES('170002','이몽룡','770215','003','051124');

INSERT INTO EMP_TABLE
VALUES('170003','성춘향','820513','003','000117');

INSERT INTO EMP_TABLE
VALUES('170004','장보고','941102','004','130227');

INSERT INTO EMP_TABLE
VALUES('170005','임꺽정','801212','001','150115');

SELECT * FROM EMP_TABLE;

UPDATE EMP_TABLE SET HREDATE = '2018-03-01' WHERE EMPNAME = '장보고';
-- 이 SQL은 현재 데이터 상으로는 문제가 없어 보이나
-- 데이터가 많아질 경우 이름이 장보고인 사원이 중복되지 않는다는 보장이 없다.
-- 따라서 사원으로 이름을 조건으로 변경을 시도하는 것은 데이터 무결성을 해치는 매우 위험한 방법이다.

-- 1. UPDATE를 하기전에 변경하고자 하는 정보를 먼조 조회해야한다.
SELECT * FROM EMP_TABLE WHERE EMPNAME = '장보고';

-- 2. 조회된 데이터 중에서 변경하고자 하는 데이터의 PK를 입수한다.
--    여기서 조회된 PK : 170004 가 되는데 

-- 3. 조회된 PK를 이용해서 데이터 변경을 시도한다.
UPDATE EMP_TABLE SET HREDATE = '2018-03-01' WHERE EMPNO = '170004';

SELECT * FROM EMP_TABLE;