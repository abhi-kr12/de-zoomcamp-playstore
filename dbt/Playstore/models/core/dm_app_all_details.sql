{{
    config(
        materialized='table'
    )
}}

select a.`App Name`,
a.`Category`,
b.`Release Date`,
b.`Content Rating`,
b.`Ad Supported`,
b.`In App Purchases`,
c.`Rating`,
c.`Rating Count`,
c.`Total Installs`,
c.`Free`,
c.`Price`
 from {{ ref('dim_app_details') }} a
inner join {{ ref('dim_app_misc') }} b
on a.`App ID` = b.`App ID`
inner join {{ ref('fact_app') }} c
on b.`App ID` = c.`App ID`
