view: fishing_effort_byvessel {
  sql_table_name: globalfishingwatch.fishing_effort_byvessel ;;

  dimension: date {
    type: date
    sql:CAST(${TABLE}.date as timestamp) ;;


    link: {
      label: "Custom Date Drill"
      url: "https://dcl.dev.looker.com/dashboards/415?Date={{ _filters['fishing_effort_byvessel.date'] | url_encode }}"
    }
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
    link: {
      label:"Explore custom drill"
      url: "https://dcl.dev.looker.com/explore/Henry_Thesis/fishing_timelines?fields=fishing_effort_byvessel.date,fishing_effort_byvessel.mmsi,fishing_effort_byvessel.fishing_hours,fishing_vessels.flag&f[fishing_effort_byvessel.date]={{ value }}"
      }

    link: {
      label: "Custom Drill, passing two values"
      url: "https://dcl.dev.looker.com/dashboards/415?Mmsi={{ value }}&Fishing={{ fishing_effort_byvessel.fishing_hours._value | url_encode }}"
    }
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

  dimension: latitude_bin {
    type:  number
    sql:${lat_bin}/10 ;;
  }

  dimension: longitude_bin {
    type: number
    sql:${lon_bin}/10 ;;
  }

  dimension: coordinates {
    type: location
    sql_latitude:${latitude_bin} ;;
    sql_longitude:${longitude_bin} ;;
  }

  #dimension: geopoint {
 #   sql: ST_GEOGPOINT(${longitude_bin},${latitude_bin});;
  #  type: location
  #}

  #dimension: within {
    #sql: ST_DWithin(${geopoint}, ST_GEOGPOINT(-7.78944444, 55.2286111), 5000) ;;
    #type: yesno
  #

  dimension: 3_billion {
    type: number
    sql:3000000000 ;;
    value_format_name: decimal_0
    link: {
      label: "WWF"
      url: "https://www.worldwildlife.org/industries/sustainable-seafood"
      }
  }

  measure: 90_percent {
    type: number
    sql: 90 ;;
    label: "Percentage of the world’s fish stocks are either overfished or fully exploited"
    link: {
      label: "Guardian Overfishing Article"
      url: "https://www.theguardian.com/environment/2016/jul/07/global-fish-production-approaching-sustainable-limit-un-warns"
    }
  }

  measure: count_distinct_test {
    type: count_distinct
    sql: ${compound_primary_key} ;;
    drill_fields: [test_set*]
  }

  set: test_set {
    fields: [count_distinct_test]
  }

  measure: failed_attempt {
    type: number
    sql:  ${3_billion}}/0;;
}
}
