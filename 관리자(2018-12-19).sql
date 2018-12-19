-- 여기는 관리자 화면입니다.

CREATE USER myuser1 IDENTIFIED BY 1111;
-- TABLESPACE를 SYSTEM 테이블 스페이스로 자동 지정
-- 실제 환경에서는 매우 위험한 방법 

GRANT CREATE TABLE TO myuser1;

GRANT SELECT, UPDATE, INSERT ON [table] TO myuser1;

CREATE TABLESPACE mytsA DATAFILE 'D:/bizwork/oracle/ordata/mytsA.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- 사용자 등록을 실행한 후 테이블스페이스를 만들지않고 
-- TABLE 등을 생성하면 생성된 TABLE들은 SYSTEM TS에 생성되어
-- 나중에 테이블스페이스를 만든 후 옮기려면 많은 문제가 발생한다.
-- 따라서 사용자를 생성하고 테이블을 만들기 전에 테이블스페이스를
-- 반드시 생성하고 사용자의 DEFAULT TABLESPACE를 지정 해 주어야한다.
ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

GRANT CREATE SESSION TO myuser1;

GRANT RESOURCE TO myuser1;