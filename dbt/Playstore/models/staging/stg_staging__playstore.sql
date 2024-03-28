{{
    config(
        materialized='view'
    )
}}


with 

playstore_data as (

    select * from {{ source('staging', 'playstore') }}
    where maximum_installs>1000
)

select
    app_name `App_Name`,
    app_id `App_ID`,
    category `Category`,
    rating `Rating`,
    rating_count `Rating_count`,
    installs `Install_Range`,
    minimum_installs  `Minimum_Installs`,
    maximum_installs `Total_Installs`,
    free  `Free`,
    price `Price`,
    currency `Currency`,
    size `Size`,
    minimum_android `Minimum_Android`,
    developer_id `Developer_ID`,
    developer_website `Developer_Website`,
    developer_email `Developer_Email`,
    cast(released as Date) `Release_Date`,
    last_updated `Last_Updated`,
    content_rating `Content_Rating`,
    privacy_policy `Privacy_Policy`,
    ad_supported `Ad_Supported`,
    in_app_purchases `In_App_Purchases`,
    editors_choice `Editor_Choice`

from playstore_data

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}