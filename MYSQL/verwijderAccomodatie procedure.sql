DELIMITER $$
Create procedure verwijderAccommodatie (IN accomodatie VARCHAR(5))
BEGIN 
DECLARE openstaandeBoekingen int;
Declare nietBetaald int;
Declare totaal int;

Select count(*) as aantal into openstaandeBoekingen From reservering
where aankomstDatum > current_date() And accomodatieCode = accomodatie;

Select count(*) as aantal into nietBetaald From reservering
Where betaald = 0 And accomodatieCode = accomodatie;

Set totaal =  openstaandeBoekingen + nietBetaald;

If totaal = 0 then
Delete From Hotel Where accomodatieCode = accomodatie;
Delete From lodge Where accomodatieCode = accomodatie;
Delete From accomodatie Where accomodatieCode = accomodatie;

else 
signal SQLSTATe '45000' Set message_text = 'Kan accommodatie niet verwijderden';
end if;
end	$$	


  