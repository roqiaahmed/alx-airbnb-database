
-- find the total number of bookings made by each user
SELECT user_id, COUNT(user_id) AS booking_count
FROM bookings
GROUP BY user_id;


-- rank properties based on the total number of bookings they have received.
SELECT P.*, 
  RANK() OVER(ORDER BY B.bcount DESC) AS rank,
  ROW_NUMBER() OVER(ORDER BY B.bcount DESC) AS row_num
FROM properties P
JOIN (
SELECT property_id, COUNT(*) AS bcount FROM bookings GROUP BY(property_id)
) AS B USING(property_id );
