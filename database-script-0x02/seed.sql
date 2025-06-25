-- Insert sample data for Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
(UNHEX('550e8400e29b41d4a716446655440000'), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+12345678901', 'guest'),
(UNHEX('550e8400e29b41d4a716446655440001'), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+12345678902', 'host'),
(UNHEX('550e8400e29b41d4a716446655440002'), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '+12345678903', 'admin'),
(UNHEX('550e8400e29b41d4a716446655440003'), 'Bob', 'Williams', 'bob.williams@example.com', 'hashed_password_4', '+12345678904', 'guest'),
(UNHEX('550e8400e29b41d4a716446655440004'), 'Emma', 'Brown', 'emma.brown@example.com', 'hashed_password_5', '+12345678905', 'host');

-- Insert sample data for Properties
INSERT INTO Properties (property_id, host_id, name, description, price_per_night, location) VALUES
(UNHEX('660e8400e29b41d4a716446655440000'), UNHEX('550e8400e29b41d4a716446655440001'), 'Cozy Beach House', 'A beautiful beachfront property with stunning views.', 150.00, '123 Ocean Drive, Miami, FL'),
(UNHEX('660e8400e29b41d4a716446655440001'), UNHEX('550e8400e29b41d4a716446655440004'), 'Mountain Cabin', 'A rustic cabin in the mountains, perfect for a getaway.', 120.00, '456 Pine Road, Aspen, CO'),
(UNHEX('660e8400e29b41d4a716446655440002'), UNHEX('550e8400e29b41d4a716446655440001'), 'City Apartment', 'Modern apartment in the heart of the city.', 200.00, '789 Downtown Ave, New York, NY');

-- Insert sample data for Bookings
INSERT INTO Bookings (booking_id, user_id, property_id, start_date, end_date, total_price, status) VALUES
(UNHEX('770e8400e29b41d4a716446655440000'), UNHEX('550e8400e29b41d4a716446655440000'), UNHEX('660e8400e29b41d4a716446655440000'), '2025-07-01', '2025-07-05', 600.00, 'confirmed'),
(UNHEX('770e8400e29b41d4a716446655440001'), UNHEX('550e8400e29b41d4a716446655440003'), UNHEX('660e8400e29b41d4a716446655440001'), '2025-08-10', '2025-08-15', 600.00, 'pending'),
(UNHEX('770e8400e29b41d4a716446655440002'), UNHEX('550e8400e29b41d4a716446655440000'), UNHEX('660e8400e29b41d4a716446655440002'), '2025-09-01', '2025-09-03', 400.00, 'cancelled');

-- Insert sample data for Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method, payment_date) VALUES
(UNHEX('880e8400e29b41d4a716446655440000'), UNHEX('770e8400e29b41d4a716446655440000'), 600.00, 'credit_card', '2025-06-20 10:00:00'),
(UNHEX('880e8400e29b41d4a716446655440001'), UNHEX('770e8400e29b41d4a716446655440001'), 600.00, 'paypal', '2025-08-01 12:00:00');

-- Insert sample data for Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment) VALUES
(UNHEX('990e8400e29b41d4a716446655440000'), UNHEX('660e8400e29b41d4a716446655440000'), UNHEX('550e8400e29b41d4a716446655440000'), 5, 'Amazing stay, loved the beach view!'),
(UNHEX('990e8400e29b41d4a716446655440001'), UNHEX('660e8400e29b41d4a716446655440001'), UNHEX('550e8400e29b41d4a716446655440003'), 4, 'Great cabin, very cozy but a bit remote.'),
(UNHEX('990e8400e29b41d4a716446655440002'), UNHEX('660e8400e29b41d4a716446655440002'), UNHEX('550e8400e29b41d4a716446655440000'), 3, 'Nice apartment, but noisy neighborhood.');

-- Insert sample data for Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body) VALUES
(UNHEX('aa0e8400e29b41d4a716446655440000'), UNHEX('550e8400e29b41d4a716446655440000'), UNHEX('550e8400e29b41d4a716446655440001'), 'Hi, is the beach house available for July?'),
(UNHEX('aa0e8400e29b41d4a716446655440001'), UNHEX('550e8400e29b41d4a716446655440001'), UNHEX('550e8400e29b41d4a716446655440000'), 'Yes, it’s available! Let me know if you want to book.'),
(UNHEX('aa0e8400e29b41d4a716446655440002'), UNHEX('550e8400e29b41d4a716446655440003'), UNHEX('550e8400e29b41d4a716446655440004'), 'Can you confirm the amenities for the mountain cabin?');