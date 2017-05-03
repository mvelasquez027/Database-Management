-- Matthew Velasquez
-- CMPT 308 Database Systems
-- April 19, 2017
-- Final Design Project SQL


DROP TABLE IF EXISTS Quarter Final Stage;
DROP TABLE IF EXISTS Final;
DROP TABLE IF EXISTS Semi-Final Stage;
DROP TABLE IF EXISTS Stadium;
DROP TABLE IF EXISTS National Teams;
DROP TABLE IF EXISTS Match Dates;
DROP TABLE IF EXISTS Qualifications;
DROP TABLE IF EXISTS Group A
DROP TABLE IF EXISTS Group B;
DROP TABLE IF EXISTS Group C;
DROP TABLE IF EXISTS Group D;
;


--- Quarter Final Stage ---
CREATE TABLE Quarter Final Stage 
(
	qfsid char(3) NOT NULL,
	country char(20) NOT NULL REFERENCES National Teams(country),
  	PRIMARY KEY(qfsid)
);

--- Semi-Final Stage ---
CREATE TABLE Semi-Final Stage 
(
	sfsid char(3) NOT NULL, 
  	country char(20) NOT NULL REFERENCES National Teams(country),
  	PRIMARY KEY(sfsid)	
);

--- Final ---
CREATE TABLE Final 
(
	fid char(3) NOT NULL,
 	country char(20) NOT NULL REFERENCES National Teams(country),
 	PRIMARY KEY(fid)
); 

--- Stadium ---
CREATE TABLE Stadium 
(
	sid char(4) NOT NULL, 
  	city text,
  	country char(20) NOT NULL REFERENCES National Teams(country),
  	qfsid char(3) NOT NULL REFERENCES Quarter Final Stage(qfsid),
  	fid char(3) NOT NULL REFERENCES Final(fid),
  	sfsid char(3) NOT NULL REFERENCES Semi Final Stage(sfsid),
  	PRIMARY KEY(sid)
);

--- National Teams --- 
CREATE TABLE National Teams
(
	country text NOT NULL,
	name text,
  	age integer,
  	height integer,
  	weight integer,
  	mdid char(8) NOT NULL REFERENCES Match Dates(mdid),
  	qid char(2) NOT NULL REFERENCES Qualifications(qid), 
  	a text NOT NULL REFERENCES Groups(a),
  	b text NOT NULL REFERENCES Groups(b),
  	c text NOT NULL REFERENCES Groups(c),
  	d text NOT NULL REFERENCES Groups(d),
  	PRIMARY KEY(country)
);

--- Match Dates ---
CREATE TABLE Match Dates 
(
	mdid char(8) NOT NULL,
	country char(20) NOT NULL REFERENCES National Teams(country),
  	PRIMARY KEY(mdid)
);

--- Qualifications ---
CREATE TABLE Qualifications 
(
	qid char(2) NOT NULL REFERENCES Qualifications(qid),
  	country char(20) NOT NULL REFERENCES National Teams(country),
  	PRIMARY KEY(qid)
);

--- Group A ---
CREATE TABLE Group A 
(
	a text NOT NULL,
  	country char(20) NOT NULL REFERENCES National Teams(country),
  	PRIMARY KEY(a)
);

--- Group B ---
CREATE TABLE Group B
(
	b text NOT NULL,
	country char(20) NOT NULL REFERENCES National Teams(country),
	PRIMARY KEY(b)
);

--- Group C ---
CREATE TABLE Group C
(
	c text NOT NULL,
	country char(20) NOT NULL REFERENCES National Teams(country),
	PRIMARY KEY(c)
);

--- Group D ---
CREATE TABLE Group D
(
	d text NOT NULL,
	country char(20) NOT NULL REFERENCES National Teams(country),
	PRIMARY KEY(d)
);
  

