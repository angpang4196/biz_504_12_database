-- ����� ������ ���� ȭ���Դϴ�.
CREATE USER user4196 IDENTIFIED BY 1234;

CREATE TABLESPACE mytbs4196 
DATAFILE 'D:/bizwork/oracle/ordata/mytbs4196.dbf' 
SIZE 100M
AUTOEXTEND ON NEXT 1M;

GRANT DBA TO user4196;
