USE adlister_db;

DROP TABLE IF EXISTS ads, ads_categories, users, categories;


CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(240) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads_categories (
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

INSERT INTO users (username, email, password) VALUES
                                                  ('JohnDoe','johndoe@example.com','$2a$12$ydoos7sl0kTVjW8PqNYzeeuImwkZc4pazPl6.TfRdgYPE/ApFhrc.'),
                                                  ('JaneSmith','janesmith@example.com','$2a$12$mmFFq2Sqx3.4NmYPhuHTtuCUNdhxXQjXV//zZoChbPPkhcIWSvHne'),
                                                  ('Mike1','mikejohnson@example.com','$2a$12$el/vWaxEuA8B.9dgSjWc/OjzV9yyHijmQOzKKSRGbRb4DxAJNKXeO'),
                                                  ('bob','test@codeup.com', '$2a$12$4XdLaqVSUl.3OuEq2r15VuaLT4KKxO4hGNVLtnjiy8tWpD.oyuy1e'),
                                                  ('joeab91','jab102191@gmail.com','$2a$12$XMaLwx14AAjGw7IIVowiD.9n//tnvdYLLN8gvL9Gd2jCFi7ijQBr2.');



INSERT INTO ads (user_id, title, description) VALUES
                                                  (1, 'Wooden Dining Table', 'Solid wood dining table in excellent condition.'),
                                                  (2, 'Antique Pocket Watch', 'Rare antique pocket watch from the 1800s.'),
                                                  (3, 'LEGO Star Wars Set', 'Brand new LEGO Star Wars Millennium Falcon set.'),
                                                  (4, 'Wanted: Old Vinyl Records', 'Looking to buy old vinyl records in good condition.'),
                                                  (5, 'Miscellaneous Items Lot', 'Assorted items including kitchenware, tools, and more.'),
                                                  (1, 'Alamo Souvenir', 'A souvenir from the Alamo in San Antonio, TX.'),
                                                  (2, 'Diamond Ring', 'Beautiful diamond ring in excellent condition.'),
                                                  (3, 'Lawn Mowing Service', 'I will mow your lawn for a reasonable price.'),
                                                  (4, 'Wooden Dining Table', 'Solid wood dining table in excellent condition.'),
                                                  (5, 'Antique Pocket Watch', 'Rare antique pocket watch from the 1800s.'),
                                                  (1, 'LEGO Star Wars Set', 'Brand new LEGO Star Wars Millennium Falcon set.'),
                                                  (2, 'Wanted: Old Vinyl Records', 'Looking to buy old vinyl records in good condition.'),
                                                  (3, 'Miscellaneous Items Lot', 'Assorted items including kitchenware, tools, and more.'),
                                                  (4, 'Alamo Souvenir', 'A souvenir from the Alamo in San Antonio, TX.'),
                                                  (5, 'Diamond Ring', 'Beautiful diamond ring in excellent condition.'),
                                                  (1, 'Lawn Mowing Service', 'I will mow your lawn for a reasonable price.'),
                                                  (2, 'Wooden Dining Table', 'Solid wood dining table in excellent condition.'),
                                                  (3, 'Antique Pocket Watch', 'Rare antique pocket watch from the 1800s.'),
                                                  (4, 'LEGO Star Wars Set', 'Brand new LEGO Star Wars Millennium Falcon set.'),
                                                  (5, 'Wanted: Old Vinyl Records', 'Looking to buy old vinyl records in good condition.');

INSERT INTO categories (name) VALUES
                                  ('Furniture'),
                                  ('Collectables'),
                                  ('Toys'),
                                  ('Items wanted'),
                                  ('Miscellaneous'),
                                  ('Souvenirs'),
                                  ('Jewelry'),
                                  ('Services');

INSERT INTO ads_categories (ad_id, category_id) VALUES
                                                    (1, 1),
                                                    (2, 2),
                                                    (3, 3),
                                                    (4, 4),
                                                    (5, 5),
                                                    (6, 6),
                                                    (7, 7),
                                                    (8, 8),
                                                    (9, 1),
                                                    (10, 2),
                                                    (11, 3),
                                                    (12, 4),
                                                    (13, 5),
                                                    (14, 6),
                                                    (15, 7),
                                                    (16, 8),
                                                    (17, 1),
                                                    (18, 2),
                                                    (19, 3),
                                                    (20, 4),
                                                    (1, 2),
                                                    (2, 3),
                                                    (3, 4),
                                                    (4, 5),
                                                    (5, 6),
                                                    (6, 7),
                                                    (7, 8),
                                                    (8, 1),
                                                    (9, 2),
                                                    (10, 3),
                                                    (11, 4),
                                                    (12, 5),
                                                    (13, 6),
                                                    (14, 7),
                                                    (15, 8),
                                                    (16, 1),
                                                    (17, 2),
                                                    (18, 3),
                                                    (19, 4),
                                                    (20, 5);


