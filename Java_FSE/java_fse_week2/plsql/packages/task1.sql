CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER);
    PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER);
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/
CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
    PROCEDURE AddCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER) IS
    BEGIN
        INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
        VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);
        COMMIT;
    END AddCustomer;

    PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER) IS
    BEGIN
        UPDATE Customers
        SET Name = p_name, DOB = p_dob, Balance = p_balance, LastModified = SYSDATE
        WHERE CustomerID = p_customer_id;
        COMMIT;
    END UpdateCustomerDetails;

    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT Balance INTO v_balance
        FROM Customers
        WHERE CustomerID = p_customer_id;
        RETURN v_balance;
    END GetCustomerBalance;
END CustomerManagement;
