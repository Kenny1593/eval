create database eval3;
create user eval3 with login password 'eval3';
Alter database eval3 owner to eval3;


create table admin(
    id serial primary key not null,
    nom varchar(25) not null ,
    pwd varchar(50) not null
);

create table utilisateur(
    id serial primary key not null,
    nom varchar(25) not null ,
    pwd varchar(50) not null
);

--0 false
--1 true
create table patient(
    id serial primary key not null,
    Nom varchar(50) not null ,
    genre integer default 1,
    DateNaissance timestamp not null,
    DateAjout timestamp default now(),
    remboursement integer default 0
);

create table TypeActe(
    id serial primary key not null,
    valeur varchar(50) not null,
    code varchar(3) not null ,
    budget decimal (15,2)
);


create table TypeDepense(
    id serial primary key not null ,
    valeur varchar(50) not null,
    code varchar(3) not null ,
    budget decimal (15,2)
);

create table Facture(
    id serial primary key not null ,
    idPatient integer not null ,
    Date date not null
);
ALTER table Facture add foreign key (idPatient) references patient(id);

create table DetailActePatient(
    id serial primary key not null ,
    idFacture integer not null ,
    idTypeActe integer not null,
    Montant  decimal (15,2) not null
);
Alter table DetailActePatient add foreign key (idFacture) references facture(id);
ALTER table DetailActePatient add foreign key (idTypeActe) references typeacte(id);


create table Depense(
    id serial primary key not null ,
    idTypeDepense integer not null,
    date date not null default now(),
    montant decimal (15,2) not null
);
Alter table Depense add foreign key (idTypeDepense) references TypeDepense(id);




drop owned by eval3;








