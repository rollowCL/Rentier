CREATE DATABASE rentier CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER DATABASE rentier CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE brands
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    logo_file_name VARCHAR(255),
    email VARCHAR(255),
    active BIT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE product_categories
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    category_name VARCHAR(255) NOT NULL,
    active BIT NOT NULL,
    category_Order TINYINT NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE product_sizes
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    size_name VARCHAR(255) NOT NULL,
    product_category_id BIGINT NOT NULL,
    active BIT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY  (product_category_id) REFERENCES product_categories(id)
);

CREATE TABLE products
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_desc TEXT,
    product_text VARCHAR(255),
    product_brand_text VARCHAR(255),
    brand_id BIGINT NOT NULL,
    product_category_id BIGINT NOT NULL,
    created_date DATETIME NOT NULL,
    updated_date DATETIME,
    active BIT NOT NULL,
    price_gross DECIMAL(10,2) NOT NULL,
    available_online BIT NOT NULL,
    image_file_name VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brands(id),
    FOREIGN KEY (product_category_id) REFERENCES product_categories(id)
);

CREATE TABLE addresses
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    zip_code VARCHAR(6) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    street_number VARCHAR(255) NOT NULL,
    active BIT NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id)
);

CREATE TABLE shops
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    shop_name VARCHAR(255) NOT NULL,
    address_id BIGINT NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255),
    photo_file_name VARCHAR(255),
    active BIT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products_shops
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    product_id BIGINT NOT NULL,
    product_size_id BIGINT NOT NULL,
    shop_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (product_size_id) REFERENCES product_sizes(id),
    FOREIGN KEY (shop_id) REFERENCES shops(id)
);

CREATE TABLE user_roles
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    role_name VARCHAR(255) NOT NULL,
    order_type_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_type_id) REFERENCES order_types(id)
);


CREATE TABLE users
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    user_role_id BIGINT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    register_date DATETIME NOT NULL,
    active BIT NOT NULL,
    verified BIT NOT NULL,
    bill_address_id BIGINT NOT NULL,
    ship_address_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_role_id) REFERENCES user_roles(id)
);

CREATE TABLE users_shops
(
    user_id BIGINT NOT NULL,
    shop_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (shop_id) REFERENCES shops(id)
);

CREATE TABLE payment_methods
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    payment_method_name VARCHAR(255) NOT NULL,
    active BIT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE delivery_methods
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    delivery_method_name VARCHAR(255) NOT NULL,
    delivery_method_cost DECIMAL(5,2) NOT NULL,
    active BIT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE order_statuses
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    order_status_name VARCHAR(255) NOT NULL,
    active BIT NOT NULL,
    delivery_method_id BIT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (delivery_method_id) REFERENCES delivery_methods(id)
);

CREATE TABLE order_types
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    order_type_name VARCHAR(255) NOT NULL,
    numbered BIT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    order_type_id BIGINT NOT NULL,
    order_status_id BIGINT NOT NULL,
    order_number VARCHAR(255),
    order_date DATETIME NOT NULL,
    order_status_date DATETIME NOT NULL,
    user_id BIGINT NOT NULL,
    delivery_method_id BIGINT NOT NULL,
    delivery_method_cost DECIMAL(5,2) NOT NULL,
    payment_method_id BIGINT NOT NULL,
    bill_address_id BIGINT NOT NULL,
    ship_address_id BIGINT NOT NULL,
    pickup_ship_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_type_id) REFERENCES order_types(id),
    FOREIGN KEY (order_status_id) REFERENCES order_statuses(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (delivery_method_id) REFERENCES delivery_methods(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id),
    FOREIGN KEY (pickup_ship_id) REFERENCES shops(id)

);

CREATE TABLE order_details
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    order_id BIGINT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_desc TEXT NOT NULL,
    product_category_name VARCHAR(255) NOT NULL,
    product_size_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price_net DECIMAL(10) NOT NULL,
    vat_prc DECIMAL(2) NOT NULL,
    price_gross DECIMAL(10) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_numbers
(
    id BIGINT AUTO_INCREMENT NOT NULL,
    year INT NOT NULL,
    number INT(11) NOT NULL,
    PRIMARY KEY (id)
);