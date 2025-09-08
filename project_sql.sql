-- Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    reorder_level INT NOT NULL DEFAULT 10
);

-- Warehouses
CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Suppliers
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

-- Stock (Inventory per warehouse)
CREATE TABLE Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    UNIQUE(product_id, warehouse_id)
);

-- Products
INSERT INTO Products (product_name, sku, reorder_level) VALUES
('Wireless Mouse', 'SKU001', 10),
('USB Keyboard', 'SKU002', 15),
('HDMI Cable', 'SKU003', 20),
('External Hard Drive', 'SKU004', 5),
('Laptop Stand', 'SKU005', 8),
('USB-C Charger', 'SKU006', 12),
('Bluetooth Speaker', 'SKU007', 10),
('Gaming Headset', 'SKU008', 6),
('Mechanical Keyboard', 'SKU009', 10),
('Ergonomic Chair', 'SKU010', 3),
('Smartphone', 'SKU011', 10),
('Tablet', 'SKU012', 7),
('Monitor 24"', 'SKU013', 4),
('Monitor 27"', 'SKU014', 4),
('Laser Printer', 'SKU015', 2),
('Scanner', 'SKU016', 3),
('WiFi Router', 'SKU017', 6),
('Power Bank', 'SKU018', 15),
('Flash Drive 64GB', 'SKU019', 20),
('SD Card 128GB', 'SKU020', 20);

-- Warehouses
INSERT INTO Warehouses (warehouse_name, location) VALUES
('Central Warehouse', 'New York'),
('East Warehouse', 'Boston'),
('West Warehouse', 'Los Angeles'),
('North Warehouse', 'Chicago'),
('South Warehouse', 'Dallas'),
('Houston Depot', 'Houston'),
('Seattle Hub', 'Seattle'),
('Miami Storage', 'Miami'),
('Denver Center', 'Denver'),
('Phoenix Stockyard', 'Phoenix'),
('Atlanta Depot', 'Atlanta'),
('San Diego Warehouse', 'San Diego'),
('Philadelphia Hub', 'Philadelphia'),
('San Jose Storage', 'San Jose'),
('Austin Distribution', 'Austin');

-- Suppliers
INSERT INTO Suppliers (supplier_name, contact_email) VALUES
('Tech Supplies Inc.', 'contact@techsupplies.com'),
('Gadget World', 'support@gadgetworld.com'),
('SmartTech Co.', 'info@smarttech.co'),
('Global Electronics', 'sales@globalelec.com'),
('Future Gadgets', 'hello@futuregadgets.com'),
('Universal Components', 'orders@unicomponents.com'),
('FastTech Supplies', 'service@fasttech.com'),
('Prime Electronics', 'prime@electronics.com'),
('NextGen Devices', 'sales@nextgendevices.com'),
('Nova Distributors', 'contact@novadistributors.com'),
('Urban Electronics', 'info@urbanelectronics.com'),
('Electronix Corp.', 'support@electronix.com'),
('SuperTech Supplies', 'help@supertech.com'),
('VisionWare Ltd.', 'contact@visionware.com'),
('MegaTech World', 'info@megatech.com'),
('Infinity Supplies', 'orders@infinitysupplies.com'),
('Digital Hub', 'support@digitalhub.com'),
('ElectroXpress', 'sales@electroxpress.com'),
('Bytezone Inc.', 'contact@bytezone.com'),
('Core Components', 'info@corecomponents.com');

--  Stock Entries 
INSERT INTO Stock (product_id, warehouse_id, quantity) VALUES
(1, 1, 25), (2, 1, 18), (3, 1, 12), (4, 2, 8), (5, 2, 30),
(6, 3, 16), (7, 3, 14), (8, 4, 22), (9, 4, 10), (10, 5, 5),
(11, 5, 7), (12, 6, 19), (13, 6, 9), (14, 7, 3), (15, 7, 6),
(16, 8, 17), (17, 8, 12), (18, 9, 28), (19, 9, 15), (20, 10, 23),
(1, 10, 7), (2, 11, 11), (3, 11, 9), (4, 12, 20), (5, 12, 18),
(6, 13, 15), (7, 13, 13), (8, 14, 21), (9, 14, 6), (10, 15, 4),
(11, 1, 12), (12, 2, 16), (13, 3, 5), (14, 4, 10), (15, 5, 8),
(16, 6, 9), (17, 7, 14), (18, 8, 6), (19, 9, 30), (20, 10, 11),
(1, 11, 5), (2, 12, 18), (3, 13, 22), (4, 14, 13), (5, 15, 4),
(6, 1, 7), (7, 2, 25), (8, 3, 10), (9, 4, 5), (10, 5, 12),
(11, 6, 14), (12, 7, 8), (13, 8, 19), (14, 9, 6), (15, 10, 10),
(16, 11, 20), (17, 12, 17), (18, 13, 4), (19, 14, 18), (20, 15, 12),
(1, 2, 9), (2, 3, 7), (3, 4, 30), (4, 5, 11), (5, 6, 16),
(6, 7, 12), (7, 8, 14), (8, 9, 9), (9, 10, 4), (10, 11, 6),
(11, 12, 20), (12, 13, 8), (13, 14, 13), (14, 15, 10), (15, 1, 15),
(16, 2, 22), (17, 3, 6), (18, 4, 19), (19, 5, 10), (20, 6, 7),
(1, 7, 12), (2, 8, 4), (3, 9, 6), (4, 10, 8), (5, 11, 10),
(6, 12, 15), (7, 13, 12), (8, 14, 14), (9, 15, 16), (10, 1, 9),
(11, 2, 6), (12, 3, 8), (13, 4, 10), (14, 5, 4), (15, 6, 18);

-- Check stock levels for all products across warehouses
SELECT p.product_name, w.warehouse_name, s.quantity
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
ORDER BY p.product_name, w.warehouse_name;

-- Products below reorder level (alerts)
SELECT p.product_name, w.warehouse_name, s.quantity, p.reorder_level
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
WHERE s.quantity < p.reorder_level;

DELIMITER $$

CREATE TRIGGER trg_low_stock AFTER UPDATE ON Stock
FOR EACH ROW
BEGIN
    DECLARE reorder_lvl INT;
    SELECT reorder_level INTO reorder_lvl FROM Products WHERE product_id = NEW.product_id;

    IF NEW.quantity < reorder_lvl THEN
        INSERT INTO StockAlerts (product_id, warehouse_id, alert_message)
        VALUES (
            NEW.product_id,
            NEW.warehouse_id,
            CONCAT('Low stock: Product ', NEW.product_id, ' in Warehouse ', NEW.warehouse_id, 
                   ', Quantity: ', NEW.quantity)
        );
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE TransferStock (
    IN prod_id INT,
    IN source_wh INT,
    IN target_wh INT,
    IN qty INT
)
BEGIN
    DECLARE current_qty INT;

    -- Check available quantity at source
    SELECT quantity INTO current_qty 
    FROM Stock
    WHERE product_id = prod_id AND warehouse_id = source_wh;

    IF current_qty IS NULL OR current_qty < qty THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough stock to transfer';
    ELSE
        -- Deduct stock from source warehouse
        UPDATE Stock SET quantity = quantity - qty
        WHERE product_id = prod_id AND warehouse_id = source_wh;

        -- Add stock to target warehouse; insert if doesn't exist
        INSERT INTO Stock(product_id, warehouse_id, quantity)
        VALUES(prod_id, target_wh, qty)
        ON DUPLICATE KEY UPDATE quantity = quantity + qty;
    END IF;
END$$

DELIMITER ;
