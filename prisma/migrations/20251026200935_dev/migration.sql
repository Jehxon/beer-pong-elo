-- CreateTable
CREATE TABLE "Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "elo" INTEGER NOT NULL DEFAULT 1000
);

-- CreateTable
CREATE TABLE "Match" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "winnerA" BOOLEAN NOT NULL,
    "winnerB" BOOLEAN NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ONGOING'
);

-- CreateTable
CREATE TABLE "MatchTeamA" (
    "matchId" INTEGER NOT NULL,
    "playerId" INTEGER NOT NULL,

    PRIMARY KEY ("matchId", "playerId"),
    CONSTRAINT "MatchTeamA_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "MatchTeamA_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "MatchTeamB" (
    "matchId" INTEGER NOT NULL,
    "playerId" INTEGER NOT NULL,

    PRIMARY KEY ("matchId", "playerId"),
    CONSTRAINT "MatchTeamB_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "MatchTeamB_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Shot" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "matchId" INTEGER NOT NULL,
    "playerId" INTEGER NOT NULL,
    "hit" BOOLEAN NOT NULL,
    "cup" INTEGER,
    "bounceCup" INTEGER,
    "team" TEXT NOT NULL,
    "sequence" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "Shot_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Shot_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
