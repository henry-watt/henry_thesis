view: derivedtableaddtoproject {
  derived_table: {
    sql: SELECT
        fishing_effort.date  AS fishing_effort_date,
        fishing_effort.geartype  AS fishing_effort_geartype
      FROM globalfishingwatch.fishing_effort  AS fishing_effort
      WHERE {% condition date_filter %} fishing_effort.date {% endcondition %}
      GROUP BY 1,2
      ORDER BY 1
      LIMIT 500
       ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fishing_effort_date {
    type: string
    sql: ${TABLE}.fishing_effort_date ;;
  }

  filter: date_filter {
    type: string
    suggestions: ["2012-01-01", "2012-01-02"]
  }

  dimension: fishing_effort_geartype {
    type: string
    sql: ${TABLE}.fishing_effort_geartype ;;
  }

  set: detail {
    fields: [fishing_effort_date, fishing_effort_geartype]
  }

  parameter: sale_price_metric_picker {
    description: "Use with the Sale Price Metric measure"
    type: unquoted
    allowed_value: {
      label: "Fixed Gear"
      value: "fixed_gear"
    }
    allowed_value: {
      label: "Purse Seines"
      value: "purse_seines"
    }
  }
}
