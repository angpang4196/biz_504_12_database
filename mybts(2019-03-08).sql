-- mybts ����ȭ��

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

-- tbl_user�� tbl_hobby �� ����
-- tbl_user table���� userid�� �ߺ����� ������ 1���� �����ϴ� ���̴�.

-- tbl_hobby table���� userid�� �������� �����Ͱ� ������ ������ userid Į���� �������� tbl_user�� [1:��] �� ���踦 ���´�.

-- tbl_user�� tbl_hobby�� [1:��]�� ���踦 FK�� ����

-- FK�� ������ ���� ��(��)�� ��ġ�� �ִ� table�� �������� ALTER�� ����
ALTER TABLE tbl_hobby ADD FOREIGN KEY(userid)   -- ���� ��ġ
REFERENCES tbl_user(userid)                     -- 1�� ��ġ 
ON DELETE CASCADE ;                             -- ��������

-- FK ����
-- tbl_user�� userid�� ������ tbl_hobby���� 0�� �̻��� userid�� ���� �� �ִ�.
-- tbl_user�� userid�� ������ tbl_hobby���� ���� ���� �� ����.

-- tbl_user�� ���� userid�� tbl_hobby�� �߰��Ϸ��� �ϸ� ���� �߻� 
-- ���� tbl_hobby�� �ִ� userid�� tbl_user���� �����Ϸ��� �õ��ϸ� FK�� ���ǿ� ����Ǿ� ������ �� ����.

-- ��� 1 >>> ���� tbl_hobby�� �ִ� userid�� ��� �����ϰ� tbl_user�� �ִ� userid�� ����
-- ��� 2 >>> FK�� ON DELETE CASCADE�� ���� �� �д�.
