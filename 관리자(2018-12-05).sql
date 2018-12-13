-- 여기는 관리자 화면입니다.

-- SQL의 주석문 
-- Ctrl + / : 주석 설정 및 해제
-- 우리나라
-- 대한민국
-- Ctrl + S : 저장

SELECT 30+30 FROM DUAL;        -- 키워드는 대문자, 나머지는 소문자      
SELECT '대한민국' FROM DUAL;   -- 문자를 ""이 아닌 '' 로 묶는다.
SELECT 30 * 30 FROM dual;

-- SELECT 
-- 데이터를 조회(읽기)를 수행하는 Keyword
-- 간단한 연산(4칙연산)등을 수행할 때도 사용할 수 있다.

-- 간단한 연산을 수행할 때 표준(보편적인) DBMS에서는
-- SELECT 30 + 40; 이라고 입력하면 수행이 되지만
-- 오라클에서는 SELECT 30 + 40 FROM DUAL; 이라고
-- 입력해야 수행이 완료된다.
SELECT 30 + 40 FROM DUAL;