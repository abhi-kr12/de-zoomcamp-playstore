{{ config(materialized="table") }}

select
    `App ID`,
    `Rating`,
    `Rating count`,
    `Install Range`,
    `Minimum Installs`,
    `Total Installs`,
    `Free`,
    `Price`
from {{ ref("stg_staging__playstore") }}
