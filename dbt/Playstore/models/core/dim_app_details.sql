{{ config(materialized="table") }}

select `App_ID`, `App_Name`, `Category`
from {{ ref("stg_staging__playstore") }}
