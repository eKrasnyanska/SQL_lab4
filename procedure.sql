create or replace PROCEDURE RemoveGenre (
    p_name people.people_name%type,
    p_genre genre.genre_name%type
)
IS 
   v_name people.people_name%type;
   v_genre genre.genre_name%type;
BEGIN
    SELECT people_people_name, genre_genre_name INTO v_name, v_genre 
    FROM Preferences
    WHERE people_people_name = p_name 
    AND genre_genre_name = p_genre;
    
    DELETE FROM Preferences
    WHERE people_people_name = p_name 
    AND genre_genre_name = p_genre;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('The row removed correctly.');
    DBMS_OUTPUT.PUT_LINE('The result can be found in the Preferences table.');
EXCEPTION
    WHEN NO_DATA_FOUND 
    THEN DBMS_OUTPUT.PUT_LINE('People or genre not found!');
END;