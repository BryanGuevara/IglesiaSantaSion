--Si necesita reiniciar la base de datos, descomente esto y corra el codigo
--USE master; DROP DATABASE SantaSion; 

-- Creación de la base de datos "SantaSion"
CREATE DATABASE SantaSion;
GO
-- Cambio al uso de la base de datos recién creada
USE SantaSion;

-- Creación de la tabla "Anuncios" para guardar la informacion de las actividades
CREATE TABLE Eventos (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    Titulo varchar(50) NOT NULL,
    Descripcion text,
    FechaInicio date,
    HoraInicio varchar(10),
    FechaFin date,
    HoraFin varchar(10)
);

-- Crear la tabla "Votaciones" para generar encuestas
CREATE TABLE Votaciones (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    Titulo varchar(50) NOT NULL,
    Descripcion text
);

-- Crear la tabla "Votaciones" para ver las opciones y cuantos votos tiene
CREATE TABLE OpcionesVotacion (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    VotacionID uniqueidentifier,
    Opcion varchar(50) NOT NULL
);
CREATE TABLE Votos (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    VotacionID uniqueidentifier,
    OpcionID uniqueidentifier,
    MembresiaID uniqueidentifier
);

-- Crear la tabla "Interesados" para rastrear a las personas interesadas en un evento
CREATE TABLE Interesados (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    EventoID uniqueidentifier,
    MembresiaID uniqueidentifier,
    FechaInteres datetime
);

-- Creación de la tabla "Membresias" para almacenar datos de los miembros
CREATE TABLE Membresias (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    Nombres varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
    ConocidoComo varchar(50) NOT NULL,
    FechaNacimiento date NOT NULL
);

-- Creación de la tabla "Comunidades" para almacenar datos de las comunidades a las que pueden pertenecer los miembros
CREATE TABLE Comunidades (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    Nombre varchar(50) NOT NULL,
    Edadinicio varchar(7),
    EdadFin varchar(7)
);

-- Creación de la tabla "Directivas" para almacenar datos de las directivas de las comunidades
CREATE TABLE Directivas(
	ID uniqueidentifier PRIMARY KEY NOT NULL,
	Nombre varchar(30)
);

-- Creación de la tabla "MembresiasComunidades" para relacionar miembros y comunidades
CREATE TABLE MembresiasComunidades (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    MembresiaId uniqueidentifier,
    ComunidadId uniqueidentifier
);

-- Creación de la tabla "Directivos" para relacionar miembros, directivas y comunidades
CREATE TABLE Directivos (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    MembresiaId uniqueidentifier,
    DirectivasId uniqueidentifier,
    ComunidadId uniqueidentifier
);

-- Crear la tabla "Instrumentos" para almacenar información sobre los instrumentos disponibles
CREATE TABLE Instrumentos (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    Nombre varchar(20) NOT NULL
);

-- Crear la tabla "Musicos" para almacenar información sobre los músicos
CREATE TABLE Musicos (
    ID uniqueidentifier PRIMARY KEY NOT NULL,
    MembresiaId uniqueidentifier NOT NULL,
    InstrumentoId uniqueidentifier NOT NULL 
);

-- Crear la tabla "Rol" para almacenar los Roles disponibles
CREATE TABLE Rol (
	ID uniqueidentifier PRIMARY KEY NOT NULL,
	Nombre varchar(20)
);

-- Crear la tabla "RolMembresia" para conectar los miembros con los roles
CREATE TABLE RolMembresia (
	ID uniqueidentifier PRIMARY KEY NOT NULL,
	RolId uniqueidentifier,
	MenmbresiaId uniqueidentifier
);

-- Insertar la entrada para la Vigilia Nacional de Jóvenes en Cupinco
INSERT INTO Eventos (ID, Titulo, Descripcion, FechaInicio, HoraInicio, FechaFin, HoraFin)
VALUES (
    NEWID(), 
    'Vigilia Nacional de Jóvenes en Cupinco', 
    'Directiva General de Jovenes Embajadores de Cristo les invita a la Vigilia Nacional en Cupinco el 11 de noviembre.
    \n\nPrograma:
    \n18:00 - 21:00: Registro
    \n21:00 - 02:00: Desarrollo de la vigilia.\n
    \nCosto: $2.00 por persona (12 años en adelante).
    \nVenta de camisetas, pupusas, cena y bebidas.\n
    \nContacto: +503 6997-1605 (Hno. Jaime Guevara)',
    '2023-11-11', '09:00 PM', '2023-11-12', '02:00 AM'
);

