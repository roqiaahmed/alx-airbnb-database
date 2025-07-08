-- retrieves all bookings along with the user details, property details, and payment details 

EXPLAIN SELECT   
  u.first_name || ' ' || u.last_name AS user_name,
  u.email,
  p.name AS property_name,
  p.location,
  b.start_date,
  b.end_date,
  b.status,
  pay.amount AS payment_amount,
  pay.payment_method,
  pay.payment_date
FROM bookings b
JOIN users u USING(user_id )
JOIN properties p USING(property_id)
JOIN payments pay USING(booking_id);
