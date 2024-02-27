use health_care;

select
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obsession_score
from ocd_patient_dataset
group by 1
order by 2;
