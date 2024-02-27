create database health_care;

use health_care;

select * from ocd_patient_dataset;

select
Gender,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obsession_scores
from ocd_patient_dataset
group by 1
order by 2;

-- or --

select
Gender,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obsession_scores
from ocd_patient_dataset
group by Gender
order by patient_count;


with data as (
select
Gender,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obsession_scores
from ocd_patient_dataset
group by 1
order by 2
)

select

sum( case when Gender = 'Female' then patient_count else 0 end) as count_female,
sum( case when Gender = 'Male' then patient_count else 0 end) as count_male,

round(sum(case when Gender = 'Female' then patient_count else 0 end)/
(sum(case when Gender = 'Female' then patient_count else 0 end)
+sum(case when Gender = 'Male' then patient_count else 0 end))*100,2) as pct_female,

round(sum(case when Gender = 'Male' then patient_count else 0 end)/
(sum(case when Gender = 'Female' then patient_count else 0 end)
+sum(case when Gender = 'Male' then patient_count else 0 end))*100,2) as pct_male
from data;
