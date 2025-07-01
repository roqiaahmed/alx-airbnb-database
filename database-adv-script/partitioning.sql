CREATE TABLE bookings (
    booking_id BYTEA PRIMARY KEY,
    user_id BYTEA NOT NULL,
    property_id BYTEA NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status status NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);


CREATE TABLE booking_january PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE booking_february PARTITION OF bookings
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE booking_july PARTITION OF bookings
    FOR VALUES FROM ('2025-06-01') TO ('2025-07-01');
