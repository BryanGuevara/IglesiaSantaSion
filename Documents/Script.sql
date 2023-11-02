--Si necesita reiniciar la base de datos, descomente esto
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
    Id uniqueidentifier NOT NULL,
    Nombres varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
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

--Tabla que une las Membresias con las comunidades
CREATE TABLE MembresiasComunidades (
    MembresiaId uniqueidentifier,
    ComunidadId uniqueidentifier
);
GO

--Insertado de el primer valor de los miembros, puede cambiarlo si gusta
INSERT INTO Membresias (Id, Nombres, Apellidos, FechaNacimiento)
VALUES (NEWID(), 'Bryan Alberto', 'Guevara Guerrero', '2004-03-20');

--Insertado de el primer valor de los miembros, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Heraldos Portadores de Esperanza', '02 años', '14 años');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Jovenes Embajadores de Cristo', '15 años', '35 años');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Señoras y Señoritas', '15 años', '');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Heroes de la Fe', '36 años', '');

--Insertado de el primer valor de los miembros, Se recomienda solo cambiar si a modificado los otros insertar, de otro modo no los toquen, porque son datos especificos
DECLARE @MembresiaId uniqueidentifier;
SELECT @MembresiaId = Id FROM Membresias WHERE Nombres = 'Bryan Alberto';

DECLARE @ComunidadIdNinos uniqueidentifier;
DECLARE @ComunidadIdJovenes uniqueidentifier;
SELECT @ComunidadIdNinos = ID FROM Comunidades WHERE Nombre = 'Heraldos Portadores de Esperanza';
SELECT @ComunidadIdJovenes = ID FROM Comunidades WHERE Nombre = 'Jovenes Embajadores de Cristo';

INSERT INTO MembresiasComunidades (MembresiaId, ComunidadId) VALUES (@MembresiaId, @ComunidadIdNinos);
INSERT INTO MembresiasComunidades (MembresiaId, ComunidadId) VALUES (@MembresiaId, @ComunidadIdJovenes);

--para ver los valores desde SQL que inserto
SELECT * FROM Membresias;
SELECT * FROM Comunidades;
SELECT * FROM MembresiasComunidades;