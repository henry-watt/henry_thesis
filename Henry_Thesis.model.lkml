connection: "lookerdata_standard_sql"

include: "*.view.lkml"                       # include all views in this project
include: "*.dashboard.lookml"   # include a LookML dashboard called my_dashboard

map_layer: countries_maritime {
  file: "countries-maritime.topojson"
  format: topojson
  property_key: "A3"
}


explore: fishing_effort {
  join: population {
    type: inner
    relationship: one_to_one
    sql_on: ${fishing_effort.flag} = ${population.code};;
  }
  join: ISO3 {
    type: inner
    relationship: one_to_one
    sql_on: ${fishing_effort.flag} = ${ISO3.code};;
  }
}
explore: fishing_effort_byvessel {}

explore: fishing_vessels {
  join: ISO3 {
    type: inner
    relationship: one_to_one
    sql_on: ${fishing_vessels.flag} = ${ISO3.code};;
    }

  join: population {
    type: inner
    relationship: one_to_one
    sql_on: ${ISO3.code} = ${population.code};;
  }
  }

explore: vessels {}

explore: tiuna {}

explore: ISO3 {}

explore: twilio_test {}

explore: fishing_timelines {
  view_name: fishing_effort_byvessel
  join: fishing_vessels {
    type: inner
    relationship: many_to_one
    sql_on: ${fishing_effort_byvessel.mmsi} = ${fishing_vessels.mmsi} ;;
  }
  join: ISO3 {
    type: inner
    relationship: one_to_one
    sql_on: ${fishing_vessels.flag} = ${ISO3.code};;
  }
  join: population {
    type: inner
    relationship: one_to_one
    sql_on: ${ISO3.code} = ${population.code};;
  }
  }
