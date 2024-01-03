view: person_pdt {

#   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT carrier as carrier
  ,origin as origin
  ,destination as destination
  ,flight_num as flight_num
  ,tail_num as tail_num
  ,dep_time as dep_time
  ,arr_time as arr_time
  ,cancelled as cancelled
  ,count(*) as count_filgths
       FROM demo_db.flights
      WHERE origin = "ATL"
      GROUP BY carrier
  ,origin
  ,destination
  ,flight_num
  ,tail_num
  ,dep_time
  ,arr_time
  ,cancelled;;

  datagroup_trigger: testing_pdt
    indexes: ["tail_num"]
  }
#
#   # Define your dimensions and measures here, like this:
   dimension: id {
#     description: "Unique ID for each user that has ordered"
     type: string
 #   primary_key: yes
     sql: ${TABLE}.flight_num ;;
   }
#
   dimension: carrier {
#     description: "The total number of orders for each user"
     type: string
     sql: ${TABLE}.carrier ;;
   }
#
  dimension: destination {
#     description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: flight_num {
#     description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.flight_num ;;
  }

   dimension_group: dep_time {
#     description: "The date when each user last ordered"
     type: time
     timeframes: [date, week, month, year]
     sql: ${TABLE}.dep_time ;;
   }
#
   measure: total_filgths {
#     description: "Use this for counting lifetime orders across many users"
     type: sum
     sql: ${TABLE}.count_filgths;;
   }

 }
