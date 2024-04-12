/* Sales and inventory data for a chain of fictitious toy stores in Mexico called Maven Toys including information about products, stores, daily sales transactions and current inventory levels at each location.

-- Which product categories drive the biggest profits? Is this the same across store locations*/
SELECT
	st.store_location,
	p.product_category, 
	SUM(product_price * units - product_cost) AS profit
FROM
	products AS p
JOIN
	sales AS s
ON
	s.product_id = p.product_id	
JOIN
	stores AS st
ON
	st.store_id = s.store_id
GROUP BY
	st.store_location,
	p.product_category
ORDER BY
	st.store_location,
	profit DESC;


-- How much money is tied up in inventory at the toy stores? How long will it last?
SELECT
	SUM(p.product_cost) AS total_cost
FROM
	products AS p
LEFT JOIN
	inventory AS i
ON
	p.product_id = i.product_id
WHERE
	stock_on_hand > 0;
	
SELECT (SELECT SUM(stock_on_hand) FROM inventory) / (SELECT SUM(units)/365 FROM sales) AS duration;

	
-- Are sales being lost with out of stock products at certain locations?	
SELECT
		p.product_name,
		st.store_location,
        i.stock_on_hand,
		AVG(CAST(p.product_price AS NUMERIC) * s.units) avg_sales
	FROM
		products AS p
	JOIN
		inventory As i
	ON
		p.product_id = i.product_id
	JOIN
		stores AS st
	ON
		i.store_id = st.store_id
	JOIN
		sales AS s
	ON
		p.product_id = s.product_id
	WHERE
		i.stock_on_hand = 0
GROUP BY 1,2,3;
	
