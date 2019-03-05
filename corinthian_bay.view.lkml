view: corinthian_bay {
  derived_table: {
    sql:
      SELECT
      -20.17 AS lat, 57.41 AS long, '2016-03-20' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -21.41 AS lat, 57.59 AS long, '2016-03-20' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -21.61 AS lat, 57.75 AS long, '2016-03-21' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -25.15 AS lat, 59.71 AS long, '2016-03-21' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -25.34 AS lat, 59.79 AS long, '2016-03-22' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -28.6 AS lat, 61.4 AS long, '2016-03-22' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -28.78 AS lat, 61.47 AS long, '2016-03-23' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -31.7 AS lat, 62.88 AS long, '2016-03-23' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -31.87 AS lat, 63.01 AS long, '2016-03-24' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -34.52 AS lat, 64.42 AS long, '2016-03-24' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -34.86 AS lat, 64.5 AS long, '2016-03-25' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -37.52 AS lat, 65.96 AS long, '2016-03-25' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -37.69 AS lat, 66.17 AS long, '2016-03-26' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -40.26 AS lat, 67.51 AS long, '2016-03-26' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -40.47 AS lat, 67.57 AS long, '2016-03-27' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -43.8 AS lat, 69.61 AS long, '2016-03-27' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -44.15 AS lat, 69.82 AS long, '2016-03-28' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -47.33 AS lat, 72.14 AS long, '2016-03-28' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -48.18 AS lat, 72.6 AS long, '2016-03-29' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -45.96 AS lat, 73.3 AS long, '2016-04-20' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -43.22 AS lat, 71.45 AS long, '2016-04-20' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -42.93 AS lat, 71.2 AS long, '2016-04-21' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -39.97 AS lat, 70.2 AS long, '2016-04-21' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -39.25 AS lat, 69.69 AS long, '2016-04-22' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -35.92 AS lat, 67.44 AS long, '2016-04-22' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -35.63 AS lat, 67.23 AS long, '2016-04-23' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -32.37 AS lat, 64.77 AS long, '2016-04-23' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -31.85 AS lat, 64.5 AS long, '2016-04-24' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -28.58 AS lat, 62.22 AS long, '2016-04-24' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -27.98 AS lat, 61.83 AS long, '2016-04-25' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -24.73 AS lat, 59.65 AS long, '2016-04-25' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -24.28 AS lat, 59.44 AS long, '2016-04-26' AS date, 503000087 AS mmsi
      UNION ALL
      SELECT
      -20.15 AS lat, 57.26 AS long, '2016-04-26' AS date, 503000087 AS mmsi


      ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: mmsi {
    type: number
    sql: ${TABLE}.mmsi ;;
  }

  measure: count {
    type: count
  }
}
