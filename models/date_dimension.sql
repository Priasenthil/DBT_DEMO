with cte as(
    select
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,
    {{get_daytype('started_at')}} as day_type,
    {{get_season('started_at')}} as season_type,
    {{get_period_type('started_at')}} as period_type
    from
    {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select 
*
from
cte