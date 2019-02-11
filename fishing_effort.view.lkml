view: fishing_effort {
  sql_table_name: globalfishingwatch.fishing_effort ;;

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: fishing_hours {
    type: number
    sql: ${TABLE}.fishing_hours ;;
    value_format_name: "decimal_1"
  }

  dimension: flag {
    type: string
    sql: ${TABLE}.flag ;;
  }

  dimension: geartype {
    type: string
    sql: ${TABLE}.geartype ;;
  }

  dimension: lat_bin {
    type: number
    sql: ${TABLE}.lat_bin ;;
  }

  dimension: lon_bin {
    type: number
    sql: ${TABLE}.lon_bin ;;
  }

  dimension: mmsi_present {
    type: number
    sql: ${TABLE}.mmsi_present ;;
  }

  dimension: vessel_hours {
    type: number
    sql: ${TABLE}.vessel_hours ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: latitude_bin {
    type:  number
    sql:${lat_bin}/10 ;;
  }

  dimension: longitude_bin {
    type: number
    sql:${lon_bin}/10 ;;
  }

  measure: total_fishing_hours {
    type: sum
    sql: ${fishing_hours} ;;
    value_format_name: decimal_0
  }

  dimension: coordinates{
    type: location
    sql_latitude:${latitude_bin} ;;
    sql_longitude:${longitude_bin} ;;
  }
}
