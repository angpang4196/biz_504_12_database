-- ����� user2 ���� ȭ���Դϴ�. 

CREATE TABLE tbl_test1(
    str_num CHAR(4) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

SELECT * FROM tbl_test1;

DROP TABLE tbl_users;

CREATE TABLE tbl_users(
    str_num CHAR(3) PRIMARY KEY,
    str_name nVARCHAR2(20),
    str_tel nVARCHAR2(15)
);

INSERT INTO tbl_users
VALUES('001','ȫ�浿','010-1342-1392');
INSERT INTO tbl_users
VALUES('002','������','010-3949-7932');
INSERT INTO tbl_users
VALUES('003','�̸���','010-3743-1346');
INSERT INTO tbl_users
VALUES('004','ȫ�浿','010-2633-1239');
INSERT INTO tbl_users
VALUES('005','�ܱ�','010-7234-4826');

SELECT * FROM tbl_users;

INSERT INTO tbl_test1
VALUES('001',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('002',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('003',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('004',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

INSERT INTO tbl_test1
VALUES('005',ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0),ROUND(DBMS_RANDOM.value(100,50),0));

SELECT * FROM tbl_test1;

SELECT * FROM tbl_users ORDER BY str_num;

-- �л��� ������ �����ϴ� table�� �����ϴ� ��
-- ���� �Ϲ����� ������� table�� �����

-- �й�, �̸�, ����, ����, ����, ����, ���

-- �ʿ��� Į���� ��� �����ϴ� ���̺��� ������ �� �ִ�.

-- �й�, �̸�, ��ȭ��ȣ, �ּ�, ����, ����, ����, ����, ���

-- ������ database ���� ���������� �� ���� ���̺�
-- �ʿ��� Į���� ��� �����ϴ� ���� �ſ� �ٶ��� ���� �ʴ�.
-- DB���������� �ʿ��� �����鳢�� ���̺��� ������ ������ �ؼ� 
-- DATA�� �����Ѵ�.

-- �л������� : tbl_users ���̺� �ְ�
-- ���������� : tbl_test1 ���̺� �ְ� �ϴ� ���� ����.

-- ������, �̷��� ���̺��� �и��ϸ�
-- ���� ������ ���鼭 �л������� ���� ��ȸ�ϰ� ���� ��
-- ������� �߻��Ѵ�.

-- �׷��� ǥ�� SQL���� �ΰ��� ���̺��� ����(JOIN)�ؼ�
-- ��ġ 1���� ���̺�ó�� �����͸� �� �� �ִ� ����� �����Ѵ�.

-- �� ���� ���̺� ������ ��� ����ʹ�. "�׳�"
SELECT * FROM tbl_test1, tbl_users;

-- �� ���� ���̺��� ��ȸ(read, select)�� ��
-- �������� �ټ��� table�� ���(join) �����ִ� ���
-- >> join �̶���Ѵ�.
-- join�߿��� ���� �ܼ��� �������� join����
-- << equal join >> �̶�� �Ѵ�.
SELECT * FROM tbl_test1, tbl_users WHERE tbl_test1.str_num = tbl_users.str_num ;

-- ���ϴ� Į���� �����ϱ�
SELECT tbl_test1.str_num, tbl_users.str_name, tbl_test1.intKor, tbl_test1.intEng, tbl_test1.intMath FROM tbl_test1, tbl_users 
WHERE tbl_test1.str_num = tbl_users.str_num;

-- ���̺� ���� ���̱�(TABLE�� �ڿ��� AS�� �����ʴ´�.)
SELECT T.str_num, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T, tbl_users U
WHERE T.str_num = U.str_num;

-- ����Ŭ 9 �̻󿡼� ����ϴ� ���� EQ JOIN
SELECT T.str_num, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T
NATURAL JOIN tbl_users U;

SELECT T.str_num AS �й�, U.str_name AS �̸�, T.intKor AS ����, T.intEng AS ����, T.intMath AS ����, 
    (T.intKor + T.intEng + T.intMath) AS ����, (T.intKor + T.intEng + T.intMath)/ 3 AS ���
FROM tbl_test1 T , tbl_users U
WHERE T.str_num = U.str_num;

-- test1 ���̺� ������ �ϳ� �߰��Ѵ�.
INSERT INTO tbl_test1
VALUES('006',90,90,100);

SELECT * FROM tbl_test1;

SELECT T.str_num, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T
LEFT JOIN tbl_users U
        ON T.str_num = U.str_num;

-- ������ SQL��(SELECT)�� ����������
-- TABLEó�� ����ϰ�, TABLE�� SELECT�ϴ� �������
-- ����� �� �ִ�.
-- << VIEW >>
CREATE VIEW myJoin
AS
SELECT T.str_num AS Tnum, U.str_num AS Unum, U.str_name, T.intKor, T.intEng, T.intMath 
FROM tbl_test1 T , tbl_users U
WHERE T.str_num = U.str_num(+);

SELECT * FROM myJoin;

DROP VIEW myJoin;

SELECT * FROM myJoin WHERE Tnum = '002';

SELECT * FROM myJoin ORDER BY Tnum;

-- DCL ���
-- ���� ���� tbl_users, tbl_test1 ���̺� �����͸� �߰��ߴ�.
-- ������ ���� ������ ���� �������� ������ �� �� �����̴�.
-- ���� �����ʹ� ����Ŭ�� �ӽ� ���念���� ������ �Ǿ� �ִ�.
-- �ӽ� ���念���� ����� �����͸� ������ ���� ������ �����ϴ� 
-- Ű���带 �н�
COMMIT; -- ��� ���峻���� ������ ���� ������ �ݿ��϶�.

SELECT * FROM tbl_test1;

DELETE FROM tbl_test1 WHERE tbl_test1.str_num = '006';

SELECT * FROM tbl_test1;



        
