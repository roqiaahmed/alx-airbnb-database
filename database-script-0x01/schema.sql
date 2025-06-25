CREATE TABLE Users (
    user_id BINARY(16) PRIMARY KEY NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    password_hash VARCHAR(128) NOT NULL,
    phone_number VARCHAR(15),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE Properties(
    property_id BINARY(16) PRIMARY KEY NOT NULL,
    host_id BINARY(16) FOREIGN KEY REFERENCES Users(user_id) NOT NULL,
    name VARCHAR(256) NOT NULL,
    description TEXT NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    location VARCHAR(256) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE Bookings (
    booking_id BINARY(16) PRIMARY KEY NOT NULL,
    user_id BINARY(16) FOREIGN KEY REFERENCES Users(user_id) NOT NULL,
    property_id BINARY(16) FOREIGN KEY REFERENCES Properties(property_id) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE Payments(
    payment_id BINARY(16) PRIMARY KEY NOT NULL,
    booking_id BINARY(16) FOREIGN KEY REFERENCES Bookings(booking_id) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
)

CREATE TABLE Reviews (
    review_id BINARY(16) PRIMARY KEY NOT NULL,
    property_id BINARY(16) FOREIGN KEY REFERENCES Properties(property_id) NOT NULL,
    user_id BINARY(16) FOREIGN KEY REFERENCES Users(user_id) NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE Messages (
    message_id BINARY(16) PRIMARY KEY NOT NULL,
    sender_id BINARY(16) FOREIGN KEY REFERENCES Users(user_id) NOT NULL,
    recipient_id BINARY(16) FOREIGN KEY REFERENCES Users(user_id) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
)

CREATE INDEX idx_user_email ON Users(email);

CREATE INDEX idx_property_id ON Properties(property_id);
Create INDEX idx_property_id ON Bookings(property_id);

CREATE INDEX idx_booking_id ON Bookings(booking_id);
CREATE INDEX idx_booking_id ON Payments(booking_id);
