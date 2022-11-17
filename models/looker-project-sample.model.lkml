connection: "looker-sample-connection"

# include all the views
include: "/views/**/*.view"

datagroup: looker-project-sample_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker-project-sample_default_datagroup

explore: omni_channel_transactions {
  join: customers {
    type: left_outer
    sql_on: ${omni_channel_transactions.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: omni_channel_transactions__transaction_details {
    view_label: "Omni Channel Transactions: Transaction Details"
    sql: LEFT JOIN UNNEST(${omni_channel_transactions.transaction_details}) as omni_channel_transactions__transaction_details ;;
    relationship: one_to_many
  }
}

explore: customers {}

explore: omni_channel_support_calls {
  join: omni_channel_support_calls__messages {
    view_label: "Omni Channel Support Calls: Messages"
    sql: LEFT JOIN UNNEST(${omni_channel_support_calls.messages}) as omni_channel_support_calls__messages ;;
    relationship: one_to_many
  }
}

explore: channels {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: category_lookup {}

explore: omni_channel_events {
  join: customers {
    type: left_outer
    sql_on: ${omni_channel_events.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: events {}

explore: products {}

explore: us_stores {}

explore: transaction_detail {
  join: customers {
    type: left_outer
    sql_on: ${transaction_detail.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: channels {
    type: left_outer
    sql_on: ${transaction_detail.channel_id} = ${channels.id} ;;
    relationship: many_to_one
  }

  join: transaction_detail__line_items {
    view_label: "Transaction Detail: Line Items"
    sql: LEFT JOIN UNNEST(${transaction_detail.line_items}) as transaction_detail__line_items ;;
    relationship: one_to_many
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}
