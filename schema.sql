  CREATE TABLE animals (
  id integer PRIMARY KEY,
  name varchar,
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal
  species character varying
)

CREATE TABLE owners( id SERIAL PRIMARY KEY, full_name VARCHAR(50), age INT);
CREATE TABLE species( id SERIAL PRIMARY KEY, name VARCHAR(50));
CREATE SEQUENCE animals_id_seq owned BY animals.id;
ALTER TABLE ANIMALS ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');
SELECT SETVAL(pg_get_serial_sequence('animals', 'id'), max(id)) FROM animals;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);