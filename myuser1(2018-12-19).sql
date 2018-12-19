-- ����� myuser1 ȭ���Դϴ�.

CREATE TABLE EMP_TABLE(
    EMPNO       CHAR(6)         PRIMARY KEY ,
    EMPNAME     NVARCHAR2(20)   NOT NULL,
    EMPBIRTH    CHAR(8) ,
    DEPTNO      CHAR(3)         NOT NULL,
    HREDATE     CHAR(10)        NOT NULL
);

SELECT * FROM EMP_TABLE;

INSERT INTO EMP_TABLE
VALUES('170001','ȫ�浿','880212','001','180323');

INSERT INTO EMP_TABLE
VALUES('170002','�̸���','770215','003','051124');

INSERT INTO EMP_TABLE
VALUES('170003','������','820513','003','000117');

INSERT INTO EMP_TABLE
VALUES('170004','�庸��','941102','004','130227');

INSERT INTO EMP_TABLE
VALUES('170005','�Ӳ���','801212','001','150115');

SELECT * FROM EMP_TABLE;

UPDATE EMP_TABLE SET HREDATE = '2018-03-01' WHERE EMPNAME = '�庸��';
-- �� SQL�� ���� ������ �����δ� ������ ���� ���̳�
-- �����Ͱ� ������ ��� �̸��� �庸���� ����� �ߺ����� �ʴ´ٴ� ������ ����.
-- ���� ������� �̸��� �������� ������ �õ��ϴ� ���� ������ ���Ἲ�� ��ġ�� �ſ� ������ ����̴�.

-- 1. UPDATE�� �ϱ����� �����ϰ��� �ϴ� ������ ���� ��ȸ�ؾ��Ѵ�.
SELECT * FROM EMP_TABLE WHERE EMPNAME = '�庸��';

-- 2. ��ȸ�� ������ �߿��� �����ϰ��� �ϴ� �������� PK�� �Լ��Ѵ�.
--    ���⼭ ��ȸ�� PK : 170004 �� �Ǵµ� 

-- 3. ��ȸ�� PK�� �̿��ؼ� ������ ������ �õ��Ѵ�.
UPDATE EMP_TABLE SET HREDATE = '2018-03-01' WHERE EMPNO = '170004';

SELECT * FROM EMP_TABLE;