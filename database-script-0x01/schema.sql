CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE status AS ENUM ('pending', 'confirmed', 'cancelled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

CREATE TABLE users (
    user_id BYTEA PRIMARY KEY NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    password_hash VARCHAR(128) NOT NULL,
    phone_number VARCHAR(15),
    user_role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE properties(
    property_id BYTEA PRIMARY KEY NOT NULL,
    host_id BYTEA NOT NULL,
    name VARCHAR(256) NOT NULL,
    description TEXT NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    location VARCHAR(256) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_host
        FOREIGN KEY (host_id)
        REFERENCES Users(user_id)
);

CREATE TABLE bookings (
    booking_id BYTEA PRIMARY KEY NOT NULL,
    user_id BYTEA  NOT NULL,
    property_id BYTEA NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status  "status" NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id),
    CONSTRAINT fk_property
        FOREIGN KEY (property_id)
        REFERENCES Properties(property_id)
);

CREATE TABLE payments(
    payment_id BYTEA PRIMARY KEY NOT NULL,
    booking_id BYTEA NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method payment_method NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking
        FOREIGN KEY (booking_id)
        REFERENCES Bookings(booking_id)
);

CREATE TABLE reviews (
    review_id BYTEA PRIMARY KEY NOT NULL,
    property_id BYTEA NOT NULL,
    user_id BYTEA NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property
        FOREIGN KEY (property_id)
        REFERENCES Properties(property_id),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
);

CREATE TABLE messages (
    message_id BYTEA PRIMARY KEY NOT NULL,
    sender_id BYTEA  NOT NULL,
    recipient_id BYTEA  NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender
        FOREIGN KEY (sender_id)
        REFERENCES Users(user_id),
    CONSTRAINT fk_recipient
        FOREIGN KEY (recipient_id)
        REFERENCES Users(user_id)
);

CREATE INDEX idx_user_email ON Users(email);

CREATE INDEX idx_property_id ON Properties(property_id);
Create INDEX idx_book_propertyid ON Bookings(property_id);

CREATE INDEX idx_booking_id ON Bookings(booking_id);
CREATE INDEX idx_Payment_bookid ON Payments(booking_id);


CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = CURRENT_TIMESTAMP;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER update_users_timestamp
BEFORE UPDATE ON Users
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_properties_timestamp
BEFORE UPDATE ON Properties
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_bookings_timestamp
BEFORE UPDATE ON Bookings
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_reviews_timestamp
BEFORE UPDATE ON Reviews
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();
