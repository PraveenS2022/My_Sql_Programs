CREATE DATABASE UNIVERSE;
USE UNIVERSE;

CREATE TABLE Planets (
    id INT,
    name VARCHAR(30),
    radius_km INT,
    mass_kg BIGINT,
    distance_from_sun_mkm INT,
    num_moons INT,
    dominant_gas VARCHAR(30),
    surface_temperature_c INT
);

INSERT INTO Planets VALUES 
(1, 'Mercury', 2440, 330000000000000000000000, 58, 0, 'None', 167),
(2, 'Venus', 6052, 4870000000000000000000000, 108, 0, 'CO2', 464),
(3, 'Earth', 6371, 5970000000000000000000000, 150, 1, 'N2', 15),
(4, 'Mars', 3389, 642000000000000000000000, 228, 2, 'CO2', -60),
(5, 'Jupiter', 69911, 1900000000000000000000000000, 778, 79, 'H2', -145),
(6, 'Saturn', 58232, 568000000000000000000000000, 1429, 83, 'H2', -178),
(7, 'Uranus', 25362, 86800000000000000000000000, 2871, 27, 'H2', -224),
(8, 'Neptune', 24622, 102000000000000000000000000, 4495, 14, 'H2', -218),
(9, 'Pluto', 1188, 13000000000000000000000, 5900, 5, 'CH4', -230),
(10, 'Planet X', 7000, 6000000000000000000000000, 10000, 2, 'Unknown', -150);

SET SQL_SAFE_UPDATES = 0;

UPDATE Planets SET surface_temperature_c = 20 WHERE name = 'Earth';
UPDATE Planets SET dominant_gas = 'H2-He mix' WHERE num_moons > 50;
UPDATE Planets SET name = 'Unknown' WHERE radius_km < 2000;
DELETE FROM Planets WHERE name = 'Planet X';
DELETE FROM Planets WHERE surface_temperature_c < -200;

SELECT * FROM Planets WHERE num_moons > 10;
SELECT * FROM Planets WHERE mass_kg > 1000000000000000000000000 AND surface_temperature_c < 0;
SELECT * FROM Planets WHERE dominant_gas = 'CO2' OR dominant_gas = 'N2';
SELECT * FROM Planets WHERE name IN ('Earth', 'Mars', 'Venus');
SELECT * FROM Planets WHERE name NOT IN ('Pluto', 'Planet X');
SELECT * FROM Planets WHERE distance_from_sun_mkm BETWEEN 100 AND 1000;
SELECT * FROM Planets WHERE surface_temperature_c NOT BETWEEN -100 AND 100;

CREATE TABLE Moons (
    id INT,
    name VARCHAR(50),
    planet VARCHAR(30),
    radius_km INT,
    distance_from_planet_km INT,
    has_atmosphere BOOLEAN,
    discovered_by VARCHAR(50),
    discovery_year INT
);

INSERT INTO Moons VALUES
(1, 'Moon', 'Earth', 1737, 384400, FALSE, 'Unknown', 0),
(2, 'Phobos', 'Mars', 11, 9377, FALSE, 'Hall', 1877),
(3, 'Deimos', 'Mars', 6, 23460, FALSE, 'Hall', 1877),
(4, 'Io', 'Jupiter', 1821, 421700, TRUE, 'Galileo', 1610),
(5, 'Europa', 'Jupiter', 1561, 670900, TRUE, 'Galileo', 1610),
(6, 'Ganymede', 'Jupiter', 2634, 1070400, TRUE, 'Galileo', 1610),
(7, 'Callisto', 'Jupiter', 2410, 1882700, TRUE, 'Galileo', 1610),
(8, 'Titan', 'Saturn', 2575, 1221870, TRUE, 'Huygens', 1655),
(9, 'Enceladus', 'Saturn', 252, 237948, TRUE, 'Herschel', 1789),
(10, 'Triton', 'Neptune', 1353, 354800, TRUE, 'Lassell', 1846),
(11, 'Charon', 'Pluto', 606, 19591, FALSE, 'Christy', 1978),
(12, 'Miranda', 'Uranus', 236, 129900, FALSE, 'Kuiper', 1948),
(13, 'Oberon', 'Uranus', 761, 583500, FALSE, 'Herschel', 1787),
(14, 'Ariel', 'Uranus', 578, 191020, FALSE, 'Lassell', 1851),
(15, 'Dysnomia', 'Eris', 350, 37400, FALSE, 'Brown', 2005),
(16, 'Pan', 'Saturn', 14, 133584, FALSE, 'Showalter', 1990),
(17, 'Atlas', 'Saturn', 15, 137670, FALSE, 'Terrile', 1980),
(18, 'Hyperion', 'Saturn', 135, 1481000, FALSE, 'Bond', 1848),
(19, 'Mimas', 'Saturn', 198, 185520, FALSE, 'Herschel', 1789),
(20, 'Dione', 'Saturn', 561, 377400, FALSE, 'Cassini', 1684);

