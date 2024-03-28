{{ config(materialized="table") }}

select `App_ID`, `Developer_ID`, `Developer_Website`, `Developer_Email`
from {{ ref("stg_staging__playstore") }}
