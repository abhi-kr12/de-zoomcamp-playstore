{{ config(materialized="table") }}

select
    `App_ID`,
    `Release_Date`,
    `Last_Updated`,
    `Content_Rating`,
    `Privacy_Policy`,
    `Ad_Supported`,
    `In_App_Purchases`,
    `Editor_Choice`
from {{ ref("stg_staging__playstore") }}
