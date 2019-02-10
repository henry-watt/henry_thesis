connection: "lookerdata_standard_sql"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: fishing_effort {}
explore: fishing_effort_byvessel {}
explore: fishing_vessels {}
explore: vessels {}

explore: fishing_timelines {
  view_name: fishing_effort_byvessel
  join: fishing_vessels {
    type: inner
    relationship: one_to_one
    sql_on: ${fishing_effort_byvessel.mmsi} = ${fishing_vessels.mmsi} ;;
  }
}
