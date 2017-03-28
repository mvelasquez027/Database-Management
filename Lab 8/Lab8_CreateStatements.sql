CREATE TABLE Address
(
    Address INTEGER NOT NULL,
    city TEXT,
    state TEXT,
    zip TEXT,
    PRIMARY KEY (Address)
);


CREATE TABLE People
(
    pid CHARACTER(4) NOT NULL,
    name TEXT,
    Address TEXT,
    Address INTEGER REFERENCES Address(Address),
    PRIMARY KEY (pid)
);


CREATE TABLE Actor
(
    pid CHARACTER(4) NOT NULL REFERENCES People(pid),
    birthday DATE,
    haircolor TEXT,
    eyecolor TEXT,
    height INTEGER,
    weight INTEGER,
    favoritecolor TEXT,
    actoranniversary DATE,
    PRIMARY KEY (pid)
);


CREATE TABLE Movie
(
    mid CHARACTER(4) NOT NULL,
    name TEXT,
    year INTEGER,
    mpaa INTEGER,
    totalsales INTEGER,
    domesticsales INTEGER,
    foreignsales INTEGER,
    cdsales INTEGER,
    PRIMARY KEY (mid)
);


CREATE TABLE Roles
(
    mid CHARACTER(4) NOT NULL REFERENCES Movie(mid),
    pid CHARACTER(4) NOT NULL REFERENCES People(pid),
    roles TEXT,
    PRIMARY KEY (mid, pid)
);


CREATE TABLE Spouse
(
    pid CHARACTER(4) NOT NULL REFERENCES People(pid),
    partner TEXT,
    PRIMARY KEY (pid)
);


CREATE TABLE Director
(
    pid CHARACTER(4) NOT NULL REFERENCES People(pid),
    filmschool TEXT,
    directoranniversary DATE,
    favoritelensmaker TEXT,
    PRIMARY KEY (pid)
);