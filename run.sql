SET SERVEROUTPUT ON;

DECLARE
    cursor c1 is 
    select film_name_p as f, film_company_p as c
    from table(GetFilmList('Adventure', 100000));
BEGIN 
    DBMS_OUTPUT.enable;
    DBMS_OUTPUT.put_line('Demonstration of how the procedure RemoveGenre works correctly');
    DBMS_OUTPUT.put_line('*****');
    RemoveGenre('Bob', 'Comedy');
    DBMS_OUTPUT.put_line('---------------------------------------------------------------');
    DBMS_OUTPUT.put_line('Demonstration of exception in the procedure RemoveGenre');
    DBMS_OUTPUT.put_line('*****');
    RemoveGenre('Bob', 'Horror');
    DBMS_OUTPUT.put_line('---------------------------------------------------------------');
    DBMS_OUTPUT.put_line('Demonstration of how the function GetFilmList works');
    DBMS_OUTPUT.put_line('*****');
    FOR iter IN c1
    LOOP
        DBMS_OUTPUT.put_line('Film name ' || iter.f || ', company ' || iter.c);
    END LOOP;
END;