CREATE TABLE Users(
   idUser INT AUTO_INCREMENT,
   firstname VARCHAR(50) ,
   lastname VARCHAR(50) ,
   email VARCHAR(128) ,
   password VARCHAR(128) ,
   PRIMARY KEY(idUser)
);

CREATE TABLE Galery(
   idGalery INT AUTO_INCREMENT,
   name VARCHAR(50) ,
   description VARCHAR(50) ,
   creationDate DATETIME,
   idUser INT NOT NULL,
   PRIMARY KEY(idGalery),
   FOREIGN KEY(idUser) REFERENCES Users(idUser)
);

CREATE TABLE Photo(
   idPhoto INT AUTO_INCREMENT,
   name VARCHAR(50) ,
   price DECIMAL(15,2)  ,
   description VARCHAR(50) ,
   photoDate DATE,
   idGalery INT NOT NULL,
   PRIMARY KEY(idPhoto),
   FOREIGN KEY(idGalery) REFERENCES Galery(idGalery)
);

CREATE TABLE Command(
   idCommand INT AUTO_INCREMENT,
   commandDate VARCHAR(50) ,
   idGalery INT NOT NULL,
   PRIMARY KEY(idCommand),
   FOREIGN KEY(idGalery) REFERENCES Galery(idGalery)
);

CREATE TABLE Contact(
   idUser INT,
   idUser_1 INT,
   PRIMARY KEY(idUser, idUser_1),
   FOREIGN KEY(idUser) REFERENCES Users(idUser),
   FOREIGN KEY(idUser_1) REFERENCES Users(idUser)
);

CREATE TABLE Galery_shared(
   idGalery INT,
   idUser INT,
   PRIMARY KEY(idGalery, idUser),
   FOREIGN KEY(idGalery) REFERENCES Galery(idGalery),
   FOREIGN KEY(idUser) REFERENCES Users(idUser)
);

CREATE TABLE Contains(
   idPhoto INT,
   idCommand INT,
   quantity INT,
   PRIMARY KEY(idPhoto, idCommand),
   FOREIGN KEY(idPhoto) REFERENCES Photo(idPhoto),
   FOREIGN KEY(idCommand) REFERENCES Command(idCommand)
);
