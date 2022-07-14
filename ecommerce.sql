DROP DATABASE IF EXISTS ecommerce_clothing_db;
CREATE DATABASE IF NOT EXISTS ecommerce_clothing_db;
USE ecommerce_clothing_db;

CREATE TABLE IF NOT EXISTS permissions
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
#     permission_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS role_permissions
(
    id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role_id       INT UNSIGNED NOT NULL,
    permission_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id),
    FOREIGN KEY (permission_id) REFERENCES permissions (id)
);


CREATE TABLE IF NOT EXISTS products
(
    id          INT UNSIGNED   NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)   NOT NULL,
    price       FLOAT UNSIGNED NOT NULL,
    description TEXT,
    quantity    INT UNSIGNED   NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reviews
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    content    TEXT         NOT NULL,
    stars      INT UNSIGNED NOT NULL,
    check (stars BETWEEN 0 AND 10),
    product_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(20)  NOT NULL,
    check (LENGTH(username) > 5),
    password VARCHAR(20)  NOT NULL,
    check (LENGTH(password) > 8),
    role_id  INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin'),
       ('user');

INSERT INTO permissions (name)
VALUES ('view'),
       ('create'),
       ('edit'),
       ('delete'),
       ('order');

INSERT INTO products (name, price, description, quantity)
VALUES ('shirt', 19.99, 'Soft cotton tag-less shirts come in a variety of colors.', 100),
       ('jeans', 39.99, 'Denim blue jeans stolen from wrangler', 123),
       ('shoes', 79.99, 'Leather shoes with a leather sole', 10),
       ('socks', 9.99, 'Socks with a mesh back', 100);

INSERT INTO role_permissions (role_id, permission_id)
VALUES ((SELECT id FROM roles WHERE name = 'admin'), (SELECT id FROM permissions WHERE name = 'create')),
       ((SELECT id FROM roles WHERE name = 'admin'), (SELECT id FROM permissions WHERE name = 'edit')),
       ((SELECT id FROM roles WHERE name = 'admin'), (SELECT id FROM permissions WHERE name = 'delete')),
       ((SELECT id FROM roles WHERE name = 'user'), (SELECT id FROM permissions WHERE name = 'order')),
       ((SELECT id FROM roles WHERE name = 'user'), (SELECT id FROM permissions WHERE name = 'view'))


INSERT INTO reviews (content, stars, product_id)
VALUES ('Very good, I like', 9, (SELECT id FROM products WHERE name = 'shirt')),
('It was basically bigger than I want', 5, (SELECT id FROM products WHERE name = 'shoes')),
('It was a bit too small', 1, (SELECT id FROM products WHERE name = 'jeans')),
('It was a bit too big', 10, (SELECT id FROM products WHERE name = 'shirt')),
('The delibery guy was not as good as I expected', 2, (SELECT id FROM products WHERE name = 'jeans'));