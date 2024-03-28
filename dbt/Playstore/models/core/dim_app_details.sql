{{ config(materialized="table") }}

select `App ID`, `App Name`, `Category`
from {{ ref("stg_staging__playstore") }}
