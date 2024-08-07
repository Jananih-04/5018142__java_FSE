DECLARE
    CURSOR c_transactions IS
        SELECT CustomerID, AccountID, TransactionDate, Amount, TransactionType
        FROM Transactions
        WHERE TransactionDate BETWEEN TRUNC(SYSDATE, 'MM') AND LAST_DAY(SYSDATE);
BEGIN
    FOR trans_rec IN c_transactions LOOP
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || trans_rec.CustomerID || ', Account ID: ' || trans_rec.AccountID || ', Date: ' || trans_rec.TransactionDate || ', Amount: ' || trans_rec.Amount || ', Type: ' || trans_rec.TransactionType);
    END LOOP;
END;
