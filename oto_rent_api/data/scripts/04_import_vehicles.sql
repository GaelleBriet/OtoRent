

BEGIN;
INSERT INTO "vehicle" ( "mark","model", "zeroto100","ecoclass", "power", "topspeed", "picture", "price", "agency_id") VALUES
('Toyota', 'Corolla', 9.2, 'D', 140, 205, 'https://www.automobile-magazine.fr/asset/cms/840x394/199517/config/147187/r-2022ndashcorollagrsportwp003.jpg', 50, 1),
('Ford', 'Mustang', 5.6, 'F', 460, 250, 'https://www.gpas-cache.ford.com/guid/5afe6c34-163b-3d14-ac06-6924c8668621.png', 120, 2),
('Tesla', 'Model 3', 5.3, 'A', 283, 225, 'https://cdn.automobile-propre.com/uploads/2020/10/Tesla-Model-3-Performance-2020.jpg', 200, 3),
('BMW', 'X3', 6.3, 'C', 184, 230, 'https://www.bmw.fr/content/dam/bmw/marketFR/bmw_fr/all-models/X-series/x3/x3-xdrive30e-avant.jpg', 90, 4),
('Audi', 'Q5', 6.3, 'C', 190, 230, 'https://sx-content-labs.sixt.io/Media/8fleet-1050x600/audi-q5-5d-braun-2018.png', 100, 5),
('Mercedes-Benz', 'C-Class', 5.8, 'B', 255, 250, 'https://cdn.drivek.com/configurator-imgs/cars/fr/800/MERCEDES/C-CLASS/40330_SEDAN-4-DOORS/mercedes-benz-c-class-sedan-2021-front-side-1.jpg', 150, 6),
('Chevrolet', 'Camaro', 5.2, 'F', 455, 290, 'https://www.chevrolet.cl/content/dam/chevrolet/south-america/chile/espanol/index/cars/2019-camaro/colorizer/04-2000x1000-camaro-gaz.png?imwidth=960', 130, 7),
('Nissan', 'Altima', 7.6, 'D', 182, 208, 'https://www-europe.nissan-cdn.net/content/dam/Nissan/nissan_middle_east/vehicles/altima/MY19/grades/ALTIMA-SV-Pearl-White.jpg.ximg.l_12_m.smart.jpg', 60, 8),
('Volvo', 'XC90', 5.6, 'B', 316, 240, 'https://www.largus.fr/images/styles/large_p/public/images/2015-volvo-xc90-excellence-01.jpg?itok=o0p5lx9y', 180, 1),
('Honda', 'Civic', 8.2, 'E', 174, 200, 'https://images.caradisiac.com/logos-ref/modele/modele--honda-civic-10/S0-modele--honda-civic-10.jpg', 70, 2);

COMMIT;
