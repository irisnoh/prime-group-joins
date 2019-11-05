--Get all customers and their addresses.

SELECT "first_name", "last_name", "street", "state", "zip", "address_type" FROM "customers"
JOIN "addresses" ON "addresses"."customer_id"="customers"."id";
-- Get all orders and their line items (orders, quantity and product).
SELECT "quantity", "description", "order_id"  FROM "line_items"
JOIN "orders" ON "line_items"."order_id"="orders"."id"
JOIN "products" ON "line_items"."product_id"="products"."id"
ORDER BY "order_id";
-- Which warehouses have cheetos?
SELECT "description", "warehouse" FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "description" = 'cheetos';
-- Which warehouses have diet pepsi?
SELECT "description", "warehouse" FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "description" = 'diet pepsi';
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT ("orders"."id"), "customers"."first_name" FROM "orders"
JOIN "addresses" ON "orders"."address_id"="addresses"."id"
JOIN "customers" ON "addresses"."customer_id"="customers"."id"
GROUP BY "customers"."first_name";
-- How many customers do we have?
SELECT COUNT (*) FROM "customers";

-- How many products do we carry?
SELECT COUNT (*) FROM "products";

-- What is the total available on-hand quantity of diet pepsi? 92
-- Stretch
-- 9. How much was the total cost for each order?
-- 10. How much has each customer spent in total?
-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
