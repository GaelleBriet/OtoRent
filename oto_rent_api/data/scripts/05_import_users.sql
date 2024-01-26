

BEGIN;
INSERT INTO "account" ( "name", "firstname", "email", "password") VALUES
( 'WAYNE', 'Bruce', 'b.wayne@wayne-enterprise.com', '$2b$10$UFen7BKYOEHmA6JS7yoB4.YnW/BqtlZcguB/W5hlHJ.c1T4oT.plS'),
( 'STARK', 'Tony', 't.stark@stark-indestries.com' , '$2b$10$KvEsyRcTidVzJe8BpkmsPeP0xCCcF3FhuFto/rdSfsm8TeSpNSWiS');
COMMIT;