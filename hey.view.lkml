
view: hey {
  derived_table: {
    persist_for: "5 minutes"
    explore_source: fishing_timelines {
      column: active_2013 { field: fishing_vessels.active_2013 }

    }
  }
  dimension: active_2013 {
    label: "Fishing Vessels Active 2013 (Yes / No)"
    type: yesno
  }
}
