{{ config(materialized="table") }}

select
    `App ID`,
    `Release Date`,
    `Last Updated`,
    `Content Rating`,
    `Privacy Policy`,
    `Ad Supported`,
    `In App Purchases`,
    `Editor Choice`
from {{ ref("stg_staging__playstore") }}
