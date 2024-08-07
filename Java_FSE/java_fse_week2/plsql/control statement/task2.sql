DECLARE
    CURSOR c_customers IS
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000;
BEGIN
    FOR customer_rec IN c_customers LOOP
        UPDATE Customers
        SET IsVIP = TRUE
        WHERE CustomerID = customer_rec.CustomerID;
    END LOOP;
    COMMIT;
END;
