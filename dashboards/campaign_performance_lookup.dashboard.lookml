- dashboard: campaign_performance
  title: Campaign Performance
  layout: newspaper
  query_timezone: user_timezone
  description: 'Drill down dashboards for campaign performance lookup'
  embed_style:
    background_color: "#ffffff"
    show_title: true
    title_color: "#f94000"
    show_filters_bar: false
    tile_text_color: "#0b91e6"
    text_tile_text_color: "#0b91e6"
  elements:
  - title: Total Clicks
    name: Total Clicks
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [adevents.total_clicks, adevents.click_rate]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
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
    single_value_title: Clicks
    comparison_label: "(CTR)"
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 4
    col: 4
    width: 4
    height: 4
  - title: Total Impressions
    name: Total Impressions
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [adevents.total_impressions]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: false
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
    single_value_title: Impressions
    comparison_label: Weekly Change
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 4
    col: 0
    width: 4
    height: 4
  - title: Total Cost
    name: Total Cost
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [adevents.total_cost]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
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
    single_value_title: Total Cost
    comparison_label: Associated Revenue
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 4
    col: 8
    width: 4
    height: 4
  - title: Associated Revenue
    name: Associated Revenue
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [session_purchase_facts.revenue]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: false
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
    single_value_title: Associated Revenue
    comparison_label: Campaign End Date
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 4
    col: 12
    width: 4
    height: 4
  - title: Clicks by Date
    name: Clicks by Date
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [adevents.created_date, adevents.click_rate, adevents.total_clicks]
    fill_fields: [adevents.created_date]
    filters:
      campaigns.advertising_channel: "-NULL"
    sorts: [adevents.created_date]
    limit: 500
    column_limit: 50
    stacking: ''
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
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    ordering: none
    show_null_labels: false
    hidden_fields: []
    series_types:
      adevents.total_clicks: column
    y_axes: [{label: !!null '', maxValue: 0.5, minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: adevents.click_rate,
            name: Click Through Rate (CTR), axisId: adevents.click_rate}]}, {label: !!null '',
        orientation: right, series: [{id: adevents.total_clicks, name: Total Clicks,
            axisId: adevents.total_clicks}], showLabels: true, showValues: false,
        maxValue: !!null '', minValue: !!null '', valueFormat: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    colors: ["#87d79b", "#294988", "#476d70", "#294259", "#747474"]
    series_colors: {}
    listen:
      Campaign Name: campaigns.campaign_name
    row: 8
    col: 16
    width: 8
    height: 7
  - title: Top Performing Keywords
    name: Top Performing Keywords
    model: thelook_adwords
    explore: events
    type: table
    fields: [keywords.criterion_name, adevents.total_clicks, adevents.total_impressions,
      adevents.click_rate, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      keywords.criterion_name: "-NULL"
    sorts: [session_purchase_facts.revenue desc]
    limit: 100
    column_limit: 50
    dynamic_fields: [{table_calculation: profit, label: Profit, expression: "${session_purchase_facts.revenue}-${adevents.total_cost}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Custom, colors: ["#ffffff", "#87d79b"]},
        bold: false, italic: false, strikethrough: false, fields: [adevents.total_cost]},
      {type: low to high, value: !!null '', background_color: !!null '', font_color: !!null '',
        palette: {name: Custom, colors: ["#ffffff", "#87d79b"]}, bold: false, italic: false,
        strikethrough: false, fields: [session_purchase_facts.revenue]}, {type: low
          to high, value: !!null '', background_color: !!null '', font_color: !!null '',
        palette: {name: Custom, colors: ["#ffffff", "#87d79b"]}, bold: false, italic: false,
        strikethrough: false, fields: [profit]}, {type: low to high, value: !!null '',
        background_color: !!null '', font_color: !!null '', palette: {name: Custom,
          colors: ["#ffffff", "#FFFFFF", "#87d79b"]}, bold: false, italic: false,
        strikethrough: false, fields: [adevents.click_rate]}]
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 15
    col: 12
    width: 12
    height: 10
  - title: Keyword Spend vs Revenue
    name: Keyword Spend vs Revenue
    model: thelook_adwords
    explore: events
    type: looker_scatter
    fields: [keywords.keyword_id, session_purchase_facts.revenue, adevents.total_cost]
    filters:
      campaigns.campaign_id: NOT NULL
      events.traffic_source: Adwords
    sorts: [adevents.total_cost desc]
    limit: 500
    column_limit: 50
    stacking: ''
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
    point_style: circle
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [keywords.keyword_id]
    y_axes: [{label: Attribution (USD), maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: custom,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: session_purchase_facts.total_attribution, name: Sessions Total
              Attribution, axisId: session_purchase_facts.total_attribution}]}]
    x_axis_label: Keyword Spend ($)
    swap_axes: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    colors: ["#673AB7", "#3F51B5", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50",
      "#8BC34A", "#d1e03a", "#FFEB3B", "#9E9E9E", "#607D8B"]
    series_colors:
      session_purchase_facts.revenue: "#294988"
    reference_lines: []
    trend_lines: [{color: "#999292", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: string, label: Trend}]
    listen:
      Campaign Name: campaigns.campaign_name
    row: 25
    col: 0
    width: 12
    height: 11
  - title: Keyword Profitability
    name: Keyword Profitability
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [keywords.criterion_name, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      keywords.criterion_name: "-NULL"
      adevents.total_cost: ">0"
    sorts: [adevents.total_cost desc]
    limit: 100
    column_limit: 50
    dynamic_fields: [{table_calculation: profit, label: Profit, expression: "${session_purchase_facts.revenue}-${adevents.total_cost}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    stacking: percent
    show_value_labels: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#949393"
    colors: ["#87d79b", "#294988", "#476d70", "#294259", "#747474"]
    series_colors: {}
    x_axis_label: Keyword Name
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: adevents.total_cost_clicks,
            name: Cost, axisId: adevents.total_cost_clicks}, {id: session_purchase_facts.total_attribution,
            name: Attribution, axisId: session_purchase_facts.total_attribution}]}]
    series_types:
      adevents.total_cost_clicks: line
      session_purchase_facts.total_attribution: line
    series_labels:
      adevents.total_cost_clicks: Cost
      session_purchase_facts.total_attribution: Attribution
      adevents.total_cost: Total Spend
    hidden_series: []
    hidden_fields: [profit]
    listen:
      Campaign Name: campaigns.campaign_name
    row: 15
    col: 0
    width: 12
    height: 10
  - title: CTR By Time of Day
    name: CTR By Time of Day
    model: thelook_adwords
    explore: events
    type: table
    fields: [adevents.click_rate, adevents.created_hour_of_day, adevents.created_day_of_week]
    pivots: [adevents.created_day_of_week]
    filters:
      adevents.created_day_of_week: ''
      adevents.created_hour_of_day: NOT NULL
    sorts: [adevents.created_day_of_week 0, adevents.created_hour_of_day]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Custom, colors: ["#FFFFFF", "#87d79b"]},
        bold: false, italic: false, strikethrough: false, fields: [adevents.click_rate]}]
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 25
    col: 12
    width: 12
    height: 11
  - name: "<span class='fa fa-dollar'>Campaign Performance</span>"
    type: text
    title_text: "<span class='fa fa-dollar'>Campaign Performance</span>"
    subtitle_text: How is this campaign doing?
    body_text: "**Recommended Action** If a campaign is not performing as expected,\
      \ pause the campaign on Adwords and investigate different triggers to pull on\
      \ the Google Advertising Page"
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Campaign Benchmark
    name: Campaign Benchmark
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [sessions.weeks_since_campaing_start, campaigns.count, campaigns.campaign_benchmark,
      session_purchase_facts.revenue]
    pivots: [campaigns.campaign_benchmark]
    filters:
      sessions.weeks_since_campaing_start: "[0, 12]"
    sorts: [campaigns.campaign_benchmark 0, sessions.weeks_since_campaing_start]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: campaign_revenue, label: Campaign Revenue,
        expression: "${session_purchase_facts.revenue}/${campaigns.count}", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}, {table_calculation: rolling_attribution,
        label: Rolling Attribution, expression: 'if(is_null(${session_purchase_facts.revenue}),null,running_total(${session_purchase_facts.revenue}/${campaigns.count}))',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    stacking: ''
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
    x_axis_scale: linear
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: false
    point_style: circle_outline
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: 681 - NA - Search - Competition,
            name: 681 - NA - Search - Competition, axisId: session_purchase_facts.return_on_investment},
          {id: Benchmark, name: Benchmark, axisId: session_purchase_facts.return_on_investment}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        type: linear}]
    hidden_fields: [session_purchase_facts.total_attribution, campaigns.count, calculation_1,
      campaign_revenue, session_purchase_facts.revenue]
    x_axis_label: Weeks Since Start
    colors: ["#87d79b", "#294988"]
    series_colors: {}
    listen:
      Campaign Name: campaigns.campaign_selector
    row: 8
    col: 0
    width: 10
    height: 7
  - title: ROI
    name: ROI
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [session_purchase_facts.ROI]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: false
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
    single_value_title: ROI
    comparison_label: Campaign End Date
    hidden_fields: []
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 4
    col: 16
    width: 4
    height: 4
  - title: End Date
    name: End Date
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [campaigns.end_date, campaigns.is_active_now]
    filters:
      campaigns.end_date: NOT NULL
    sorts: [campaigns.end_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: is_active, label: Is Active, expression: 'if(${campaigns.is_active_now},
          "Is Active", "Not Active")', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
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
    comparison_label: ''
    hidden_fields: [campaigns.is_active_now]
    single_value_title: End Date
    value_format: ''
    y_axes: []
    listen:
      Campaign Name: campaigns.campaign_name
    row: 4
    col: 20
    width: 4
    height: 4
  - title: Spend Benchmark
    name: Spend Benchmark
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [sessions.weeks_since_campaing_start, campaigns.count, adevents.total_cost,
      campaigns.campaign_benchmark]
    pivots: [campaigns.campaign_benchmark]
    filters:
      sessions.weeks_since_campaing_start: "[0, 12]"
    sorts: [campaigns.campaign_benchmark 0, sessions.weeks_since_campaing_start]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: campaign_spend, label: Campaign Spend, expression: "${adevents.total_cost}/${campaigns.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: rolling_spend, label: Rolling Spend,
        expression: 'if(is_null(${adevents.total_cost}),null,running_total(${adevents.total_cost}/${campaigns.count}))',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    stacking: ''
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
    x_axis_scale: linear
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: false
    point_style: circle_outline
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: 681 - NA - Search - Competition,
            name: 681 - NA - Search - Competition, axisId: session_purchase_facts.return_on_investment},
          {id: Benchmark, name: Benchmark, axisId: session_purchase_facts.return_on_investment}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        type: linear}]
    hidden_fields: [campaigns.count, calculation_1, campaign_revenue, campaign_spend,
      adevents.total_cost]
    x_axis_label: Weeks Since Start
    series_colors: {}
    colors: ["#87d79b", "#294988"]
    listen:
      Campaign Name: campaigns.campaign_selector
    row: 8
    col: 10
    width: 6
    height: 7
  filters:
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: campaigns.campaign_name
