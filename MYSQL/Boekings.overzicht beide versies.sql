Use big_five_safari;

Create View Boekingsoverzicht2 AS
select Accomodatie.naam, Accomodatie.stad, Accomodatie.land, Accomodatie.kamer, concat(Reiziger.voornaam," ",Reiziger.achternaam) as reiziger , res.aankomstDatum,
datediff(res.vertrekDatum, res.aankomstDatum) As aantalDagen, res.betaald  
From Accomodatie
INNER JOIN Reservering res On res.accomodatieCode = Accomodatie.accomodatieCode
INNER JOIN Reiziger On Reiziger.reizigersCode = res.reizigersCode
order by res.aankomstDatum;


Create View Boekingsoverzicht AS
select Accomodatie.naam, Accomodatie.stad, Accomodatie.kamer, Reiziger.hoofdreiziger, Accomodatie.soort, Reiziger.adres, Accomodatie.land , Reiziger.postcode, Reiziger.voornaam, Reiziger.achternaam, Reiziger.plaats, res.aankomstDatum, res.vertrekDatum, res.idReservering, res.betaald, res.reizigersCode, res.accomodatieCode
From Accomodatie
INNER JOIN Reservering res On res.accomodatieCode = Accomodatie.accomodatieCode
INNER JOIN Reiziger On Reiziger.reizigersCode = res.reizigersCode
order by res.aankomstDatum;
