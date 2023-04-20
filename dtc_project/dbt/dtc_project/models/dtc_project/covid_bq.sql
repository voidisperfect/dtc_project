{{ config(
  materialized='table',
    partition_by={
      "field": "Date_reported",
      "data_type": "datetime",
      "granularity": "day"
    },
    cluster_by = ['WHO_region'],
) }}
select * from {{ source("mage_dtc_project","dtc_pipeline_transform") }}