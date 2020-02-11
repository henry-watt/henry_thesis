- dashboard: test1224
  title: test1224
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: Henry_Thesis
    explore: fishing_timelines
    type: table
    fields: [population.code, population.population, populationtestdimension]
    filters:
      populationtestdimension: '49290'
    sorts: [population.code]
    limit: 500
    dynamic_fields: [{dimension: populationtestdimension, label: PopulationTestDimension,
        expression: 'abs(${population.population})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}]
    query_timezone: Europe/Dublin
    row: 0
    col: 0
    width: 8
    height: 6
