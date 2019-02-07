view: vessels {
  sql_table_name: globalfishingwatch.vessels ;;

  dimension: callsign {
    type: string
    sql: ${TABLE}.callsign ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}.flag ;;
  }

  dimension: imo {
    type: number
    sql: ${TABLE}.imo ;;
  }

  dimension: inferred_engine_power {
    type: number
    sql: ${TABLE}.inferred_engine_power ;;
  }

  dimension: inferred_geartype {
    type: string
    sql: ${TABLE}.inferred_geartype ;;
  }

  dimension: inferred_geartype_score {
    type: number
    sql: ${TABLE}.inferred_geartype_score ;;
  }

  dimension: inferred_length {
    type: number
    sql: ${TABLE}.inferred_length ;;
  }

  dimension: inferred_subgeartype {
    type: string
    sql: ${TABLE}.inferred_subgeartype ;;
  }

  dimension: inferred_subgeartype_score {
    type: number
    sql: ${TABLE}.inferred_subgeartype_score ;;
  }

  dimension: inferred_tonnage {
    type: number
    sql: ${TABLE}.inferred_tonnage ;;
  }

  dimension: mmsi {
    type: number
    sql: ${TABLE}.mmsi ;;
  }

  dimension: registry_engine_power {
    type: number
    sql: ${TABLE}.registry_engine_power ;;
  }

  dimension: registry_geartype {
    type: string
    sql: ${TABLE}.registry_geartype ;;
  }

  dimension: registry_length {
    type: number
    sql: ${TABLE}.registry_length ;;
  }

  dimension: registry_tonnage {
    type: number
    sql: ${TABLE}.registry_tonnage ;;
  }

  dimension: shipname {
    type: string
    sql: ${TABLE}.shipname ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  measure: count {
    type: count
    drill_fields: [shipname]
  }
}
