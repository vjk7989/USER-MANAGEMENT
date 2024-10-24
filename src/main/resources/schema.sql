CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    password TEXT,
    role TEXT
);

CREATE TABLE software (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    access_levels TEXT
);

CREATE TABLE requests (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    software_id INTEGER REFERENCES software(id),
    access_type TEXT,
    reason TEXT,
    status TEXT
);
