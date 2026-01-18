USE online_store;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100)
  -- email wasn't working so I added it up here
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NULL,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

INSERT INTO customers (id, first_name, last_name, email) VALUES   
(1, 'John', 'Doe', 'johndoe@gmail.com'),  
(2, 'Jane', 'Smith', 'janesmith@gmail.com'),   
(3, 'Alice', 'Smith', 'alicesmith@gmail.com'),   
(4, 'Bob', 'Brown', 'bobbrown@gmail.com');
-- made up some emails

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
  (1, '2023-01-01', 100.00),
  (1, '2023-02-01', 150.00),
  (2, '2023-01-01', 200.00),
  (3, '2023-04-01', 250.00),
  (3, '2023-04-01', 300.00),
  (NULL, '2023-04-01', 100.00);
  -- Bob don't want nobody to know he has an order

SELECT * FROM customers;
SELECT * FROM orders;

-- LEFT JOIN
-- Show all customers, including those with zero orders
SELECT
  c.id,
  c.first_name,
  c.last_name,
  COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders o
  ON o.customer_id = c.id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY c.id;

