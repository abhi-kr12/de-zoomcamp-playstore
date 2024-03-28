{{ config(materialized="table") }}

select `App_ID`, `App Name`, `Category`
from {{ ref("stg_staging__playstore") }}
