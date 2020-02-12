- dashboard: advertising_pulse
  title: Advertising Pulse
  layout: newspaper
  query_timezone: user_timezone
  description: 'Display vs search, and things like timeline, revenue and cost goals'
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Total Clicks by Channel
    name: Total Clicks by Channel
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [adevents.total_clicks, campaigns.advertising_channel, adevents.created_date]
    pivots: [campaigns.advertising_channel]
    fill_fields: [adevents.created_date]
    filters:
      campaigns.advertising_channel: "-NULL"
    sorts: [campaigns.advertising_channel, adevents.created_date desc]
    limit: 500
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: monotone
    query_timezone: America/Los_Angeles
    column_spacing_ratio:
    column_group_spacing_ratio:
    colors: ["#294988", "#87d79b", "#476d70", "#294259", "#747474"]
    series_colors: {}
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: events.event_date
    row: 9
    col: 12
    width: 12
    height: 7
  - title: Clicks Over Time
    name: Clicks Over Time
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [adevents.cost_per_click, adevents.total_clicks, adevents.created_date]
    fill_fields: [adevents.created_date]
    filters:
      adevents.created_week: 30 days ago for 30 days
    sorts: [adevents.created_date]
    limit: 500
    column_limit: 50
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    y_axes: [{label: CPC ($), maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: adevents.cost_per_click,
            name: CPC ($), axisId: adevents.cost_per_click}]}, {label: Clicks, maxValue: !!null '',
        minValue: !!null '', orientation: right, showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
        valueFormat: !!null '', series: [{id: adevents.total_clicks, name: Click,
            axisId: adevents.total_clicks}]}]
    series_types:
      adevents.total_clicks: column
    series_labels:
      adevents.cost_per_click: CPC ($)
      adevents.total_clicks: Click
    colors: ["#87d79b", "#294988", "#476d70", "#294259", "#747474"]
    series_colors: {}
    x_axis_datetime_label: "%b %d"
    hidden_fields: []
    listen: {}
    row: 9
    col: 0
    width: 12
    height: 7
  - title: Active Views
    name: Active Views
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [adevents.total_viewability, adevents.total_impressions, adevents.total_clicks,
      adevents.cost_per_impression, adevents.total_cost_impressions]
    filters:
      campaigns.advertising_channel: ''
    sorts: [adevents.total_clicks desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: type, label: Type, expression: '"Display"',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    hidden_fields: [adevents.cost_per_impression, adevents.total_clicks, adevents.total_cost_impressions]
    single_value_title: Active Views
    comparison_label: Impressions
    y_axes: []
    listen:
      Date: events.event_date
    row: 4
    col: 8
    width: 4
    height: 5
  - title: CPM
    name: CPM
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [adevents.total_viewability, adevents.total_impressions, adevents.total_clicks,
      adevents.cost_per_impression, adevents.total_cost_impressions]
    sorts: [adevents.total_clicks desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: type, label: Type, expression: '"Display"',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    hidden_fields: [adevents.total_clicks, adevents.total_cost_impressions, adevents.total_impressions,
      adevents.total_viewability]
    single_value_title: Cost Per Thousand (CPM)
    comparison_label: Impressions
    y_axes: []
    listen:
      Date: events.event_date
    row: 4
    col: 12
    width: 4
    height: 5
  - title: Cost Per Click
    name: Cost Per Click
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [campaigns.advertising_channel, adevents.total_viewability, adevents.total_impressions,
      adevents.total_clicks, adevents.total_cost_impressions, adevents.cost_per_click]
    filters:
      campaigns.advertising_channel: Search
    sorts: [adevents.total_clicks desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    hidden_fields: [adevents.total_clicks, adevents.total_cost_impressions, adevents.total_impressions,
      adevents.total_viewability]
    single_value_title: Cost Per Click
    comparison_label: Impressions
    y_axes: []
    listen:
      Date: events.event_date
    row: 4
    col: 4
    width: 4
    height: 5
  - title: Clicks
    name: Clicks
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [campaigns.advertising_channel, adevents.total_viewability, adevents.total_clicks,
      adevents.total_impressions, adevents.total_cost_impressions, adevents.cost_per_click]
    filters:
      campaigns.advertising_channel: Search
    sorts: [adevents.total_clicks desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#88a7a9"
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    hidden_fields: [adevents.total_cost_impressions, adevents.total_viewability, adevents.cost_per_click]
    single_value_title: Clicks
    comparison_label: Impressions
    y_axes: []
    listen:
      Date: adevents.created_date
    row: 4
    col: 0
    width: 4
    height: 5
  - title: Conversions
    name: Conversions
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [adevents.total_impressions, adevents.total_clicks, session_purchase_facts.total_purchases]
    filters:
      sessions.traffic_source: Adwords
    sorts: [adevents.total_impressions desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: adevents.total_impressions,
            name: Total Impressions, axisId: adevents.total_impressions}, {id: adevents.total_clicks,
            name: Total Clicks, axisId: adevents.total_clicks}, {id: session_purchase_facts.conversions_from_search,
            name: Conversions From Search, axisId: session_purchase_facts.conversions_from_search}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    colors: ["#54538f", "#88a7a9", "#605772", "#5b8ebe", "#7ec99a", "#5db794"]
    series_types: {}
    point_style: circle
    series_colors: {}
    series_labels:
      sessions.count_purchase: Conversions (Purchases)
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
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: ["#476d70", "#294988", "#87d79b", "#294259", "#747474"]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    show_null_points: true
    interpolation: linear
    labelScale: ".1"
    hidden_fields: []
    title_hidden: true
    listen:
      Date: adevents.created_date
    row: 4
    col: 16
    width: 8
    height: 5
  - title: Active Campaigns - Timeline
    name: Active Campaigns - Timeline
    model: thelook_adwords
    explore: events
    type: looker_timeline
    fields: [campaigns.campaign_name, campaigns.created_date, campaigns.end_date,
      session_purchase_facts.ROI]
    filters:
      campaigns.is_active_now: 'Yes'
      session_purchase_facts.ROI: NOT NULL
      session_purchase_facts.revenue: ">20"
    sorts: [campaigns.created_date]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    barColors: ["#87d79b", "#294988"]
    groupBars: true
    labelSize: 10pt
    showLegend: true
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    valueFormat: ''
    colors: ['palette: Looker Classic']
    series_colors: {}
    y_axes: []
    listen:
      Date: adevents.created_date
    row: 19
    col: 4
    width: 20
    height: 8
  - title: Revenue Target
    name: Revenue Target
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [events.event_week, session_purchase_facts.revenue, campaigns.bid_type]
    pivots: [campaigns.bid_type]
    filters:
      campaigns.bid_type: "-NULL"
      events.event_date: 1 quarters ago for 1 quarters
      user_session_fact.site_acquisition_source: Adwords
    sorts: [events.event_week, campaigns.bid_type]
    limit: 500
    dynamic_fields: [{table_calculation: revenue_adjusted, label: Revenue Adjusted,
        expression: "if(diff_days(${events.event_week}, now()) < 0,\nnull,\nrunning_total(${session_purchase_facts.revenue}))",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: week_in_quarter, label: Week in Quarter, expression: 'concat("WK",running_total(1))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {table_calculation: goal, label: Goal, expression: 'running_total(max(${revenue_display})*1.2/6)',
        value_format: !!null '', value_format_name: usd, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_revenue_won, label: Total Revenue
          Won, expression: "if(diff_days(${events.event_week}, now()) < 0,\nnull,\n\
          running_total(sum(pivot_row(${session_purchase_facts.revenue}))))", value_format: !!null '',
        value_format_name: usd, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: revenue_display,
        label: Revenue Display, expression: 'if(running_total(1)<=6,${total_revenue_won},null)',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: supermeasure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{id: Display - Revenue Adjusted,
            name: Display - Revenue Adjusted, axisId: revenue_adjusted}, {id: Search
              - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted},
          {id: total_revenue_won, name: Total Revenue Won, axisId: total_revenue_won},
          {id: Display - Goal, name: Display - Goal, axisId: goal}, {id: Search -
              Goal, name: Search - Goal, axisId: goal}], showLabels: true, showValues: true,
        valueFormat: "$#,##0", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    colors: ["#294988", "#87d79b", "#476d70", "#294259", "#747474"]
    series_types:
      Search - revenue_adjusted: column
      Display - revenue_adjusted: column
      CPC - revenue_adjusted: column
      Target CPA - revenue_adjusted: column
      Enhanced CPC - revenue_adjusted: column
      total_revenue_won: area
      revenue_display: area
    point_style: none
    series_colors: {}
    series_labels:
      revenue_display: Revenue
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    reference_lines: [{reference_type: range, line_value: mean, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#54538f",
        label: Goal}]
    show_null_points: false
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [session_purchase_facts.total_attribution, quota, revenue_adjusted,
      events.event_week, session_purchase_facts.revenue, total_revenue_won]
    listen: {}
    row: 27
    col: 0
    width: 12
    height: 6
  - title: Budget Target
    name: Budget Target
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [events.event_week, adevents.total_cost, campaigns.bid_type]
    pivots: [campaigns.bid_type]
    filters:
      events.event_date: last quarter
      campaigns.bid_type: "-NULL"
    sorts: [events.event_week, campaigns.bid_type]
    limit: 500
    dynamic_fields: [{table_calculation: spend_adjusted, label: Spend Adjusted, expression: "if(diff_days(${events.event_week},\
          \ now()) < 0,\nnull,\nrunning_total(${adevents.total_cost}))", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}, {table_calculation: week_in_quarter,
        label: Week in Quarter, expression: 'concat("WK",running_total(1))', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string},
      {table_calculation: budget, label: Budget, expression: 'running_total(max(${spend_display})*0.7/6)',
        value_format: !!null '', value_format_name: usd, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: total_spent, label: Total Spent,
        expression: "if(diff_days(${events.event_week}, now()) < 0,\nnull,\nrunning_total(sum(pivot_row(${adevents.total_cost}))))",
        value_format: !!null '', value_format_name: usd, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: spend_display, label: Spend Display,
        expression: 'if(running_total(1)<=6,${total_spent},null)', value_format: !!null '',
        value_format_name: usd, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{id: Display - Revenue Adjusted,
            name: Display - Revenue Adjusted, axisId: revenue_adjusted}, {id: Search
              - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted},
          {id: total_revenue_won, name: Total Revenue Won, axisId: total_revenue_won},
          {id: Display - Goal, name: Display - Goal, axisId: goal}, {id: Search -
              Goal, name: Search - Goal, axisId: goal}], showLabels: true, showValues: true,
        valueFormat: "$#,##0", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    colors: ["#294988", "#87d79b", "#476d70", "#294259", "#747474"]
    series_types:
      goal: area
      Search - revenue_adjusted: column
      Display - revenue_adjusted: column
      CPC - revenue_adjusted: column
      Target CPA - revenue_adjusted: column
      Enhanced CPC - revenue_adjusted: column
      CPC - spend_adjusted: column
      Enhanced CPC - spend_adjusted: column
      Target CPA - spend_adjusted: column
      total_spent: area
      spend_display: area
    point_style: none
    series_colors: {}
    series_labels:
      spend_display: Spend
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    reference_lines: [{reference_type: range, line_value: mean, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#54538f",
        label: Budget}]
    show_null_points: false
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [quota, adevents.total_cost, spend_adjusted, events.event_week,
      total_spent]
    listen: {}
    row: 33
    col: 0
    width: 12
    height: 5
  - title: Ad Spend
    name: Ad Spend
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [events.previous_period, adevents.total_cost]
    filters:
      events.previous_period: "-NULL"
      events.previous_period_filter: 90 days ago for 90 days
    sorts: [events.previous_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${adevents.total_cost}/offset(${adevents.total_cost},1)-1",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
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
    single_value_title: Total Spend
    comparison_label: Previous Period
    hidden_fields: []
    value_format: "$#,###"
    y_axes: []
    listen:
      Date: adevents.previous_period_filter
    row: 19
    col: 0
    width: 4
    height: 4
  - title: Revenue
    name: Revenue
    model: thelook_adwords
    explore: events
    type: single_value
    fields: [events.previous_period, session_purchase_facts.revenue]
    filters:
      events.previous_period: "-NULL"
      user_session_fact.site_acquisition_source: Adwords
      events.previous_period_filter: 90 days ago for 90 days
    sorts: [events.previous_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "%Change", expression: "${session_purchase_facts.revenue}/offset(${session_purchase_facts.revenue},1)-1",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
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
    single_value_title: Associated Revenue
    comparison_label: Previous Period
    hidden_fields: []
    value_format: "$#,###"
    y_axes: []
    listen:
      Date: adevents.previous_period_filter
    row: 23
    col: 0
    width: 4
    height: 4
  - title: Active Campaigns - Performance Waterfall
    name: Active Campaigns - Performance Waterfall
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [campaigns.campaign_name, session_purchase_facts.net_profit]
    filters:
      campaigns.campaign_name_raw: "-NULL"
      campaigns.is_active_now: 'Yes'
      adevents.total_cost: ">0"
    sorts: [session_purchase_facts.net_profit desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: offset, label: offset, expression: 'running_total(offset(${session_purchase_facts.net_profit},-1))',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: offset_for_negative, label: offset for negative, expression: "${offset}\
          \ + ${session_purchase_facts.net_profit}", value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: offset_2, label: Offset,
        expression: "if(${session_purchase_facts.net_profit}<0,\n  if(${offset}+${session_purchase_facts.net_profit}<0,if(${offset}>=0,0,${offset}),${offset_for_negative}),${offset})",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: gain, label: Gain, expression: 'if(${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit},0)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: loss, label: Loss+, expression: "if(${session_purchase_facts.net_profit}<0,\n\
          \  if(${offset}+${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit}*-1,if(${offset}>=0,${offset},0)),0)",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: loss_, label: Loss-, expression: 'if(${session_purchase_facts.net_profit}<0,${session_purchase_facts.net_profit}+${loss},0)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#b6b6b6"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [session_purchase_facts.total_attribution, expense, session_purchase_facts.net_profit,
      offset, offset_for_negative]
    series_types: {}
    colors: ["#294988", "#87d79b", "#476d70", "#294259", "#747474"]
    series_colors:
      offset: transparent
      expense_negative: "#294988"
      expense_positive: "#294988"
      offset_2: transparent
      loss: "#294259"
    hide_legend: true
    y_axes: [{label: Rolling Net Profit, orientation: left, series: [{id: offset_2,
            name: Offset, axisId: offset_2}, {id: gain, name: Gain, axisId: gain},
          {id: loss, name: Loss+, axisId: loss}, {id: loss_, name: Loss-, axisId: loss_}],
        showLabels: true, showValues: true, minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '4'
    listen: {}
    row: 33
    col: 12
    width: 12
    height: 11
  - name: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
    type: text
    title_text: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
    subtitle_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    subtitle_text: How are we doing in search?
    body_text: ''
    row: 2
    col: 0
    width: 8
    height: 2
  - name: 'display text'
    type: text
    subtitle_text: How are we doing in Display?
    row: 2
    col: 8
    width: 8
    height: 2
  - name: 'overall text'
    type: text
    title_text: ''
    subtitle_text: How are we doing overall?
    row: 2
    col: 16
    width: 8
    height: 2
  - name: "<span class='fa fa-dollar'> Revenue and Cost</span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Revenue and Cost</span>"
    subtitle_text: How are we tracking towards spend budget and revenue goals?
    body_text: "**Recommended Action** Dig deeper into under performing campaigns\
      \ and figure out what is going wrong"
    row: 16
    col: 0
    width: 24
    height: 3
  - title: Q Over Q Tracking Revenue Target
    name: Q Over Q Tracking Revenue Target
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [campaigns.day_of_quarter, campaigns.created_quarter, session_purchase_facts.revenue]
    pivots: [campaigns.created_quarter]
    fill_fields: [campaigns.created_quarter]
    filters:
      campaigns.created_quarter: 5 quarters
      user_session_fact.site_acquisition_source: Adwords
      campaigns.campaign_name: ''
    sorts: [campaigns.day_of_quarter, campaigns.created_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_revenue, label: Running Revenue,
        expression: 'running_total(${session_purchase_facts.revenue})', value_format: !!null '',
        value_format_name: usd_0, _kind_hint: measure, _type_hint: number}, {table_calculation: goal_pace,
        label: Goal Pace, expression: "${running_revenue}\n/\n50000", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}, {
        table_calculation: to_goal, label: "% To Goal", expression: "if(\ndiff_days(${date},\
          \ date(\nextract_years(now()),\nextract_months(now()),\nextract_days(now())))\
          \ < 0,\nnull,\n${goal_pace})\n", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}, {table_calculation: first_day_of_quarter,
        label: First Day of Quarter, expression: "date(\nextract_years(${campaigns.created_quarter}),\n\
          extract_months(${campaigns.created_quarter}),\nextract_days(${campaigns.created_quarter}))",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: date}, {table_calculation: date, label: Date, expression: 'add_days(${campaigns.day_of_quarter},${first_day_of_quarter})

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: date}, {table_calculation: goal, label: Goal, expression: 'if(is_null(pivot_index(${session_purchase_facts.revenue}-${session_purchase_facts.revenue},1)),1,1)',
        value_format: !!null '', value_format_name: percent_0, _kind_hint: supermeasure,
        _type_hint: number}]
    query_timezone: user_timezone
    stacking: ''
    show_value_labels: false
    label_density: 1
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
    show_null_points: false
    point_style: none
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [session_purchase_facts.total_attribution, goal_pace, first_day_of_quarter,
      date, running_revenue, session_purchase_facts.revenue, goal]
    font_size: medium
    colors: ["#294988", "#87d79b", "#476d70", "#294259", "#747474"]
    series_colors:
      goal: "#c8c8ca"
    hidden_series: []
    y_axes: []
    listen: {}
    row: 38
    col: 0
    width: 12
    height: 6
  - title: Top Spend Campaigns
    name: Top Spend Campaigns
    model: thelook_adwords
    explore: sessions
    type: looker_grid
    fields: [campaigns.campaign_name, adevents.total_cost, session_attribution.ROI,
      session_attribution.total_attribution]
    filters:
      adevents.created_quarter: 2019-Q4
    sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
    limit: 10
    column_limit: 50
    query_timezone: user_timezone
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
      campaigns.campaign_name: 316
      adevents.total_cost: 210
      session_attribution.ROI: 202
      session_attribution.total_attribution: 223
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
    row: 27
    col: 12
    width: 12
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 90 days ago for 90 days
    allow_multiple_values: true
    required: false
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: adevents.created_date
  - name: Location
    title: Location
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
