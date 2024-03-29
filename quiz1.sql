create database quiz1;
create table kbtu(              --1
    id serial primary key,
    fake_id int,
    specialty varchar(66),
    added_date date,
    is_financing boolean,
    description text,
    students_count int
);

Alter table kbtu add column modereted_at interval;      --2
Alter table kbtu rename column specialty to specialty_name;     --3
Alter table kbtu alter column description set not null;     --4
--Alter table kbtu alter column description drop not null;
Alter table kbtu drop constraint kbtu_pkey;     --5
--Alter table kbtu add primary key (id);
Alter table kbtu drop column fake_id;       --6

Select * from kbtu where specialty_name like 'F%';       --7
Select * from kbtu where students_count>100 and students_count<500;     --8
Select * from kbtu where students_count!=200;       --9

Insert into kbtu values(1, 'FIT', '2019-11-11', true, 'NICE', 300);       --9

create table mit (like kbtu);        --11

Insert into mit select * from kbtu where added_date>now();      --12
Insert into mit values(1, 'FIT', '2019-03-04', false, 'WOW', 200, '1 minute ago') returning id;       --13

Update mit set students_count = students_count + (select students_count from kbtu where specialty_name = mit.specialty_name);      --14

Delete from mit using kbtu where mit.specialty_name = kbtu.specialty_name;      --15
