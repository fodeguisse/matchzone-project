#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id        Int  Auto_increment  NOT NULL ,
        lastname  Varchar (50) NOT NULL ,
        firstname Varchar (50) NOT NULL ,
        email     Varchar (100) NOT NULL ,
        password  Varchar (255) NOT NULL ,
        phone     Varchar (150) NOT NULL ,
        role      Varchar (50) NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tournament
#------------------------------------------------------------

CREATE TABLE tournament(
        id          Int  Auto_increment  NOT NULL ,
        name        Varchar (150) NOT NULL ,
        description Text NOT NULL ,
        adress      Varchar (255) NOT NULL ,
        eventDate   Datetime NOT NULL ,
        image       Varchar (255) ,
        createdAt   Datetime NOT NULL ,
        updatedAt   Datetime NOT NULL ,
        id_user     Int NOT NULL
	,CONSTRAINT tournament_PK PRIMARY KEY (id)

	,CONSTRAINT tournament_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: match
#------------------------------------------------------------

CREATE TABLE match(
        id              Int  Auto_increment  NOT NULL ,
        name            Varchar (150) NOT NULL ,
        description     Text NOT NULL ,
        numberOfPlayers Int NOT NULL ,
        adress          Varchar (255) NOT NULL ,
        eventDate       Datetime NOT NULL ,
        image           Varchar (255) ,
        createdAt       Datetime NOT NULL ,
        updatedAt       Datetime NOT NULL ,
        id_user         Int NOT NULL ,
        id_tournament   Int
	,CONSTRAINT match_PK PRIMARY KEY (id)

	,CONSTRAINT match_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
	,CONSTRAINT match_tournament0_FK FOREIGN KEY (id_tournament) REFERENCES tournament(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: team
#------------------------------------------------------------

CREATE TABLE team(
        id              Int  Auto_increment  NOT NULL ,
        name            Varchar (100) NOT NULL ,
        numberOfPlayers Int NOT NULL ,
        id_user         Int NOT NULL
	,CONSTRAINT team_PK PRIMARY KEY (id)

	,CONSTRAINT team_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: comment
#------------------------------------------------------------

CREATE TABLE comment(
        id            Int  Auto_increment  NOT NULL ,
        content       Text NOT NULL ,
        id_user       Int NOT NULL ,
        id_match      Int ,
        id_tournament Int
	,CONSTRAINT comment_PK PRIMARY KEY (id)

	,CONSTRAINT comment_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
	,CONSTRAINT comment_match0_FK FOREIGN KEY (id_match) REFERENCES match(id)
	,CONSTRAINT comment_tournament1_FK FOREIGN KEY (id_tournament) REFERENCES tournament(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: have
#------------------------------------------------------------

CREATE TABLE have(
        id       Int NOT NULL ,
        id_match Int NOT NULL
	,CONSTRAINT have_PK PRIMARY KEY (id,id_match)

	,CONSTRAINT have_team_FK FOREIGN KEY (id) REFERENCES team(id)
	,CONSTRAINT have_match0_FK FOREIGN KEY (id_match) REFERENCES match(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: join
#------------------------------------------------------------

CREATE TABLE join(
        id       Int NOT NULL ,
        id_match Int NOT NULL
	,CONSTRAINT join_PK PRIMARY KEY (id,id_match)

	,CONSTRAINT join_user_FK FOREIGN KEY (id) REFERENCES user(id)
	,CONSTRAINT join_match0_FK FOREIGN KEY (id_match) REFERENCES match(id)
)ENGINE=InnoDB;

