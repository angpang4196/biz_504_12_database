-- ����� user1���� ������ ȭ���Դϴ�.
-- user1�� dba ������ ������ �ִ�.

-- table ����
-- table�̸� : tbl_std
-- st_num, st_name, st_tel, st_addr, int_age, int_grade Į���� ������ �ְ�
-- st_num�� PK�� �����Ǿ� �ְ�, st_name�� ��ĭ�� ���� ��������� �����Ǿ��ִ�.

CREATE TABLE tbl_std(
st_num CHAR(3) PRIMARY KEY,
st_name nVARCHAR2(50) NOT NULL,
st_tel nVARCHAR2(20),
st_addr nVARCHAR2(125),
int_age NUMBER(3),
int_grade NUMBER(4)
);

SELECT * FROM tbl_std;

-- ȫ�浿, �̸���, ������, �Ӳ���, ���� �̸��� �������� 
-- ������ �׸��� �����Ӱ� �����Ͽ� �����͸� �߰��Ͻÿ�.
INSERT INTO tbl_std
VALUES('1','ȫ�浿','010-1111-1111','����Ư����',15,30);
INSERT INTO tbl_std
VALUES('2','�̸���','010-1111-1234','�λ걤����',15,30);
INSERT INTO tbl_std
VALUES('3','������','010-1111-4567','��õ������',15,30);
INSERT INTO tbl_std
VALUES('4','�Ӳ���','010-1113-1113','��걤����',15,30);
INSERT INTO tbl_std
VALUES('5','����','010-1212-1212','����������',15,30);

SELECT * FROM tbl_std;

UPDATE tbl_std SET int_age = 16, int_grade = 50 WHERE st_name = '�̸���';

SELECT * FROM tbl_std;

UPDATE tbl_std SET int_age = 17, int_grade = 60 WHERE st_name = '������';
UPDATE tbl_std SET int_age = 18, int_grade = 70 WHERE st_name = '�Ӳ���';
UPDATE tbl_std SET int_age = 19, int_grade = 80 WHERE st_name = '����';

SELECT * FROM tbl_std;