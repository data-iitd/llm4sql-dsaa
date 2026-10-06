BEGIN TRANSACTION;

-- --------------------------------------------------------

--
-- Table structure for table People
--
--

DROP TABLE IF EXISTS People;
CREATE TABLE People (
	playerID varchar(10) NOT NULL,
	birthYear int NOT NULL,
	birthMonth int NOT NULL,
	birthDay int NOT NULL,
	birthCountry varchar(50) NOT NULL,
	birthState varchar(50) NOT NULL,
	birthCity varchar(50) NOT NULL,
	deathYear int NOT NULL,
	deathMonth int NOT NULL,
	deathDay int NOT NULL,
	deathCountry varchar(50) NOT NULL,
	deathState varchar(50) NOT NULL,
	deathCity varchar(50) NOT NULL,
	nameFirst varchar(50) NOT NULL,
	nameLast varchar(50) NOT NULL,
	nameGiven varchar(255) NOT NULL,
	weight int NOT NULL,
	height double precision NOT NULL,
	bats varchar(1) NOT NULL,
	throws varchar(1) NOT NULL,
	debut varchar(10) NOT NULL,
	finalGame varchar(10) NOT NULL,
	retroID varchar(9) NOT NULL,
	bbrefID varchar(9) NOT NULL,
	PRIMARY KEY (playerID)
);

-- --------------------------------------------------------

--
-- Table structure for table TeamsFranchises
--
--

DROP TABLE IF EXISTS TeamsFranchises;
CREATE TABLE TeamsFranchises (
	franchID varchar(3) NOT NULL,
	franchName varchar(50) NOT NULL,
	active varchar(2) NOT NULL,
	NAassoc varchar(3) NOT NULL,
	PRIMARY KEY (franchID)
);

-- --------------------------------------------------------

--
-- Table structure for table Teams
--
--

DROP TABLE IF EXISTS Teams;
CREATE TABLE Teams (
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	teamID varchar(3) NOT NULL,
	franchID varchar(3) NOT NULL,
	divID varchar(1) NOT NULL,
	Rank int NOT NULL,
	G int NOT NULL,
	Ghome int NOT NULL,
	W int NOT NULL,
	L int NOT NULL,
	DivWin boolean NOT NULL, --changed to boolean
	WCWin boolean NOT NULL,  --changed to boolean
	LgWin boolean NOT NULL,  --changed to boolean
	WSWin boolean NOT NULL,  --changed to boolean
	R int NOT NULL,
	AB int NOT NULL,
	H int NOT NULL,
	H2B int NOT NULL,
	H3B int NOT NULL,
	HR int NOT NULL,
	BB int NOT NULL,
	SO int NOT NULL,
	SB int NOT NULL,
	CS int NOT NULL,
	HBP int NOT NULL,
	SF int NOT NULL,
	RA int NOT NULL,
	ER int NOT NULL,
	ERA double precision NOT NULL,
	CG int NOT NULL,
	SHO int NOT NULL,
	SV int NOT NULL,
	IPouts int NOT NULL,
	HA int NOT NULL,
	HRA int NOT NULL,
	BBA int NOT NULL,
	SOA int NOT NULL,
	E int NOT NULL,
	DP int NOT NULL,
	FP double precision NOT NULL,
	name varchar(50) NOT NULL,
	park varchar(255) NOT NULL,
	attendance int NOT NULL,
	BPF int NOT NULL,
	PPF int NOT NULL,
	teamIDBR varchar(3) NOT NULL,
	teamIDlahman45 varchar(3) NOT NULL,
	teamIDretro varchar(3) NOT NULL,
	PRIMARY KEY (yearID,lgID,teamID),
	CONSTRAINT fk_franchID_teams
	FOREIGN KEY(franchID)
	REFERENCES TeamsFranchises(franchID) 
);

-- --------------------------------------------------------

--
-- Table structure for table Batting
--
--

DROP TABLE IF EXISTS Batting;
CREATE TABLE Batting (
	playerID varchar(10) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	G int NOT NULL,
	AB int NOT NULL,
	R int NOT NULL,
	H int NOT NULL,
	H2B int NOT NULL,
	H3B int NOT NULL,
	HR int NOT NULL,
	RBI int NOT NULL,
	SB int NOT NULL,
	CS int NOT NULL,
	BB int NOT NULL,
	SO int NOT NULL,
	IBB int NOT NULL,
	HBP int NOT NULL,
	SH int NOT NULL,
	SF int NOT NULL,
	GIDP int NOT NULL,
	PRIMARY KEY (playerID,yearID,stint),
	CONSTRAINT fk_playerID_batting
	FOREIGN KEY(playerID)
	REFERENCES People(playerID),
	CONSTRAINT fk_teamID_batting
	FOREIGN KEY(teamID, yearID, lgID)
	REFERENCES Teams(teamID, yearID, lgID)
	-- CONSTRAINT fk_lgID_batting
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table Fielding
--
--

DROP TABLE IF EXISTS Fielding;
CREATE TABLE Fielding (
	playerID varchar(10) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	POS varchar(2) NOT NULL,
	G int NOT NULL,
	GS int NOT NULL,
	InnOuts int NOT NULL,
	PO int NOT NULL,
	A int NOT NULL,
	E int NOT NULL,
	DP int NOT NULL,
	PB int NOT NULL,
	WP int NOT NULL,
	SB int NOT NULL,
	CS int NOT NULL,
	ZR double precision NOT NULL,
	PRIMARY KEY (playerID,yearID,stint,POS),
	CONSTRAINT fk_playerID_fielding
	FOREIGN KEY(playerID)
	REFERENCES People(playerID),
	CONSTRAINT fk_teamID_fielding
	FOREIGN KEY(teamID, yearID, lgID)
	REFERENCES Teams(teamID, yearID, lgID)
	-- CONSTRAINT fk_lgID_fielding
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)

);

