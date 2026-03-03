-- EXERCICE 2

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (124, 'H123', '2024-02-06', 845.00);

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (151, 'H124', '2024-02-07', 70.00);

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (112, 'H125', '2024-02-05', 1024.00);

-- EXERCICE 4

UPDATE orders
SET status = 'Cancelled',
    shippedDate = CURDATE(),
    comments = 'Order cancelled due to delay'
WHERE orderDate = '2003-09-28';

-- EXERCICE 5

UPDATE products
SET productName = CONCAT(productName, ' (code ', productCode, ')')
WHERE productLine = 'Trains';

-- EXERCICE 6

UPDATE products
SET buyPrice = buyPrice * 1.0002,
    MSRP = MSRP * 1.0002
WHERE quantityInStock > 500;

-- EXERCICE 7

DELETE p
FROM payments p
JOIN customers c ON p.customerNumber = c.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE e.lastName = 'Patterson';

-- EXERCICE 8

DELETE FROM customers c
WHERE c.city = 'Lisbon'
AND NOT EXISTS (
    SELECT 1
    FROM payments p
    WHERE p.customerNumber = c.customerNumber
);

-- EXERCICE 9

INSERT INTO employees (
    employeeNumber,
    lastName,
    firstName,
    extension,
    email,
    officeCode,
    reportsTo,
    jobTitle
)
SELECT 
    customerNumber + 2000,
    contactLastName,
    contactFirstName,
    'x0000',
    'new@company.com',
    '1',
    NULL,
    'Sales Rep'
FROM customers;

-- EXERCICE 10

UPDATE orders o
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
SET o.status = 'Cancelled',
    o.shippedDate = CURDATE(),
    o.comments = 'Order cancelled by management'
WHERE e.firstName = 'Elizabeth'
AND e.lastName = 'Lincoln';