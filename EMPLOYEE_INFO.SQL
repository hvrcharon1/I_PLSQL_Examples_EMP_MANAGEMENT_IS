SET SERVEROUTPUT ON

DECLARE
  V_COUNT NUMBER(2);
  V_SALARY EMPLOYEES.SALARY%TYPE;
  V_NEW_SALARY EMPLOYEES.SALARY%TYPE;
  EMPID CONSTANT NUMBER(5) := 102;
BEGIN
  -- get job history count
  SELECT COUNT(*) INTO V_COUNT FROM JOB_HISTORY WHERE EMPLOYEE_ID = EMPID;
  
  SELECT SALARY INTO V_SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = EMPID;
  -- calculate new salary 
  V_NEW_SALARY := V_SALARY + ( V_SALARY * (V_COUNT * 10) / 100);
  
  DBMS_OUTPUT.PUT_LINE('Job History count  : ' || V_COUNT);
  DBMS_OUTPUT.PUT_LINE('Current salary     : ' || V_SALARY);
  DBMS_OUTPUT.PUT_LINE('New salary         : ' || V_NEW_SALARY);
END;

  
