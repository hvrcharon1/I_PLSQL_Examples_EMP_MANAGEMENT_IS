SALARY_HISTORY TABLE

Name        Null Type      
----------- ---- --------- 
EMPLOYEE_ID      NUMBER(5) 
OLD_SALARY       NUMBER(5) 
NEW_SALARY       NUMBER(5) 
CHANGED          DATE  

----------------------------------------------------------

CREATE OR REPLACE TRIGGER EMPLOYEES_SALARY_LOG 
AFTER UPDATE OF SALARY ON EMPLOYEES 
FOR EACH ROW 
WHEN (old.salary <> new.salary) 
BEGIN
   INSERT INTO SALARY_HISTORY VALUES(:old.EMPLOYEE_ID,:old.SALARY, :new.SALARY, SYSDATE);
END;


