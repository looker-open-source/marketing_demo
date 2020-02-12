label: "3) Digital Marketing"

connection: "snowflake"

include: "*/*.view.lkml"         # include all views in this project
include: "dashboards/*.dashboard.lookml"  # include all dashboards in this project


datagroup: ecommerce_etl {
  sql_trigger: SELECT max(completed_at) FROM ecomm.etl_jobs ;;
  max_cache_age: "24 hours"}
persist_with: ecommerce_etl

explore: events{
  label:  "(1) Digital Ads - Event Data"
  join: sessions {
    relationship: many_to_one
    sql_on: ${events.session_id} = ${sessions.session_id} ;;
  }
  join: users {
    view_label: "Users"
    relationship: many_to_one
    sql_on: ${sessions.session_user_id} = ${users.id} ;;
    fields: [user_facts*]
  }
  join: user_session_fact {
    view_label: "Users"
    relationship: one_to_one
    sql_on: ${users.id} = ${user_session_fact.session_user_id} ;;
  }

  join: session_purchase_facts {
    relationship: many_to_one
    sql_on: ${sessions.session_user_id} = ${session_purchase_facts.session_user_id}
          and ${sessions.session_start_raw} >= ${session_purchase_facts.last_session_end_raw}
          and ${sessions.session_end_raw} <= ${session_purchase_facts.session_end_raw};;
  }

  join: adevents {
    relationship: one_to_many
    sql_on: ${events.ad_event_id} = ${adevents.adevent_id}
      and ${events.referrer_code} = ${adevents.keyword_id}
      and ${events.is_entry_event}
      ;;
  }
  join: keywords {
    relationship: many_to_one
    sql_on:${keywords.keyword_id} = ${adevents.keyword_id} ;;
  }
  join: adgroups{
    relationship: many_to_one
    sql_on: ${keywords.ad_id} = ${adgroups.ad_id} ;;
  }
  join: campaigns {
    relationship: many_to_one
    sql_on: ${campaigns.campaign_id} = ${adgroups.campaign_id} ;;
    type: full_outer
  }
}



explore: sessions{
  fields: [ALL_FIELDS*, -sessions.funnel_view*]
  label: "(2) Marketing Attribution"
  join: adevents {
    relationship: many_to_one
    sql_on: ${adevents.adevent_id} = ${sessions.ad_event_id} ;;
  }
  join: users {
    view_label: "Users"
    relationship: many_to_one
    sql_on: ${sessions.session_user_id} = ${users.id} ;;
    fields: [user_facts*]
  }
  join: user_session_fact {
    view_label: "Users"
    relationship: one_to_one
    sql_on: ${users.id} = ${user_session_fact.session_user_id} ;;
#     fields: [user_session_measures*] -- ZL: commenting out so I can use first and last touch attribution sources as regular dimensions
  }

  join: session_attribution {
    relationship: many_to_one
    sql_on: ${sessions.session_user_id} = ${session_attribution.session_user_id}
          and ${sessions.session_start_raw} >= ${session_attribution.last_session_end_raw}
          and ${sessions.session_end_raw} <= ${session_attribution.session_end_raw};;
    fields: [attribution_detail*]
  }
  join: keywords {
    relationship: many_to_one
    sql_on:${keywords.keyword_id} = ${adevents.keyword_id} ;;
  }
  join: adgroups{
    relationship: many_to_one
    sql_on: ${keywords.ad_id} = ${adgroups.ad_id} ;;
  }
  join: campaigns {
    relationship: many_to_one
    sql_on: ${campaigns.campaign_id} = ${adgroups.campaign_id} ;;
  }

  ## Removing preferred category in favor of version based directly off of referral source
#   join: user_purchase_facts {
#     view_label: "Users"
#     relationship: one_to_one
#     sql_on: ${events.user_id} = ${user_purchase_facts.user_id} ;;
#   }

#   join: adevents {
#     relationship: one_to_many
#     sql_on: ${events.ad_event_id} = ${adevents.adevent_id}
#       and ${events.referrer_code} = ${adevents.keyword_id}
#       and ${events.is_entry_event}
#       ;;
#   }
}
