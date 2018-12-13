-- 여기는 user1으로 접속한 화면입니다.
-- 이름(o_name), 전화번호(o_tel), 
-- 주소(o_addr), 회사(o_comp), 부서 칼럼(o_dept)을 갖는
-- tbl_office 테이블을 생성하시오.
-- 단 id는 PK로 선언하고 이름은 NOT NULL

CREATE TABLE tbl_office(
id NUMBER PRIMARY KEY,
o_name CHAR(30) NOT NULL,
o_tel VARCHAR2(20),
o_addr nVARCHAR2(50),
o_comp nVARCHAR2(30),
o_dept nVARCHAR2(20)
);

SELECT * FROM tbl_office;

