-- ����� myBTS ȭ��
DROP TABLE tbl_score;

-- FOREGIN KEY ����
-- ���� tbl_score ���̺� �����͸� �Է��ϴµ� tbl_student ���̺� st_num �� ��ġ���� �ʴ� ����
-- �Է��ϸ� ������ �߻��ؼ� �߸� �ԷµǴ� �����Ͱ� ������ �����ϴ� ��
-- ���� ���Ἲ ����
CREATE TABLE tbl_score(
    id          NUMBER  PRIMARY KEY,
    st_num      VARCHAR2(5) NOT NULL,
    sc_sb_code  VARCHAR2(3) NOT NULL,
    sc_score    NUMBER(3),
    CONSTRAINT FK_st_num FOREIGN KEY(st_num)
    REFERENCES tbl_student(st_num)
);

DROP TABLE tbl_student;

CREATE TABLE tbl_student(
    st_num      VARCHAR2(5)         PRIMARY KEY,
    st_name     nVARCHAR2(20)   NOT NULL,
    st_grade    VARCHAR2(2),
    st_tel      nVARCHAR2(20)
);
-- �ʱ⿡ �뷮�� �����͸� �Է��Ϸ��� �ϴµ�
-- FK�� �����Ǿ� ������
-- tbl_student �����Ͱ� ��� �ϼ��Ǳ� ������
-- tbl_score �����͸� �߰��� �� ���Եȴ�.
-- ���� �ʱ⿡�� �ϴ� FK�� ���� �Ǵ� ������ �ʰ�
-- �����͸� �Է��ϰ�
-- �����Ͱ� ���� �ϼ��Ǹ� FK�� �����ϴ� ���� ����.
ALTER TABLE tbl_score DROP CONSTRAINT FK_st_num;

ALTER TABLE tbl_score ADD CONSTRAINT FK_st_num FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num);

-- ���� �����͸� ��� �Է��� �� FK�� ����(�߰�)�ϴµ� ������ �߻��ϸ� 
-- tbl_score�� �߸��� st_num�� �����ϴٴ� ���̴�.
-- �̷� ������ join�� ���ؼ� �����͸� Ȯ���ؾ� �Ѵ�.
SELECT SC.st_num, ST.st_num, ST.st_name
    FROM tbl_score SC 
        LEFT JOIN tbl_student ST
            ON SC.st_num = ST.st_num
WHERE ST.st_num = '';

DESC tbl_student;
DESC tbl_score;

DROP TABLE tbl_score;

INSERT INTO tbl_student VALUES('00001','ȫ�浿',1,'001-111-1111');
INSERT INTO tbl_student VALUES('00002','�̸���',1,'001-121-2111');
INSERT INTO tbl_student VALUES('00003','������',2,'001-144-3111');

INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL, '00002', '001', 100);

SELECT SC.st_num, ST.st_name,SC.sc_sb_code, sc_score
    FROM tbl_score SC 
        LEFT JOIN tbl_student ST
            ON SC.st_num = ST.st_num;
            
SELECT * FROM tbl_student;
DELETE FROM tbl_student WHERE st_num = '00003';
-- �й� 00003�� ���� tbl_score�� �Էµ� �����Ͱ� ��� 
-- tbl_student���� ������ ����������

-- �й� 00002�� �̹� tbl_score�� �Էµ� �����Ͱ� �ֱ� ������ 
-- tbl_student���� ������ �Ұ����ϴ�.
DELETE FROM tbl_student WHERE st_num = '00002';

-- �ᱹ �� �� ���̺��� st_num�� �������� join���� �������� �� 
-- �������谡 ��Ȯ�� ���� ����join�� �����ص� ������ ���� �ȴ�.
ALTER TABLE tbl_score DROP CONSTRAINT FK_st_num;

-- ���� tbl_student ���̺��� �����͸� �����ϴµ�
-- tbl_score�� st_num�� ��ġ�ϴ� �����͵��� ������ ����(���) �����ض�.
ALTER TABLE tbl_score ADD CONSTRAINT FK_st_num 
FOREIGN KEY(st_num) REFERENCES tbl_student(st_num) ON DELETE CASCADE;

SELECT * FROM tbl_score;

DELETE FROM tbl_student WHERE st_num = '00002';

-- tbl_student�� �����͸� �����ϴµ� tbl_score�� st_num�� ��ġ�ϴ� �����Ͱ� ������
-- st_num�� NULL�� �ٲپ��.
ALTER TABLE tbl_score ADD CONSTRAINT FK_st_num 
FOREIGN KEY(st_num) REFERENCES tbl_student(st_num) ON DELETE SET NULL;