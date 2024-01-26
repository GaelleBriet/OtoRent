

BEGIN;
INSERT INTO "agency" ("name", "address", "latitude", "longitude", "phone", "email") VALUES
('O''To Rent Paris','214 Rue de Maubeuge 75001 Paris', 48.8804947, 2.3523043, '+33 1 23 45 67 89','paris@oto-rent.com'),
('O''To Rent Nantes','214 Rue de Paris 44000 Nantes', 47.2173, -1.5534, '+33 1 23 45 67 89','nantes@oto-rent.com'),
('O''To Rent Strasbourg','214 Rue de Bordeaux 67000 Strasbourg', 47.3894744, 0.6902978, '+33 1 23 45 67 89','strasbourg@oto-rent.com'),
('O''To Rent Lyon','214 Rue de Rennes 69000 Lyon', 45.74846, 4.84671, '+33 1 23 45 67 89','lyon@oto-rent.com'),
('O''To Rent Marseille','214 Rue de Toulouse 13000 Marseille', 43.2936527, 5.3921322, '+33 1 23 45 67 89','marseille@oto-rent.com'),
('O''To Rent Toulouse','214 Rue de Vanne 31000 Toulouse', 43.6043, 1.4437, '+33 1 23 45 67 89','toulouse@oto-rent.com'),
('O''To Rent Bordeaux','214 Rue de Caen 33000 Bordeaux', 44.8404, -0.5805, '+33 1 23 45 67 89','bordeaux@oto-rent.com'),
('O''To Rent La Rochelle','214 Rue de Dunkerque 17000 La Rochelle', 46.1667, -1.15, '+33 1 23 45 67 89','la-rochelle@oto-rent.com');
COMMIT;
