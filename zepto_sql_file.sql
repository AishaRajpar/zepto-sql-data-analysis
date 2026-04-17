---- ---------------Zepto SQL Project----------------------

-----------------------------Table Creation----------------------------

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);


-------------------------Data Exploration---------------------------


SELECT COUNT(*) FROM zepto;
SELECT * FROM zepto LIMIT 10;

SELECT * FROM zepto
WHERE name IS NULL OR category IS NULL OR mrp IS NULL 
OR discountPercent IS NULL OR discountedSellingPrice IS NULL 
OR weightInGms IS NULL OR outOfStock IS NULL OR quantity IS NULL;

SELECT DISTINCT category FROM zepto ORDER BY category;

SELECT outOfStock, COUNT(*) FROM zepto GROUP BY outOfStock;

SELECT name, COUNT(*) 
FROM zepto 
GROUP BY name 
HAVING COUNT(*) > 1;

-------------------------Data Cleaning--------------------

```sql
SELECT * FROM zepto WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto 
WHERE mrp = 0 OR discountedSellingPrice = 0;

UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;
```

---

-----------------------Data Analysis------------------------

```sql
-- Q1
SELECT name, category, mrp, discountPercent
FROM zepto ORDER BY discountPercent DESC LIMIT 10;

-- Q2
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;

-- Q3
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4
SELECT *
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5
SELECT category,
ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6
SELECT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7
SELECT name, weightInGms,
CASE 
    WHEN weightInGms < 1000 THEN 'LOW'
    WHEN weightInGms < 5000 THEN 'MEDIUM'
    ELSE 'BULK'
END AS weight_category
FROM zepto;

-- Q8
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;
