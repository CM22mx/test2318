- dashboard: lkmltem
  title: LKML tem
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: 4SsqRpNizJbbkyOsMIyHBG
  elements:
  - title: UDD tem
    name: UDD tem
    model: cm_2318
    explore: orders
    type: looker_grid
    fields: [orders.id, users.state, users.age, orders.count, orders.status]
    pivots: [orders.status]
    sorts: [orders.count desc 0, orders.status]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '2'
      label: 総売上_先週比
      value_format:
      value_format_name: percent_0
      _kind_hint: dimension
      table_calculation: __1
      _type_hint: number
    - category: table_calculation
      expression: '1'
      label: 総売上_
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: __2
      _type_hint: number
    - category: table_calculation
      expression: '2'
      label: 総売上_先々週比
      value_format:
      value_format_name: percent_0
      _kind_hint: dimension
      table_calculation: _
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", users.state, __2, __1, _, _1_1, users.age,
      orders.id, CANCELLED_orders.count, COMPLETED_orders.count, PENDING_orders.count]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      orders.count:
        is_active: true
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