--- National Teams ---
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Muller', 32, 66, 140);
  
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Gomez, 29, 64, 150);
  
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Lahm', 31, 68, 125);
 
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Ozil', 28, 64, 136);
  
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Boateng', 33, 66, 150);  

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Ballack', 33, 70, 143);
		
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Reus', 31, 69, 138);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Kroos', 31, 67, 146);
	
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Hummels', 29, 70, 140);	
	
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Neuer', 31, 72, 152);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Germany', 'Draxler', 30, 68, 138);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Costa', 32, 69, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Morata', 34, 68, 145);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Ramos, 31, 71, 150);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Iniesta', 34, 69, 148);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Pique', 35, 72, 153);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Silva', 33, 67, 138);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Isco', 34, 69, 143);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Alba', 30, 68, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Koke', 31, 69, 135);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Spain', 'Mata', 30, 70, 143);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Tapia', 25, 69, 135);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Guerrero', 32, 70, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Ascues', 32, 72, 147);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Yotun', 29, 71, 141);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Rodriguez', 33, 68, 138);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Cueva', 29, 67, 139);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Advincula', 33, 71, 146);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Gallese', 28, 70, 142);	

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Flores', 27, 66, 135);
	
INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Cruzado', 33, 69, 135);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Ruidiaz', 28, 67, 138);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Ronaldo', 33, 70, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Ronaldo', 33, 70, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Fernandinho', 29, 71, 145);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Paulinho', 31, 68, 152);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Neymar', 30, 70, 136);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Silva', 32, 72, 150);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Pato', 34, 74, 155);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Firmino', 32, 71, 149);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Willian', 31, 69, 146);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Coutinho', 24, 71, 150);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Oscar', 29, 69, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Ronaldo', 33, 70, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Ronaldo', 33, 70, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Brazil', 'Ronaldo', 33, 70, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Peru', 'Muller', 32, 64, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Ronaldo', 32, 72, 147);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Nani', 32, 68, 149);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Quaresma', 32, 69, 148);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Sanches', 31, 73, 156);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Pepe', 33, 69, 151);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Eder', 31, 72, 148);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Moutinho', 33, 70, 146);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Gomes', 34, 72, 156);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Carvalho', 32, 70, 152);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Coentrao', 29, 71, 152);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Alves', 30, 71, 160);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Muller', 32, 64, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Muller', 32, 64, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Portugal', 'Muller', 32, 64, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Zaza', 32, 72, 145);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'DeRossi', 33, 73, 158);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Buffon', 35, 74, 163);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Eder', 30, 71, 152);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Candreva', 34, 71, 160);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Immobile', 31, 70, 156);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Florenzi', 29, 68, 151);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Darmian', 30, 70, 145);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Cassano', 29, 73, 163);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Motta', 33, 69, 153);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Parolo', 35, 70, 159);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Italy', 'Bonaventura', 31, 71, 156);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Valencia', 32, 64, 140);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Ayovi', 33, 72, 157);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Bolanos', 31, 68, 159);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Noboa', 30, 70, 157);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Montero', 29, 71, 160);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Erazo', 28, 70, 158);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Dominguez', 31, 70, 157);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Mina', 30, 68, 151);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Paredes', 28, 70, 157);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador, 'Arroyo', 33, 69, 161);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Ecuador', 'Dreer', 34, 70, 159);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Messi', 31, 68, 142);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'DiMaria', 32, 70, 158);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Pastore', 29, 69, 159);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Rojo', 30, 70, 161);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Tevez', 34, 68, 159);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Aguero', 31, 70, 160);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Mascherano', 33, 69, 156);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Romero', 31, 70, 156);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Otamendi', 26, 71, 162);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Banega', 31, 68, 152);

INSERT INTO National Teams(country, name, age, height, weight)
	VALUES('Argentina', 'Zabaleta', 34, 73, 165);
	
	
	
--- Stadium ---
INSERT INTO Stadium(sid, city)
	VALUES(0001, 'Rio');

INSERT INTO Stadium(sid, city)
	VALUES(0002, 'London');

INSERT INTO Stadium(sid, city)
	VALUES(0003, 'Belo Horizante');

INSERT INTO Stadium(sid, city)
	VALUES(0004, 'Sao Paulo');

INSERT INTO Stadium(sid, city)
	VALUES(0005, 'Salvador');

INSERT INTO Stadium(sid, city)	
	VALUES(0006, 'Brasilia');

INSERT INTO Stadium(sid, city)
	VALUES(0007, 'Fortaleza');

INSERT INTO Stadium(sid, city)
	VALUES(0008, 'Manaus');

INSERT INTO Stadium(sid, city)
	VALUES(0009, 'Porto Alegre');

INSERT INTO Stadium(sid, city)
	VALUES(0010, 'Belem');

INSERT INTO Stadium(sid, city)
	VALUES(0011, 'Sao Luis');

INSERT INTO Stadium(sid, city)
	VALUES(0012, 'Campinas');
  

