/* denormalize trips table */
ALTER table trips ADD COLUMN finished_at varchar(12);

 
UPDATE trips SET finished_at = (SELECT MAX(stop_times.arrival_time) from stop_times where stop_times.trip_id = trip_id); 

/* much slower:

UPDATE trips
SET finished_at  = tg.last_arrival_time
 FROM trips t
 INNER JOIN (
     SELECT trip_id, MAX(arrival_time) last_arrival_time
     FROM stop_times
     GROUP BY trip_id
 ) tg ON t.trip_id = tg.trip_id;

*/


