{{ config(materialized="table") }}

select `App_ID`, `Size`, `Minimum_Android`
from {{ ref("stg_staging__playstore") }}
