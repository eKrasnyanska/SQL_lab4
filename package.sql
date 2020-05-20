--Firstly compile this--
CREATE OR REPLACE package film_package is
    PROCEDURE RemoveGenre (p_name people.people_name%type,
    p_genre genre.genre_name%type);
    
    TYPE film_row IS RECORD (
    film_name_p films_review.film%type,
    film_company_p films_review.company%type
    );

    TYPE film_list_type IS TABLE OF film_row;

    FUNCTION GetFilmList (
    film_genre films_review.genre%type,
    film_budget films_review.budget%type
    ) RETURN film_list_type
    pipelined;
END film_package;

--------------------------------------------------------------

--Then compile this block--
CREATE OR REPLACE package body film_package is
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
    
    FUNCTION GetFilmList (
        film_genre films_review.genre%type,
        film_budget films_review.budget%type
    ) RETURN film_list_type
    pipelined
    IS 
    BEGIN
        for iter in (
            SELECT film, company
            FROM films_review
            WHERE budget > film_budget AND genre = film_genre
        )
        LOOP 
            pipe row(iter);
        END LOOP;
    END;   
END film_package;

-- TEST Package------
--select * from table(film_package.GetFilmList('Adventure', 100000));
--
--begin 
--    film_package.RemoveGenre('Bob', 'Horror');
--end;

-------------------------------------------------------------------
--If you need you can drop function and procedure outside package--
DROP PROCEDURE RemoveGenre; 
DROP FUNCTION GetFilmList;