/*Queries that provide answers to the questions from all projects.*/
SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-13';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE NOT name= 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


BEGIN;
  update animals
  set species = 'unspecified';
  ROLLBACK;

BEGIN;
  update animals
  set species = 'digimon' where name like '%mon';
  update animals
  set species = 'pokemon' where name not like '%mon';
  COMMIT;

BEGIN;
  DELETE from animals
  ROLLBACK;

BEGIN;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
  SAVEPOINT delete_2022;
  UPDATE animals
  SET weight_kg = weight_kg * -1;
  ROLLBACK TO SAVEPOINT delete_2022;
  UPDATE animals
  SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
  COMMIT;
  
SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-30' GROUP BY species;

SELECT animals.name, owner_id, full_name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owner_id = 4;
SELECT animals.name, species_id, species.name FROM animals JOIN species ON species.id = animals.species_id WHERE species_id = 1;
SELECT animals.name, owner_id, full_name FROM animals JOIN owners ON owners.id = animals.owner_id;
SELECT animals.name,species_id,species.name FROM animals JOIN species ON species.id = animals.species_id;
SELECT animals.name,owner_id,full_name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE name LIKE '%mon' AND owners.id = 2;
SELECT animals.name,owner_id,full_name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE escape_attempts = 0 AND owners.id = 5;
SELECT full_name, COUNT(owner_id) FROM owners JOIN animals on owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT (owner_id) desc limit 1;