-- ����� ������ ȭ���Դϴ�.

CREATE USER myuser IDENTIFIED BY 1234;
-- CREATE USER myuser IDENTIFIED BY 1234 DEFAULT TABLESPACE ....;
-- ���� TABLESPACE�� �����ϱ����� ����ڸ� ���� ����ϴٺ��� DEFAULT TABLESPACE�� �������� �ʾҴ�.
-- �̷� ��� DEFAULT TABLESPACE�� SYSTEM ���� ������ �����Ǵ� ��, �̰��� �ǹ����� �ſ� ������ ��� 

GRANT DBA TO myuser;

CREATE TABLESPACE myTBL DATAFILE 'D:/bizwork/oracle/ordata/mytbl.dbf' size 100M AUTOEXTEND ON NEXT 1M;

-- myuser ����ڿ��� TABLESPACE�� �������� �ʾҴ�.
-- ���� ���ο� TABLESPACE�� ���������Ƿ� myuser���� default tablespace�� �����ϰڴ�.

ALTER USER myuser DEFAULT TABLESPACE myTBL;
    
