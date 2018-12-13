-- 여기는 관리자 화면입니다.

-- 새로운 사용자 user2를 생성
CREATE USER user2 IDENTIFIED BY 1234;

-- 현재 user2 사용자는 아무런 권한이 없는 상태

-- 지난번에 user1에는 DBA라는 통합 권한을 부여
-- 실제 실무에서는 DBA권한을 아무에게나 함부로 부여하지않는다.
-- 오라클에서 DBA권한은 최고권한인 sysdba 권한에 준하는
-- 상당히 높은 권한이어서 함부로 부여하면 문제를 일으킬 수 있다.

-- 최고 권한
-- ORACLE : sysdba
-- MySQL : root
-- MSSQL : sa
-- etc : administor, root


-- user2에게 세부적인 권한을 부여하는 방법에 대해 학습
-- 1. user2에게 CRUD를 실행할 수 있는 권한을 부여
-- 임시로 TABLE을 생성

CREATE TABLE tbl_test(
st_name CHAR(20),
st_addr nVARCHAR2(125)
);

-- user2에게 tbl_test 테이블을 읽을 수 있는 권한을 주겠다.
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2;   -- INSERT(추가)권한 부여

GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user2;

-- 특정 사용자에게 부여된 권한을 조회하는 PL/SQL(오라클 SQL)
SELECT * FROM USER_TAB_PRIVS_MADE 
WHERE GRANTEE = 'USER2'; -- 사용자 ID는 반드시 대문자로