view: omni_channel_support_calls {
  sql_table_name: `Looker_Demo_retail.omni_channel_support_calls`
    ;;

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: conversation_end {
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
    sql: ${TABLE}.conversation_end_at ;;
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}.conversation_id ;;
  }

  dimension_group: conversation_start {
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
    sql: ${TABLE}.conversation_start_at ;;
  }

  dimension: messages {
    hidden: yes
    sql: ${TABLE}.messages ;;
  }

  dimension: resolved_on_call {
    type: string
    sql: ${TABLE}.resolved_on_call ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: omni_channel_support_calls__messages {
  drill_fields: [message_id]

  dimension: message_id {
    primary_key: yes
    type: string
    sql: message_id ;;
  }

  dimension: answer_end {
    type: number
    sql: answer_end ;;
  }

  dimension: answer_start {
    type: number
    sql: answer_start ;;
  }

  dimension: intent_id {
    type: string
    sql: intent_id ;;
  }

  dimension: issue_subtopic {
    type: string
    sql: issue_subtopic ;;
  }

  dimension: issue_topic {
    type: string
    sql: issue_topic ;;
  }

  dimension: live_agent_speaking {
    type: yesno
    sql: live_agent_speaking ;;
  }

  dimension: omni_channel_support_calls__messages {
    type: string
    hidden: yes
    sql: omni_channel_support_calls__messages ;;
  }

  dimension: response {
    type: string
    sql: response ;;
  }

  dimension: row {
    type: number
    sql: row ;;
  }

  dimension: sentiment {
    type: number
    sql: sentiment ;;
  }

  dimension: user_end {
    type: number
    sql: user_end ;;
  }

  dimension: user_question {
    type: string
    sql: user_question ;;
  }

  dimension: user_start {
    type: number
    sql: user_start ;;
  }
}
