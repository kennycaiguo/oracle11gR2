--�򵥲�ѯ
select * from rbac_user;
select t.id,t.loginname,t.groupid from rbac_user t;
--���б��ʽ�Ĳ�ѯ
select t.groupid||'���' ���� from rbac_user t;
select distinct t.groupid from rbac_user t;
--ɸѡ��ѯ  <,>,<>,!,=,>=,<=,all,any,like,not like,in,not in,between and,not bettween and,is null 
select * from rbac_user t where t.groupid = '930000';
select * from rbac_user t where t.groupid like '930%';
select * from rbac_user t where t.groupid = any('930000','930100');
--�����ѯ,���;ۺϺ���һ��ʹ�á�֮��ԾۺϺ�������ɸѡ��having
select t.groupid,sum(t.valid) from rbac_user t where t.groupid = any('930000','930100') group by t.groupid having sum(t.valid)>7;
--�����ѯ  order by desc���� ascĬ������
select t.groupid from rbac_user t where t.groupid like '930%' group by t.groupid order by t.groupid desc;
--��������ѯ,�����
select ru.* from rbac_user ru,rbac_group rg where ru.groupid = rg.id and rg.name='�������з��չ���';
--������
select ru.* from rbac_user ru join rbac_group rg where ru.groupid = rg.id and rg.name='�������з��չ���';




