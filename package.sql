--Firstly compile this--
CREATE OR REPLACE package demo_package is
    PROCEDURE RemoveGenre (p_name people.people_name%type,
    p_genre genre.genre_name%type);
    
    FUNCTION SelectFilm (p_budget films_review.budget%type,
    p_genre films_review.genre%type) RETURN VARCHAR2;
END demo_package;

--------------------------------------------------------------

--Then compile this block--
CREATE OR REPLACE package body demo_package is
    PROCEDURE RemoveGenre (
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
    
    FUNCTION SelectFilm (
    p_budget films_review.budget%type,
    p_genre films_review.genre%type
    )
    RETURN VARCHAR2
    IS 
        v_film VARCHAR2(50);
    BEGIN
        SELECT film INTO v_film
        FROM films_review
        WHERE budget > p_budget AND genre = p_genre;
        RETURN v_film;   
    EXCEPTION
        WHEN NO_DATA_FOUND 
        THEN DBMS_OUTPUT.PUT_LINE('Film with this budget or genre not found!');
        v_film := 'Function finished';
        RETURN v_film;
    END;
END demo_package;

-------------------------------------------------------------------
--If you need you can drop function and procedure outside package--
DROP PROCEDURE RemoveGenre; 
DROP FUNCTION SelectFilm;