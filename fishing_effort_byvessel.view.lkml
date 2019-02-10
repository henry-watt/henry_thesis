view: fishing_effort_byvessel {
  sql_table_name: globalfishingwatch.fishing_effort_byvessel ;;

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: fishing_hours {
    type: number
    sql: ${TABLE}.fishing_hours ;;
  }

  dimension: lat_bin {
    type: number
    sql: ${TABLE}.lat_bin ;;
  }

  dimension: lon_bin {
    type: number
    sql: ${TABLE}.lon_bin ;;
  }

  dimension: mmsi {
    type: number
    sql: ${TABLE}.mmsi ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_fishing_hours {
    type: sum
    sql: ${fishing_hours} ;;
    value_format_name: decimal_0
  }
  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.date AS STRING), ' ', CAST(${TABLE}.mmsi AS STRING)) ;;
  }
}
