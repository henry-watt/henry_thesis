view: fishing_vessels {
  sql_table_name: globalfishingwatch.fishing_vessels ;;

  dimension: active_2012 {
    type: yesno
    sql: ${TABLE}.active_2012 ;;
  }

  dimension: active_2013 {
    type: yesno
    sql: ${TABLE}.active_2013 ;;
  }

  dimension: active_2014 {
    type: yesno
    sql: ${TABLE}.active_2014 ;;
  }

  dimension: active_2015 {
    type: yesno
    sql: ${TABLE}.active_2015 ;;
  }

  dimension: active_2016 {
    type: yesno
    sql: ${TABLE}.active_2016 ;;
  }

  dimension: engine_power {
    type: number
    sql: ${TABLE}.engine_power ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}.flag ;;
  }

  dimension: geartype {
    type: string
    sql: ${TABLE}.geartype ;;
  }

  dimension: length {
    type: number
    sql: ${TABLE}.length ;;
  }

  dimension: mmsi {
    type: number
    sql: ${TABLE}.mmsi ;;
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
