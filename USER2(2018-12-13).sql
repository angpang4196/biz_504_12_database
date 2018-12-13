-- 여기는 user2의 화면입니다.

CREATE TABLE tbl_emploree(
    strEmpno CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strJob nVARCHAR2(20),
    intSal NUMBER(5),
    strDeptNo nVARCHAR2(20)
);

SELECT * FROM tbl_emploree;

-- 테이블 변경
ALTER TABLE tbl_emploree MODIFY intSal NUMBER(10);

INSERT INTO tbl_emploree
VALUES('001','홍길동', '인사업무', 2500000, '총무부');

INSERT INTO tbl_emploree
VALUES('002','이몽룡', '기술영업', 2500000, '영업부');

INSERT INTO tbl_emploree
VALUES('003','성춘향', '급여관리', 2500000, '총무부');

INSERT INTO tbl_emploree
VALUES('004','장길산', '생산관리', 2500000, '생산부');

INSERT INTO tbl_emploree
VALUES('005','임걱정', '품질관리', 2500000, '생산부');

SELECT * FROM tbl_emploree;