SET SERVEROUTPUT ON;

DECLARE
    v_film VARCHAR2(50);
    v_company VARCHAR2(50);
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
    select * into v_film, v_company from table(GetFilmList('Adventure', 100000));
    DBMS_OUTPUT.put_line('Film name ' || v_film || ', company ' || v_company);
END;