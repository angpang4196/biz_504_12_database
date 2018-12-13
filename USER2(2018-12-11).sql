-- ����� user2 ȭ���Դϴ�.

CREATE TABLE tbl_users(
    str_userid nVARCHAR2(12) PRIMARY KEY,
    str_name nVARCHAR2(50) NOT NULL,
    str_tel nVARCHAR2(15),
    str_addr nVARCHAR2(50)
);

SELECT * FROM tbl_users;

INSERT INTO tbl_users
VALUES('001','ȫ�浿','010-1111-1111','����Ư����'); 
INSERT INTO tbl_users
VALUES('002','������','010-1234-1234','��걤����'); 
INSERT INTO tbl_users
VALUES('003','�Ӳ���','010-4567-1123','����������'); 
INSERT INTO tbl_users
VALUES('004','�庸��','010-1634-1273','����Ư����'); 
INSERT INTO tbl_users
VALUES('005','�̼���','010-1654-4923','�λ걤����'); 

SELECT * FROM tbl_users;

-- ���� �ۼ��� tbl_users ���̺� str_userid�� 12�ڸ��� ������ �ߴµ�
-- �Է��� �ϴٺ��� �ʹ� ���� �ڸ��� �����Ѵ�.
-- �׷��� ���� �Է����� id������ 3���� ũ�⸦ �ٲ㺸�����Ѵ�.
-- �̹� ������ ���̺��� Į�� ������ ����
-- DDL����� ALTER ����� ����Ѵ�.

ALTER TABLE tbl_users MODIFY str_userid nVARCHAR2(3);
ALTER TABLE tbl_users MODIFY str_name nVARCHAR2(5);
-- CHAR �� �����ʹ� ���̴� �����Ϳ� �޸� ���� ũ�⸸ŭ 
-- ��������� �̹� ä���� �־ ũ�⸦ ���̱Ⱑ �� �ȴ�.

-- (n)VARCHAR2 �� �����ʹ� ���̴� �������� 
-- ���� ���̰� �� �����͸�ŭ�� ũ�⸦ ���� �� �ִ�.
INSERT INTO tbl_users(str_userid, str_name)
VALUES('006','������');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('007','������');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('008','����');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('009','���ؿ�');
INSERT INTO tbl_users(str_userid, str_name)
VALUES('010','�ֹν�');

SELECT * FROM tbl_users;

-- SELECT�� ������ �� Ư���� Į���鸸 �����ؼ� ������ �� ��
-- Į������Ʈ : PROJECTION
SELECT str_name, str_tel FROM tbl_users;

-- tbl_users�� ����Ǿ��ִ� ������ ����Ʈ���� Ư�� ����� ����Ʈ�� ����ʹ�.
SELECT * FROM tbl_users WHERE str_name = '�̼���';
SELECT * FROM tbl_users WHERE str_addr = '����Ư����';
SELECT * FROM tbl_users WHERE str_addr = '����Ư����' AND str_name = 'ȫ�浿';

-- tbl_users ���̺��� str_userid�� 003���� 006������ �����͸� ����ʹ�.
SELECT * FROM tbl_users WHERE str_userid >= '003' AND str_userid <= '006';
SELECT * FROM tbl_users WHERE str_userid BETWEEN '003' AND '006';

SELECT * FROM tbl_users;

-- SQL�� ��� �Լ�
-- SUM, COUNT, AVG, MIN, MAX (Į���� ���δ� �Լ�)
-- ���� tbl_users�� ����� ������ ������ ���
SELECT COUNT(*) FROM tbl_users;
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT(*) AS ����,
    MIN(str_userid) AS ������,
    MAX(str_userid) AS ū��
FROM tbl_users;

SELECT COUNT(*) ,
    MIN(str_userid) ,
    MAX(str_userid)
FROM tbl_users;