--insertado de el primer valor de Votaciones
 INSERT INTO Votaciones (ID, Titulo, Descripcion)
VALUES 
    (NEWID(), 'Próxima Salida de Jóvenes', '¿A dónde te gustaría que sea la próxima salida de jóvenes?');


--Insertado de el primer valor de los miembros, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Membresias (ID, Nombres, Apellidos, ConocidoComo,FechaNacimiento)
VALUES (NEWID(), 'Jaime Alberto', 'Guevara', 'Hno. Jaime', '1986-01-01'),
    (NEWID(), 'Bryan Alberto', 'Guevara Guerrero', 'Hno. Bryan', '2004-03-20'),
    (NEWID(), 'Julio Cesar', 'Navarro Tula', 'Hno. Julio', '1977-06-20'),
    (NEWID(), 'Jessica Lisset', 'Avila Linares', 'Hna. Jessica', '1993-02-19'),
    (NEWID(), 'Angel Guadalupe', 'Hernandez De Valle', 'Hna. Angela', '1963-05-31'),
    (NEWID(), 'Ana Ruth Elizabeth', 'Guerrero De Guevara', 'Hna. Betty', '1978-02-12'),
    (NEWID(), 'Claudia Lisandra', 'Hernandez Villalta', 'Hna. Claudia', '1989-08-13'),
    (NEWID(), 'Ingrid Yasmin', 'Cubias De Ramirez', 'Hna. Ingrid', '1992-12-27'),
    (NEWID(), 'Irene', 'Orellana De Rodriguez', 'Hna. Irene', '1979-04-15'),
    (NEWID(), 'Alba Yecenia', 'Peñate Rivas', 'Hna. Alba', '1980-01-09'),
    (NEWID(), 'Bersy Vladimir', 'Coreas Lainez', 'Hno. Vladimir', '1986-01-30'),
    (NEWID(), 'Eva Leonor', 'Peñate Vda. De Rivas', 'Mamita Noy', '1961-01-05'),
    (NEWID(), 'Rosa Emerita', 'Navarro De Nerio', 'Hna. Rosa', '1975-09-10'),
    (NEWID(), 'Jairo Antonio', 'Ruano Mendez', 'Hno. Jairo', '1967-01-08'),
    (NEWID(), 'David Edgardo', 'Miranda Ochoa', 'Hno. David', '1989-01-27'),
    (NEWID(), 'Patricia Aracely', 'Ruano De Miranda', 'Hna. Patty', '1994-04-03'),
    (NEWID(), 'Yolanda Yanira', 'Navarro De Ruano', 'Hna. Yanira', '1973-01-02'),
    (NEWID(), 'Francisca', 'Linares Aguilar', 'Hna. Francisca', '1949-01-30'),
    (NEWID(), 'Maria Esperanza', 'Peñate Rivas', 'Hna. Tita', '1978-07-28'),
    (NEWID(), 'Nuria Consuelo', 'Mancia De Duran', 'Hna. Nuria', '1959-06-22');

--Insertado de el primer valor de los miembros, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Heraldos Portadores de Esperanza', '02 años', '14 años');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Jovenes Embajadores de Cristo', '15 años', '35 años');
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Señoras y Señoritas', '15 años', NULL);
INSERT INTO Comunidades (ID, Nombre, Edadinicio, EdadFin) VALUES (NEWID(), 'Heroes de la Fe', '36 años', NULL);

--Insertado de el primeros valores de Directiva, puede cambiarlo si gusta, el "NEWID()" es para que genere unos caractares aleatorios que sirven de ID
INSERT INTO Directivas(ID, Nombre) VALUES (NEWID(), 'Pastor/a');
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

--insertado de el primer valor de los Instrumentos
INSERT INTO Instrumentos(ID, Nombre) VALUES (NEWID(), 'Teclado');
INSERT INTO Instrumentos(ID, Nombre) VALUES (NEWID(), 'Bateria');
INSERT INTO Instrumentos(ID, Nombre) VALUES (NEWID(), 'Güiro');
INSERT INTO Instrumentos(ID, Nombre) VALUES (NEWID(), 'Guitarra');

--Insertado de el primer valor de Rol
INSERT INTO Rol(ID, Nombre) VALUES (NEWID(), 'Administrador');
INSERT INTO Rol(ID, Nombre) VALUES (NEWID(), 'Miembro');

--Sacando el ID de los eventos
DECLARE @EventoCupinco uniqueidentifier;
SELECT @EventoCupinco = ID FROM Eventos WHERE Titulo = 'Vigilia Nacional de Jóvenes en Cupinco';

