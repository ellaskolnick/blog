TRUNCATE TABLE comments, posts RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO posts (name, content) VALUES ('Blueberries', 'I am blue!');
INSERT INTO posts (name, content) VALUES ('Raspberries', 'I am red!');
INSERT INTO comments (name, content, post_id) VALUES ('Harry Styles','I prefer watermelons', '1');
INSERT INTO comments (name, content, post_id) VALUES ('Taylor Swift', 'I prefer red berries', '1');
INSERT INTO comments (name, content, post_id) VALUES ('Billie Ellish', 'I like them', '2');
INSERT INTO comments (name, content, post_id) VALUES ('Madison Beer', 'Are they?', '2');
