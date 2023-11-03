--Si necesita reiniciar la base de datos, descomente esto y corra el codigo
--USE master;
--GO

--DROP DATABASE SantaSion;
--GO

--Creacion de la base
CREATE DATABASE SantaSion;
GO

--Para usar la base
USE SantaSion;
GO

--Creacion de la tabla donde quedan registrado los miembros
CREATE TABLE Membresias (
    ID uniqueidentifier NOT NULL,
    Nombres varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
    ConocidoComo varchar(50) NOT NULL,
    FechaNacimiento date NOT NULL
);
GO

--Cracion de la tabla de comunidades a las que pertenecen los miembros
CREATE TABLE Comunidades (
    ID uniqueidentifier NOT NULL,
    Nombre varchar(50) NOT NULL,
    Edadinicio varchar(7),
    EdadFin varchar(7)
);
GO

--Creacion de la tabla de las directivas de las comunidades
CREATE TABLE Directivas(
	ID uniqueidentifier,
	Nombre varchar(30)
);
GO

--Tabla que une las Membresias con las comunidades
CREATE TABLE MembresiasComunidades (
    ID uniqueidentifier NOT NULL,
    MembresiaId uniqueidentifier,
    ComunidadId uniqueidentifier
);
GO

--Tabla que une las Membresias con las Directivas y las comunidades
CREATE TABLE Directivos (
    ID uniqueidentifier NOT NULL,
    MembresiaId uniqueidentifier,
    DirectivasId uniqueidentifier,
    ComunidadId uniqueidentifier
);
GO

--Insertado de el primer valor de los miembros, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Membresias (ID, Nombres, Apellidos, ConocidoComo,FechaNacimiento)
VALUES (NEWID(), 'Bryan Alberto', 'Guevara Guerrero', 'Hno. Bryan', '2004-03-20');

--Insertado de el primer valor de los miembros, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Heraldos Portadores de Esperanza', '02 años', '14 años');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Jovenes Embajadores de Cristo', '15 años', '35 años');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Señoras y Señoritas', '15 años', '');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Heroes de la Fe', '36 años', '');

--Insertado de el primeros valores de Directiva, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Maestro/a');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Presidente/a');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Vice Presidente/a');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Secretario/a');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Pro Secretario/a');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Tesorero/a');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Pro Tesorero');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), '1° Vocal');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), '2° Vocal');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), '3° Vocal');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), '4° Vocal');
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), '5° Vocal');

--Insertado de el primer valor de los miembros, Se recomienda solo cambiar si a modificado los otros insertar, de otro modo no los toquen, porque son datos especificos
DECLARE @MembresiaId uniqueidentifier;
SELECT @MembresiaId = ID FROM Membresias WHERE ConocidoComo = 'Hno. Bryan';

DECLARE @ComunidadIdNinos uniqueidentifier;
DECLARE @ComunidadIdJovenes uniqueidentifier;
SELECT @ComunidadIdNinos = ID FROM Comunidades WHERE Nombre = 'Heraldos Portadores de Esperanza';
SELECT @ComunidadIdJovenes = ID FROM Comunidades WHERE Nombre = 'Jovenes Embajadores de Cristo';


INSERT INTO MembresiasComunidades (ID, MembresiaId, ComunidadId) VALUES (NEWID(), @MembresiaId, @ComunidadIdNinos);
INSERT INTO MembresiasComunidades (ID, MembresiaId, ComunidadId) VALUES (NEWID(), @MembresiaId, @ComunidadIdJovenes);

--Insertado de el primer valor de los Directivos, Se recomienda solo cambiar si a modificado los otros insertar, de otro modo no los toquen, porque son datos especificos
DECLARE @DirectivasIdTesorero uniqueidentifier;
SELECT @DirectivasIdTesorero = ID FROM Directivas WHERE Nombre = 'Tesorero/a';
DECLARE @DirectivasIdMaestro uniqueidentifier;
SELECT @DirectivasIdMaestro = ID FROM Directivas WHERE Nombre = 'Maestro/a';

INSERT INTO Directivos(ID, MembresiaId, DirectivasId,ComunidadId) VALUES (NEWID(), @MembresiaId, @DirectivasIdTesorero, @ComunidadIdJovenes);
INSERT INTO Directivos(ID, MembresiaId, DirectivasId,ComunidadId) VALUES (NEWID(), @MembresiaId, @DirectivasIdMaestro, @ComunidadIdNinos);

--para ver los valores desde SQL que inserto
SELECT * FROM Membresias;
SELECT * FROM Comunidades;
SELECT * FROM Directivas;
SELECT * FROM MembresiasComunidades;
SELECT * FROM Directivos;