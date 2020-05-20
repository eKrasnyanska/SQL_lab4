--Function return Film name and Company with defined genre and budget--
--Firstly run this block--
CREATE TYPE film_row AS OBJECT (
    film_name_p VARCHAR2(50),
    film_company_p VARCHAR2(50)
)

--After that run this block--
CREATE TYPE film_list_type IS TABLE OF film_row

--Generate function--
CREATE OR REPLACE FUNCTION GetFilmList (
    film_genre films_review.genre%type,
    film_budget films_review.budget%type
) RETURN film_list_type
AS
    result_films film_list_type := film_list_type();
BEGIN
    for cursor IN (
                    SELECT film, company
                    FROM films_review
                    WHERE budget > film_budget AND genre = film_genre
                )
    LOOP
        result_films.extend;
        result_films(result_films.last) := film_row(cursor.film, cursor.company);              
    END LOOP;
    RETURN result_films;
END;