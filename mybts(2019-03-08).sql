-- mybts 접속화면

create table tbl_user(
    userid char(5) primary key,
    username nvarchar2(20),
    tel nvarchar2(20)
);

create table tbl_hobby(
    id number primary key,
    userid char(5),
    hobby nvarchar2(20)
);

-- tbl_user와 tbl_hobby 의 관계
-- tbl_user table에서 userid는 중복되지 않으며 1개만 존재하는 값이다.

-- tbl_hobby table에서 userid는 여러개의 데이터가 있을수 있으며 userid 칼럼을 기준으로 tbl_user와 [1:다] 의 관계를 갖는다.

-- tbl_user와 tbl_hobby의 [1:다]의 관계를 FK로 설정

-- FK를 설정할 때는 다(多)의 위치에 있는 table을 기준으로 ALTER를 실행
ALTER TABLE tbl_hobby ADD FOREIGN KEY(userid)   -- 다의 위치
REFERENCES tbl_user(userid)                     -- 1의 위치 
ON DELETE CASCADE ;                             -- 제약조건

-- FK 조건
-- tbl_user에 userid가 있으면 tbl_hobby에는 0개 이상의 userid가 있을 수 있다.
-- tbl_user에 userid가 없으면 tbl_hobby에는 절대 있을 수 없다.

-- tbl_user에 없는 userid를 tbl_hobby에 추가하려고 하면 오류 발생 
-- 만약 tbl_hobby에 있는 userid를 tbl_user에서 삭제하려고 시도하면 FK의 조건에 위배되어 삭제할 수 없다.

-- 방법 1 >>> 먼저 tbl_hobby에 있는 userid를 모두 삭제하고 tbl_user에 있는 userid를 삭제
-- 방법 2 >>> FK에 ON DELETE CASCADE를 설정 해 둔다.