--Sacando el ID de las votaciones
DECLARE @VotacionID uniqueidentifier;
SELECT @VotacionID = ID FROM Votaciones WHERE Titulo = 'Próxima Salida de Jóvenes';

--Insertando Opciones de las votaciones
INSERT INTO OpcionesVotacion (ID, VotacionID, Opcion)
VALUES
    (NEWID(), @VotacionID, 'Cerro verde (Casa de Cristal)'),
    (NEWID(), @VotacionID, 'Lago de Coatepeque'),
    (NEWID(), @VotacionID, 'Playa los Cobanos');

--Sacando el ID de las opciones
DECLARE @OpcionID1 uniqueidentifier;
DECLARE @OpcionID2 uniqueidentifier;
DECLARE @OpcionID3 uniqueidentifier;
SELECT @OpcionID1 = ID FROM OpcionesVotacion WHERE Opcion = 'Cerro verde (Casa de Cristal)';
SELECT @OpcionID2 = ID FROM OpcionesVotacion WHERE Opcion = 'Lago de Coatepeque';
SELECT @OpcionID3 = ID FROM OpcionesVotacion WHERE Opcion = 'Playa los Cobanos';

--Sacando el ID de los Hermanos
DECLARE @MembresiaIdHnoJaime uniqueidentifier;
SELECT @MembresiaIdHnoJaime = ID FROM Membresias WHERE ConocidoComo = 'Hno. Jaime';
DECLARE @MembresiaIdHnoBryan uniqueidentifier;
SELECT @MembresiaIdHnoBryan = ID FROM Membresias WHERE ConocidoComo = 'Hno. Bryan';
DECLARE @MembresiaIdHnoJulio uniqueidentifier;
SELECT @MembresiaIdHnoJulio = ID FROM Membresias WHERE ConocidoComo = 'Hno. Julio';
DECLARE @MembresiaIdHnaJessica uniqueidentifier;
SELECT @MembresiaIdHnaJessica = ID FROM Membresias WHERE ConocidoComo = 'Hna. Jessica';
DECLARE @MembresiaIdHnaAngela uniqueidentifier;
SELECT @MembresiaIdHnaAngela = ID FROM Membresias WHERE ConocidoComo = 'Hna. Angela';
DECLARE @MembresiaIdHnaBetty uniqueidentifier;
SELECT @MembresiaIdHnaBetty = ID FROM Membresias WHERE ConocidoComo = 'Hna. Betty';
DECLARE @MembresiaIdHnaClaudia uniqueidentifier;
SELECT @MembresiaIdHnaClaudia = ID FROM Membresias WHERE ConocidoComo = 'Hna. Claudia';
DECLARE @MembresiaIdHnaIrene uniqueidentifier;
SELECT @MembresiaIdHnaIrene = ID FROM Membresias WHERE ConocidoComo = 'Hna. Irene';
DECLARE @MembresiaIdHnaPatty uniqueidentifier;
SELECT @MembresiaIdHnaPatty = ID FROM Membresias WHERE ConocidoComo = 'Hna. Patty';
DECLARE @MembresiaIdHnaYanira uniqueidentifier;
SELECT @MembresiaIdHnaYanira = ID FROM Membresias WHERE ConocidoComo = 'Hna. Yanira';
DECLARE @MembresiaIdHnaFrancisca uniqueidentifier;
SELECT @MembresiaIdHnaFrancisca = ID FROM Membresias WHERE ConocidoComo = 'Hna. Francisca';
DECLARE @MembresiaIdHnaTita uniqueidentifier;
SELECT @MembresiaIdHnaTita = ID FROM Membresias WHERE ConocidoComo = 'Hna. Tita';
DECLARE @MembresiaIdHnaNuria uniqueidentifier;
SELECT @MembresiaIdHnaNuria = ID FROM Membresias WHERE ConocidoComo = 'Hna. Nuria';
DECLARE @MembresiaIdHnoVladimir uniqueidentifier;
SELECT @MembresiaIdHnoVladimir = ID FROM Membresias WHERE ConocidoComo = 'Hno. Vladimir';
DECLARE @MembresiaIdMamitaNoy uniqueidentifier;
SELECT @MembresiaIdMamitaNoy = ID FROM Membresias WHERE ConocidoComo = 'Mamita Noy';
DECLARE @MembresiaIdHnaRosa uniqueidentifier;
SELECT @MembresiaIdHnaRosa = ID FROM Membresias WHERE ConocidoComo = 'Hna. Rosa';
DECLARE @MembresiaIdHnoJairo uniqueidentifier;
SELECT @MembresiaIdHnoJairo = ID FROM Membresias WHERE ConocidoComo = 'Hno. Jairo';
DECLARE @MembresiaIdHnoDavid uniqueidentifier;
SELECT @MembresiaIdHnoDavid = ID FROM Membresias WHERE ConocidoComo = 'Hno. David';
DECLARE @MembresiaIdHnaAlba uniqueidentifier;
SELECT @MembresiaIdHnaAlba = ID FROM Membresias WHERE ConocidoComo = 'Hna. Alba';

