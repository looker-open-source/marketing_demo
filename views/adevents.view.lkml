view: adevents {
  view_label: "Ad Events"
  sql_table_name: ecomm.ad_events ;;

  dimension: adevent_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: keyword_id {
    type: number
    sql: ${TABLE}.keyword_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      hour_of_day,
      day_of_week,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  filter: previous_period_filter {
    type: date
    description: "Use this filter for period analysis"
  }

  dimension: previous_period
  {
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE
        WHEN {% date_start previous_period_filter %} is [not] null AND {% date_end previous_period_filter %} is [not] null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_raw} >=  {% date_start previous_period_filter %}
                AND ${created_raw}  <= {% date_end previous_period_filter %}
                THEN 'This Period'
              WHEN ${created_raw}  >= DATEADD(day,-1*DATEDIFF('day',{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ) + 1, DATEADD(day,-1,{% date_start previous_period_filter %} ) )
                AND ${created_raw}  <= DATEADD(day,-1,{% date_start previous_period_filter %} )
                THEN 'Previous Period'
            END
          END ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: is_click_event {
    type: yesno
    sql: ${event_type} = 'click';;
  }
  dimension: is_impression_event {
    type: yesno
    sql: ${event_type} = 'impression';;
  }

  dimension: cost_search{
    hidden: yes
    type: number
    sql: case when ${is_click_event} = true
        and ${campaigns.advertising_channel} = 'Search' then (1.0*${TABLE}.amount)/100 end ;;
    value_format_name: usd
  }

  dimension: cost_display{
    hidden: yes
    type: number
    sql: case when ${is_impression_event} = true
      and ${campaigns.advertising_channel} != 'Search'
      then (1.0*${TABLE}.amount)/1000 end ;;
    value_format_name: usd
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${cost_search} + ${cost_display} ;;
    value_format_name: usd
  }

##### Campaign Standard Metric Aggregates #####

  measure: total_cost_clicks {
    hidden: yes
    label: "Total Spend (Search Clicks)"
    type: sum
    sql: ${cost_search} ;;
    value_format_name: usd
  }

  measure: total_cost_impressions {
    hidden: yes
    label: "Total Spend (Display Impressions)"
    type: sum
    sql: ${cost_display} ;;
    value_format_name: usd
  }

  measure: total_cost {
    label: "Total Spend"
    type: number
    sql: ${total_cost_clicks} + ${total_cost_impressions} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: total_cumulative_spend {
    label: "Total Spend (Cumulative)"
    type: running_total
    sql: ${total_cost_clicks} ;;
    value_format_name: usd_0
    drill_fields: [campaign_detail*]

  }
##### Ad Event Metrics #####

  measure: total_ad_events {
    type: count
    drill_fields: [events.id, keywords.criterion_name, keywords.keyword_id]
  }

  measure: total_clicks {
    type: sum
    sql: case when ${event_type} = 'click' then 1 else 0 end;;
    drill_fields: [detail*]
  }

  measure: total_impressions {
    type: sum
    sql: case when ${event_type} = 'impression' then 1 else 0 end;;
    drill_fields: [detail*]
  }

##### Viewability & Conversion Metrics #####

  measure: total_viewability {
    type: number
    sql: ${total_impressions} * .66 ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

  }

  measure: click_rate {
    label: "Click Through Rate (CTR)"
    description: "Percent of people that click on an ad."
    type: number
    sql: ${total_clicks}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
    drill_fields: [detail*]

  }

  measure: cost_per_click {
    label: "Cost per Click (CPC)"
    description: "Average cost per ad click."
    type: number
    sql: ${total_cost_clicks}* 1.0/ NULLIF(${total_clicks},0) ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: cost_per_impression {
    label: "Cost per Thousand Impressions (CPM)"
    description: "Average cost per one thousand ad impressions for display ads."
    type: number
    sql: ${total_cost_impressions}* 1.0/ NULLIF(1.0*${total_impressions}/1000,0) ;;
    value_format: "$0.000"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [campaigns.campaign_name, keywords.criterion_name, device_type, event_type, total_cost]

  }
  set: campaign_detail {
    fields: [campaigns.campaign_name, adgroups.name, adgroups.ad_type, total_cost]
  }
}
