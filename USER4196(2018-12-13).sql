-- 여기는 user4196 접속 화면입니다.

CREATE TABLE tbl_grade(
    strNum CHAR(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

INSERT INTO tbl_grade
VALUES('001', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('002', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('003', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('004', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('005', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

SELECT * FROM tbl_grade;

CREATE TABLE tbl_users(
    strNum CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strTel nVARCHAR2(20),
    strAddr nVARCHAR2(50)
);

INSERT INTO tbl_users
VALUES('001','홍길동','001-001-0001','서울특별시');

INSERT INTO tbl_users
VALUES('002','성춘향','001-001-0001','부산광역시');

INSERT INTO tbl_users
VALUES('003','홍길동','001-001-0001','광주광역시');

INSERT INTO tbl_users
VALUES('004','장보고','001-001-0001','서울특별시');

INSERT INTO tbl_users(strNum, strName)
VALUES('005','이순신');

SELECT * FROM tbl_users;

SELECT G.strNum AS 학번, U.strName AS 이름, U.strTel AS 번호, U.strAddr AS 주소, 
G.intKor AS 국어점수, G.intEng AS 영어점수, G.intMath AS 수학점수, 
G.intKor + G.intEng + G.intMath AS 총점, ROUND((G.intKor + G.intEng + G.intMath)/3,2) AS 평균
FROM tbl_users U
LEFT JOIN tbl_grade G ON G.strNum = U.strNum;

SELECT * FROM tbl_grade, tbl_users WHERE tbl_grade.strNum = tbl_users.strNum;

SELECT * FROM tbl_users;

UPDATE tbl_users SET strTel = '005-005-0005', strAddr = '인천광역시' WHERE strNum = '005';


    