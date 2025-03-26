CREATE DATABASE parking_db;
DROP TABLE IF EXISTS payment_transactions;
DROP TABLE IF EXISTS parking_sessions;

CREATE TABLE parking_sessions (
    id SERIAL PRIMARY KEY,
    license_plate VARCHAR(20) NOT NULL,
    entry_timestamp TIMESTAMP DEFAULT NOW(),
    exit_timestamp TIMESTAMP NULL,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE payment_transactions (
    id SERIAL PRIMARY KEY,
    parking_session_id INT NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    is_paid BOOLEAN DEFAULT FALSE,
    payment_timestamp TIMESTAMP DEFAULT NOW(),
    payment_source VARCHAR(10) DEFAULT 'gate',
    note TEXT,
    CONSTRAINT fk_parking_session
    FOREIGN KEY(parking_session_id)
    REFERENCES parking_sessions(id)
    ON DELETE CASCADE
);