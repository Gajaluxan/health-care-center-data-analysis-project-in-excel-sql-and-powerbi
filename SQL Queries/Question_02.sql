use health_care;

select
Ethnicity,
count(`Patient ID`) as patients_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obsessions_score
from ocd_patient_dataset
group by 1
order by 2;
