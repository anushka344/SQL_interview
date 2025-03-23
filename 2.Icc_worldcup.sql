create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


select * from icc_world_cup;

select teamName ,  count(1) as TotalMatch, SUM(noOfWin) as Winner, 
count(1) - sum(noOfWin) as Losses from (
select Team_1 as teamName , case when Team_1 =Winner then 1 else 0 end as noOfWin
from icc_world_cup
union all
select Team_2 as teamName , case when Team_2 =Winner then 1 else 0 end as noOfWin
from icc_world_cup) A 
group by teamName