-- DDL (synthetic demo)
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  city VARCHAR(100),
  state CHAR(2),
  vehicle_model VARCHAR(50),
  vehicle_year INT,
  email VARCHAR(120),
  signup_date DATE
);
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  service_type VARCHAR(40),
  price_usd DECIMAL(10,2),
  region VARCHAR(50),
  install_duration_minutes INT,
  installer_id INT
);
CREATE TABLE inventory (
  item_id INT PRIMARY KEY,
  item_name VARCHAR(80),
  vehicle_model VARCHAR(50),
  unit_cost_usd DECIMAL(10,2),
  stock_qty INT,
  last_restock_date DATE
);
CREATE TABLE warranty (
  warranty_id INT PRIMARY KEY,
  order_id INT,
  claim_date DATE,
  claim_type VARCHAR(40),
  resolved BOOLEAN,
  resolution_days INT
);
