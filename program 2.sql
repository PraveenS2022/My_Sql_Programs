create database superbikes;
use superbikes;
create table supershowroom(
slno int,
superbikes_name varchar(25), superbikes_color varchar(20), superbikes_no varchar(20), superbikes_engine bigint);
select *from supershowroom; 
alter table supershowroom add column superbike_tyer varchar(50);
alter table supershowroom drop column superbike_tyer;
 
 insert into supershowroom values(1,'bmw','blue','ka14_df2657',5677),
 (2,'bmw','blue','ka14_df2657',5677),
 (3,'bmw','blue','ka14_df2657',5677),
 (4,'bmw','blue','ka14_df2657',5677);
 
 delete from supershowroom
 where slno=3;


 
 
 
