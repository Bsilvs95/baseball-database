UPDATE teams SET abbreviation = "WAS" WHERE abbreviation = "WSH";

SELECT startTime, homescore, awayscore FROM games WHERE startTime >= '2019-06-06 00:00:00' AND startTime <= '2019-06-06 17:00:00';

SELECT * FROM teams WHERE league = "NL";


---------------------------------------------------------

SELECT  CONCAT (firstname, ' ', lastname) AS fullName, position, hit, throws, abbreviation
FROM players p JOIN teams t ON p.currentTeamId = t.id
WHERE t.abbreviation = 'BOS';

---------------------------------------------------------

SELECT CONCAT (firstname, ' ', lastname) AS fullName, position, abbreviation, homeRuns
FROM hittingStats hs JOIN players p ON hs.playerId = p.id
JOIN teams t ON hs.teamid = t.id
JOIN games g ON hs.gameId = g.id
WHERE g.startTime LIKE '2019-06-06%'
ORDER BY hs.homeRuns DESC LIMIT 5;

---------------------------------------------------------

SELECT CONCAT (firstname, ' ', lastname) AS fullName, abbreviation, (ps.earnedRuns/ps.inningsPitched) * 9 AS ERA
FROM pitchingStats ps 
Join players p ON ps.playerId = p.id
JOIN teams t ON ps.teamid = t.id
JOIN games g ON ps.gameId = g.id
WHERE g.startTime LIKE '2019-06-06%' AND ps.inningsPitched >= 4
ORDER BY ERA ASC LIMIT 5;

---------------------------------------------------------

SELECT CONCAT (firstname, ' ', lastname) AS fullName, position, t.abbreviation, doubles, startTime, home.abbreviation AS home, away.abbreviation AS away
FROM  hittingStats hs
JOIN players p ON hs.playerId = p.id
JOIN teams t ON hs.teamid = t.id
JOIN games g ON hs.gameId = g.id
Join teams home ON g.homeTeamId = home.id
JOIN teams away ON g.awayTeamId = away.id
ORDER BY hs.doubles  DESC LIMIT 1;

---------------------------------------------------------