UPDATE Moons SET planet = 'Earth' WHERE name = 'Moon';
UPDATE Moons SET has_atmosphere = TRUE WHERE name IN ('Titan', 'Europa');
UPDATE Moons SET discovered_by = 'Modern Astronomer' WHERE discovery_year > 1900;
UPDATE Moons SET name = CONCAT(name, '_Updated') WHERE radius_km < 100;
DELETE FROM Moons WHERE planet = 'Eris';
DELETE FROM Moons WHERE has_atmosphere = FALSE AND radius_km < 100;

SELECT * FROM Moons WHERE distance_from_planet_km > 1000000 AND has_atmosphere = TRUE;
SELECT * FROM Moons WHERE discovered_by IN ('Galileo', 'Cassini');
SELECT * FROM Moons WHERE planet NOT IN ('Jupiter', 'Saturn');
SELECT * FROM Moons WHERE radius_km BETWEEN 500 AND 2000;
SELECT * FROM Moons WHERE discovery_year NOT BETWEEN 1600 AND 1900;

CREATE TABLE Galaxies (
    id INT,
    name VARCHAR(50),
    type VARCHAR(30),
    distance_lightyears BIGINT,
    num_stars_estimate BIGINT,
    known_planetary_systems INT,
    dominant_element VARCHAR(30),
    age_billion_years FLOAT
);

INSERT INTO Galaxies VALUES
(1, 'Milky Way', 'Spiral', 0, 300000000000, 8000, 'Hydrogen', 13.6),
(2, 'Andromeda', 'Spiral', 2537000, 1000000000000, 10000, 'Hydrogen', 10.0),
(3, 'Triangulum', 'Spiral', 2730000, 40000000000, 3000, 'Helium', 12.0),
(4, 'Whirlpool', 'Spiral', 23000000, 100000000000, 5000, 'Hydrogen', 11.0),
(5, 'Sombrero', 'Spiral', 31000000, 80000000000, 2000, 'Hydrogen', 9.5),
(6, 'Large Magellanic Cloud', 'Irregular', 163000, 30000000000, 1500, 'Hydrogen', 13.0),
(7, 'Small Magellanic Cloud', 'Irregular', 200000, 25000000000, 1000, 'Hydrogen', 12.5),
(8, 'Messier 87', 'Elliptical', 53000000, 200000000000, 7000, 'Helium', 12.0),
(9, 'NGC 1300', 'Barred Spiral', 61000000, 100000000000, 3000, 'Hydrogen', 10.5),
(10, 'IC 1101', 'Elliptical', 1047000000, 100000000000, 100, 'Unknown', 13.8);

UPDATE Galaxies SET dominant_element = 'Hydrogen-Helium' WHERE known_planetary_systems > 4000;
UPDATE Galaxies SET age_billion_years = 13.7 WHERE name IN ('Milky Way', 'IC 1101');
UPDATE Galaxies SET type = 'Unknown' WHERE num_stars_estimate < 50000000000;
DELETE FROM Galaxies WHERE age_billion_years < 10;
DELETE FROM Galaxies WHERE dominant_element = 'Unknown';

SELECT * FROM Galaxies WHERE num_stars_estimate > 50000000000 AND known_planetary_systems > 1000;
SELECT * FROM Galaxies WHERE dominant_element IN ('Hydrogen', 'Helium');
SELECT * FROM Galaxies WHERE type NOT IN ('Elliptical', 'Unknown');
SELECT * FROM Galaxies WHERE distance_lightyears BETWEEN 100000 AND 100000000;
SELECT * FROM Galaxies WHERE age_billion_years NOT BETWEEN 11.0 AND 13.0;
