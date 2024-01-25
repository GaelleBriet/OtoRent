BEGIN;

DELETE from "account";
DELETE from "vehicle";
DELETE from "agency";
DELETE from "rent";

ALTER SEQUENCE agency_id_seq RESTART;
ALTER SEQUENCE account_id_seq RESTART;
ALTER SEQUENCE vehicle_id_seq RESTART;
ALTER SEQUENCE rent_id_seq RESTART;

COMMIT;