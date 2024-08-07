DECLARE
    CURSOR c_customers IS
        SELECT CustomerID, LoanID, InterestRate
        FROM Customers c JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM c.DOB) > 60;
BEGIN
    FOR customer_rec IN c_customers LOOP
        UPDATE Loans
        SET InterestRate = InterestRate * 0.99
        WHERE LoanID = customer_rec.LoanID;
    END LOOP;
    COMMIT;
END;
