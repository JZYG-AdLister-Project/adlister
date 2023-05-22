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
INSERT INTO ads (user_id, title, description)
VALUES
    (1, 'Vintage Armchair', 'This vintage armchair has been a cherished family heirloom, passed down through generations. It holds a special place in our home, symbolizing comfort, nostalgia, and the stories shared by our loved ones.'),
    (2, 'Antique Silver Spoon', 'This antique silver spoon from the 1800s carries a rich family history. It represents our ancestors\' culinary traditions and serves as a reminder of the connections between generations.'),
    (3, 'Limited Edition Star Wars Poster', 'This limited edition Star Wars poster is a cherished family possession. It brings back memories of watching the movies together and ignites our passion for the epic saga.'),
    (4, 'Vintage Vinyl Records Collection', 'This collection of vintage vinyl records is a treasure trove of music and memories. Each record carries the soundtracks of special moments and the nostalgia of bygone eras.'),
    (5, 'Assorted Kitchen Appliances', 'These kitchen appliances are more than just functional tools. They are heirlooms that have seen countless family meals and celebrations, making them a meaningful part of our family history.'),
    (1, 'Texas Lone Star Flag', 'Authentic Texas Lone Star flag from the Alamo.'),
    (2, 'Sapphire Pendant Necklace', 'Elegant sapphire pendant necklace, perfect for special occasions.'),
    (3, 'Gardening Services', 'Professional gardening services for all your landscaping needs.'),
    (4, 'Rustic Farmhouse Table', 'Handcrafted rustic farmhouse dining table, ideal for family gatherings.'),
    (5, 'Vintage Pocket Watch', 'Exquisite vintage pocket watch from the 1900s.'),
    (1, 'LEGO Harry Potter Set', 'Brand new LEGO Harry Potter Hogwarts Castle set.'),
    (2, 'Classic Rock Vinyl Records', 'Looking to buy classic rock vinyl records in good condition.'),
    (3, 'Assorted Power Tools Set', 'A set of power tools for all your DIY projects.'),
    (4, 'San Antonio Spurs Memorabilia', 'Memorabilia items from the San Antonio Spurs basketball team.'),
    (5, 'Emerald Stud Earrings', 'Stunning emerald stud earrings, perfect for gifting.'),
    (1, 'Landscape Design Consultation', 'Professional landscape design consultation for your outdoor space.'),
    (2, 'Solid Oak Coffee Table', 'Beautiful solid oak coffee table with a modern design.'),
    (3, 'Vintage Film Cameras', 'Rare vintage film cameras for photography enthusiasts.'),
    (4, 'Star Wars Collectibles Lot', 'Assorted Star Wars collectibles, including action figures and memorabilia.'),
    (5, 'Vinyl Record Player', 'High-quality vinyl record player with built-in speakers and Bluetooth connectivity.');

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

SELECT ads.id, ads.user_id, ads.title, ads.description, GROUP_CONCAT(c.name SEPARATOR ', ') AS category
       FROM ads
           JOIN ads_categories ac on ads.id = ac.ad_id
           JOIN categories c on ac.category_id = c.id
       WHERE ads.id = 1
       GROUP BY ads.id;

INSERT INTO ads_categories(ad_id, category_id) VALUES (?, ?);