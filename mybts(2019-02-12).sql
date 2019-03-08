-- mybts ȭ��

-- ȸ�������� ���ؼ� ȸ�������� ��� table ����
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
    constraint unique(m_userid) -- ���̺��� ������ �� unique ���� 
);

-- ȸ�� ���������� idĮ���� TABLE ���Ἲ�� �����ϱ����� ��
-- ������ ȸ�������� Ȱ���ϱ� ���ؼ��� �ַ� ����ϴ� Į���� m_userid Į���̴�.
-- ȸ�� ���� table���� m_userid�� �ߺ��Ǿ�� �� �ȴ�.
-- ���� ȸ�� ���� table�� m_userid Į���� unique�� ������ �� �ش�.

ALTER TABLE tbl_member ADD UNIQUE (m_userid); -- �������� ���� ����
ALTER TABLE tbl_member ADD CONSTRAINT U_userid UNIQUE (m_userid); -- U_userid �̸����� ����

CREATE TABLE tbl_hobby(
    id          number          primary key,
    m_userid    nvarchar2(30)   not null,
    m_hobby     nvarchar2(20) 
);

drop table tbl_hobby;

-- FOREIGN KEY �� ����
-- FK �� main table (tbl_member)�� � Į���� ������ ���Ѽ� 
-- ���� main table�� �����͸� �����ϸ� sub table(tbl_hobby)�� �����Ͱ� 
-- �ǹ̾��� ���� �ִ� ���� �����ϱ� ���� ����
ALTER TABLE tbl_hobby ADD CONSTRAINT FK_userid FOREIGN KEY (m_userid) REFERENCES tbl_member(m_userid) on delete cascade ;
drop foreign key f_userid;

insert into tbl_member(id,m_userid,m_password,m_name)
values(0,'aaa','1234','ȫ�浿');

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

-- tbl_member table�� aaa��� ����ڰ� ������ tbl_hobby�� aaa ������� ��̸� �߰��� �� ����.
insert into tbl_hobby(id, m_userid, m_hobby)
values(1,'aaa','music');

create sequence MEMBER_SEQ start with 1 increment by 1;