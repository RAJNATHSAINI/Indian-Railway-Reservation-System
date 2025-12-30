-- Confirmed tickets
SELECT * FROM ticket WHERE status='CONFIRMED';

-- Waiting list passengers
SELECT passenger_id FROM ticket WHERE status='WAITING';

-- Revenue
SELECT SUM(amount) FROM payment;

-- Train source to destination
SELECT t.train_name, s1.station_name AS source, s2.station_name AS destination
FROM train t
JOIN station s1 ON t.source_station = s1.station_id
JOIN station s2 ON t.destination_station = s2.station_id;
