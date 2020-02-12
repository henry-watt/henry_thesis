view: derivedtableaddtoproject {
  derived_table: {
    sql: SELECT
        CAST(fishing_effort.date AS TIMESTAMP)  AS fishing_effort_date,
        fishing_effort.geartype  AS fishing_effort_geartype
      FROM globalfishingwatch.fishing_effort  AS fishing_effort
      WHERE {% condition date_filter %} fishing_effort.date {% endcondition %}
    AND fishing_effort.geartype = {% parameter geartype_selector %}
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
    type: date
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

  parameter: geartype_selector {
    type: string
    allowed_value: {
      label: "Fixed Gear"
      value: "fixed_gear"
    }
    allowed_value: {
      label: "Purse Seines"
      value: "purse_seines"
    }
    }

  dimension: dynamic_date {
    sql:
        {% if geartype_selector._parameter_value == "fixed_gear" %}
          FORMAT_DATE(${fishing_effort_date}, '%m/%d/%Y')
        {% elsif geartype_selector._parameter_value == "purse_seines" %}
          FORMAT_DATE(${fishing_effort_date}, '%d/%m/%Y')
        {% else %}
          ${fishing_effort_date}
        {% endif %};;
      type: string
  }
  }
