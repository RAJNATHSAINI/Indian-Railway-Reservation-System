CREATE OR REPLACE TRIGGER seat_assign_trigger
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    IF :NEW.status = 'CONFIRMED' THEN
        :NEW.seat_no := NVL(
            (SELECT MAX(seat_no) FROM ticket WHERE train_id = :NEW.train_id),
            0
        ) + 1;
    ELSE
        :NEW.seat_no := 0;
    END IF;
END;
/
