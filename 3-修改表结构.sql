--�޸ı�ṹ���﷨
alter table aateat add column_name|modify column_name|drop column column_name

--�����ֶ�
alter table aateat add isbn varchar2(20);
--�޸���
alter table aateat modify publish varchar2(80) not null;
/*  ɾ����
ɾ�������������DDL[drop column]������һ����ʱ�����飬��Ϊɾ������֮�󣬱������¹��������ɾ���е����ݡ�
���ɾ��û���ù���������á�set unused��alter table tablename drop unused column;�����ͻ������û���ù�����ȫ��ȥ��
*/
alter table aateat drop column isbn;
alter table aate set unused column publish; --���δʹ�õ���

--��������
alter table aate rename column isbn to iss;

--��������
rename aateat to aate;