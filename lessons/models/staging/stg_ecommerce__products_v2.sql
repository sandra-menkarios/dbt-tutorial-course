WITH source AS (
        SELECT *

        FROM {{ source('thelook_ecommerce', 'products') }}
)

SELECT
        id AS product_id,
        cost,
        category,
        name,
        retail_price,
        department,
        sku,
        distribution_center_id,
		brand

FROM source