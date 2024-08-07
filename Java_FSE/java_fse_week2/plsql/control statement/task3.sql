DECLARE
    CURSOR c_loans IS
        SELECT c.Name, l.LoanID, l.EndDate
        FROM Customers c JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
    FOR loan_rec IN c_loans LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || loan_rec.Name || ', your loan ID ' || loan_rec.LoanID || ' is due on ' || loan_rec.EndDate);
    END LOOP;
END;
