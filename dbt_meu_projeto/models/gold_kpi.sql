with interpolado AS (
 {{ interpolar_sales(ref('silver_kpi')) }}
)

SELECT
    date,
    case 
      when sales is null then sales_interpolado
      else sales 
    end as sales
FROM interpolado