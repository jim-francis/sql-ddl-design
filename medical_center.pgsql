DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    contact_num TEXT NOT NULL
);

CREATE TABLE conditions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE insurance_co (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    has_copay BOOLEAN NOT NULL,
    in_network BOOLEAN NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    dob TEXT NOT NULL,
    contact_num TEXT NOT NULL,
    insurance INTEGER references insurance_co(id),
    conditions INTEGER references conditions(id)
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    patient INTEGER references patients(id) NOT NULL,
    date_of_visit TEXT NOT NULL,
    attending_physician INTEGER REFERENCES doctors(id) NOT NULL,
    appointment_type TEXT NOT NULL,
    dxs INTEGER REFERENCES conditions(id),
    follow_up_date TEXT
);