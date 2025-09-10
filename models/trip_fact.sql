with trips as (

select 
ride_id,
-- rideable_type,
DATE(to_timestamp(started_at)) as trip_date,
start_statio_id as start_station_id,
end_station_id,
member_csual as member_casual,
timestampdiff(seconds,to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration_seconds

from
{{ ref('stg_bike') }}
where RIDE_ID != '"bikeid"' and RIDE_ID != 'bikeid'

)

select 
*
from 
trips