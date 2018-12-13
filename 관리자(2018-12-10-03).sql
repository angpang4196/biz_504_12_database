-- 여기는 관리자 화면입니다.

-- 1. TABLESPACE 생성
CREATE TABLESPACE myts1
DATAFILE 'd:bizwork/oracle/ordata/myts1.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

-- 2. 새로운 사용자 등록
CREATE USER user3 IDENTIFIED BY 1234
DEFAULT TABLESPACE myts1;

-- 3. 사용자 접속(login)권한 부여
GRANT CREATE SESSION TO user3;

-- 4. TABLESPACE 사용 권한 부여
GRANT RESOURCE TO user3;

-- 5. CREATE TABLE 권한 부여
GRANT CREATE TABLE TO user3;

-- 6. 사용할 TABLE을 생성

-- 7. CRUD 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE TO [table] user3;

-- 4, 5, 6, 7과 기타 권한을 부여하는 방법으로
-- TEST 환경에서는
GRANT DBA TO user3;