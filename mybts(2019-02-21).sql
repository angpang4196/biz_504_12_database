-- mybts ����ȭ��

-- �ŷ�ó ���� ���̺� 
create table tbl_dept(
    d_code varchar2(5) primary key,
    d_name nvarchar2(50) not null,
    d_ceo nvarchar2(50)
);

select * from tbl_dept order by d_code;

select * from tbl_dept where d_name like('%�Ե�%') order by d_name;