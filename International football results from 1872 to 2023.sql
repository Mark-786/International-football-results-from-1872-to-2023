-- Creating a database
CREATE database Football;
-- Using the database
USE Football;
-- Running the SELECT query
SELECT * FROM results;
-- Checking results of all friendly matches
SELECT * FROM results
WHERE tournament = 'Friendly';
-- Checking results where home team was Germany
SELECT * FROM results
WHERE home_team = 'Germany';
-- Checking results of matches after 12th december 1930
SELECT * FROM results
WHERE date > 1930-12-12;
-- Checking results where Germany scored more than 3 goals
SELECT * FROM results
WHERE (home_team = 'Germany' AND home_score > 3 AND home_score > away_score)
   OR (away_team = 'Germany' AND away_score > 3 AND away_score > home_score);
-- Checking results when Germany played Austria at home
SELECT * FROM results
WHERE home_team = 'Germany' AND away_team = 'Austria';
-- Checking result when germany scored 3 or more goals at home
SELECT * FROM results
WHERE home_team = 'Germany' AND home_score >= 3;
-- Checking scores when germany played and the outcome was a Draw
SELECT * FROM results
WHERE (home_team = 'Germany' OR away_team = 'Germany')
AND (home_score = away_score);
-- Checking score when England did not play at a neutral venue
SELECT * FROM results
WHERE (home_team = 'England' OR away_team = 'England')
AND (neutral = 'FALSE');
-- Checking the most goals scored by england in a game
SELECT MAX(Home_score OR away_score)
FROM results
WHERE home_team OR away_team = 'England';
-- Checking England's biggest win
SELECT *
 FROM results
where 'England' IN (home_team, away_team)
AND (home_score - away_score = (SELECT MAX(home_score - away_score) 
FROM results where 'England' IN (home_team - away_team))
     OR
     away_score - home_score = (SELECT MAX(away_score - home_score) 
     FROM results where
    'England' IN (home_team - away_team)));
