--1
CREATE INDEX country_idx on customers(country);
SELECT * FROM customers
WHERE country = 'US';
DROP INDEX country_idx on customers;

--2
CREATE INDEX total_index ON orders(totalamount);
SELECT * FROM orders
WHERE totalamount > 0;
DROP INDEX total_index ON orders;

--3
CREATE UNIQUE INDEX customerid_index ON customers(customerid);
SELECT customers.customerid,firstname,lastname,address1
FROM customers
JOIN orders ON customers.customerid = orders.customerid
WHERE CUSTOMERS.customerid IN (
    SELECT customerid FROM orders GROUP BY customerid HAVING SUM(totalamount) >1000
)

--4
CREATE INDEX prod_idx ON products(prod_id);

with foo as
(
SELECT sum(quantity) sum_quantity from orderlines
group by orderlines.prod_id )
SELECT prod_id,title, foo.sum_quantity from products,foo
group by products.title,products.prod_id,foo.sum_quantity;
DROP INDEX prod_idx ON products;
--5
CREATE INDEX customer_idx ON customers(customerid);
SELECT * from customers
where customers.customerid in (select customerid from orders);
DROP INDEX customer_idx ON customers;
--6
CREATE UNIQUE INDEX uidx_6 ON products(prod_id);
CREATE UNIQUE INDEX uidx_6x ON orderlines(prod_id);
SELECT products.prod_id FROM products 
EXCEPT 
SELECT orderlines.prod_id FROM orderlines ;
--7
CREATE INDEX total ON orders(totalamount);
SELECT customerid, SUM(totalamount) total FROM orders 
GROUP BY customerid;
DROP INDEX total ON orders;

--8
CREATE INDEX soLuong ON orderlines(quantity);
SELECT prod_id, SUM(quantity) quantity FROM orderlines
GROUP BY prod_id;
DROP INDEX soLuong ON orderlines;
------------------------------------------------------------------------------------
