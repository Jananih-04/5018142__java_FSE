CREATE OR REPLACE PROCEDURE UpdateSalary(p_employee_id IN NUMBER, p_percentage IN NUMBER) IS
    employee_not_found EXCEPTION;
    pragma exception_init(employee_not_found, -20001);
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_percentage / 100)
    WHERE EmployeeID = p_employee_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE employee_not_found;
    ELSE
        COMMIT;
    END IF;
EXCEPTION
    WHEN employee_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateSalary;
