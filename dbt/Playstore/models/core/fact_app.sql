{{ config(materialized="table") }}

select
    `App_ID`,
    `Rating`,
    `Rating_count`,
    `Install_Range`,
    `Minimum_Installs`,
    `Total_Installs`,
    `Free`,
    `Price`
from {{ ref("stg_staging__playstore") }}
