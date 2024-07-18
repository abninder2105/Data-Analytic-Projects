use phase_3;
-- 3.1 Inserting data into table
CREATE TABLE Crime_against_women2001_2012 (
`STATE/UT` VARCHAR(255),
 `DISTRICT` VARCHAR(255),
 `Year` VARCHAR(255),
 `Rape` VARCHAR(255),
 `Kidnapping and Abduction` VARCHAR(255),
 `Dowry Deaths` VARCHAR(255),
 `Assault on women with intent to outrage her modesty` VARCHAR(255),
 `Insult to modesty of Women` VARCHAR(255),
 `Cruelty by Husband or his Relatives` VARCHAR(255),
 `Importation of Girls` VARCHAR(255)
 );
-- imported the datafile to the work bench
-- 3.2 --
SELECT
    `STATE/UT` AS State,
    `DISTRICT` AS District,
    `Year`,
    MAX(CAST(`Rape` AS UNSIGNED)) AS Max_Rapes,
    MAX(CAST(`Kidnapping and Abduction` AS UNSIGNED)) AS Max_Kidnappings
FROM
    Crime_against_women2001_2012
GROUP BY
    `STATE/UT`, `DISTRICT`, `Year`
ORDER BY
    Max_Rapes DESC, Max_Kidnappings DESC
LIMIT 1;
-- finding:- Madhya Pradesh has max no. of rapes and kidnapping in year 2012 i.e 3425 rapes and 1127 kidnappings.


-- 3.3 --
SELECT
    `STATE/UT` AS State,
    `DISTRICT` AS District,
    `Year`,
    MIN(CAST(`Rape` AS UNSIGNED)) AS Min_Rapes,
    MIN(CAST(`Kidnapping and Abduction` AS UNSIGNED)) AS Min_Kidnappings
FROM
    Crime_against_women2001_2012
GROUP BY
    `STATE/UT`, `DISTRICT`, `Year`
ORDER BY
    Min_Rapes ASC, Min_Kidnappings ASC;
    
    -- 3.4 Insert record of 02_District_wise_crimes_committed_against_ST_2001_2012.csv into a new table
    -- 3.5 --
    SELECT
    `DISTRICT` AS District,
    MAX(CAST(`Dacoity` AS UNSIGNED)) AS Max_Dacoity,
    MAX(CAST(`Robbery` AS UNSIGNED)) AS Max_Robbery
FROM
    `02_district_wise_crimes_committed_against_st_2001_2012`
GROUP BY
    `DISTRICT`
ORDER BY
    Max_Dacoity DESC, Max_Robbery DESC;
-- finding:- It shows that DAHOD district has max no. of Dacoity and Robbery

-- 3.6 --
SELECT
    `DISTRICT` AS District,
    MIN(CAST(`Murder` AS UNSIGNED)) AS Min_Murders
FROM
    `02_district_wise_crimes_committed_against_st_2001_2012`
GROUP BY
    `DISTRICT`
ORDER BY
    Min_Murders ASC;
  
  -- 3.7 --
SELECT
    `DISTRICT` AS District,
    `Year`,
    CAST(`Murder` AS UNSIGNED) AS Murders
FROM
    `02_district_wise_crimes_committed_against_st_2001_2012`
ORDER BY
    `DISTRICT` ASC, `Year` ASC, Murders ASC;
  
-- 3.8.1 -- creating new table which has only records of state, district,year,muder, attempt to muder and rape. --
CREATE TABLE District_wise_crimes_committed_IPC_2001_2012(
`STATE/UT` VARCHAR(255), 
`DISTRICT` VARCHAR(255), 
`YEAR` VARCHAR(255), 
`MURDER` VARCHAR(255),
 `ATTEMPT TO MURDER` VARCHAR(255),
 `RAPE` VARCHAR(255)
 );
 
 -- 3.8.2 -- 
 SELECT
    `STATE/UT` AS State_UT,
    `YEAR` AS Year,
    `DISTRICT` AS District,
    CAST(`MURDER` AS UNSIGNED) AS Murders
FROM
    District_wise_crimes_committed_IPC_2001_2012
WHERE
    (`STATE/UT`, `YEAR`, CAST(`MURDER` AS UNSIGNED)) IN (
        SELECT `STATE/UT`, `YEAR`, MAX(CAST(`MURDER` AS UNSIGNED))
        FROM District_wise_crimes_committed_IPC_2001_2012
        GROUP BY `STATE/UT`, `YEAR`
    )
ORDER BY
    `STATE/UT`, `YEAR`;






