-- 여기는 관리자 화면입니다.

-- 자바 어플리케이션에서 사용할 테이블 스페이스와 사용자를 생성
CREATE TABLESPACE bbsTS DATAFILE 'D:/bizwork/oracle/ordata/bbsTS.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

CREATE USER bbsUSER IDENTIFIED BY 1234 DEFAULT TABLESPACE bbsTS;

GRANT DBA TO bbsUSER;