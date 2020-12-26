CREATE TABLE categories(
    id INTEGER PRIMARY KEY,
    catName TEXT,
    iconId INTEGER
);

INSERT INTO categories VALUES
    (0, 'Accomodation', 0),
    (2, 'Bills', 2),
    (3, 'Books', 3),
    (4, 'Car', 4),
    (6, 'Clothes', 6),
    (7, 'Debt', 7),
    (8, 'Eating out', 8),
    (9, 'Education', 9),
    (10, 'Electronics', 10),
    (11, 'Entertainment', 11),
    (12, 'Gifts', 12),
    (13, 'Groceries', 13),
    (14, 'Health care', 14),
    (15, 'Hygiene', 15),
    (16, 'Other', 16),
    (17, 'Transport', 17),
    (18, 'Sport', 18);