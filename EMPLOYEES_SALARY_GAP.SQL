SALARY_HISTORY TABLE  

Name        Null Type      
----------- ---- --------- 
EMPLOYEE_ID      NUMBER(5) 
OLD_SALARY       NUMBER(5) 
NEW_SALARY       NUMBER(5) 
CHANGED          DATE  

-------------------------------------------------------------------
CREATE OR REPLACE TRIGGER EMPLOYEES_SALARY_GAP
before UPDATE OF SALARY ON EMPLOYEES 
FOR EACH ROW 
WHEN (old.salary <> new.salary) 
DECLARE
  V_CHANGED DATE;
  INVALID_CHANGE EXCEPTION;
BEGIN
    SELECT MAX(CHANGED) INTO V_CHANGED FROM SALARY_HISTORY WHERE EMPLOYEE_ID = :new.EMPLOYEE_ID;
    
    IF V_CHANGED IS NOT NULL THEN
         IF  MONTHS_BETWEEN(SYSDATE,V_CHANGED) < 3 THEN
             RAISE INVALID_CHANGE;
         END IF;
    ELSE
         IF MONTHS_BETWEEN(SYSDATE, :new.HIRE_DATE) < 3 THEN
             RAISE INVALID_CHANGE;
         END IF;             
    END IF;         
         
EXCEPTION
    WHEN INVALID_CHANGE THEN
      RAISE_APPLICATION_ERROR(-20222,'Salary cannot be changed within 3 months of previous change');             
    
END;
