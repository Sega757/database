CREATE TABLE PlayerStatistics (
Id INT PRIMARY KEY AUTO_INCREMENT,
SeasonId INT,
PlayerId VARCHAR(255),
Label VARCHAR(255),
Number INT,
ClubId VARCHAR(255),
IsZero BOOLEAN,
Goals INT,
Assists INT,
Matches INT,
Minutes INT,
GoalPlusPass INT,
PenGoals INT,
DoubleGoals INT,
HatTricks INT,
OwnGoals INT,
YellowCards INT,
YellowRedCards INT,
RedCards INT,
FairPlayScore INT,
FOREIGN KEY (SeasonId) REFERENCES Season(Id),
FOREIGN KEY (PlayerId) REFERENCES Player(Id),
FOREIGN KEY (ClubId) REFERENCES FootballClub(Id)
);

CREATE TABLE Season (
Id INT PRIMARY KEY AUTO_INCREMENT,
Year VARCHAR(255),
CompetitionId VARCHAR(255),
FOREIGN KEY (CompetitionId) REFERENCES Competition(Id)
);

CREATE TABLE Competition (
Id VARCHAR(255) PRIMARY KEY,
Name VARCHAR(255),
ImgSource VARCHAR(255),
Country VARCHAR(255)
);

CREATE TABLE CompetitionTable (
Id INT PRIMARY KEY AUTO_INCREMENT,
GroupName VARCHAR(255),
SeasonId INT,
Position INT,
ClubId VARCHAR(255),
GamesPlayed INT,
GamesWon INT,
GamesDrawn INT,
GamesLost INT,
GoalsScored INT,
GoalsMissed INT,
GoalsDifference INT,
Points INT,
FOREIGN KEY (SeasonId) REFERENCES Season(Id),
FOREIGN KEY (ClubId) REFERENCES FootballClub(Id)
);

CREATE TABLE Player (
Id VARCHAR(255) PRIMARY KEY,
ImgSource VARCHAR(255),
FirstName VARCHAR(255),
LastName VARCHAR(255),
Position VARCHAR(255),
DateOfBirth DATE,
WorkingLeg VARCHAR(255),
Height INT,
Weight INT,
OriginalName VARCHAR(255),
Citizenship VARCHAR(255),
PlaceOfBirth VARCHAR(255)
);

CREATE TABLE FootballMatch (
Id VARCHAR(255) PRIMARY KEY,
Label VARCHAR(255),
Stage VARCHAR(255),
Date DATETIME,
Status VARCHAR(255),
SeasonId INT,
FOREIGN KEY (SeasonId) REFERENCES Season(Id)
);

CREATE TABLE MatchEvent (
Id INT PRIMARY KEY AUTO_INCREMENT,
Minute VARCHAR(255),
Type VARCHAR(255),
Label VARCHAR(255),
PlayerId VARCHAR(255),
StatisticsId INT,
FOREIGN KEY (PlayerId) REFERENCES Player(Id),
FOREIGN KEY (StatisticsId) REFERENCES MatchStatistics(Id)
);

CREATE TABLE Season (
Id INT PRIMARY KEY AUTO_INCREMENT,
Year VARCHAR(255),
CompetitionId VARCHAR(255),
FOREIGN KEY (CompetitionId) REFERENCES Competition(Id)
);

CREATE TABLE FootballClub (
Id VARCHAR(255) PRIMARY KEY,
ClubName VARCHAR(255),
ImgSource VARCHAR(255),
NameEnglish VARCHAR(255),
FullName VARCHAR(255),
MainCoach VARCHAR(255),
City VARCHAR(255),
Country VARCHAR(255),
Stadium VARCHAR(255),
FoundationDate VARCHAR(255),
Rating INT
);

CREATE TABLE MatchStatistics (
Id INT PRIMARY KEY AUTO_INCREMENT,
MatchId VARCHAR(255),
ClubId VARCHAR(255),
HomeAway TINYINT,
Goals INT,
Xg DOUBLE,
Shots INT,
ShotsOnTarget INT,
ShotsBlocked INT,
Saves INT,
BallPossession INT,
Corners INT,
Fouls INT,
Offsides INT,
YCards INT,
RCards INT,
Attacks INT,
AttacksDangerous INT,
Passes INT,
AccPasses DOUBLE,
FreeKicks INT,
Prowing INT,
Crosses INT,
Tackles INT,
FOREIGN KEY (MatchId) REFERENCES FootballMatch(Id),
FOREIGN KEY (ClubId) REFERENCES FootballClub(Id)
);

CREATE TABLE MatchSquadPlayers (
Id INT PRIMARY KEY AUTO_INCREMENT,
Number INT,
Label VARCHAR(255),
Type INT,
IsCaptain BOOLEAN,
PlayerId VARCHAR(255),
StatisticsId INT,
FOREIGN KEY (PlayerId) REFERENCES Player(Id),
FOREIGN KEY (StatisticsId) REFERENCES MatchStatistics(Id)
);