--Sacando el ID de las comunidades
DECLARE @ComunidadIdNinos uniqueidentifier;
DECLARE @ComunidadIdJovenes uniqueidentifier;
DECLARE @ComunidadIdSeñoras uniqueidentifier;
DECLARE @ComunidadIdHeroes uniqueidentifier;
SELECT @ComunidadIdHeroes = ID FROM Comunidades WHERE Nombre = 'Heroes de la Fe';
SELECT @ComunidadIdSeñoras = ID FROM Comunidades WHERE Nombre = 'Señoras y Señoritas';
SELECT @ComunidadIdNinos = ID FROM Comunidades WHERE Nombre = 'Heraldos Portadores de Esperanza';
SELECT @ComunidadIdJovenes = ID FROM Comunidades WHERE Nombre = 'Jovenes Embajadores de Cristo';

--Sacando el ID de la directiva
DECLARE @DirectivasIdTesorero uniqueidentifier;
DECLARE @DirectivasIdMaestro uniqueidentifier;
DECLARE @DirectivasIdPastor uniqueidentifier;
SELECT @DirectivasIdPastor = ID FROM Directivas WHERE Nombre = 'Pastor/a';
SELECT @DirectivasIdTesorero = ID FROM Directivas WHERE Nombre = 'Tesorero/a';
SELECT @DirectivasIdMaestro = ID FROM Directivas WHERE Nombre = 'Maestro/a';

-- Sacando el ID de los instrumentos
DECLARE @InstrumentoIdTeclado uniqueidentifier;
DECLARE @InstrumentoIdGuitarra uniqueidentifier;
DECLARE @InstrumentoIdBateria uniqueidentifier;
DECLARE @InstrumentoIdGuiro uniqueidentifier;
SELECT @InstrumentoIdTeclado = ID FROM Instrumentos WHERE Nombre = 'Teclado';
SELECT @InstrumentoIdBateria = ID FROM Instrumentos WHERE Nombre = 'Bateria';
SELECT @InstrumentoIdGuitarra = ID FROM Instrumentos WHERE Nombre = 'Guitarra';
SELECT @InstrumentoIdGuiro = ID FROM Instrumentos WHERE Nombre = 'Güiro';

-- Sacando el ID de los Roles
Declare @RolAdmin uniqueidentifier;
Declare @RolMiembro uniqueidentifier;
SELECT @RolAdmin = ID FROM Rol WHERE Nombre = 'Administrador';
SELECT @RolMiembro = ID FROM Rol WHERE Nombre = 'Miembro';

--Insertado de quienes votaron
	INSERT INTO Votos (ID, VotacionID, OpcionID, MembresiaID)
VALUES
    (NEWID(), @VotacionID, @OpcionID1, @MembresiaIdHnoJaime),
    (NEWID(), @VotacionID, @OpcionID1, @MembresiaIdHnoBryan),
	(NEWID(), @VotacionID, @OpcionID3, @MembresiaIdHnaAlba),
    (NEWID(), @VotacionID, @OpcionID3, @MembresiaIdHnaBetty),
    (NEWID(), @VotacionID, @OpcionID2, @MembresiaIdHnoJulio),
    (NEWID(), @VotacionID, @OpcionID2, @MembresiaIdHnaClaudia);
	
--Insertado de interesados en el evento
INSERT INTO Interesados (ID, EventoID, MembresiaID, FechaInteres)
VALUES 
	(NEWID(), @EventoCupinco, @MembresiaIdHnoBryan,'2023-11-04 19:00:00'),
	(NEWID(), @EventoCupinco, @MembresiaIdHnoJaime,'2023-11-04 19:00:00');

