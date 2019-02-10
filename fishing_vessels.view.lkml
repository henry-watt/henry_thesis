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

  dimension: geartype {
    type: string
    sql: ${TABLE}.geartype ;;
    link: {
      url: "{{ fishing_vessels.url_field._value }}"
      label: "{{ value }}"
    }
  }

  dimension: url_field {
    hidden: yes
    type: string
    sql:
        CASE
            WHEN ${geartype} = 'trawlers' THEN ('https://en.wikipedia.org/wiki/Fishing_trawler')
            WHEN ${geartype} = 'fixed_gear' THEN ('https://definedterm.com/fixed_gear/178332')
            WHEN ${geartype} = 'purse_seines' THEN ('https://www.fisheries.noaa.gov/national/bycatch/fishing-gear-purse-seineshttps://www.fisheries.noaa.gov/national/bycatch/fishing-gear-purse-seines')
            WHEN ${geartype} = 'drifting_longlines' THEN ('http://www.fao.org/fishery/geartype/233/en')
            WHEN ${geartype} = 'squid_jigger' THEN ('http://www.fao.org/fishery/vesseltype/330/en')
            WHEN ${geartype} = 'other_fishing' THEN ('http://www.fao.org/fishery/vesseltype/search/en')
            ELSE NULL
        END ;;
  }
}
