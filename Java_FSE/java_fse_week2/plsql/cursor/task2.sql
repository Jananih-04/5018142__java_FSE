DECLARE
    CURSOR c_accounts IS
        SELECT AccountID, Balance
        FROM Accounts;
    v_annual_fee CONSTANT NUMBER := 50;
BEGIN
    FOR account_rec IN c_accounts LOOP
        UPDATE Accounts
        SET Balance = Balance - v_annual_fee
        WHERE AccountID = account_rec.AccountID;
    END LOOP;
    COMMIT;
END;
