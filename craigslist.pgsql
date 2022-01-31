DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE subregions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    subregions INTEGER REFERENCES subregions
);

CREATE TABLE subcategories (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    subcategories INTEGER REFERENCES subcategories
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    region INTEGER REFERENCES regions NOT NULL,
    location INTEGER REFERENCES subregions,
    posts INTEGER DEFAULT 0
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    region INTEGER REFERENCES regions NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    username INTEGER REFERENCES users(id) NOT NULL,
    location INTEGER REFERENCES subregions NOT NULL,
    category INTEGER REFERENCES category NOT NULL,
    subcategory INTEGER REFERENCES subcategories
);