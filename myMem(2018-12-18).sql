-- 여기는 myMem 화면입니다.

-- 오라클에서 $ 표시가 있는 table들을 system dictionary 이라고 한다.
-- SYS DIC 라고 약칭하며 이 table은 시스템의 정보를 담고 있는 중요한 table들
-- 원래 SYS DIC 들은 관리자로 접속했을 때 확인할 수 있는 table인데
-- myMem 사용자에게 DBA권한을 부여했기때문에 확인이 가능하다.
SELECT * FROM v$datafile;
SELECT NAME FROM v$datafile;

SELECT * FROM dba_tablespaces;
SELECT * FROM dba_data_files;
SELECT * FROM v$controlfile;
SELECT * FROM dba_users;
SELECT * FROM dba_tab_privs;

SELECT USERNAME, EXPIRY_DATE, DEFAULT_TABLESPACE, PROFILE, AUTHENTICATION_TYPE FROM DBA_USERS;
