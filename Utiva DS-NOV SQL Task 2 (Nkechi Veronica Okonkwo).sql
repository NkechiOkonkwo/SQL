SELECT
	pizza_id,
	SUM(quantity) AS total_quantity 
FROM
	(SELECT
	*
FROM
	order_details
WHERE
	pizza_id LIKE 's%')AS subquery
GROUP BY
	pizza_id
ORDER BY 
	total_quantity DESC;
	
SELECT
	pizza_id,
	price
FROM
	pizzas
WHERE
	price > (SELECT AVG(price) AS average_price FROM pizzas);