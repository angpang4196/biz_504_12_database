-- gradeUser�� ������ ����ó�� ȭ���Դϴ�.

SELECT * FROM tbl_student;

DESC tbl_score;

CREATE TABLE tbl_score(
--   ID	�й�	����	����
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);

SELECT * FROM tbl_score;

SELECT COUNT(*) FROM tbl_score;

-- ���� ���̺� ����
-- �����ȣ, �����, ��米��
CREATE TABLE tbl_subject(
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name NVARCHAR2(20) NOT NULL,
    su_pro NVARCHAR2(30)
);

-- ��� Į���� �����Ͱ� ���� ��� ����ϴ� ���
-- VALUES���� ������ ����Ʈ�� ���̺� ������ �� ������ �ۼ�
INSERT INTO tbl_subject
VALUES('001', '����', 'ȫ�浿');

-- �Ϻ� Į������ �����Ͱ� ���� ��� ����ϴ� ���
-- VALUES���� ���̺�� ������ ������ Į���� ��ġ�ϴ� �����͸� ������� �ۼ�
INSERT INTO tbl_subject(su_num, su_name)
VALUES('002', '����');

-- ���̺��� ������ ����� Į�� ������ �𸣰ų� ��Ȯ�� ��ġ�ϴ� Į���� ��ġ�ǵ��� �����͸� �ۼ��ϴ� ���
INSERT INTO tbl_subject(su_name, su_num, su_pro)
VALUES('����', '003', '������');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('004', '����');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('005', '����');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('006', '����');

SELECT * FROM tbl_subject;

-- �����͸� �Է��� �� Ȯ���� �غ��� ���� �����Ͱ� �� ���� �ִ�.
-- �غ�� ���� �����͸� Ȯ���� �ô��� �����ȣ 006�� ������ �ƴϰ� �����̴�. 
UPDATE tbl_subject SET su_name = '����' WHERE su_num = '006';

INSERT INTO tbl_subject(su_num, su_name)
VALUES('900', '��������');

-- �����͸� Ȯ���� ���� �����ȣ 900 �̶�� �׸��� �ִ�.
-- �׷��� �� �����͸� �����Ϸ��� �Ѵ�.
-- DFW
DELETE FROM tbl_subject WHERE su_num = '900';

-- �������̺��� �����͸� Ȯ���ϴµ�...
-- ����Į���� �����͵��� ������� �ƴϰ�, �����ȣ�� �Ǿ��ִ�.
-- �׷��� � �������� �˱Ⱑ �ſ� ��ƴ�.
-- �������̺�� �������̺��� join�� �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num, SC.sc_subject, SU.su_name, SC.sc_score 
FROM tbl_score SC
    LEFT JOIN tbl_subject SU
        ON SC.sc_subject = SU.su_num ;

-- ���� ��ȸ�� �ϸ鼭 �л����� ��� ������ �������� Ȯ���ϱⰡ ��ƴ�.
-- �л� ���̺�� join�� �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num, ST.st_name, SC.sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_st_num = ST.st_num ;
        
-- ���� ���̺�� �л� ���̺��� �й� Į���� type�� �޶� join�� ������� �ʴ´�.
-- Į���� ����
ALTER TABLE tbl_student MODIFY st_num CHAR(5);
ALTER TABLE tbl_score MODIFY sc_st_num CHAR(5);

-- �л� ���̺�� ���� ���̺��� �������̺� ���ÿ� JOIN�ؼ� VIEW�ϱ�
CREATE VIEW view_score
AS
SELECT SC.sc_st_num AS �й�, ST.st_name AS �л��̸�, SC.sc_subject AS �����ȣ, SU.su_name AS �����̸�, SC.sc_score AS ����
FROM tbl_score SC

LEFT JOIN tbl_student ST
ON TRIM(SC.sc_st_num) = TRIM(ST.st_num)

LEFT JOIN tbl_subject SU
ON SC.sc_subject = SU.su_num ORDER BY sc.sc_st_num;

SELECT * FROM view_score;

-- �й�, �̸�, ���� ������ VIEW ����
SELECT �й�, �л��̸�, SUM(����), AVG(����)
FROM view_score GROUP BY �й�, �л��̸� ORDER BY �й�;

-- �й�, �̸�, ����, ����, ����, ����, ��������
SELECT �й�, �л��̸�,
    SUM(DECODE(�����ȣ, '001', ����)) AS ����,
    SUM(DECODE(�����ȣ, '002', ����)) AS ����,
    SUM(DECODE(�����ȣ, '003', ����)) AS ����,
    SUM(DECODE(�����ȣ, '004', ����)) AS ����,
    SUM(DECODE(�����ȣ, '005', ����)) AS ��������,
    SUM(����) AS ����
FROM view_score GROUP BY �й�, �л��̸� ORDER BY �й�;

-- �� �л��� ������ �������� ���ڵ忡 �����صΰ� VIEW�� �� �� �϶�ǥ ó�� ���̴� SQL
SELECT �й�, �л��̸�,
    SUM(DECODE(�����ȣ, '001', ����)) AS ����,
    SUM(DECODE(�����ȣ, '002', ����)) AS ����,
    SUM(DECODE(�����ȣ, '003', ����)) AS ����,
    SUM(DECODE(�����ȣ, '004', ����)) AS ����,
    SUM(DECODE(�����ȣ, '005', ����)) AS ��������,
    SUM(����) AS ����
FROM view_score GROUP BY �й�, �л��̸� ORDER BY �й�;

CREATE VIEW �����϶�ǥ
AS
SELECT �й�, �л��̸�,
    SUM(DECODE(�����ȣ, '001', ����)) AS ����,
    SUM(DECODE(�����ȣ, '002', ����)) AS ����,
    SUM(DECODE(�����ȣ, '003', ����)) AS ����,
    SUM(DECODE(�����ȣ, '004', ����)) AS ����,
    SUM(DECODE(�����ȣ, '005', ����)) AS ��������,
    SUM(����) AS ����,
    RANK() OVER( ORDER BY SUM(����) DESC) AS ����
FROM view_score GROUP BY �й�, �л��̸� ORDER BY ����;
-- GROUP BY�� ����ؼ� SQL�� �ۼ��ϴ� ���
-- SUM, AVG, COUNT, MAX, MIN, RANK�� ����Լ��� ������ ���� 
-- Į���̳� ���ĵ��� ��� GROUP BY�� �ۼ��� �־�� �Ѵ�.

SELECT * FROM �����϶�ǥ ORDER BY �й�;

INSERT INTO tbl_subject(su_num, su_name, su_pro)
VALUES ('009', '��������', '�̸���');

UPDATE tbl_subject SET su_pro = '�Ӳ���' WHERE su_num = '009';

DELETE FROM tbl_subject WHERE su_num = '009';