# 'USE WORLD' is used at the start of the SQL page to let the following
# SQL statements know which database we are using. 
# USE WORLD may have been repeated below if this file/MYSQL has been closed 
# and reopened.
USE WORLD;

#Task 1: Using count, get the number of cities in the USA
USE world;
SELECT COUNT(*) AS Number_of_Cities_in_USA FROM City
	WHERE CountryCode = 'USA';

# EXTENSION to Task 1: Using COUNT and GROUP BY to get the number of Cities per 
# District in the USA represented in the data, then ordered by Descending number 
# of cities in each District
SELECT COUNT(*) AS Number_of_cities, District, CountryCode FROM city
	WHERE CountryCode = 'USA'
    GROUP by District
    ORDER BY Number_of_cities DESC;
    
# Task 2: Find out what the population and 
# life expectancy for people in Argentina (ARG) is
SELECT NAME, Population, LifeExpectancy FROM country
WHERE Code ='ARG';

# TASK 3: Using ORDER BY, LIMIT, what country has the 
# highest life expectancy?
SELECT Name, LifeExpectancy FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1; 

# TASK 4: Select 25 cities around the world that start 
# with the letter 'F' in a single SQL query.
SELECT Name, CountryCode FROM city
WHERE Name LIKE 'F%'
LIMIT 25;

# TASK 5: Create a SQL statement to display columns Id, 
# Name, Population from the city table and limit results 
# to first 10 rows only.
SELECT ID, Name, Population FROM city
LIMIT 10;

# TASK 6: Create a SQL statement to find only those 
# cities from city table whose population is larger 
# than 2000000
SELECT Population, Name, CountryCode FROM city
WHERE Population > 2000000
ORDER By Population;

# TASK 7: Create a SQL statement to find all city 
# names from city table whose name begins with “Be” 
# prefix.
SELECT Name, CountryCode FROM city
WHERE Name LIKE 'Be%';

# TASK 8: Create a SQL statement to find only those  
# cities from city table whose population is between 
# 500000-1000000.
SELECT Name, Population FROM city
WHERE Population BETWEEN 500000 AND 1000000
ORDER BY Population DESC, Name;

# TASK 9: Create a SQL statement to find a city 
# with the lowest population in the city table
SELECT Name, Population AS Lowest_Population, CountryCode FROM city
ORDER BY Population ASC
LIMIT 1;

#Alternative way to get the same result of lowest population from city table:
SELECT Name, Population 
FROM city
WHERE Population = (SELECT MIN(Population) FROM city);

# TASK 10: Create a SQL statement to show the population of 
# Switzerland and all the languages spoken there.
SELECT co.Name, cl.CountryCode, GROUP_CONCAT(DISTINCT Language SEPARATOR ', ')  
	AS Languages_Spoken_in_Switzerland, co.Population AS Total_Population 
    FROM country AS co
INNER JOIN countrylanguage AS cl 
	ON co.Code=cl.CountryCode
	WHERE cl.CountryCode = 'CHE' ;
    
#Alternative way to show languages spoken in Switzerland:
 SELECT co.Name,  Language 
	AS Languages_Spoken_in_Switzerland, ROUND(co.Population*(Percentage/100)) AS Population_speaking_language 
    FROM country AS co
INNER JOIN countrylanguage AS cl 
	ON co.Code=cl.CountryCode
	WHERE cl.CountryCode = 'CHE';   
#-----------------------------------------------  
# EXTENSION TASKS:
 
# EXT TASK: Create a SQL statement to show Languages 
# and what countries they are spoken in.
SELECT  cl.Language, GROUP_CONCAT(DISTINCT co.Name SEPARATOR ', ')  
AS Countries_speaking_this_language FROM country AS co
INNER JOIN countrylanguage AS cl 
	ON co.Code=cl.CountryCode
GROUP BY cl.Language;
    
#EXT TASK:The SQL below is a query to find out how many Official languages are spoken
# and their relative percentages in square brackets, as can be seen the  pepercentages 
# do no add up to 100 as there are unofficial languages also spoken
# but not represented below due to the IsOfficial = 'T' condition.To see all 
# Languages This condition can be disables with a '#'
# For each country in the list. GROUP_CONCAT allows me to show the countries as 
# a list all in one row, rather than over many rows. Within that function some 
# formatting is done to make the countries and associated percentage more readable. 

SELECT Name, 
GROUP_CONCAT(' ', Language, ' [', Percentage, '%', ']' ORDER BY Percentage DESC)  
AS 'Languages', COUNT( DISTINCT Language) AS Number_of_Official_languages_Spoken FROM world.countrylanguage
join country ON country.Code = countrylanguage.CountryCode
WHERE Percentage>0 AND IsOfficial = 'T'	
GROUP BY country.Name
Order BY Number_of_Official_languages_Spoken DESC, Name;

#EXT TASK:
#This query returns the number of people speaking a certain language around the world
# The number of people speaking that language per country is aggreagated to give a whole world figure.
SELECT Language, CONCAT(ROUND(SUM((Percentage/100)*Population/(1000))), ' K') AS number_speaking_language_around_the_world  FROM country
join countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE Percentage >0
GROUP BY Language
ORDER BY SUM((Percentage/100)*Population) DESC;

#EXT TASK:
#This query shows how many different languages are spoken in each country
SELECT Name, COUNT( DISTINCT Language) AS Number_of_languages_spoken FROM world.countrylanguage
JOIN country
ON country.Code=countrylanguage.CountryCode
GROUP BY Name
ORDER BY Number_of_languages_spoken DESC;

# This query translates rows to columns using group_concat, this way all languages can be shown on one row
# from the country in the Name column, The output was fomatted and a count applied
# The boolean column for official languages was used to show only official languages
SELECT Name, 
GROUP_CONCAT('  ', Language, '[', Percentage, '%', ']' ORDER BY Percentage DESC ) AS Languages_spoken, 
COUNT( DISTINCT Language) AS Number_of_Official_languages_Spoken 
FROM world.countrylanguage
join country ON country.Code = countrylanguage.CountryCode
WHERE Percentage>0 AND IsOfficial = 'T'	
GROUP BY country.Name
Order BY Number_of_Official_languages_Spoken DESC, Name;

# Number of people speaking a particular language in each country
SELECT country.Name, Language, Percentage'%', CONCAT(ROUND((Percentage/100)*Population/(1000)), 'K') AS number_of_people_K FROM country
join countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE Percentage >0
ORDER BY  ROUND((Percentage/100)*Population/(1000)) DESC;

#This query returns the number of people speaking a certain language around the world
# The number of people speaking that language per country is aggreagated to give a whole world figure.
SELECT Language, CONCAT(ROUND(SUM((Percentage/100)*Population/(1000))), ' K') AS number_speaking_language_around_the_world  FROM country
join countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE Percentage >0
GROUP BY Language
ORDER BY SUM((Percentage/100)*Population) DESC;

# This query shows use of three tables joined just to illustrate that it is the 
# same procedure as joining two. Here we have the Country, number of Districts and 
# number of Languages
SELECT   co.Name AS CountryName, COUNT(DISTINCT c.District) AS Number_0f_Districts,
    COUNT( DISTINCT cl.Language) AS number_of_languages FROM city AS c
INNER JOIN countrylanguage AS cl 
	ON c.CountryCode=cl.CountryCode
INNER JOIN country AS co
	ON co.Code=c.CountryCode
    Group BY co.Name
    ORDER BY co.Name;