SELECT * FROM geeksforgeeks.sample_data;
SELECT 
    *
FROM
    geeksforgeeks.sample_data;
SELECT 
    department, age
FROM
    sample_data
ORDER BY age;
SELECT 
    *
FROM
    sample_data s1
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            sample_data s2
        GROUP BY Department
        HAVING s1.department = s2.department)
ORDER BY salary;
SELECT 
    *
FROM
    sample_data;
SELECT 
    *
FROM
    sample_data s1
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            sample_data s2
        GROUP BY country
        HAVING s1.country = s2.country);
SELECT 
    *
FROM
    sample_data;
SELECT 
    *
FROM
    sample_data s1
WHERE
    age > (SELECT 
            AVG(age)
        FROM
            sample_data s2
        GROUP BY country
        HAVING s1.country = s2.Country)
ORDER BY age;
SELECT 
    *
FROM
    sample_data s1
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            sample_data s2
        GROUP BY country
        HAVING s1.country = s2.country);