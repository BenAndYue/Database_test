CREATE USER 'administratie' IDENTIFIED BY 'Vakantie2020';
GRANT ALL PRIVILEGES ON * . * TO 'administratie';
grant All on *.* to 'administratie' with grant option;

Grant select on big_five_safari.boekingsoverzicht2 to 'administratie'; 
GRANT EXECUTE ON PROCEDURE big_five_safari.verwijderAccommodatie TO 'administratie';

CREATE USER 'nieuweUser'@'localhost' IDENTIFIED BY 'hallo';






