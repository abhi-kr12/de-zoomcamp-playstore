{{
    config(
        materialized='table'
    )
}}

select a.`App_Name`,
a.`Category`,
b.`Release_Date`,
b.`Content_Rating`,
b.`Ad_Supported`,
b.`In_App_Purchases`,
c.`Rating`,
c.`Rating_Count`,
c.`Total_Installs`,
c.`Free`,
c.`Price`
 from {{ ref('dim_app_details') }} a
inner join {{ ref('dim_app_misc') }} b
on a.`App_ID` = b.`App_ID`
inner join {{ ref('fact_app') }} c
on b.`App_ID` = c.`App_ID`
