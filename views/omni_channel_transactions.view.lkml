view: omni_channel_transactions {
  sql_table_name: `Looker_Demo_retail.omni_channel_transactions`
    ;;

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_date ;;
  }

  dimension: fulfillment_channel {
    type: string
    sql: ${TABLE}.fulfillment_channel ;;
  }

  dimension: offer_type {
    type: string
    sql: ${TABLE}.offer_type ;;
  }

  dimension: purchase_channel {
    type: string
    sql: ${TABLE}.purchase_channel ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_date ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_date ;;
  }

  dimension: store_latitude {
    type: number
    sql: ${TABLE}.store_latitude ;;
  }

  dimension: store_longitude {
    type: number
    sql: ${TABLE}.store_longitude ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }

  dimension: store_sq_ft {
    type: number
    sql: ${TABLE}.Store_sq_ft ;;
  }

  dimension: store_state {
    type: string
    sql: ${TABLE}.store_state ;;
  }

  dimension_group: transaction {
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
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_details {
    hidden: yes
    sql: ${TABLE}.transaction_details ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    drill_fields: [store_name, customers.last_name, customers.id, customers.first_name]
  }
}

view: omni_channel_transactions__transaction_details {
  dimension: gross_margin {
    type: number
    sql: gross_margin ;;
  }

  dimension: omni_channel_transactions__transaction_details {
    type: string
    hidden: yes
    sql: omni_channel_transactions__transaction_details ;;
  }

  dimension: product_area {
    type: string
    sql: product_area ;;
  }

  dimension: product_brand {
    type: string
    sql: product_brand ;;
  }

  dimension: product_category {
    type: string
    sql: product_category ;;
  }

  dimension: product_department {
    type: string
    sql: product_department ;;
  }

  dimension: product_name {
    type: string
    sql: product_name ;;
  }

  dimension: product_sku {
    type: string
    sql: product_sku ;;
  }

  dimension: sale_price {
    type: number
    sql: sale_price ;;
  }
}
