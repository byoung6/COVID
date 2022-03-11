-- Creating Database Tables for Covid Data
-- Steps I took to build a SQL database
-- 1) copy the sql script below for the table you are interested in
-- 2) paste into pgadmin and run to create empty tables
-- 3) right-click table under database/schema/tables/tablename
-- 4) click from the menu import/export to import the csv file into the table
-- 5) select import, choose the file, and choose the , delimiter

-- Initial Table for comparing covid vaccinations/deaths/and icu_patients
CREATE TABLE COVID (     
dates VARCHAR,
location_country VARCHAR,
icu_patients_per_million VARCHAR,
new_deaths_smoothed VARCHAR,
new_vaccinations_smoothed_per_million VARCHAR
);

SELECT * FROM COVID;

-- Refined table for comparing lag data of new cases/new deaths/new vacc/etc
CREATE TABLE COVID2 (
dates VARCHAR,
location_country VARCHAR,
continent VARCHAR,
new_cases_smoothed VARCHAR,
icu_patients VARCHAR,
icu_patients_per_million VARCHAR,
new_deaths_smoothed VARCHAR,
new_vaccinations_smoothed VARCHAR
);

SELECT * FROM COVID2;