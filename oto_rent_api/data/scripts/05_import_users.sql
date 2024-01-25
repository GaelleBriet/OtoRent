

BEGIN;
INSERT INTO "account" ( "name", "firstname", "email", "password") VALUES
( 'WAYNE', 'Bruce', 'b.wayne@wayne-enterprise.com', '$2y$10'),
( 'STARK', 'Tony', 't.stark@stark-indestries.com' , '$2y$10');
COMMIT;
