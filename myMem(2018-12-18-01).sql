-- 여기는 myMem 접속화면입니다.

SELECT * FROM tbl_iolist;

-- 거래처 (주)동양엔지니어링(광주남구롯데)의 자료만 확인하고 싶을 때
SELECT * FROM tbl_iolist WHERE io_dname = '(주)동양엔지니어링(광주남구롯데)';

-- 지금 현재 tbl_iolist는 상품이름과 거래처명, 거래처대표명을 직접 가지고있기 때문에 
-- 만약 상품이름이나 거래처명, 거래처대표명을 변경 및 삭제하려고 하면 
-- 다수(2개 이상)의 데이터가 변경이 필요한 상황이다.
-- 이 때 다수의 데이터를 변경하는 것은 DB사용환경, 규칙 입장에서는 매우 바람직하지않다.
-- 그래서 현재의 tbl_iolist 테이블을 분리 작업하여 데이터 변경이 다수 발생하지않도록
-- 조치를 취해야 한다.
-- 이론적으로 제2정규화(2NF)라고 한다.

-- 1. 거래처명과 거래처대표명을 분리한다.
--  가. tbl_iolist로부터 거래처명과 거래처대표명을 묶어서 모아보자
-- 거래처명 : io_dname , 거래처대표명 : io_ceo

-- 거래처명과 대표명을 리스트 확인
SELECT io_dname , io_ceo FROM tbl_iolist ORDER BY io_dname;

-- 거래처명과 대표명을 묶어서 확인
-- tbl_iolist에서 거래처명과 대표명을 1개씩만 추출한 SQL
SELECT io_dname, io_ceo FROM tbl_iolist GROUP BY io_dname, io_ceo ORDER BY io_dname;

--  나. 여기에서 생성된 list를 엑셀로 복사하여 데이터 작업

--  다. 거래처 테이블 생성
CREATE TABLE tbl_dept(
    d_code	CHAR(4)		    PRIMARY KEY,
    d_name	NVARCHAR2(50)	NOT NULL,	
    d_ceo	NVARCHAR2(20)	NOT NULL,	
    d_tel	NVARCHAR2(20),
    d_addr	NVARCHAR2(20),
    d_fax	NVARCHAR2(20),
    d_sid	CHAR(14)		
);

--  라. 거래처 테이블 확인
SELECT COUNT(*) FROM tbl_dept;
SELECT * FROM tbl_dept;

--  마. iolist 테이블에서 거래처명, 대표자명을 제거하고 거래처코드 칼럼으로 대체

-- a. iolist와 dept 테이블을 JOIN해서 혹시 잘못 연결된 데이터가 없는지 확인
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I, tbl_dept D WHERE I.io_dname = D.d_name;

-- b. iolist에는 있는데 혹시 dept테이블에 데이터가 없는 것이 있는가 확인
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I LEFT JOIN tbl_dept D ON I.io_dname = D.d_name;

-- c. iolist에 dept테이블의 d_code와 연결할 칼럼을 추가
ALTER TABLE tbl_iolist ADD io_dcode CHAR(4);

DESC tbl_iolist;

-- SUB QUERY 
SELECT I.io_dname, (SELECT D.d_name FROM tbl_dept D WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_ceo) AS dname
FROM tbl_iolist I ORDER BY dname;

-- 중복데이터가 있는가 검사하는 SQL
SELECT d_name, count(*) FROM tbl_dept
GROUP BY d_name --, d_ceo
HAVING count(*) > 1;

SELECT * FROM tbl_dept WHERE d_name = '우리냉동';

-- d. 이제 SUB QUERY 를 사용해서 dept table에서 d_code를 iolist에 update 실행
UPDATE tbl_iolist I SET io_dcode = (SELECT d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo FROM tbl_iolist;

-- e. iolist와 dept 테이블을 JOIN해서 거래처명 대표를 같이 조회하는 SQL
SELECT io_dcode, D.d_name, D.d_ceo, I.io_cname
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- f. iolist에서 io_dname, io_ceo칼럼을 삭제해도 된다.
ALTER TABLE tbl_iolist DROP COLUMN io_ceo;

DESC tbl_iolist;