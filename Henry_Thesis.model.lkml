connection: "lookerdata_standard_sql"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

map_layer: countries_maritime {
  file: "countries-maritime.topojson"
  format: topojson
  property_key: "A3"
}


explore: fishing_effort {}
explore: fishing_effort_byvessel {}
explore: fishing_vessels {}
explore: vessels {}
explore: tiuna {}
explore: twilio_test {}
explore: fishing_timelines {
  view_name: fishing_effort_byvessel
  join: fishing_vessels {
    type: inner
    relationship: many_to_one
    sql_on: ${fishing_effort_byvessel.mmsi} = ${fishing_vessels.mmsi} ;;
  }
}
