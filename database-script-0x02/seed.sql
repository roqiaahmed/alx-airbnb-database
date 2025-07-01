-- Insert sample data for Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, user_role) VALUES
(decode('550e8400e29b41d4a716446655440000', 'hex'), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+12345678901', 'guest'),
(decode('550e8400e29b41d4a716446655440001', 'hex'), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+12345678902', 'host'),
(decode('550e8400e29b41d4a716446655440002', 'hex'), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '+12345678903', 'admin'),
(decode('550e8400e29b41d4a716446655440003', 'hex'), 'Bob', 'Williams', 'bob.williams@example.com', 'hashed_password_4', '+12345678904', 'guest'),
(decode('550e8400e29b41d4a716446655440004', 'hex'), 'Emma', 'Brown', 'emma.brown@example.com', 'hashed_password_5', '+12345678905', 'host');

-- Insert sample data for Properties
INSERT INTO Properties (property_id, host_id, name, description, price_per_night, location) VALUES
(decode('660e8400e29b41d4a716446655440000', 'hex'), decode('550e8400e29b41d4a716446655440001', 'hex'), 'Cozy Beach House', 'A beautiful beachfront property with stunning views.', 150.00, '123 Ocean Drive, Miami, FL'),
(decode('660e8400e29b41d4a716446655440001', 'hex'), decode('550e8400e29b41d4a716446655440004', 'hex'), 'Mountain Cabin', 'A rustic cabin in the mountains, perfect for a getaway.', 120.00, '456 Pine Road, Aspen, CO'),
(decode('660e8400e29b41d4a716446655440002', 'hex'), decode('550e8400e29b41d4a716446655440001', 'hex'), 'City Apartment', 'Modern apartment in the heart of the city.', 200.00, '789 Downtown Ave, New York, NY');

-- Insert sample data for Bookings
INSERT INTO Bookings (booking_id, user_id, property_id, start_date, end_date, total_price, status) VALUES
(decode('770e8400e29b41d4a716446655440000', 'hex'), decode('550e8400e29b41d4a716446655440000', 'hex'), decode('660e8400e29b41d4a716446655440000', 'hex'), '2025-07-01', '2025-07-05', 600.00, 'confirmed'),
(decode('770e8400e29b41d4a716446655440001', 'hex'), decode('550e8400e29b41d4a716446655440003', 'hex'), decode('660e8400e29b41d4a716446655440001', 'hex'), '2025-08-10', '2025-08-15', 600.00, 'pending'),
(decode('770e8400e29b41d4a716446655440002', 'hex'), decode('550e8400e29b41d4a716446655440000', 'hex'), decode('660e8400e29b41d4a716446655440002', 'hex'), '2025-09-01', '2025-09-03', 400.00, 'cancelled');

-- Insert sample data for Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method, payment_date) VALUES
(decode('880e8400e29b41d4a716446655440000', 'hex'), decode('770e8400e29b41d4a716446655440000', 'hex'), 600.00, 'credit_card', '2025-06-20 10:00:00'),
(decode('880e8400e29b41d4a716446655440001', 'hex'), decode('770e8400e29b41d4a716446655440001', 'hex'), 600.00, 'paypal', '2025-08-01 12:00:00');

-- Insert sample data for Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment) VALUES
(decode('990e8400e29b41d4a716446655440000', 'hex'), decode('660e8400e29b41d4a716446655440000', 'hex'), decode('550e8400e29b41d4a716446655440000', 'hex'), 5, 'Amazing stay, loved the beach view!'),
(decode('990e8400e29b41d4a716446655440001', 'hex'), decode('660e8400e29b41d4a716446655440001', 'hex'), decode('550e8400e29b41d4a716446655440003', 'hex'), 4, 'Great cabin, very cozy but a bit remote.'),
(decode('990e8400e29b41d4a716446655440002', 'hex'), decode('660e8400e29b41d4a716446655440002', 'hex'), decode('550e8400e29b41d4a716446655440000', 'hex'), 3, 'Nice apartment, but noisy neighborhood.');

-- Insert sample data for Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body) VALUES
(decode('aa0e8400e29b41d4a716446655440000', 'hex'), decode('550e8400e29b41d4a716446655440000', 'hex'), decode('550e8400e29b41d4a716446655440001', 'hex'), 'Hi, is the beach house available for July?'),
(decode('aa0e8400e29b41d4a716446655440001', 'hex'), decode('550e8400e29b41d4a716446655440001', 'hex'), decode('550e8400e29b41d4a716446655440000', 'hex'), 'Yes, it’s available! Let me know if you want to book.'),
(decode('aa0e8400e29b41d4a716446655440002', 'hex'), decode('550e8400e29b41d4a716446655440003', 'hex'), decode('550e8400e29b41d4a716446655440004', 'hex'), 'Can you confirm the amenities for the mountain cabin?');
