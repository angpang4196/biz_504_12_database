-- ����� ������ ȭ���Դϴ�.
-- ���ο� ����� ���
-- �ϴ� ���� ����� USER2 ����
DROP USER USER2 CASCADE; -- USER2�� Ȱ���ߴ� ��� ������ ����

-- �ٽ� user2�� ����
CREATE USER user2 IDENTIFIED BY 1234;
DEFAULT TABLESPACE myTs;

-- user2���� CRUD ������ �ο�
-- CRUD������ �ο��ҷ��� ���� TABLE�� �����Ǿ� �־�� �Ѵ�.

-- 1. ������ ���� �ο�
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2;

-- 2. CRUD �ϰ� ���� �ο�
GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user2;

-- ���� ������� user2�� �����ϰ�, CRUD ������ �ο������� 
-- ���� ���� ������ �ο����� �ʾҴ�.

-- CONNECT ���� ������ DB������ ���� ���� ������ �ſ� �ٸ���.
-- 11gEx������ ����� ���� ������ �ȴ�.
-- ���� CONNECT ������ �Ϲ����� ��� ������� �ʰ�
GRANT CONNECT TO user2; 

-- ���� ������ �ο��ϱ� ���ؼ��� CREATE SESSION ������ �ο��Ѵ�.
GRANT CREATE SESSION TO user2;
-- REVOKE CREATE TABLE FROM user2;
GRANT CREATE TABLE to user2;

-- user2�� ����� TABLE SPACE�� �ϳ� ����
CREATE TABLESPACE myTs  -- myTs ��� �̸����� DB ���� ���� ����
DATAFILE 'D:/bizwork/oracle/ordata/myts.dbf'  -- ���� ���� ��ġ�� ����
SIZE 100M  -- ���� Ȯ���� �뷮
AUTOEXTEND ON NEXT 1M  -- �뷮�� �����ϸ� 1M�� �ڵ� Ȯ��
MAXSIZE UNLIMITED;  -- �ִ� �뷮 ���� ����

-- TABLESPACE�� �����ϰ�, ��� ������ �����϶�.
DROP TABLESPACE myTs 
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

DEFAULT TABLESPACE 