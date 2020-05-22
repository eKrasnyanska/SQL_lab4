-- Trigger activate when you enter budget less then 1000 -----
-- Version 1 ----------
CREATE OR REPLACE TRIGGER ChangeBudget_pkg_bfr_upd
BEFORE UPDATE
OF budget
ON film
FOR EACH ROW
DECLARE
    my_excep EXCEPTION;
BEGIN
    if (:new.budget <1000) THEN
        DBMS_OUTPUT.put_line('Begin test of trigger');    
        raise my_excep;
    end if;
EXCEPTION
    WHEN my_excep 
    THEN DBMS_OUTPUT.put_line('The budget is less then 1000');    
END;

-- Version 2 ---------- Updating don't finished -- 
--CREATE OR REPLACE TRIGGER ChangeBudget_pkg_bfr_upd
--BEFORE UPDATE
--OF budget
--ON film
--FOR EACH ROW
--
--DECLARE
--    my_excep EXCEPTION;
--    PRAGMA EXCEPTION_INIT( my_excep, -20099 );
--BEGIN
--    if (:new.budget <1000) THEN
--        DBMS_OUTPUT.put_line('Begin test of trigger');
--        DBMS_OUTPUT.put_line('You enter budget less then 1000');
--        RAISE_APPLICATION_ERROR( -20099,'The budget is less then 1000');
--    end if;
--END;


--- Code for testing triggers ----
--begin
--    UPDATE film
--    set budget = 100
--    where film_name = 'Stand by Me' and director = 'Rob Reiner';
--EXCEPTION 
--    WHEN OTHERS
--    THEN DBMS_OUTPUT.put_line('Error by updating. Operation canceled');
--end;