-- ����� user1���� ������ ȭ���Դϴ�.
-- �̸�(o_name), ��ȭ��ȣ(o_tel), 
-- �ּ�(o_addr), ȸ��(o_comp), �μ� Į��(o_dept)�� ����
-- tbl_office ���̺��� �����Ͻÿ�.
-- �� id�� PK�� �����ϰ� �̸��� NOT NULL

CREATE TABLE tbl_office(
id NUMBER PRIMARY KEY,
o_name CHAR(30) NOT NULL,
o_tel VARCHAR2(20),
o_addr nVARCHAR2(50),
o_comp nVARCHAR2(30),
o_dept nVARCHAR2(20)
);

SELECT * FROM tbl_office;

