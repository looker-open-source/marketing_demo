view: keywords {
  sql_table_name: ecomm.keywords ;;

  dimension: keyword_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.KEYWORD_ID ;;
  }

  dimension: ad_id {
    type: number
    sql: ${TABLE}.AD_ID ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BIDDING_STRATEGY_TYPE ;;
  }

  dimension: cpc_bid_amount {
    label: "CPC Bid (USD)"
    type: number
    sql:( ${TABLE}.CPC_BID_AMOUNT * 1.0 )/100.0 ;;
    value_format_name: usd
  }

  dimension_group: created {
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
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: criterion_name {
    type: string
    sql: ${TABLE}.CRITERION_NAME ;;
    link: {
      icon_url: "https://www.google.com/images/branding/product/ico/googleg_lodp.ico"
      label: "Google Search"
      url: "https://www.google.com/search?q={{ value | encode_uri}}"
    }
    link: {
      label: "View on AdWords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/adgroups?campaignId={{ criterion_name._value | encode_uri }}"
    }
    link: {
      label: "Pause Keyword"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?keywordId={{ criterion_name._value | encode_uri }}"
    }
  }

  dimension: keyword_match_type {
    type: string
    sql: ${TABLE}.KEYWORD_MATCH_TYPE ;;
  }

  dimension: period {
    type: number
    sql: ${TABLE}.PERIOD ;;
  }

  dimension: quality_score {
    type: number
    sql: ${TABLE}.QUALITY_SCORE ;;
  }

  dimension: system_serving_status {
    type: string
    sql: ${TABLE}.SYSTEM_SERVING_STATUS ;;
  }

  measure: count {
    type: count
    drill_fields: [keyword_id, criterion_name, adevents.count]
  }
}
