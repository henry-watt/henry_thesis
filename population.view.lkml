view: population {
  derived_table: {
    sql:
      SELECT
      'CHN' AS code, 1418434395 AS population
      UNION ALL
      SELECT
      'ESP' AS code, 46426941 AS population
      UNION ALL
      SELECT
      'ITA' AS code, 59240560 AS population
      UNION ALL
      SELECT
      'FRA' AS code, 65399723 AS population
      UNION ALL
      SELECT
      'RUS' AS code, 143917898 AS population
      UNION ALL
      SELECT
      'KOR' AS code, 51282047 AS population
      UNION ALL
      SELECT
      'TWN' AS code, 23768087 AS population
      UNION ALL
      SELECT
      'GBR' AS code, 60800000 AS population
      UNION ALL
      SELECT
      'JPN' AS code, 126961329 AS population
      UNION ALL
      SELECT
      'NOR' AS code, 5295619 AS population
      UNION ALL
      SELECT
      'USA' AS code, 328335464 AS population
      UNION ALL
      SELECT
      'ISL' AS code, 357050 AS population
      UNION ALL
      SELECT
      'NLD' AS code, 17300000 AS population
      UNION ALL
      SELECT
      'ARG' AS code, 43847430 AS population
      UNION ALL
      SELECT
      'PRT' AS code, 10310000 AS population
      UNION ALL
      SELECT
      'DNK' AS code, 5800000 AS population
      UNION ALL
      SELECT
      'IRL' AS code, 4784000 AS population
      UNION ALL
      SELECT
      'FRO' AS code, 49290 AS population
      UNION ALL
      SELECT
      'GRC' AS code, 10770000 AS population
      UNION ALL
      SELECT
      'CAN' AS code, 36710000 AS population

      ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  measure: count {
    type: count
  }

  parameter: p_a {
    type: string
    allowed_value: { label:"a" value: "a"}
    allowed_value: { label:"b" value: "b"}
  }

  parameter: p_b {
    type: string
    allowed_value: {label:"c" value: "c"}
    allowed_value: {label:"d" value: "d"}
  }

  parameter: p_c {
    type: string
    allowed_value: {label:"e" value: "e"}
    allowed_value: {label:"f" value: "f"}
  }

  dimension: conditional_if_dimension {
    type: string
    sql: {% if (p_a._parameter_value == "'a'" and p_b._parameter_value == "'c'")  or (p_c._parameter_value == "'e'") %}
         "a c"
        {% elsif (p_a._parameter_value == "'b'" and p_b._parameter_value =="'d'") %}
        "b d"
        {% else %}
        NULL
        {% endif %} ;;
  }

}
