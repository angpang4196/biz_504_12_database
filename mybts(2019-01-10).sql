-- ����� mybts ȭ���Դϴ�.

-- mySQL
SHOW TABLES;

-- Oracle
SELECT * FROM DBA_TABLES WHERE OWNER = 'MYBTS';

-- ���̺��� ����
DESC tbl_student;
DESC tbl_score;

-- ������ Ȯ��
SELECT * FROM USER_SEQUENCES;

-- ������ ������Ű��
SELECT SEQ_SCORE.NEXTVAL FROM DUAL;

SELECT * FROM tbl_score;

DELETE FROM tbl_score;

-- ID ���� PK�� ������ ���
-- �ٸ� ���̺�� JOIN�� �� �� KEY�� ���Ǵ� ��찡 �ִ�.
-- �׷��� ���� �����͸� �����ϰ� ���ο� �����͸� �߰��� ����
-- ������ ����ϴ� ID���� ��Ȱ�������ʴ´�.
INSERT INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES(SEQ_SCORE.nextval, '00001', '001', 80);

SELECT * FROM tbl_score;

DROP SEQUENCE SEQ_SCORE;

INSERT INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES(SEQ_SCORE.nextval, '00001', '005', 43);

INSERT INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES(SEQ_SCORE.nextval, '00001', '002', 75);

INSERT INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES(SEQ_SCORE.nextval, '00001', '003', 26);

INSERT INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES(SEQ_SCORE.nextval, '00001', '004', 87);

-- ���� view�� �����Ͽ� java�� �����Ͽ� ����� ��� 
-- �� AS Į������ �̸��� vo�� ��������� �����ؾ� �ϴµ�
-- �ѱ۷� �ۼ��� �ϸ� ��������� �ѱ۷� �ۼ��ؾ� �Ѵ�.
-- �ǹ������� �ѱ� ����� �����ϴ� �����
-- ������ �������� �ۼ��Ѵ�.
CREATE VIEW view_score_sum
AS
SELECT st_num, 
    SUM(DECODE(sc_sb_code,'001',sc_score,0)) AS ss_kor,
    SUM(DECODE(sc_sb_code,'002',sc_score,0)) AS ss_eng,
    SUM(DECODE(sc_sb_code,'003',sc_score,0)) AS ss_math,
    SUM(DECODE(sc_sb_code,'004',sc_score,0)) AS ss_sci,
    SUM(DECODE(sc_sb_code,'005',sc_score,0)) AS ss_music
FROM tbl_score 
GROUP BY st_num;

SELECT * FROM view_score_sum;

SELECT * FROM tbl_score;