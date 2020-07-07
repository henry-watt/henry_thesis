  view: sort_test {
    derived_table: {
      sql:
      SELECT
        1 AS number, 'a' AS string
      UNION ALL
      SELECT
        1.0 AS number, 'b' AS string
      UNION ALL
      SELECT
        1.25 AS number, 'c' AS string
      UNION ALL
      SELECT
        1.5 AS number, 'd' AS string
      UNION ALL
      SELECT
        1.75 AS number, 'e' AS string
      UNION ALL
      SELECT
        2 AS number, 'f' AS string
      UNION ALL
      SELECT
        2.0 AS number, 'g' AS string
      UNION ALL
      SELECT
        2.25 AS number, 'h' AS string
      UNION ALL
      SELECT
        2.5 AS number, 'i' AS string
      UNION ALL
      SELECT
        2.75 AS number, 'j' AS string
      UNION ALL
      SELECT
        3 AS number, 'k' AS string
      UNION ALL
      SELECT
        10 AS number, 'l' AS string
      UNION ALL
      SELECT
        10.1 AS number, 'm ' AS string
      ;;
    }

    dimension: number {
      type: number
      sql: ${TABLE}.number ;;
    }

    dimension: string {
      type: string
      sql: ${TABLE}.string ;;
    }

    measure: count {
      type: count
    }
  }
