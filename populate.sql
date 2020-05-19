---------------------------
-- Populate Country table
---------------------------
INSERT INTO Country(c_code)
VALUES('USA');
INSERT INTO Country(c_code)
VALUES('UK');
INSERT INTO Country(c_code)
VALUES('UA');
---------------------------
-- Populate Company table
---------------------------
INSERT INTO Company(company_name, country_c_code)
VALUES('Columbia Pictures Corporation', 'USA');
INSERT INTO Company(company_name, country_c_code)
VALUES('Hemdale', 'UK');
INSERT INTO Company(company_name, country_c_code)
VALUES('Walt Disney Pictures', 'USA');
---------------------------
-- Populate Film table
---------------------------
INSERT INTO Film(film_name, director, release_date, budget)
VALUES('Stand by Me', 'Rob Reiner', '1986-10-12', 8000000);
INSERT INTO Film(film_name, director, release_date, budget)
VALUES('Aliens', 'James Cameron', '1990-07-10', 18500000);
INSERT INTO Film(film_name, director, release_date, budget)
VALUES('Howard the Duck', 'Willard Huyck', '1989-04-30', 35000000);
---------------------------
-- Populate Genre table
---------------------------
INSERT INTO Genre(genre_name)
VALUES('Horror');
INSERT INTO Genre(genre_name)
VALUES('Adventure');
INSERT INTO Genre(genre_name)
VALUES('Comedy');
---------------------------
-- Populate People table
---------------------------
INSERT INTO People(people_name)
VALUES('Bob');
INSERT INTO People(people_name)
VALUES('Boba');
INSERT INTO People(people_name)
VALUES('Boban');
---------------------------
-- Populate Film_rental table
---------------------------
INSERT INTO Film_rental(income, date_point, film_film_name, film_director)
VALUES(16000000, 2020, 'Stand by Me', 'Rob Reiner');
INSERT INTO Film_rental(income, date_point, film_film_name, film_director)
VALUES(37000000, 2020, 'Aliens', 'James Cameron');
INSERT INTO Film_rental(income, date_point, film_film_name, film_director)
VALUES(45000000, 2020, 'Howard the Duck', 'Willard Huyck');
---------------------------
-- Populate Film_Genre table
---------------------------
INSERT INTO Film_Genre(genre_genre_name, film_film_name, film_director)
VALUES('Adventure', 'Stand by Me', 'Rob Reiner');
INSERT INTO Film_Genre(genre_genre_name, film_film_name, film_director)
VALUES('Horror', 'Aliens', 'James Cameron');
INSERT INTO Film_Genre(genre_genre_name, film_film_name, film_director)
VALUES('Comedy', 'Howard the Duck', 'Willard Huyck');
---------------------------
-- Populate Company_Film table
---------------------------
INSERT INTO Company_Film(company_company_name, company_country_c_code, film_film_name, film_director)
VALUES('Hemdale', 'UK', 'Stand by Me', 'Rob Reiner');
INSERT INTO Company_Film(company_company_name, company_country_c_code, film_film_name, film_director)
VALUES('Columbia Pictures Corporation', 'USA', 'Aliens', 'James Cameron');
INSERT INTO Company_Film(company_company_name, company_country_c_code, film_film_name, film_director)
VALUES('Walt Disney Pictures', 'USA', 'Howard the Duck', 'Willard Huyck');
---------------------------
-- Populate Preferences table
---------------------------
INSERT INTO Preferences(people_people_name, genre_genre_name)
VALUES('Bob', 'Comedy');
INSERT INTO Preferences(people_people_name, genre_genre_name)
VALUES('Boba', 'Adventure');
INSERT INTO Preferences(people_people_name, genre_genre_name)
VALUES('Boban', 'Horror');

