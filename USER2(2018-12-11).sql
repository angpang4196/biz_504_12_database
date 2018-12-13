-- 여기는 user2 화면입니다.

CREATE TABLE tbl_users(
    str_userid nVARCHAR2(12) PRIMARY KEY,
    str_name nVARCHAR2(50) NOT NULL,
    str_tel nVARCHAR2(15),
    str_addr nVARCHAR2(50)
);

SELECT * FROM tbl_users;

INSERT INTO tbl_users
VALUES('001','홍길동','010-1111-1111','서울특별시'); 
INSERT INTO tbl_users
VALUES('002','성춘향','010-1234-1234','울산광역시'); 
INSERT INTO tbl_users
VALUES('003','임꺽정','010-4567-1123','대전광역시'); 
INSERT INTO tbl_users
VALUES('004','장보고','010-1634-1273','서울특별시'); 
INSERT INTO tbl_users
VALUES('005','이순신','010-1654-4923','부산광역시'); 

SELECT * FROM tbl_users;

-- 현재 작성된 tbl_users 테이블에 str_userid를 12자리로 설정을 했는데
-- 입력을 하다보니 너무 많이 자리를 차지한다.
-- 그래서 현재 입력중인 id개수인 3개로 크기를 바꿔보려고한다.
-- 이미 생성된 테이블의 칼럼 형식을 변경
-- DDL명령중 ALTER 명령을 사용한다.

ALTER TABLE tbl_users MODIFY str_userid nVARCHAR2(3);
ALTER TABLE tbl_users MODIFY str_name nVARCHAR2(5);
-- CHAR 형 데이터는 보이는 데이터와 달리 실제 크기만큼 
-- 공백등으로 이미 채워져 있어서 크기를 줄이기가 안 된다.

-- (n)VARCHAR2 형 데이터는 보이는 데이터중 
-- 가장 길이가 긴 데이터만큼은 크기를 줄일 수 있다.
INSERT INTO tbl_users(str_userid, str_name)
VALUES('006','조진웅');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('007','이정재');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('008','장혁');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('009','류준열');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('010','최민식');

SELECT * FROM tbl_users;

-- SELECT를 실행할 때 특정한 칼럼들만 나열해서 보고자 할 때
-- 칼럼리스트 : PROJECTION
SELECT str_name, str_tel FROM tbl_users;

-- tbl_users에 저장되어있는 데이터 리스트에서 특정 사람의 리스트만 보고싶다.
SELECT * FROM tbl_users WHERE str_name = '이순신';
SELECT * FROM tbl_users WHERE str_addr = '서울특별시';
SELECT * FROM tbl_users WHERE str_addr = '서울특별시' AND str_name = '홍길동';

-- tbl_users 테이블에서 str_userid가 003부터 006까지의 데이터만 보고싶다.
SELECT * FROM tbl_users WHERE str_userid >= '003' AND str_userid <= '006';
SELECT * FROM tbl_users WHERE str_userid BETWEEN '003' AND '006';

SELECT * FROM tbl_users;

-- SQL의 통계 함수
-- SUM, COUNT, AVG, MIN, MAX (칼럼을 감싸는 함수)
-- 현재 tbl_users에 저장된 데이터 개수가 몇개냐
SELECT COUNT(*) FROM tbl_users;
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT(*) AS 개수,
    MIN(str_userid) AS 작은값,
    MAX(str_userid) AS 큰값
FROM tbl_users;

SELECT COUNT(*) ,
    MIN(str_userid) ,
    MAX(str_userid)
FROM tbl_users;

