-- DROP TABLE IF EXISTS upvotes;
DROP TABLE IF EXISTS users, pugs;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL
);

CREATE TABLE dogs (
  id SERIAL PRIMARY KEY,
  ownerId INTEGER REFERENCES users(id) NOT NULL,
  name varchar(255) DEFAULT NULL,
  breed TEXT DEFAULT NULL,
  age INTEGER DEFAULT NULL
);

INSERT INTO users (name, email) VALUES ('Alex', 'alex@email.com');
INSERT INTO users (name, email) VALUES ('Nataly', 'nataly@email.com');
INSERT INTO users (name, email) VALUES ('Hetty', 'hetty1336@example.com');
INSERT INTO users (name, email) VALUES ('Alphard', 'apha@example.com');

INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Alex'), 'Steve', 'Greyhound', 2);
INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Nataly'), 'Roger', 'Beagle', 7);
INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Hetty'), 'Dorg', 'German Shepard', 12);
INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Alphard'), 'Archibald', 'Mutt', 2);
INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Alphard'), 'Archy', 'Beagle', 20);
INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Alphard'), 'Arthur', 'Corgi', 5);
INSERT INTO dogs (ownerId, name, breed, age) VALUES ((SELECT id from users where name='Alex'), 'Dan', 'Wolf', 1);


