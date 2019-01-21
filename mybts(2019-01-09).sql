-- ¿©±â´Â mybts È­¸éÀÔ´Ï´Ù.

CREATE TABLE tbl_student(
    st_num      CHAR(5)         PRIMARY KEY,
    st_name     nVARCHAR2(20)   NOT NULL,
    st_grade    CHAR(2),
    st_tel      nVARCHAR2(20)
);

INSERT INTO tbl_student
VALUES('00006','È«±æµ¿','3','010-1111-1212');

INSERT INTO tbl_student
VALUES('00007','010-1111-1212','3','ÀÌ¸ù·æ');

SELECT * FROM tbl_student;

DELETE FROM tbl_student WHERE st_num = '00006';

UPDATE tbl_student SET st_tel = '010-1212-1333' WHERE st_num = '00005';

UPDATE tbl_student SET st_name = 'ÀÌ¸ù·æ', st_tel = '010-1111-1212' WHERE st_num = '00007';

CREATE TABLE tbl_score(
    id          NUMBER  PRIMARY KEY,
    st_num      CHAR(5) NOT NULL,
    sc_sb_code  CHAR(3) NOT NULL,
    sc_score    NUMBER
);

DESC tbl_score;

DROP SEQUENCE SEQ_SCORE;
CREATE SEQUENCE SEQ_SCORE START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES(SEQ_SCORE.NEXTVAL, '00004', '002', 97);

SELECT * FROM tbl_score;

COMMIT;