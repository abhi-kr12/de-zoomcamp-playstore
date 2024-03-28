{{ config(materialized="table") }}

select `App ID`, `Size`, `Minimum Android`
from {{ ref("stg_staging__playstore") }}
