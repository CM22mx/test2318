view: audit {
  derived_table: {

    sql: WITH fake_data AS

      (SELECT "2023-12-05 14:42:21,781 INFO a long string with data which then
      gets regexed" as event

      UNION ALL SELECT "2023-12-05 14:42:21,781 INFO another very long string"

      )

      SELECT * FROM dummy;;


  }


  suggestions: no


  dimension_group: event_timestamp {

    type: time
    description: "Timestamp of the log event"
    timeframes: [
      raw,
      minute15,
      minute10,
      minute30,
      minute5,
      minute,
      time,
      date,
      second,
      hour,
      hour_of_day,
      week,
      month,
      quarter,
      year
      ]

#sql: TIMESTAMP(REGEXP_EXTRACT(event, r"^(\d{4}-\d{2}-\d{2}
    #\d{2}:\d{2}:\d{2}),"),"America/Edmonton") ;;

    sql: TIMESTAMP(REGEXP_EXTRACT(event, r"^(\d{4}-\d{2}-\d{2}
      \d{2}:\d{2}:\d{2}),")) ;;

    drill_fields: [event_timestamp_hour, event_timestamp_minute5,
      event_timestamp_minute10, event_timestamp_minute30]

    allow_fill: yes

  }


  dimension: Event {

    type: string

    sql:${TABLE}.event ;;

  }


  measure: count {

    type: count


  }


  measure: distinct_count {

    type: count_distinct

    sql: ${Event} ;;

  }
 }
