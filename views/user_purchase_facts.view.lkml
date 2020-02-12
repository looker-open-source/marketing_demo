view: user_purchase_facts {
  derived_table: {
    datagroup_trigger: ecommerce_etl

    sql:
    with user_product_sales as (
    select user_id, product_category, sum(sale_price) as product_sales, row_number() over(PARTITION BY user_id order by sum(sale_price ) desc ) as category_rank
      from ecomm.order_items
      join ecomm.inventory_items
      on order_items.inventory_item_id = inventory_items.id
      join ecomm.products
      on inventory_items.product_id = products.id
      group by 1,2)

      select user_id, product_category as preferred_category
      from user_product_sales
      where category_rank = 1
       ;;
  }


  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: preferred_category {
    view_label: "Users"
    type: string
    sql: ${TABLE}.preferred_category ;;
  }

}
