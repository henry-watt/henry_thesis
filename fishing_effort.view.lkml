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
    map_layer_name: countries_maritime
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

  measure: fishing_hours_per_capita {
    type: number
    sql: ${total_fishing_hours}/${population.population};;
    value_format_name: decimal_4
  }

  dimension: coordinates{
    type: location
    sql_latitude:${latitude_bin} ;;
    sql_longitude:${longitude_bin} ;;
  }

  dimension: flag_link {
    sql:lower(${flag});;
    html: <img src="https://raw.githubusercontent.com/adamoliver/Country-Flags-ISO-3/master/gif/{{rendered_value}}.gif"/> ;;
  }

  dimension: fishing_type{
    type: string
    sql:
        CASE
            WHEN ${geartype} = 'trawlers' THEN 'Trawler'
            WHEN ${geartype} = 'fixed_gear' THEN 'Fixed Gear'
            WHEN ${geartype} = 'purse_seines' THEN 'Purse Seine'
            WHEN ${geartype} = 'drifting_longlines' THEN 'Drifting Longline'
            WHEN ${geartype} = 'squid_jigger' THEN 'Squid Jigger'
            WHEN ${geartype} = 'other_fishing' THEN 'Other Fishing Type'
            ELSE NULL
        END ;;
  }

  dimension: test {
    type: string
    sql: "huo" ;;
    html: <img src="https://www.publicdomainpictures.net/pictures/140000/velka/banner-header-1449745167Dld.jpg#.XIvn7-H1ZD4.link" width="100%" /> ;;
  }

  parameter: date_filter {
    type: date_time
    allowed_value: {
      label: "Yesterday"
      value: "Yesterday"
    }
    allowed_value: {
      label: "Week to date"
      value: "This week"
    }
    allowed_value: {
      label: "Last week"
      value: "Last Week"
    }
    allowed_value: {
      label: "Month to date"
      value: "This Month"
    }
    allowed_value: {
      label: "Last month"
      value: "Last Month"
    }
    allowed_value: {
      label: "Quarter to date"
      value: "This Quarter"
    }
    allowed_value: {
      label: "Last quarter"
      value: "Last Quarter"
    }
    allowed_value: {
      label: "Year to date"
      value: "This Year"
    }
    allowed_value: {
      label: "Full year LY"
      value: "Last Year"
    }


}
}
