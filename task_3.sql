use cartoons;
select *from screen_time;
select Age ,gender from screen_time where gender = 'male';
describe screen_time;
select gender from screen_time where age >=7 order by age desc;
select age, count(*) as numberofrecords from screen_time group by age;
select count(distinct 'screen time type') as numberofscreentimetypes from screen_time;
SELECT `Screen Time Type`, SUM(`Sample Size`) AS TotalSampleSize FROM screen_time GROUP BY `Screen Time Type`;
SELECT Age, MIN(`Average Screen Time (hours)`) AS MinScreenTime FROM screen_time GROUP BY Age;
SELECT Age, AVG(`Average Screen Time (hours)`) AS AverageScreenTime, SUM(`Sample Size`) AS TotalSampleSize FROM screen_time GROUP BY Age;
SELECT *FROM screen_time
WHERE `Average Screen Time (hours)` > (
    SELECT AVG(`Average Screen Time (hours)`)
    FROM screen_time
    WHERE `Day Type` = 'Weekend'
);
CREATE VIEW vw_average_screen_time_by_age AS
SELECT Age, AVG(`Average Screen Time (hours)`) AS AverageScreenTime
FROM screen_time
GROUP BY Age;
SELECT * FROM vw_average_screen_time_by_age;
CREATE INDEX idx_age ON screen_time (Age);
