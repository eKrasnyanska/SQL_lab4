SET SERVEROUTPUT ON;

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
    DBMS_OUTPUT.put_line('Demonstration of how the function SelectFilm works correctly');
    DBMS_OUTPUT.put_line('*****');
    DBMS_OUTPUT.put_line('The film name is "' || SelectFilm(10000000, 'Comedy') || '"');
    DBMS_OUTPUT.put_line('---------------------------------------------------------------');
    DBMS_OUTPUT.put_line('Demonstration of exception in the function SelectFilm');
    DBMS_OUTPUT.put_line('*****');
    DBMS_OUTPUT.put_line(SelectFilm(10000000, 'Adventure'));
END;