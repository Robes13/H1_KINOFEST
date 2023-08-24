Use KinoFest

CREATE TABLE Attendees(
	AttendanceID int NOT NULL PRIMARY KEY ,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Email text NOT NULL,
	PhoneNumber varchar(20) NOT NULL CHECK (LEN(PhoneNumber) = 8)
	);

CREATE TABLE Directors(
	DirectorID int NOT NULL PRIMARY KEY,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Birthday date NOT NULL,
);

CREATE TABLE Actors(
	ActorID int NOT NULL PRIMARY KEY,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Birthday date NOT NULL
);

CREATE TABLE Genres(
	GenreID int NOT NULL PRIMARY KEY,
	Name varchar(25) NOT NULL
);

CREATE TABLE Cinemas(
	CinemaID int NOT NULL PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
);

CREATE TABLE Halls(
	HallID int NOT NULL PRIMARY KEY,
	SeatAmount smallint NOT NULL
);

CREATE TABLE Movies(
	MovieID int NOT NULL PRIMARY KEY,
	DirectorID int FOREIGN KEY REFERENCES Directors(DirectorID),
	ActorID int FOREIGN KEY REFERENCES Actors(ActorID),
	GenreID int FOREIGN KEY REFERENCES Genres(GenreID),
	Title varchar(100) NOT NULL,
	Year smallint NOT NULL,
	Duration smallint NOT NULL CHECK(Duration > 0)
);

CREATE TABLE Tickets(
	TicketID int NOT NULL PRIMARY KEY,
	MovieID int FOREIGN KEY REFERENCES Movies(MovieID),
	AttendanceID int FOREIGN KEY REFERENCES Attendees(AttendanceID),
	Price decimal(6,2) NOT NULL CHECK (Price >= 0)
);


CREATE TABLE Showings(
	ShowingID int NOT NULL PRIMARY KEY,
	MovieID int FOREIGN KEY REFERENCES Movies(MovieID),
	TicketID int FOREIGN KEY REFERENCES Tickets(TicketID)
);

CREATE TABLE MovieDirectors(
	MovieDirectorsID int NOT NULL PRIMARY KEY,
	MovieID int FOREIGN KEY REFERENCES Movies(MovieID),
	DirectorID int FOREIGN KEY REFERENCES Directors(DirectorID),
);

CREATE TABLE MovieActors(
	MovieActorID int NOT NULL PRIMARY KEY,
	MovieID int FOREIGN KEY REFERENCES Movies(MovieID),
	ActorID int FOREIGN KEY REFERENCES Actors(ActorID)
);

CREATE TABLE MovieGenres(
	MovieGenreID int NOT NULL PRIMARY KEY,
	MovieID int FOREIGN KEY REFERENCES Movies(MovieID),
	GenreID int FOREIGN KEY REFERENCES Genres(GenreID)
);

CREATE TABLE CinemaTickets(
	CinemaTicketID int NOT NULL PRIMARY KEY,
	CinemaID int FOREIGN KEY REFERENCES Cinemas(CinemaID),
	HallID int FOREIGN KEY REFERENCES Halls(HallID)
);


INSERT INTO Attendees(AttendanceID, FirstName, LastName, Email, PhoneNumber)
VALUES 
(1, 'Nicklas', 'Gustavsen', 'nicklasgustavsen@hotmail.dk', 22784894),
(2, 'Robert', 'Pedersen', 'robertorlanderpedersen@gmail.com', 22784894),
(3, 'Marcus', 'Marcussen', 'marcusmarcussen@hotmail.dk', 22784894),
(4, 'Emre', 'Emre', 'EmreEmre@hotmail.dk', 22784894);


INSERT INTO Halls (HallID, SeatAmount) 
VALUES 
(1, 200),
(2, 200),
(3, 200);


INSERT INTO Genres(GenreID, GenreName)
VALUES 
(1,'Romance'),
(2,'Horror'),
(3,'Drama'),
(4,'Comedy');

INSERT INTO Directors(DirectorID, FirstName, LastName, Birthday)
VALUES
(1, 'Ole', 'Hugosen', '1970-06-03'),
(2, 'Frederikke', 'Kolberg', '1994-08-12'),
(3, 'Emma', 'Jakobsen', '1990-12-08');


INSERT INTO Cinemas (CinemaID, Name, Address) 
VALUES 
(1, 'CinemaxX', 'Kalvebod Brygge 57, 1561 København'),
(2, 'Empire Cinema', 'Guldbergsgade 29F, 2200 København'),
(3, 'ATLAS Biograferne', 'Rødovre Centrum 1F, 96, 2610 Rødovre');


INSERT INTO Movies(MovieID, DirectorID, ActorID, GenreID, Title, Year, Duration)
VALUES
(1, 1, 1, 1, 'Titanic', 1920, 200),
(2, 1, 1, 2, 'Avatar', 2000, 230),
(3, 1, 2, 2, 'Peter Plys', 1980, 120)


INSERT INTO Actors(ActorID, FirstName, LastName, Birthday)
VALUES
(1, 'Frederik', 'Jensen', '1996-01-01'),
(2, 'Ulrik', 'Hydralik', '2000-03-06'),
(3, 'Anna', 'Madsen', '1985-06-07');

INSERT INTO MovieDirectors(MovieDirectorsID, MovieID, DirectorID)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO Tickets (TicketID, AttendanceID, MovieID, Price)
VALUES
(1, 1, 1, 159.9),
(2, 2, 2, 129.9),
(3, 3, 3, 209.9);


INSERT INTO MovieGenres(MovieGenreID, MovieID, GenreID)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

INSERT INTO Showings (ShowingID, MovieID, TicketID)
Values (1, 1 , 1),
Values (2, 2 , 2),
Values (3, 3, 3);


INSERT INTO MovieActors (MovieActorID, MovieID, ActorID)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);


INSERT INTO CinemaTickets(CinemaTicketID, CinemaID, HallID)
Values
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);
