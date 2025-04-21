with interpolated AS (
 {{ interpolate_sales(ref('silver_kpi')) }}
)

SELECT
    date,
    case
      when sales is null then interpolated_sales
      else sales
    end as sales
FROM interpolated