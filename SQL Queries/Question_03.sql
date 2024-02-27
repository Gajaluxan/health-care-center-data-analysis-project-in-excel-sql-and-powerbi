use health_care;

select * from ocd_patient_dataset;

alter table ocd_patient_dataset 
modify `OCD Diagnosis Date` date;

select 
date_format(`OCD Diagnosis Date` , '%Y-%m-01 00:00:00') as month,
count(`Patient ID`) as patient_count
from ocd_patient_dataset
group by 1
order by 1;
