CREATE EXTENSION IF NOT EXISTS 'uuid-ossp';
CREATE TABLE IF NOT EXISTS users(
       id UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
       email_address VARCHAR NOT NULL UNIQUE CHECK(email_address <> ''),
       name VARCHAR NOT NULL UNIQUE CHECK(name <> ''),
       created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
