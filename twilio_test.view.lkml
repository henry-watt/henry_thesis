
include: "Henry_Thesis.model.lkml"

view: twilio_test {
  derived_table: {
    explore_source: fishing_timelines {
      column: latitude_bin { field: fishing_effort_byvessel.latitude_bin }
      column: longitude_bin { field: fishing_effort_byvessel.longitude_bin }
      column: mmsi { field: fishing_effort_byvessel.mmsi }
      column: fishing_hours { field: fishing_effort_byvessel.fishing_hours }
      column: date { field: fishing_effort_byvessel.date }
      derived_column: geopoint{
        sql: ST_GEOGPOINT(longitude_bin,latitude_bin) ;;
      }

    }
  }
  dimension: latitude_bin {
    type: number
  }
  dimension: longitude_bin {
    type: number
  }
  dimension: mmsi {
    type: number
  }
  dimension: fishing_hours {
    type: number
  }
  dimension: date {}

  measure: geopoint {}

}
