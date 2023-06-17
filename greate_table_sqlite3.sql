CREATE TABLE PlayerStatistics (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
SeasonId INTEGER,
PlayerId TEXT,
Label TEXT,
Number INTEGER,
ClubId TEXT,
IsZero INTEGER,
Goals INTEGER,
Assists INTEGER,
Matches INTEGER,
Minutes INTEGER,
GoalPlusPass INTEGER,
PenGoals INTEGER,
DoubleGoals INTEGER,
HatTricks INTEGER,
OwnGoals INTEGER,
YellowCards INTEGER,
YellowRedCards INTEGER,
RedCards INTEGER,
FairPlayScore INTEGER,
FOREIGN KEY (SeasonId) REFERENCES Season(Id),
FOREIGN KEY (PlayerId) REFERENCES Player(Id),
FOREIGN KEY (ClubId) REFERENCES FootballClub(Id)
);

CREATE TABLE Season (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
Year TEXT,
CompetitionId TEXT,
FOREIGN KEY (CompetitionId) REFERENCES Competition(Id)
);

CREATE TABLE Competition (
Id TEXT PRIMARY KEY,
Name TEXT,
ImgSource TEXT,
Country TEXT
);

CREATE TABLE CompetitionTable (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
GroupName TEXT,
SeasonId INTEGER,
Position INTEGER,
ClubId TEXT,
GamesPlayed INTEGER,
GamesWon INTEGER,
GamesDrawn INTEGER,
GamesLost INTEGER,
GoalsScored INTEGER,
GoalsMissed INTEGER,
GoalsDifference INTEGER,
Points INTEGER,
FOREIGN KEY (SeasonId) REFERENCES Season(Id),
FOREIGN KEY (ClubId) REFERENCES FootballClub(Id)
);

CREATE TABLE Player (
Id TEXT PRIMARY KEY,
ImgSource TEXT,
FirstName TEXT,
LastName TEXT,
Position TEXT,
DateOfBirth TEXT,
WorkingLeg TEXT,
Height INTEGER,
Weight INTEGER,
OriginalName TEXT,
Citizenship TEXT,
PlaceOfBirth TEXT
);

CREATE TABLE FootballMatch (
Id TEXT PRIMARY KEY,
Label TEXT,
Stage TEXT,
Date TEXT,
Status TEXT,
SeasonId INTEGER,
FOREIGN KEY (SeasonId) REFERENCES Season(Id)
);

CREATE TABLE MatchEvent (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
Minute TEXT,
Type TEXT,
Label TEXT,
PlayerId TEXT,
StatisticsId INTEGER,
FOREIGN KEY (PlayerId) REFERENCES Player(Id),
FOREIGN KEY (StatisticsId) REFERENCES MatchStatistics(Id)
);

CREATE TABLE MatchStatistics (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
MatchId TEXT,
ClubId TEXT,
HomeAway INTEGER,
Goals INTEGER,
Xg REAL,
Shots INTEGER,
ShotsOnTarget INTEGER,
ShotsBlocked INTEGER,
Saves INTEGER,
BallPossession INTEGER,
Corners INTEGER,
Fouls INTEGER,
Offsides INTEGER,
YCards INTEGER,
RCards INTEGER,
Attacks INTEGER,
AttacksDangerous INTEGER,
Passes INTEGER,
AccPasses REAL,
FreeKicks INTEGER,
Prowing INTEGER,
Crosses INTEGER,
Tackles INTEGER,
FOREIGN KEY (MatchId) REFERENCES FootballMatch(Id),
FOREIGN KEY (ClubId) REFERENCES FootballClub(Id)
);

CREATE TABLE FootballClub (
Id TEXT PRIMARY KEY,
ClubName TEXT,
ImgSource TEXT,
NameEnglish TEXT,
FullName TEXT,
MainCoach TEXT,
City TEXT,
Country TEXT,
Stadium TEXT,
FoundationDate TEXT,
Rating INTEGER
);

CREATE TABLE MatchSquadPlayers (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
Number INTEGER,
Label TEXT,
Type INTEGER,
IsCaptain INTEGER,
PlayerId TEXT,
StatisticsId INTEGER,
FOREIGN KEY (PlayerId) REFERENCES Player(Id),
FOREIGN KEY (StatisticsId) REFERENCES MatchStatistics(Id)
);
