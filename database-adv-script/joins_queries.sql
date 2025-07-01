SELECT * 
FROM users 
INNER JOIN bookings ON users.user_id = bookings.user_id;


SELECT * 
FROM Properties 
LEFT JOIN Reviews ON Reviews.property_id = Properties.property_id;

SELECT * 
FROM users 
FULL OUTER JOIN bookings 
ON users.user_id = bookings.user_id;
