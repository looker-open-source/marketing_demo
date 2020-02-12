- dashboard: 360_marketing_overview
  title: 360 Marketing Overview
  layout: newspaper
  query_timezone: user_timezone
  description: 'Overview of several digital marketing campaign - including clicks, impressions, ROI'
  embed_style:
    background_color: ''
    show_title: false
    title_color: "#fffffF"
    show_filters_bar: false
    tile_text_color: "#ffffff"
    text_tile_text_color: "#ffffff"
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
      sessions.traffic_source: Adwords
      adevents.adevent_id: NOT NULL
    sorts: [sessions.session_start_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: adevents.total_cost, name: Total
              Spend, axisId: adevents.total_cost}, {id: session_purchase_facts.revenue,
            name: Revenue, axisId: session_purchase_facts.revenue}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', valueFormat: "$#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 11, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: [user_session_fact.average_engagement, user_session_fact.average_loyalty]
    legend_position: center
    colors: ["#87d79b", "#294988"]
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: []
    listen:
      User Gender: users.gender
    row: 8
    col: 0
    width: 16
    height: 7
  - title: First Touch -  Acquisition Referrer
    name: First Touch -  Acquisition Referrer
    model: thelook_adwords
    explore: events
    type: looker_pie
    fields: [user_session_fact.count, user_session_fact.site_acquisition_source]
    filters:
      user_session_fact.site_acquisition_source: "-NULL"
    sorts: [user_session_fact.site_acquisition_source]
    limit: 500
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    inner_radius: 50
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 25
    col: 0
    width: 6
    height: 6
  - title: Conversion by Acquisition Referrer
    name: Conversion by Acquisition Referrer
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [user_session_fact.site_acquisition_source, sessions.all_sessions, sessions.count_cart_or_later,
      sessions.count_purchase]
    filters:
      user_session_fact.site_acquisition_source: "-NULL"
    sorts: [sessions.all_sessions desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: []
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: [sessions.count_product_or_later]
    legend_position: center
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_types: {}
    point_style: none
    series_colors: {}
    series_labels:
      sessions.all_sessions: Visits
      sessions.count_browse_or_later: Browse Visits
      sessions.count_cart_or_later: Add to Cart Visits
      sessions.count_purchase: Purchases
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    hidden_fields: []
    listen: {}
    row: 31
    col: 6
    width: 18
    height: 7
  - title: User Acquisition Trends
    name: User Acquisition Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [user_session_fact.first_visit_month, user_session_fact.count, user_session_fact.site_acquisition_source]
    pivots: [user_session_fact.site_acquisition_source]
    filters:
      user_session_fact.first_visit_month: 12 months ago for 12 months
    sorts: [user_session_fact.first_visit_month desc, user_session_fact.site_acquisition_source]
    limit: 500
    column_limit: 50
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    series_types: {}
    inner_radius: 50
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 25
    col: 12
    width: 12
    height: 6
  - title: Repeat Visits
    name: Repeat Visits
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [sessions.session_rank, user_session_fact.count]
    filters:
      sessions.session_rank: "<11"
      user_session_fact.first_visit_date: 12 months ago for 12 months
    sorts: [sessions.session_rank]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: return_rate, label: Return rate, expression: "${user_session_fact.count}/index(${user_session_fact.count},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: Retention, orientation: left, series: [{axisId: return_rate,
            id: return_rate, name: Return rate}], showLabels: false, showValues: true,
        maxValue: !!null '', minValue: !!null '', valueFormat: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Visit Number
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [user_acquisition.count, user_session_fact.count]
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 31
    col: 0
    width: 6
    height: 7
  - title: Customer LTV
    name: Customer LTV
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [sessions.months_since_first_session, session_purchase_facts.revenue,
      user_session_fact.site_acquisition_source, user_session_fact.count]
    pivots: [user_session_fact.site_acquisition_source]
    filters:
      sessions.months_since_first_session: "[0, 18]"
    sorts: [sessions.months_since_first_session, user_session_fact.site_acquisition_source]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: salesuser, label: Sales/User, expression: "${session_purchase_facts.revenue}/index(${user_session_fact.count},\
          \ 1)", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}, {table_calculation: cumulative_salesuser, label: Cumulative
          Sales/User, expression: 'running_total(${salesuser})', value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Lifetime Sales/User, maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: Adwords, name: Adwords, axisId: cumulative_salesuser}, {id: Email,
            name: Email, axisId: cumulative_salesuser}, {id: Facebook, name: Facebook,
            axisId: cumulative_salesuser}, {id: Organic, name: Organic, axisId: cumulative_salesuser},
          {id: YouTube, name: YouTube, axisId: cumulative_salesuser}]}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Months since acquisition
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [session_purchase_facts.total_sale_price, user_acquisition.count,
      salesuser, session_purchase_facts.revenue, user_session_fact.count]
    listen: {}
    row: 18
    col: 12
    width: 12
    height: 7
  - title: Total Spend
    name: Total Spend
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [adevents.total_cost, adevents.created_quarter]
    fill_fields: [adevents.created_quarter]
    filters:
      adevents.created_quarter: 3 quarters ago for 3 quarters
    sorts: [adevents.created_quarter desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_month, label: Prior Month, expression: "${adevents.total_cost}/offset(${adevents.total_cost},\
          \ 1)-1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    comparison_label: Prior Quarter
    single_value_title: Total Spend
    value_format: "$#,##0"
    y_axes: []
    listen: {}
    row: 4
    col: 8
    width: 4
    height: 4
  - title: Revenue
    name: Revenue
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [session_attribution.total_attribution, sessions.session_start_quarter]
    fill_fields: [sessions.session_start_quarter]
    filters:
      session_attribution.attribution_source: Adwords
      sessions.session_start_quarter: 3 quarters ago for 3 quarters
    sorts: [sessions.session_start_quarter desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_period, label: Prior Period, expression: "${session_attribution.total_attribution}/offset(${session_attribution.total_attribution},1)-1",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Adwords Revenue
    value_format: "$#,##0"
    comparison_label: Prior Quarter
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Attribution Source: session_attribution.attribution_filter
    row: 4
    col: 0
    width: 4
    height: 4
  - title: Purchases
    name: Purchases
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [sessions.count_with_purchase, session_attribution.last_session_end_quarter]
    fill_fields: [session_attribution.last_session_end_quarter]
    filters:
      session_attribution.attribution_source: Adwords
      session_attribution.last_session_end_month: 2 quarters ago for 2 quarters
    sorts: [session_attribution.last_session_end_quarter desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_period, label: Prior Period, expression: "${sessions.count_with_purchase}/offset(${sessions.count_with_purchase},1)-1",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Purchases
    comparison_label: Prior Quarter
    hidden_fields: []
    y_axes: []
    listen:
      Attribution Source: session_attribution.attribution_filter
    row: 4
    col: 12
    width: 4
    height: 4
  - title: Users Acquired
    name: Users Acquired
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [user_session_fact.count, user_session_fact.first_visit_quarter]
    fill_fields: [user_session_fact.first_visit_quarter]
    filters:
      session_attribution.attribution_source: Adwords
      user_session_fact.first_visit_quarter: 2 quarters ago for 2 quarters
    sorts: [user_session_fact.first_visit_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: prior_period, label: Prior Period, expression: "${user_session_fact.count}/offset(\
          \ ${user_session_fact.count},1)-1", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Users Acquired
    value_format: "###,###"
    comparison_label: Prior Quarter
    hidden_fields: []
    y_axes: []
    listen:
      Attribution Source: session_attribution.attribution_filter
    row: 4
    col: 4
    width: 4
    height: 4
  - title: Last Touch Conversion Referrer
    name: Last Touch Conversion Referrer
    model: thelook_adwords
    explore: sessions
    type: looker_pie
    fields: [session_attribution.attribution_source, session_attribution.total_attribution]
    filters:
      session_attribution.attribution_filter: Last Touch
      session_attribution.attribution_source: "-NULL"
    sorts: [session_attribution.attribution_source]
    limit: 500
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    inner_radius: 50
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 25
    col: 6
    width: 6
    height: 6
  - name: "<span class='fa fa-dollar'> Revenue Attribution</span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Revenue Attribution</span>"
    subtitle_text: How much are we spending and making from our campaigns?
    body_text: "**Recommended Action** Drill deeper into our campaigns with the highest\
      \ spend to make any necessary adjustments"
    row: 0
    col: 0
    width: 24
    height: 4
  - title: First Touch to Last Touch Analysis
    name: First Touch to Last Touch Analysis
    model: thelook_adwords
    explore: events
    type: sankey2
    fields: [user_session_fact.site_acquisition_source, sessions.traffic_source, session_purchase_facts.revenue]
    filters:
      user_session_fact.site_acquisition_source: "-NULL"
    sorts: [session_purchase_facts.revenue desc]
    limit: 500
    column_limit: 50
    color_range: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 18
    col: 0
    width: 12
    height: 7
  - name: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    subtitle_text: Where are our customers coming from and when do they drop off?
    row: 15
    col: 0
    width: 24
    height: 3
  - title: ROI by Channel
    name: ROI by Channel
    model: thelook_adwords
    explore: sessions
    type: looker_pie
    fields: [session_attribution.attribution_source, session_attribution.total_attribution]
    filters:
      session_attribution.attribution_filter: Last Touch
      session_attribution.attribution_source: "-NULL"
    sorts: [session_attribution.total_attribution desc, session_attribution.attribution_source]
    limit: 500
    column_limit: 50
    query_timezone: user_timezone
    value_labels: legend
    label_type: labPer
    colors: ["#294988", "#87d79b", "#476d70", "#bababa", "#294259", "#747474"]
    series_colors:
      Organic: "#bababa"
      Adwords: "#294988"
      Facebook: "#476d70"
      Email: "#87d79b"
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: Revenue, orientation: bottom, series: [{axisId: Adwords - session_attribution.total_attribution,
            id: Adwords - session_attribution.total_attribution, name: Adwords}, {
            axisId: Email - session_attribution.total_attribution, id: Email - session_attribution.total_attribution,
            name: Email}, {axisId: Facebook - session_attribution.total_attribution,
            id: Facebook - session_attribution.total_attribution, name: Facebook},
          {axisId: Organic - session_attribution.total_attribution, id: Organic -
              session_attribution.total_attribution, name: Organic}, {axisId: YouTube
              - session_attribution.total_attribution, id: YouTube - session_attribution.total_attribution,
            name: YouTube}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    label_value_format: '[>=1000000000]$#,##0.0,,," B";[>=1000000]$#0.0,," M";$#0.0,"
      K"'
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen: {}
    row: 4
    col: 16
    width: 8
    height: 4
  - title: Highest Spending Campaigns
    name: Highest Spending Campaigns
    model: thelook_adwords
    explore: sessions
    type: looker_grid
    fields: [campaigns.campaign_name, adevents.total_cost, session_attribution.ROI,
      session_attribution.total_attribution]
    filters:
      adevents.created_quarter: 2019-Q4
    sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
    limit: 10
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    series_labels:
      session_attribution.total_attribution: Revenue
    series_column_widths:
      campaigns.campaign_name: 237
      adevents.total_cost: 113
      session_attribution.ROI: 118
    series_cell_visualizations:
      adevents.total_cost:
        is_active: false
      session_attribution.ROI:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#ff1225",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [session_attribution.ROI]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_value_format:
      session_attribution.ROI:
        name: percent_0
        format_string: "#,##0%"
        label: Percent (0)
    series_types: {}
    listen: {}
    row: 8
    col: 16
    width: 8
    height: 7
  filters:
  - name: Attribution Source
    title: Attribution Source
    type: field_filter
    default_value: Last Touch
    allow_multiple_values: true
    required: false
    model: thelook_adwords
    explore: sessions
    listens_to_filters: []
    field: session_attribution.attribution_filter
  - name: User Gender
    title: User Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: users.gender
  - name: Acquisition Date
    title: Acquisition Date
    type: date_filter
    default_value: 12 months ago for 12 months
    allow_multiple_values: true
    required: false
