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
    type: date
  }

  dimension: fishing_effort_geartype {
    type: string
    sql: ${TABLE}.fishing_effort_geartype ;;
  }

  set: detail {
    fields: [fishing_effort_date, fishing_effort_geartype]
  }
}
