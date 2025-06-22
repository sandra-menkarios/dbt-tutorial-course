{{config(severity = "warn")}}

WITH order_details AS (

	SELECT order_id,
		   count(*) AS num_of_items

	FROM {{ ref('stg_ecommerce__order_items') }}
	GROUP BY 1
)

SELECT o.*,
	   od.*

FROM {{ ref('stg_ecommerce__orders') }} as o
	FULL JOIN order_details as od USING(order_id)
WHERE o.order_id IS NULL
OR od.order_id IS NULL
OR od.num_of_items != o.num_items_ordered