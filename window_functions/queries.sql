-- Popular babies names
select * from 
    (
        select gender, name, babies, ROW_NUMBER() OVER 
            (
                PARTITION BY gender ORDER BY babies DESC
            ) as popularity from baby_names
    ) 
where popularity <= 5;