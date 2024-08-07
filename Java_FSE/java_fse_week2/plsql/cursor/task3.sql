DECLARE
    CURSOR c_loans IS
        SELECT LoanID, InterestRate
        FROM Loans;
    v_new_interest_rate CONSTANT NUMBER := 4.5; -- example new rate
BEGIN
    FOR loan_rec IN c_loans LOOP
        UPDATE Loans
        SET InterestRate = v_new_interest_rate
        WHERE LoanID = loan_rec.LoanID;
    END LOOP;
    COMMIT;
END;
