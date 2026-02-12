-- Write your PostgreSQL query statement below
SELECT firstName as "firstName", lastName as "lastName", city, state
FROM Person
FULL JOIN Address ON Person.personId = Address.personId
WHERE firstName IS NOT NULL AND lastName IS NOT NULL
