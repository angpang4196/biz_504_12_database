-- ����� myMem ȭ���Դϴ�.

CREATE TABLE tbl_primary(
    p_id    NUMBER        PRIMARY KEY,
    p_name  nVARCHAR2(50) NOT NULL,
    p_tel   nVARCHAR2(20)
);

-- ���� ���̺� PK�� �� ������(���ڵ�)�� �ĺ��ϴ� � ��ҷμ� ����� �ȴ�.
-- �׷��� ����(�л�����, ��ǰ����, �ŷ�ó����, �μ�����)�� �����ϴ� ���̺�����
-- ���Ƿ� �ڵ�(D0001, S001)�� �����ؼ� �����͸� �߰�(INSERT)�� �� ����Ѵ�.

-- ������ ������ �����Ͱ� �ٷ����� �߰��Ǵ� work ���̺��� ���(��ǰ���Ը���, ����ó��)
-- �ڵ� ������ �߰��ϱⰡ �ſ� ��ƴ�.
-- �׷��� �̷� ���̺��� ���Ƿ� idĮ���� �ϳ� �߰��ϰ�
-- ������ ������ ��(���ڰ� �����Ǵ� ����)�� ����� ������ �Ѵ�.
-- mySQL���� DB������ AUTO INCREMENT ��� �ɼ��� �־ 
-- PKĮ���� �ش� �ɼ��� �������ָ� INSERT�� ������ ��
-- �ڵ����� 1�� ������ ���� �����ϰ� Į���� �Ҵ��� �ֵ��� �� �� �ִ�.

-- �׷���, ����Ŭ(11 ����)������ AUTO INCREMENT �ɼ��� ����.

-- ������� ����Ŭ�� �ִ� SEQUENCE(SEQ) ��� ��ü�� Ȱ���ؼ� AUTO INCREMENT ȿ���� ���� �� �ִ�.

-- ���ο� SEQ ��ü�� ����
CREATE SEQUENCE PK_SEQ START WITH 1 INCREMENT BY 1;
-- START : ���۰�,  INCREMENT : ����
CREATE SEQUENCE PK_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE NOMINVALUE; -- �Ǵ� [ MAXVALUE 1000 OR MINVALUE 0 ]��������

-- ������ ������ PK_SEQ �������� �׽�Ʈ �� ����.
SELECT PK_SEQ.NEXTVAL FROM DUAL;

INSERT INTO tbl_primary
VALUES(1, 'ȫ�浿', '0001');
INSERT INTO tbl_primary
VALUES(PK_SEQ.NEXTVAL, '�̸���','0005');

SELECT * FROM tbl_primary;

-- INSERT�� ������ �� ���� ID���� SEQ�� ���ؼ� Ȯ���ϴ� ���
-- INSERT�� ������� ���� ���¿��� ��ȸ�� �ϸ� ������ ����.
SELECT PK_SEQ.CURRVAL FROM DUAL;

-- INSERT�� ��������ʾ� ������ �߻��ϰ� ���� ID���� ���� �� ���� ��
-- ����Ŭ�� SYSTEM DB(�ý��� ������ ����)���κ��� ���� ��ȸ�� �� �ִ�.
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'PK_SEQ';

-- RANDOM �Լ��� ����ؼ� PK�� ����� ���
SELECT DBMS_RANDOM.VALUE FROM DAUL;
SELECT DBMS_RANDOM.VALUE(100000, 99999999) FROM DUAL;

INSERT INTO tbl_primary
VALUES( ROUND(DBMS_RANDOM.VALUE(100,9999)), '������', '0007');

SELECT * FROM tbl_primary ORDER BY p_id;

-- GUID( Global Unique Identifier), UUID( Universally Unique Identifier)
SELECT SYS_GUID() FROM DUAL;

-- SYS_GUID�� ����ؼ� PK�� ������ ���� CHAR(32) �̻��� ������ �����Ѵ�.
-- SYS_GUID�� ����ؼ� PK�� ������ �� CHAR(32)���� ������ �߻��ϴ� ��찡 �ִ�.
-- �׷� ���� CLOB, BLOB
INSERT INTO tbl_primary 
VALUES( SYS_GUID(), '�Ӳ���', '0000');

CREATE SEQUENCE SEQ_TEST
START WITH 1 INCREMENT BY 1 MAXVALUE 10 NOCACHE CYCLE;

SELECT SEQ_TEST.NEXTVAL FROM DUAL;

DROP SEQUENCE SEQ_TEST;

-- ���������� 
-- �������� �ٸ� ��üó�� ALTER�� ����ؼ� ������ �� �� �ִµ� 
-- START WITH�� ������ �� ����.
-- START WITH�� �����Ϸ��� DROP�� �Ŀ� �ٽ� �����ؾ��Ѵ�.
ALTER SEQUENCE SEQ_TEST INCREMENT BY 2 MAXVALUE 20 NOCYCLE;

-- �������� ���� �������� �����ϰ� ���� ���� �ִ�.
CREATE SEQUENCE ASC_SEQ
START WITH 9999 INCREMENT BY -1 MINVALUE 0 MAXVALUE 9999; 
-- NOMINVALUE : -1���� , NOMAXVALUE : 10�� 27�±���

SELECT ASC_SEQ.NEXTVAL FROM DUAL;

CREATE TABLE tbl_mytable(
    p_id    NUMBER          PRIMARY KEY,
    p_name  nVARCHAR2(50)   NOT NULL,
    p_tel   nVARCHAR2(20),
    p_kor   NUMBER, -- ������ �����Ϸ��� ���� Į������ ������ �ȴ�.
    p_eng   NUMBER  -- ��ó�� �ִ밪�� ������ �� ���� ���� ũ�⸦ ������ �ִ� ���� ����.
);

ALTER TABLE tbl_mytable MODIFY p_kor NUMBER(3);
ALTER TABLE tbl_mytable MODIFY p_eng NUMBER(3);

CREATE SEQUENCE MY_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE;

INSERT INTO tbl_mytable
VALUES( MY_SEQ.NEXTVAL, 'ȫ��', '010-1013-4238', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)));

SELECT * FROM tbl_mytable;

SELECT p_name AS �̸�, (p_kor + p_eng) AS ���� FROM tbl_mytable ;