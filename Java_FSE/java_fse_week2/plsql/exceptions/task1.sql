CREATE OR REPLACE PROCEDURE SafeTransferFunds(p_from_account IN NUMBER, p_to_account IN NUMBER, p_amount IN NUMBER) IS
    insufficient_funds EXCEPTION;
    pragma exception_init(insufficient_funds, -20001);
BEGIN
    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from_account;

    IF SQL%ROWCOUNT = 0 OR SQL%NOTFOUND THEN
        RAISE insufficient_funds;
    END IF;

    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to_account;

    IF SQL%ROWCOUNT = 0 THEN
        ROLLBACK;
        RAISE insufficient_funds;
    ELSE
        COMMIT;
    END IF;
EXCEPTION
    WHEN insufficient_funds THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds or invalid account.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END SafeTransferFunds;
