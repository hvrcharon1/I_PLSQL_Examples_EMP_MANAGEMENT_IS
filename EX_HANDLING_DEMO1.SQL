SET SERVEROUTPUT ON
BEGIN
   UPDATE EMPLOYEES SET DEPARTMENT_ID = 10, HIRE_DATE = NULL WHERE EMPLOYEE_ID = 120;

EXCEPTION
   WHEN OTHERS THEN
    IF  SQLCODE = -2291 THEN  -- parent not found 
     DBMS_OUTPUT.PUT_LINE('Department Id is not found');
    ELSEIF SQLCODE = -1407 THEN  -- null value in not null column
     DBMS_OUTPUT.PUT_LINE('Null is not allowed in HIRE_DATE');
    ELSE
     DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
    END IF; 
END;   
