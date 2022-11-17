view: transaction_detail {
  sql_table_name: `Looker_Demo_retail.transaction_detail`
    ;;

  dimension: channel_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.channel_id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: line_items {
    hidden: yes
    sql: ${TABLE}.line_items ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension_group: transaction_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.transaction_timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [customers.last_name, customers.id, customers.first_name, channels.id, channels.name]
  }
}

view: transaction_detail__line_items {
  dimension: gross_margin {
    type: number
    sql: gross_margin ;;
  }

  dimension: product_id {
    type: number
    sql: product_id ;;
  }

  dimension: sale_price {
    type: number
    sql: sale_price ;;
  }

  dimension: transaction_detail__line_items {
    type: string
    hidden: yes
    sql: transaction_detail__line_items ;;
  }
}
