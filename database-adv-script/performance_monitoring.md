# performance_monitoring

📊 Performance Monitoring Guide
This document outlines the steps taken to monitor, analyze, and improve the performance of frequently used SQL queries in our PostgreSQL database.

1. 🔍 Monitoring Query Performance
   We used the following PostgreSQL tools to inspect query execution behavior:

EXPLAIN ANALYZE: To view the query plan, execution time, and row estimates.
pg_stat_statements (optional for ongoing profiling): To track the most time-consuming queries over time.

2. 🔥 Bottleneck Identification
   From analyzing key queries, we found:
   | Query | Observation | Bottleneck |
   | -------------------------------------------------------- | ---------------------- | ---------------------------------------- |
   | `SELECT * FROM users;` | Sequential scan used | No filter conditions; index not used |
   | `SELECT * FROM bookings WHERE user_id = ...` | Seq scan despite index | Table is small — planner avoids index |
   | `SELECT * FROM bookings JOIN payments USING(booking_id)` | Slow join | Lack of indexes on join key `booking_id` |

3. 🛠 Optimization Actions
   Based on the findings, we made the following improvements:

✅ Index Added: Created indexes on frequently filtered columns:
✅ Partitioning: Replaced the flat bookings table with a partitioned table by start_date to improve time-based queries.
✅ Query Rewrite: Avoided SELECT \* in favor of selecting only required columns.