-- --------------------------------------------------------

--
-- Table structure for table Pitching
--
--

DROP TABLE IF EXISTS Pitching;
CREATE TABLE Pitching (
	playerID varchar(10) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	W int NOT NULL,
	L int NOT NULL,
	G int NOT NULL,
	GS int NOT NULL,
	CG int NOT NULL,
	SHO int NOT NULL,
	SV int NOT NULL,
	IPouts int NOT NULL,
	H int NOT NULL,
	ER int NOT NULL,
	HR int NOT NULL,
	BB int NOT NULL,
	SO int NOT NULL,
	BAOpp double precision NOT NULL,
	ERA double precision NOT NULL,
	IBB int NOT NULL,
	WP int NOT NULL,
	HBP int NOT NULL,
	BK int NOT NULL,
	BFP int NOT NULL,
	GF int NOT NULL,
	R int NOT NULL,
	SH int NOT NULL,
	SF int NOT NULL,
	GIDP int NOT NULL,
	PRIMARY KEY (playerID,yearID,stint),
	CONSTRAINT fk_playerID_pitching
	FOREIGN KEY(playerID)
	REFERENCES People(playerID),
	CONSTRAINT fk_teamID_pitching
	FOREIGN KEY(teamID, yearID, lgID)
	REFERENCES Teams(teamID, yearID, lgID)
	-- CONSTRAINT fk_lgID_pitching
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table AllstarFull
--
--

DROP TABLE IF EXISTS AllstarFull;
CREATE TABLE AllstarFull (
	playerID varchar(10) NOT NULL,
	yearID int NOT NULL,
	gameNum int NOT NULL,
	gameID varchar(12) NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	GP int NOT NULL,
	startingPos int NOT NULL,
	PRIMARY KEY (playerID,yearID,gameNum),
	CONSTRAINT fk_playerID_allstarfull
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_teamID_allstarfull
	-- FOREIGN KEY(teamID)
	-- REFERENCES Teams(teamID),
	-- CONSTRAINT fk_lgID_allstarfull
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table Appearances
--
--

DROP TABLE IF EXISTS Appearances;
CREATE TABLE Appearances (
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(10) NOT NULL,
	G_all int NOT NULL,
	GS int NOT NULL,
	G_batting int NOT NULL,
	G_defense int NOT NULL,
	G_p int NOT NULL,
	G_c int NOT NULL,
	G_1b int NOT NULL,
	G_2b int NOT NULL,
	G_3b int NOT NULL,
	G_ss int NOT NULL,
	G_lf int NOT NULL,
	G_cf int NOT NULL,
	G_rf int NOT NULL,
	G_of int NOT NULL,
	G_dh int NOT NULL,
	G_ph int NOT NULL,
	G_pr int NOT NULL,
	PRIMARY KEY (yearID,teamID,playerID),
	CONSTRAINT fk_playerID_appearances
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_teamID_appearances
	-- FOREIGN KEY(teamID)
	-- REFERENCES Teams(teamID),
	-- CONSTRAINT fk_lgID_appearances
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table AwardsManagers
--
--

DROP TABLE IF EXISTS AwardsManagers;
CREATE TABLE AwardsManagers (
	playerID varchar(10) NOT NULL,
	awardID varchar(25) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	tie boolean NOT NULL,  --changed to boolean
	notes varchar(100) NOT NULL,
	PRIMARY KEY (yearID,awardID,lgID,playerID),
	CONSTRAINT fk_playerID_awardsManagers
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_lgID_awardsManagers
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table AwardsPlayers
--
--

DROP TABLE IF EXISTS AwardsPlayers;
CREATE TABLE AwardsPlayers (
	playerID varchar(10) NOT NULL,
	awardID varchar(255) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	tie boolean NOT NULL,  --changed to boolean
	notes varchar(100) NOT NULL,
	PRIMARY KEY (yearID,awardID,lgID,playerID),
	CONSTRAINT fk_playerID_awardsPlayers
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_lgID_awardsPlayers
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table AwardsShareManagers
--
--

DROP TABLE IF EXISTS AwardsShareManagers;
CREATE TABLE AwardsShareManagers (
	awardID varchar(25) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(10) NOT NULL,
	pointsWon int NOT NULL,
	pointsMax int NOT NULL,
	votesFirst int NOT NULL,
	PRIMARY KEY (awardID,yearID,lgID,playerID),
	CONSTRAINT fk_playerID_AwardsShareManagers
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_lgID_AwardsShareManagers
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table AwardsSharePlayers
--
--

DROP TABLE IF EXISTS AwardsSharePlayers;
CREATE TABLE AwardsSharePlayers (
	awardID varchar(25) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(10) NOT NULL,
	pointsWon double precision NOT NULL,
	pointsMax int NOT NULL,
	votesFirst double precision NOT NULL,
	PRIMARY KEY (awardID,yearID,lgID,playerID),
	CONSTRAINT fk_playerID_AwardsSharePlayers
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_lgID_AwardsSharePlayers
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table HallOfFame
--
--

DROP TABLE IF EXISTS HallOfFame;
CREATE TABLE HallOfFame (
	playerID varchar(10) NOT NULL,
	yearid int NOT NULL,
	votedBy varchar(64) NOT NULL DEFAULT '',
	ballots int NOT NULL,
	needed int NOT NULL,
	votes int NOT NULL,
	inducted boolean NOT NULL,  --changed to boolean
	category varchar(20) NOT NULL,
	needed_note varchar(20) NOT NULL,
	PRIMARY KEY (playerID,yearid,votedBy),
	CONSTRAINT fk_playerID_HallOfFame
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
);

-- --------------------------------------------------------

--
-- Table structure for table Managers
--
--

DROP TABLE IF EXISTS Managers;
CREATE TABLE Managers (
	playerID varchar(10) NOT NULL,
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	inseason int NOT NULL,
	G int NOT NULL,
	W int NOT NULL,
	L int NOT NULL,
	rank int NOT NULL,
	plyrMgr boolean NOT NULL,  --changed to boolean
	PRIMARY KEY (yearID,teamID,inseason),
	CONSTRAINT fk_playerID_Managers
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_teamID_Managers
	-- FOREIGN KEY(teamID)
	-- REFERENCES Teams(teamID),
	-- CONSTRAINT fk_lgID_Managers
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table Salaries
--
--

DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries (
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(10) NOT NULL,
	salary double precision NOT NULL,
	PRIMARY KEY (yearID,teamID,lgID,playerID),
	CONSTRAINT fk_playerID_Salaries
	FOREIGN KEY(playerID)
	REFERENCES People(playerID)
	-- CONSTRAINT fk_teamID_Salaries
	-- FOREIGN KEY(teamID)
	-- REFERENCES Teams(teamID),
	-- CONSTRAINT fk_lgID_Salaries
	-- FOREIGN KEY(lgID)
	-- REFERENCES Teams(lgID)
);

-- --------------------------------------------------------

--
-- Table structure for table Schools
--
--

DROP TABLE IF EXISTS Schools;
CREATE TABLE Schools (
	schoolID varchar(15) NOT NULL,
	schoolName varchar(255) NOT NULL,
	schoolCity varchar(55) NOT NULL,
	schoolState varchar(55) NOT NULL,
	schoolNick varchar(55) NOT NULL,
	PRIMARY KEY (schoolID)
);

-- --------------------------------------------------------

--
-- Table structure for table CollegePlaying
--
--

DROP TABLE IF EXISTS CollegePlaying;
CREATE TABLE CollegePlaying (
	playerID varchar(10) NOT NULL,
	schoolID varchar(15) NOT NULL,
	yearID int NOT NULL,
	PRIMARY KEY (playerID, schoolID, yearID),
	CONSTRAINT fk_playerID_CollegePlaying
	FOREIGN KEY(playerID)
	REFERENCES People(playerID),
	CONSTRAINT fk_schoolID_CollegePlaying
	FOREIGN KEY(schoolID)
	REFERENCES Schools(schoolID)
);

-- --------------------------------------------------------

--
-- Table structure for table SeriesPost
--
--

DROP TABLE IF EXISTS SeriesPost;
CREATE TABLE SeriesPost (
	yearID int NOT NULL,
	round varchar(5) NOT NULL,
	teamIDwinner varchar(3) NOT NULL,
	lgIDwinner varchar(2) NOT NULL,
	teamIDloser varchar(3) NOT NULL,
	lgIDloser varchar(2) NOT NULL,
	wins int NOT NULL,
	losses int NOT NULL,
	ties int NOT NULL,
	PRIMARY KEY (yearID,round)
	-- CONSTRAINT fk_teamIDwinner_SeriesPost
	-- FOREIGN KEY(teamIDwinner)
	-- REFERENCES Teams(teamID),
	-- CONSTRAINT fk_teamIDloser_SeriesPost
	-- FOREIGN KEY	(teamIDloser)
	-- REFERENCES Teams(teamID)
);


COMMIT;

