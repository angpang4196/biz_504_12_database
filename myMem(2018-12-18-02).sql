-- ����� myMem ȭ���Դϴ�.

-- GROUP BY�� �̿��ؼ� � table �����ͷκ���
-- �ߺ����� ���� list�� �����ϱ�
--     SELECT�� �������� �� ���� ���� ���� ����Ʈ�� �ټ� ��Ÿ���µ�
--     �׵��� ��ǥ�� 1������ �����ϰ� ���� ��
-- GROUP BY ���� ����ؼ� SQL�� �ۼ��Ѵ�.
SELECT io_inout FROM tbl_iolist GROUP  BY io_inout;

-- �ߺ��������� ��ǰ ����Ʈ�� �����ϴ� SQL
SELECT io_cname FROM tbl_iolist GROUP BY io_cname;

SELECT d_name FROM tbl_dept;

-- �ŷ�ó���� �ߺ��� ���� ��� ����Ʈ�� �����޶�.
SELECT d_name FROM tbl_dept GROUP BY d_name;

SELECT d_name, d_ceo FROM tbl_dept GROUP BY d_name, d_ceo;

SELECT io_cname, count(io_cname) FROM tbl_iolist GROUP BY io_cname;

SELECT d_name, d_ceo, count(d_name) FROM tbl_dept GROUP BY d_name, d_ceo;