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
    app_name `App Name`,
    app_id `App ID`,
    category `Category`,
    rating `Rating`,
    rating_count `Rating count`,
    installs `Install Range`,
    minimum_installs  `Minimum Installs`,
    maximum_installs `Total Installs`,
    free  `Free`,
    price `Price`,
    currency `Currency`,
    size `Size`,
    minimum_android `Minimum Android`,
    developer_id `Developer ID`,
    developer_website `Developer Website`,
    developer_email `Developer Email`,
    cast(released as Date) `Release Date`,
    last_updated `Last Updated`,
    content_rating `Content Rating`,
    privacy_policy `Privacy Policy`,
    ad_supported `Ad Supported`,
    in_app_purchases `In App Purchases`,
    editors_choice `Editor Choice`

from playstore_data

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}