4.vendor TaBle

CREATE TABLE SubscriptionPlan (
    plan_id INT PRIMARY KEY,
    name VARCHAR(255) ,
    email DECIMAL(10,2),
    duration INT,
    features TEXT
);

CREATE TABLE Vendor(
    vendor_id INT PRIMARY KEY AUTO_INCREMENT,
    business_name VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    plan_id INT,
    FOREIGN KEY(plan_id) REFERENCES SubscriptionPlan(plan_id)
);

5.
CREATE TABLE ProductCategory(
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id,category_id),
    FOREIGN KEY(product_id) REFERENCES Product(product_id),
    FOREIGN KEY(category_id) REFERENCES Category(category_id)
);

6.INSERT INTO Vendor (business_name, contact_person, email, phone, address, plan_id)
VALUES ('SmartTech Ltd.', 'Rahim Khan', 'rahim@smarttech.com', '017XXXXXXXX', 'Dhaka, Bangladesh', 1);

7.
INSERT INTO Product (name, description, price, stock, status, vendor_id)
VALUES ('Laptop', 'High performance laptop', 75000, 10, 'active', 1);

8.
UPDATE Product SET stock = 15 WHERE name = 'Laptop';
9.
DELETE FROM Customer WHERE email = 'oldcustomer@gmail.com';
10.
SELECT v.business_name, p.name, p.price
FROM Vendor v JOIN SubscriptionPlan p ON v.plan_id = p.plan_id;
11.
SELECT pr.name, pr.price, pr.stock
FROM Product pr
JOIN ProductCategory pc ON pr.product_id = pc.product_id
JOIN Category c ON pc.category_id = c.category_id
WHERE c.name = 'Electronics';
12.
SELECT o.order_id, o.date, o.total_amount, o.status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
WHERE c.name = 'Karim Uddin';
13.
SELECT method, amount, status
FROM Payment WHERE order_id = 1;
14.
SELECT product_id, SUM(qty) AS total_sold
FROM OrderItem
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 5;
15.
SELECT v.business_name, SUM(oi.subtotal) AS total_sales
FROM Vendor v
JOIN Product p ON v.vendor_id = p.vendor_id
JOIN OrderItem oi ON p.product_id = oi.product_id
GROUP BY v.vendor_id;
16.
SELECT name FROM Customer
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);
17.
SELECT COUNT(*) FROM Product WHERE status = 'active';
18.
SELECT v.business_name
FROM Vendor v
JOIN SubscriptionPlan p ON v.plan_id = p.plan_id
WHERE p.name = 'Enterprise';
19.
SELECT customer_id, AVG(total_amount)
FROM Orders GROUP BY customer_id;
20.
SELECT c.name
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItem oi ON o.order_id = oi.order_id
JOIN Product p ON oi.product_id = p.product_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.vendor_id) > 1;