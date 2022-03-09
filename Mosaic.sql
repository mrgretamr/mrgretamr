CREATE DATABASE mosaic_db;

USE mosaic_db;

CREATE TABLE item (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    description VARCHAR(255)
    );
CREATE TABLE vendor (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(255)
    );
CREATE TABLE BOM (
    child_id INT PRIMARY KEY AUTO_INCREMENT, 
    quantity INT, 
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES item(id)
    );
CREATE TABLE work_order (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    requested_date DATE,
    'status' VARCHAR(20),
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES item(id)
    );
CREATE work_order_lines (
    id INT PRIMARY KEY AUTO_INCREMENT,
    confirmed_date DATE,
    requested_change_date DATE,
    'status' VARCHAR(20),
    FOREIGN KEY ('status') REFERENCES work_order('status'),
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES item(id),
    purchase_id INT,
    FOREIGN KEY (purchase_id) REFERENCES purchase_order(id)
    );
CREATE purchase_order (
    id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES item(id),
    vendor_id INT,
    FOREIGN KEY (vendor_id) REFERENCES vendor(id),
    requested_date DATE,
    FOREIGN KEY (requested_date) REFERENCES work_order(requested_date)
    );