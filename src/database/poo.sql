-- Active: 1698700533939@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL
);

CREATE TABLE accounts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    owner_id TEXT NOT NULL,
    balance REAL DEFAULT (0) NOT NULL,
    created_at TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO users (id, name, email, password, created_at)
VALUES
	('u001', 'Fulano', 'fulano@email.com', 'fulano123', '2023-10-30T21:15:45.120Z'),
	('u002', 'Beltrana', 'beltrana@email.com', 'beltrana00', '2023-10-30T21:16:20.420Z');

INSERT INTO accounts (id, owner_id, created_at)
VALUES
	('a001', 'u001', '2023-10-30T20:17:21.321'),
	('a002', 'u002', '2023-10-30T20:18:31.456');
