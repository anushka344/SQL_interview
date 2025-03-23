
create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

select * from entries;

with totalVisit as
(select name, count(1) as total_Visits  ,group_concat(distinct resources) as resources_used
from entries group by name),
floors as 
(
select name , floor , count(1) as noOfFloorVisit,
rank() over(partition by name order by count(1) desc) as rnk
from entries 
group by name, floor
)

select tv.name, tv.total_Visits, tv.resources_used
, f.floor from totalVisit tv inner join floors f where f.name=tv.name and rnk=1;


