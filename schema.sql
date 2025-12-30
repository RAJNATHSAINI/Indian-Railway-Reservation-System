-- STATION TABLE
CREATE TABLE station (
    station_id NUMBER PRIMARY KEY,
    station_name VARCHAR2(30),
    city VARCHAR2(30)
);

-- TRAIN TABLE
CREATE TABLE train (
    train_id NUMBER PRIMARY KEY,
    train_name VARCHAR2(40),
    source_station NUMBER,
    destination_station NUMBER,
    total_seats NUMBER,
    FOREIGN KEY (source_station) REFERENCES station(station_id),
    FOREIGN KEY (destination_station) REFERENCES station(station_id)
);

-- PASSENGER TABLE
CREATE TABLE passenger (
    passenger_id NUMBER PRIMARY KEY,
    passenger_name VARCHAR2(30),
    age NUMBER,
    gender VARCHAR2(10)
);

-- TICKET TABLE
CREATE TABLE ticket (
    ticket_id NUMBER PRIMARY KEY,
    train_id NUMBER,
    passenger_id NUMBER,
    journey_date DATE,
    seat_no NUMBER,
    status VARCHAR2(10),
    FOREIGN KEY (train_id) REFERENCES train(train_id),
    FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
);

-- PAYMENT TABLE
CREATE TABLE payment (
    payment_id NUMBER PRIMARY KEY,
    ticket_id NUMBER,
    amount NUMBER,
    payment_mode VARCHAR2(20),
    payment_date DATE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id)
);
