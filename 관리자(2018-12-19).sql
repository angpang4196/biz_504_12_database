-- ����� ������ ȭ���Դϴ�.

CREATE USER myuser1 IDENTIFIED BY 1111;
-- TABLESPACE�� SYSTEM ���̺� �����̽��� �ڵ� ����
-- ���� ȯ�濡���� �ſ� ������ ��� 

GRANT CREATE TABLE TO myuser1;

GRANT SELECT, UPDATE, INSERT ON [table] TO myuser1;

CREATE TABLESPACE mytsA DATAFILE 'D:/bizwork/oracle/ordata/mytsA.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- ����� ����� ������ �� ���̺����̽��� �������ʰ� 
-- TABLE ���� �����ϸ� ������ TABLE���� SYSTEM TS�� �����Ǿ�
-- ���߿� ���̺����̽��� ���� �� �ű���� ���� ������ �߻��Ѵ�.
-- ���� ����ڸ� �����ϰ� ���̺��� ����� ���� ���̺����̽���
-- �ݵ�� �����ϰ� ������� DEFAULT TABLESPACE�� ���� �� �־���Ѵ�.
ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

GRANT CREATE SESSION TO myuser1;

GRANT RESOURCE TO myuser1;