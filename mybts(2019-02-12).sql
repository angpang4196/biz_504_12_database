-- mybts 화면

-- 회원가입을 위해서 회원정보가 담길 table 생성
--  private long id;
--
--	private String m_userid;
--	private String m_re_password;
--	private String m_password;
--	private String m_name;
--	private String m_tel;
--	private String m_city;
--	private String m_addr;
--	private String[] m_hobby;

CREATE TABLE tbl_member(
    id          number          primary key,
    m_userid    nvarchar2(30)   not null,
    m_password  nvarchar2(125)  not null,
    m_name      nvarchar2(125)  not null,
    m_tel       nvarchar2(20),
    m_city      nvarchar2(20),
    m_addr      nvarchar2(125),
    constraint unique(m_userid) -- 테이블을 생성할 때 unique 지정 
);

-- 회원 정보에서는 id칼럼은 TABLE 무결성을 보장하기위한 값
-- 실제로 회원정보를 활용하기 위해서는 주로 사용하는 칼럼은 m_userid 칼럼이다.
-- 회원 정보 table에서 m_userid는 중복되어서는 안 된다.
-- 따라서 회원 정보 table의 m_userid 칼럼을 unique로 설정을 해 준다.

ALTER TABLE tbl_member ADD UNIQUE (m_userid); -- 무명으로 조건 생성
ALTER TABLE tbl_member ADD CONSTRAINT U_userid UNIQUE (m_userid); -- U_userid 이름으로 생성

CREATE TABLE tbl_hobby(
    id          number          primary key,
    m_userid    nvarchar2(30)   not null,
    m_hobby     nvarchar2(20) 
);

drop table tbl_hobby;

-- FOREIGN KEY 를 생성
-- FK 는 main table (tbl_member)의 어떤 칼럼과 연동을 시켜서 
-- 만약 main table의 데이터를 삭제하면 sub table(tbl_hobby)의 데이터가 
-- 의미없이 남아 있는 것을 방지하기 위한 설정
ALTER TABLE tbl_hobby ADD CONSTRAINT FK_userid FOREIGN KEY (m_userid) REFERENCES tbl_member(m_userid) on delete cascade ;
drop foreign key f_userid;

insert into tbl_member(id,m_userid,m_password,m_name)
values(0,'aaa','1234','홍길동');

insert into tbl_hobby(id, m_userid, m_hobby)
values(0,'aaa','book');

insert into tbl_hobby(id, m_userid, m_hobby)
values(1,'aaa','music');

insert into tbl_hobby(id, m_userid, m_hobby)
values(2,'aaa','movie');

select * from tbl_member;
select * from tbl_hobby;

commit;

delete from tbl_member where m_userid = 'aaa';

-- tbl_member table에 aaa라는 사용자가 없으면 tbl_hobby에 aaa 사용자의 취미를 추가할 수 없다.
insert into tbl_hobby(id, m_userid, m_hobby)
values(1,'aaa','music');

create sequence MEMBER_SEQ start with 1 increment by 1;