CREATE OR REPLACE FUNCTION SelectFilm (
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