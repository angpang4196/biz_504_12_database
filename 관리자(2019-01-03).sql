-- 여기는 관리자 화면입니다.

CREATE TABLESPACE gradeTS datafile 'D:/bizwork/oracle/ordata/gradeTS.dbf'
size 100m
autoextend on next 100k;

CREATE USER gradeUser IDENTIFIED BY 1234 DEFAULT TABLESPACE gradeTS;

GRANT DBA TO gradeUser;