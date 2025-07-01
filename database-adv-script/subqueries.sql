-- Get all properties where the average rating is greater than 4.0 using a subquery.
SELECT p.*
FROM Properties p
JOIN (
    SELECT property_id, AVG(rating) AS avg_rating
    FROM Reviews
    GROUP BY property_id
) AS avgrating ON p.property_id = avgrating.property_id
WHERE avgrating.avg_rating > 4.0;


-- Get users who have made more than 3 bookings.

SELECT u.*
FROM users u
JOIN (
    SELECT user_id, COUNT(*) AS booking_count
    FROM bookings
    GROUP BY user_id
) AS bookingcount ON bookingcount.user_id = u.user_id
WHERE bookingcount.booking_count > 3;
