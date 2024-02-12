-- CREATE TABLE categories (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     label VARCHAR(67)
-- );

-- CREATE TABLE tones (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     name VARCHAR(7)
-- );

-- CREATE TABLE authors (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     name VARCHAR(97)
-- );

-- CREATE TABLE sheets (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     code VARCHAR(47) NOT NULL,
--     name VARCHAR(97) NOT NULL,
--     author INTEGER DEFAULT NULL,
--     tone INTEGER DEFAULT NULL,
--     favorite CHAR(1) DEFAULT '0',
--     FOREIGN KEY (author) REFERENCES authors(id),
--     FOREIGN KEY (tone) REFERENCES tones(id)
-- );

-- CREATE TABLE sheets_categories (
--     id_sheet INT,
--     id_category INT,
--     PRIMARY KEY (id_sheet , id_category),
--     FOREIGN KEY (id_sheet)
--         REFERENCES sheets (id),
--     FOREIGN KEY (id_category)
--         REFERENCES categories (id)
-- );

-- CREATE TABLE
--   `notes_history` (
--     `id` integer not null primary key autoincrement,
--     `sheet_id` INTEGER not null,
--     `notes` TEXT null,
--     `created_at` datetime not null default CURRENT_TIMESTAMP,
--     FOREIGN KEY (sheet_id) REFERENCES sheets (id)
--   )