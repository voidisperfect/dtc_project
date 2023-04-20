{{ config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {
      "field": "Date_reported",
      "data_type": "date"
    },
    cluster_by = ['WHO_region']
) }}
select * from {{ source("mage_dtc_project","dtc_pipeline_transform") }}