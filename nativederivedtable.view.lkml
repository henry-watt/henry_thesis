

# If necessary, uncomment the line below to include explore_source.
# include: "Henry_Thesis.model.lkml"

include: "fishing_vessels.explore.lkml"


  view: native_derived_table {
    derived_table: {
      explore_source: fishing_vessels {
        column: Fishing_Style {}
        column: engine_power {}
        filters: {
          field: fishing_vessels.geartype
          value: "trawlers"
        }
      }
    }
    dimension: Fishing_Style {}
    dimension: engine_power {
      type: number
    }
  }
