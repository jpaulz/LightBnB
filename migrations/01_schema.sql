DROP TABLE users, properties, reservations, property_reviews;

CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL);

CREATE TABLE properties (
id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
description VARCHAR(255) NOT NULL,
thumbnail_photo_url VARCHAR(255) NOT NULL,
cover_photo_url VARCHAR(255) NOT NULL,
cost_per_night INTEGER NOT NULL,
parking_space INTEGER NOT NULL,
number_of_bathrooms INTEGER NOT NULL,
number_of_bedrooms INTEGER NOT NULL,
country VARCHAR(255) NOT NULL,
street VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
province VARCHAR(255) NOT NULL,
post_code VARCHAR(255) NOT NULL,
active  boolean,
owner_id INTEGER NOT NULL REFERENCES users(id));

CREATE TABLE reservations (
id SERIAL PRIMARY KEY,
start_date INTEGER NOT NULL,
end_date INTEGER NOT NULL,
property_id INTEGER NOT NULL REFERENCES properties(id),
guest_id INTEGER NOT NULL REFERENCES users(id));


CREATE TABLE property_reviews (
id SERIAL PRIMARY KEY,
guest_id INTEGER NOT NULL REFERENCES users(id),
reservation_id INTEGER NOT NULL REFERENCES reservations(id),
property_id INTEGER NOT NULL REFERENCES properties(id),
rating INTEGER NOT NULL,
message VARCHAR(255) NOT NULL);

