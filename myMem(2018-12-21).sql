-- 여기는 myMem 접속화면입니다. 

-- tbl_iolist에서 상품정보 테이블을 분리해서 제2정규화 과정을 수행

-- tbl_iolist의 개수를 확인
SELECT COUNT(*) FROM tbl_iolist;

-- 전체데이터가 아닌 어떤 조건에 맞는 데이터만 제한해서 확인하고자 할 때는 
-- WHERE 절에서 칼럼 = 조건 형식의 SQL을 이용한다.

-- 어떤 조건을 설정하기가 마땅치않을 때 그냥 몇 개의 개수만 제한해서( 예 : 10개, 100개) 조회하고자 할 때
-- 오라클용 전용 SQL 키워드 중에
-- 칼럼명으로 ROWNUM 이라는 칼럼이 있다.
-- 이 칼럼은 저장된 데이터의 ROW 순번을 가상으로 표시하는 오라클 DUMMY 칼럼
SELECT ROWNUM, io_date, io_cname io_dcode FROM tbl_iolist ;

-- ROWNUM 칼럼을 이용하면 데이터리스트 중에서 몇 개만 제한적으로 조회를 할 수 있다.
SELECT ROWNUM, io_date, io_cname FROM tbl_iolist WHERE ROWNUM <= 10;

-- ROWNUM 칼럼을 이용해서 10번째위치의 데이터부터 20번째 위치의 데이터를 조회하고싶다.
SELECT ROWNUM, io_date, io_cname FROM tbl_iolist WHERE ROWNUM BETWEEN 10 AND 20;

-- MySQL
-- SELECT * FROM tbl_iolist LIMIT 10;

SELECT * FROM tbl_iolist WHERE ROWNUM < 10;

-- 상품정보를 상품테이블로 분리하기 위해서 
-- 상품이름 리스트를 만들기
SELECT io_cname FROM tbl_iolist GROUP BY io_cname;

SELECT io_cname, io_inout, io_price FROM tbl_iolist WHERE ROWNUM < 10;

-- 현재 조회된 데이터에서 io_inout이 '매입'이면 io_price 는 '매입단가'일 것이고
--                                   '매출'이면 '매출단가'일 것으로 생각이 든다.
-- 그래서 io_inout에 따라 단가를 다르게 표시 해 보자.
-- ⑴. ROWNUM으로 개수 지정
SELECT io_cname, io_inout,
DECODE(io_inout, '매입', io_price) 매입단가,
DECODE(io_inout, '매출', io_price) 매출단가
FROM tbl_iolist WHERE ROWNUM < 10;

-- ⑵
SELECT io_cname, io_inout,
DECODE(io_inout, '매입', io_price) 매입단가,
DECODE(io_inout, '매출', io_price) 매출단가
FROM tbl_iolist GROUP BY io_cname, io_inout, DECODE(io_inout, '매입', io_price), DECODE(io_inout, '매출', io_price);

-- ⑶
SELECT io_cname, 
    AVG(DECODE(io_inout, '매입', io_price)) 매입단가,
    AVG(DECODE(io_inout, '매출', io_price)) 매출단가
FROM tbl_iolist 
GROUP BY io_cname ORDER BY io_cname;

DROP TABLE tbl_product;

CREATE TABLE tbl_product(
    p_code	    CHAR(9)		    PRIMARY KEY,
    p_name	    NVARCHAR2(50)	NOT NULL,	
    p_iprice	NUMBER,
    p_oprice	NUMBER		
);

SELECT COUNT(*) FROM tbl_product;

-- 이제 상품정보 테이블을 생성하고 데이터를 만들었으니
-- 매입매출정보에서 상품코드 칼럼을 생성하고 
-- 상품코드 칼럼 데이터를 UPDATE하고 상품명 칼럼을 삭제

ALTER TABLE tbl_iolist DROP COLUMN io_pcode;

ALTER TABLE tbl_iolist ADD io_pcode CHAR(9);

DESC tbl_iolist;

-- 서브쿼리를 이용해서 iolist와 product 테이블 간의 관계를 한번 살펴보자
SELECT io_cname, (SELECT p_name FROM tbl_product P WHERE P.p_name = I.io_cname),
    (SELECT p_code FROM tbl_product P WHERE P.p_name = I.io_cname)
FROM tbl_iolist I;

-- product table 에서 상품코드(p_code)를 조회해서 
-- iolist 테이블의 io_pcode 칼럼에 UPDATE하자
UPDATE tbl_iolist I SET io_pcode = (SELECT p_code FROM tbl_product P WHERE P.p_name = I.io_cname);

SELECT * FROM tbl_iolist;

-- UPDATE 후에 검증
-- JOIN을 이용해서 검증
SELECT I.io_pcode, I.io_cname, P.p_code, P.p_name
FROM tbl_iolist I
LEFT JOIN tbl_product P
ON I.io_pcode = P.p_code
ORDER BY I.io_pcode;

-- 상품명 칼럼을 삭제
ALTER TABLE tbl_iolist DROP COLUMN io_cname;

DESC tbl_iolist;

SELECT * FROM tbl_iolist WHERE ROWNUM < 10;

-- tbl_iolist는 제2정규화 과정이 완료되었다.
-- 매입매출 명세를 보면서 상품명과 거래처명을 같이 확인하고싶다.

-- 1. 매입매출명세와 상품명 같이 보기
SELECT I.io_date, I.io_pcode, P.p_name, I.io_inout, I.io_price, P.p_iprice, P.p_oprice, I.io_quan, I.io_price * I.io_quan AS 합계
FROM tbl_iolist I
LEFT JOIN tbl_product P
ON I.io_pcode = P.p_code; 

-- 2. 매입매출명세와 거래처정보를 같이 보기
SELECT I.io_date, I.io_dcode, D.d_name, I.io_inout, I.io_price, I.io_quan, I.io_price * I.io_quan AS 합계
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- 3. 매입매출명세를 보면서 상품정보, 거래처정보를 같이 보기
SELECT I.io_date, I.io_pcode, P.p_name, I.io_inout, I.io_dcode, D.d_name, D.d_ceo, I.io_price, 
    P.p_iprice, P.p_oprice, I.io_quan, I.io_price * I.io_quan AS 합계
    FROM tbl_iolist I
    LEFT JOIN tbl_product P
    ON I.io_pcode = P.p_code
    LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- 매입매출명세와 상품정보, 거래처정보를 JOIN해서 조회를 했는데 
-- 쿼리가 너무 복잡해
-- 그런데 자주 사용할 것 같다.
-- 이럴 때에는 SQL을 VIEW로 생성 해 두어라.

CREATE VIEW io_dept_product_view AS
SELECT I.io_date, I.io_pcode, P.p_name, I.io_inout, I.io_dcode, D.d_name, D.d_ceo, I.io_price, 
    P.p_iprice, P.p_oprice, I.io_quan, I.io_price * I.io_quan AS 합계
    FROM tbl_iolist I
    LEFT JOIN tbl_product P
    ON I.io_pcode = P.p_code
    LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

SELECT * FROM io_dept_product_view;

-- 거래일자가 2018-03-01 ~ 2018-03-31 기간의 매입인 항목의 개수와 합계금액을 조회
SELECT io_inout AS 구분, COUNT(io_inout) AS 항목개수, SUM(io_total) AS 합계금액 
FROM tbl_iolist 
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31' AND io_inout = '매입'
GROUP BY io_inout;

SELECT io_inout AS 구분, COUNT(io_inout) AS 항목개수, SUM(io_total) AS 합계금액 
FROM tbl_iolist 
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout;