--Insertado de valores de los directivos
INSERT INTO Directivos(ID, MembresiaId, DirectivasId,ComunidadId)
VALUES 
    (NEWID(), @MembresiaIdHnaBetty, @DirectivasIdPastor, NULL),
    (NEWID(), @MembresiaIdHnoJaime, @DirectivasIdPastor, NULL),
	(NEWID(), @MembresiaIdHnoBryan, @DirectivasIdPastor, NULL),
	(NEWID(), @MembresiaIdHnaBetty, @DirectivasIdMaestro, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaClaudia, @DirectivasIdMaestro, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaIrene, @DirectivasIdMaestro, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnoBryan, @DirectivasIdMaestro, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaPatty, @DirectivasIdMaestro, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaAlba, @DirectivasIdMaestro, @ComunidadIdNinos),
	(NEWID(), @MembresiaIdHnoBryan, @DirectivasIdTesorero, @ComunidadIdJovenes);

	-- Insertar músicos en la tabla Musicos
INSERT INTO Musicos (ID, MembresiaId, InstrumentoId)
VALUES
    (NEWID(), @MembresiaIdHnoJaime, @InstrumentoIdGuitarra),
    (NEWID(), @MembresiaIdHnoBryan, @InstrumentoIdTeclado),
    (NEWID(), @MembresiaIdHnoBryan, @InstrumentoIdGuitarra),
    (NEWID(), @MembresiaIdHnoBryan, @InstrumentoIdGuiro),
    (NEWID(), @MembresiaIdHnoBryan, @InstrumentoIdBateria);


-- Inserciones en las comunidades
INSERT INTO MembresiasComunidades (ID, MembresiaId, ComunidadId)
VALUES
    (NEWID(), @MembresiaIdHnaJessica, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaAngela, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaBetty, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaClaudia, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaIrene, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaPatty, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaAlba, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnaTita, @ComunidadIdSeñoras),
    (NEWID(), @MembresiaIdHnoJaime, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnoBryan, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnaJessica, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnaBetty, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnaClaudia, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnaIrene, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnaPatty, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnaAlba, @ComunidadIdJovenes),
    (NEWID(), @MembresiaIdHnoJulio, @ComunidadIdHeroes),
    (NEWID(), @MembresiaIdHnoVladimir, @ComunidadIdHeroes),
	(NEWID(), @MembresiaIdHnaBetty, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaClaudia, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaIrene, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnoBryan, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaPatty, @ComunidadIdNinos),
    (NEWID(), @MembresiaIdHnaAlba, @ComunidadIdNinos);

-- Insertando valores en RolMembresia
-- Insertar valores en RolMembresia con RolMiembro para cada Membresia
INSERT INTO RolMembresia (ID, MenmbresiaId, RolId)
VALUES
    (NEWID(), @MembresiaIdHnoJaime, @RolAdmin),
    (NEWID(), @MembresiaIdHnoBryan, @RolAdmin),
    (NEWID(), @MembresiaIdHnoJulio, @RolMiembro),
    (NEWID(), @MembresiaIdHnaJessica, @RolMiembro),
    (NEWID(), @MembresiaIdHnaAngela, @RolMiembro),
    (NEWID(), @MembresiaIdHnaBetty, @RolMiembro),
    (NEWID(), @MembresiaIdHnaClaudia, @RolMiembro),
    (NEWID(), @MembresiaIdHnaIrene, @RolMiembro),
    (NEWID(), @MembresiaIdHnaPatty, @RolMiembro),
    (NEWID(), @MembresiaIdHnaYanira, @RolMiembro),
    (NEWID(), @MembresiaIdHnaFrancisca, @RolMiembro),
    (NEWID(), @MembresiaIdHnaTita, @RolMiembro),
    (NEWID(), @MembresiaIdHnaNuria, @RolMiembro),
    (NEWID(), @MembresiaIdHnoVladimir, @RolMiembro),
    (NEWID(), @MembresiaIdMamitaNoy, @RolMiembro),
    (NEWID(), @MembresiaIdHnaRosa, @RolMiembro),
    (NEWID(), @MembresiaIdHnoJairo, @RolMiembro),
    (NEWID(), @MembresiaIdHnoDavid, @RolMiembro),
    (NEWID(), @MembresiaIdHnaAlba, @RolMiembro);


--para ver los valores desde SQL que inserto
SELECT * FROM Eventos;
SELECT * FROM Votaciones;
SELECT * FROM OpcionesVotacion;
SELECT * FROM Votos;
SELECT * FROM Interesados;
SELECT * FROM Membresias;
SELECT * FROM Comunidades;
SELECT * FROM Directivas;
SELECT * FROM MembresiasComunidades;
SELECT * FROM Directivos;
SELECT * FROM Instrumentos;
SELECT * FROM Musicos;
SELECT * FROM Rol;
SELECT * FROM RolMembresia;