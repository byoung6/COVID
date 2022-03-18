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
continent VARCHAR,
new_cases_smoothed FLOAT,
icu_patients FLOAT,
icu_patients_per_million FLOAT,
new_deaths_smoothed FLOAT,
new_vaccinations_smoothed FLOAT,
people_fully_vaccinated_per_hundred FLOAT,
total_boosters_per_hundred FLOAT,
new_people_vaccinated_smoothed_per_hundred FLOAT,
people_fully_vaccinated FLOAT,
total_boosters FLOAT,
new_vaccinations FLOAT
);

SELECT * FROM COVID;

-- Refined table filtered for United States data after 2020-01-11 (post vacc rollout)
CREATE TABLE COVID2_USA (
dates VARCHAR,
location_country VARCHAR,
continent VARCHAR,
new_cases_smoothed BIGINT,
icu_patients BIGINT,
icu_patients_per_million BIGINT,
new_deaths_smoothed BIGINT,
new_vaccinations_smoothed BIGINT
);

INSERT INTO COVID2_USA
SELECT * FROM COVID2 
WHERE location_country = 'United States' 
AND dates >= '2020-01-11';

SELECT * FROM COVID2_USA; 

-- lagging data sets to match peak to peak for new cases and new deaths
CREATE TABLE COVID_new_cases_smoothed(
    dates VARCHAR,
    new_cases_smoothed BIGINT);

CREATE TABLE COVID_new_deaths_smoothed(
    dates VARCHAR,
    new_deaths_smoothed BIGINT
);

INSERT INTO COVID_new_cases_smoothed
SELECT dates, new_deaths_smoothed 
FROM COVID2
WHERE dates >= '2020-12-11' 