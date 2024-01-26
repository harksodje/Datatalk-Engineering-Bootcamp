
select 	gt.lpep_pickup_datetime,
gt.lpep_dropoff_datetime,
gt.total_amount,
CONCAT(pzone.borough , '/', pzone.zone) AS "p_zone",
CONCAT(dzone.borough, '/', dzone.zone) AS "d_zone"from 
green_tripdata as gt,
trip_zone as pzone, 
trip_zone as dzone
where gt."PULocationID" = pzone."locationID"
and gt."DOLocationID" = dzone."locationID";


select count(*) from green_tripdata 
where DATE(lpep_pickup_datetime) = '2019-09-18' and DATE(lpep_dropoff_datetime) = '2019-09-18'
limit 5;

select Date(lpep_pickup_datetime) , "trip_distance" from 
green_tripdata
group by 1, 2
order by 2 desc;

select base.borough, sum(base.total_amount) as "t_amount" from 
(select 	gt.lpep_pickup_datetime,
	gt.lpep_dropoff_datetime,
	gt.total_amount,
 	pzone.borough,
	CONCAT(pzone.borough , '/', pzone.zone) AS "p_zone",
	CONCAT(dzone.borough, '/', dzone.zone) AS "d_zone"from 
	green_tripdata as gt,
	trip_zone as pzone, 
	trip_zone as dzone
	where gt."PULocationID" = pzone."locationID"
	and gt."DOLocationID" = dzone."locationID") as base
where Date(base.lpep_pickup_datetime) = '2019-09-18'
group by 1
having sum(base.total_amount) > 50000;

With j_table as 
	(select 	gt.lpep_pickup_datetime,
	gt.lpep_dropoff_datetime,
	gt.total_amount,
	gt.tip_amount,
	pzone.borough ,
	pzone.zone as "puzone",
	dzone.zone as "drzone",
	CONCAT(pzone.borough , '/', pzone.zone) AS "p_zone",
	CONCAT(dzone.borough, '/', dzone.zone) AS "d_zone"
	from 
	green_tripdata as gt,
	trip_zone as pzone, 
	trip_zone as dzone
	where gt."PULocationID" = pzone."locationID"
	and gt."DOLocationID" = dzone."locationID")

select * from j_table
where date_part('month', lpep_pickup_datetime) = 9 and date_part('year', lpep_pickup_datetime) = 2019 and "puzone" = 'Astoria'
order by tip_amount desc
-- order by tip_amount;

-- ;