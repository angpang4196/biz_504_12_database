����� mybts ȭ���Դϴ�.

-- �ּҷ� table�� �ϳ� ����
-- �й�, �̸�, ��ȭ��ȣ, �ּ� 
CREATE TABLE tbl_addr(
    ad_num  VARCHAR2(5)     PRIMARY KEY,
    ad_name nVARCHAR2(30)   NOT NULL,
    ad_tel  nVARCHAR2(15),
    ad_addr1 nVARCHAR2(20),
    ad_addr2 nVARCHAR2(50)
);

SELECT * FROM tbl_addr;

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19001','ȫ�浿','010-010-0011');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19002','�̸���','010-010-0022');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19003','������','010-010-0033');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19004','�庸��','010-010-0044');

commit;