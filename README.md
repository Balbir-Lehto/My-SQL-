## The following is an exercise in creating queries using MySQL:

## MySQL TASKS:

### TASK 1: Using count, get the number of cities in the USA
### Task 2: Find out what the population and life expectancy for people in Argentina (ARG) is
### TASK 3: Using ORDER BY, LIMIT, what country has the highest life expectancy?
### TASK 4: Select 25 cities around the world that start with the letter 'F' in a single SQL query.
### TASK 5: Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.
### TASK 6: Create a SQL statement to find only those cities from city table whose population is larger than 2000000
### TASK 7: Create a SQL statement to find all city names from city table whose name begins with “Be” prefix.
### TASK 8: Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.
### TASK 9: Create a SQL statement to find a city with the lowest population in the city table
### TASK 10: Create a SQL statement to show the population of Switzerland and all the languages spoken there
## Other extension (Further learning) tasks with different SQL queries:
## EER DIAGRAM:
## Task 14:


# TASK 1: Using count, get the number of cities in the USA
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/01b36a79-ebb9-41e2-a73f-61a33cb12019)

# Task 2: Find out what the population and life expectancy for people in Argentina (ARG) is
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/2bafc436-808c-4018-b19a-6bd296a7b83a)

# TASK 3: Using ORDER BY, LIMIT, what country has the highest life expectancy?
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/69aa98b1-8607-4efd-8793-81eb2b9fe003)

# TASK 4: Select 25 cities around the world that start with the letter 'F' in a single SQL query.
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/3776772e-4c71-4b08-b236-c3f987e324e6)

# TASK 5: Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/18cbf1e4-1226-49fd-9479-1ba6323abe9b)

# TASK 6: Create a SQL statement to find only those cities from city table whose population is larger than 2000000
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/bff5ad8b-f668-441e-9013-5474223cd862)

# TASK 7: Create a SQL statement to find all city names from city table whose name begins with “Be” prefix.
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/17301b0a-2278-43d1-a7e1-4440d5b6178a)

# TASK 8: Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/5fb40de7-3f2c-491b-9821-04112bdc1d9f)

# TASK 9: Create a SQL statement to find a city with the lowest population in the city table
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/8250d8c9-36a4-486b-b140-c9c2a1c107ed)

# TASK 10: Create a SQL statement to show the population of Switzerland and all the languages spoken there
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/51757429-3cad-458c-9190-8f9616980f29)

# Other extension (Further learning) tasks with different SQL queries:
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/7489cdee-b900-4286-8271-0efb5f414bce)

![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/8563b3ec-ef88-45ac-abed-4c2968aaf6c0)

![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/7e141ce5-0db0-40f6-8895-acd9185e855a)

# EER DIAGRAM:
![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/873f4a1d-02d3-49be-9010-d382d31b46fb)

![image](https://github.com/Balbir-Lehto/My-SQL-/assets/153186301/7fd7637d-42a5-4e56-8c34-c4a2df7ff90c)

# Task 14:
Identify the primary key in country table: The primary key in the ‘country’ table is ‘Code’ which holds unique values for each row in its own table.

Identify the primary key in city table: The primary key in the ‘city’ table is ‘ID’’ – which holds unique values for each row in its own table.

Identify the primary key in countrylanguage table: The primary key in ‘countrylanguage’ table is a composite of ‘Language’ & ‘CountryCode’. The combination of these two fields gives a unique key. Languages and CountryCode are not unique and are in fact both repeated in this table, but together they form a unique composite key.

Identify the foreign key in city table: The foreign key in the ‘city’ table is ‘CountryCode’ which holds unique values for each row in its own table.Identify the foreign key in countrylanguage table: The foreign key in ‘countrylanguage’ table is ‘CountryCode’ which holds unique values for each row in its table.























