CREATE DATABASE baseball;

USE baseball;

CREATE TABLE players (
    id INT AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(255), 
    position CHAR(2),
    hits ENUM('R', 'L', 'B'),
    throws ENUM('R', 'L', 'B'),
    currentTeamId INT,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY(currentTeamId) REFERENCES teams(id)
);




CREATE TABLE teams (
    id INT AUTO_INCREMENT,
    location VARCHAR(255),
    mascot VARCHAR(255),
    abbreviation VARCHAR(3),
    league ENUM('AL', 'NL'),
    division ENUM('EAST', 'West', 'central'),
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(id)
);




CREATE TABLE games (
    id INT AUTO_INCREMENT,
    startTime DATETIME,
    homeTeamID INT,
    awayteamID INT,
    homescore INT,
    awayscore INT, 
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (homeTeamID) REFERENCES teams(id),
    FOREIGN KEY (awayteamID) REFERENCES teams(id)
);

CREATE TABLE hittingStats (
    playerId INT,
    gameId INT,
    teamId INT,
    atBats INT,
    runs INT,
    hits INT, 
    doubles INT, 
    triples INT, 
    homeruns INT, 
    runsBattedIn INT,
    walks INT, 
    strikeOuts INT, 
    steals INT, 
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(playerId, gameId, teamId),
    FOREIGN KEY (playerId) REFERENCES players(id),
    FOREIGN KEY (gameId) REFERENCES games(id),
    FOREIGN KEY (teamId) REFERENCES teams(id)
);


CREATE TABLE pitchingstats (
    playerId  INT,
    gameId INT,
    teamId INT,
    wins TINYINT,
    inningsPitched DECIMAL(3, 1),
    hits INT,
    runs INT,
    earnedRuns INT, 
    walks INT,
    stikeOut INT,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(playerId, gameId, teamId),
    FOREIGN KEY (playerId) REFERENCES players(id),
    FOREIGN KEY (gameId) REFERENCES games(id),
    FOREIGN KEY (teamId) REFERENCES teams(id)
);
