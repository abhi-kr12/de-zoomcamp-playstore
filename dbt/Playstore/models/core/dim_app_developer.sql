{{ config(materialized="table") }}

select `App ID`, `Developer ID`, `Developer Website`, `Developer Email`
from {{ ref("stg_staging__playstore") }}
