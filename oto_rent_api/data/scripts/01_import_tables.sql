BEGIN;

-- Comme c'est un script de création de tables ont s'assure que celles-ci
-- Soit supprimées avant de les créées.
-- On peut supprimer plusieurs tables en même temps
DROP TABLE IF EXISTS "account", "vehicle", "agency", "rent";

-- Création de la table "user"
CREATE TABLE "account" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "firstname" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" VARCHAR(255) NOT NULL DEFAULT 'user',
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NULL
);

-- Création de la table "agence"
CREATE TABLE "agency" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "latitude" FLOAT NOT NULL,
    "longitude" FLOAT NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NULL
);

-- Création de la table "vehicle"
CREATE TABLE "vehicle" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "mark" VARCHAR(255) NOT NULL,
    "model" VARCHAR(255) NOT NULL,
    "zeroto100" FLOAT NOT NULL,
    "topspeed" INT NOT NULL,
    "power" INT NOT NULL,
    "ecoclass" VARCHAR(1) NOT NULL,
    "price" INT NOT NULL,
    "picture" VARCHAR(255) NULL,
    "agency_id" INT NOT NULL REFERENCES "agency" ("id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NULL
);

-- Création de la table "rent"

CREATE TABLE "rent" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "account_id" INT NOT NULL REFERENCES "account" ("id"),
    "vehicle_id" INT NOT NULL REFERENCES "vehicle" ("id"),
    "day" TIMESTAMP NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NULL
);

COMMIT;
