DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    hometown TEXT NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team INTEGER REFERENCES teams(id) NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams NOT NULL,
    away_team INTEGER REFERENCES teams NOT NULL,
    game_date TEXT NOT NULL,
    season INTEGER REFERENCES seasons NOT NULL,
    referee INTEGER REFERENCES referees,
    score TEXT NOT NULL
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team INTEGER REFERENCES teams NOT NULL,
    match INTEGER REFERENCES matches NOT NULL,
    result TEXT NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players NOT NULL,
    match INTEGER REFERENCES matches NOT NULL
);