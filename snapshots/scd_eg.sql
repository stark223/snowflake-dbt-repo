{% snapshot scd_table %}

-- check cols strategey
    {{
        config(
          target_schema='random',
          strategy='check',
          unique_key='ID',
          check_cols=['FIRSTNAME','LASTNAME'],
        )
    }}

    
    -- updated_at strategy
        {{
        config(
          target_schema='random',
          strategy='check',
          unique_key='ID',
          updated_at='updated_at',
        )
    }}


select * from {{source("sahil's sources",'SCD_EG')}}
{% endsnapshot %}