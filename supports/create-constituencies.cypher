// This query creates nodes representing all constituencies in Ireland.


CREATE
	(gw:Constituency1 {Population:150874,	Seats:5, Name: "GalwayWest1"}),
	(DSW:Constituency1	{Population:144908,	Seats:5, Name: "Dublin SouthWest1"}),
	(DW:Constituency1	{Population:113179,	Seats:4, Name: "Dublin West1"}),
	(DunL:Constituency1{Population:118791,	Seats:4, Name: "Dún Laoghaire1"});

	
;	(GW: Constituency	{Population: "150874",	Seats:"5", Name: "GalwayWest"}),


MATCH 
(c.Constituency)
WHERE 
c.Name = 'Carlow-Kilkenny'
SET c.Population = 145659, c.Seats = 4
RETURN 
c
MATCH (n:Constituency1)
RETURN avg(n.Population)

MATCH
(c:Constituency), (b:Constituency1)
DETACH DELETE c, b

CREATE		
(CK: Constituency	{Population:145659,Seats:4, Name: "Carlow-Kilkenny"}),
(CM: Constituency	{Population:120483, Seats:4, Name: "Cavan-Monaghan"}),
(CE: Constituency	{Population:111336, Seats:4, Name: "Clare"}),
(CE: Constituency	{Population:114365,	Seats:4, Name: "Cork East"}),
(CNC: Constituency	{Population:117170,	Seats:4, Name: "Cork North Central"}),
(CNW: Constituency	{Population:86593,	Seats:3, Name: "Cork NorthWest"}),
(CSC: Constituency	{Population:117952,	Seats:4, Name: "Cork SouthCentral"}),
(CSW: Constituency	{Population:82952,	Seats:3, Name: "Cork SouthWest"}),
(DL: Constituency	{Population:152358,	Seats:5, Name: "Donegal"}),
(DBN:Constituency	{Population:146512,	Seats:5, Name: "Dublin Bay North"}),
(DBS:Constituency	{Population:116396,	Seats:4, Name: "Dublin Bay South"}),
(DC:Constituency	{Population:89030,	Seats:3, Name: "Dublin Central"}),
(DF:Constituency	{Population:141162,	Seats:5, Name: "Dublin Fingal"}),
(DMW:Constituency	{Population:110427,	Seats:4, Name: "Dublin MidWest"}),
(DNW:Constituency	{Population:90534,	Seats:3, Name: "Dublin NorthWest"}),
(DR:Constituency	{Population:87470,	Seats:3, Name: "Dublin Rathdown"}),
(DSC:Constituency	{Population:114660,	Seats:4, Name: "Dublin SouthCentral"}),
(DSW:Constituency	{Population:144908,	Seats:5, Name: "Dublin SouthWest"}),
(DW:Constituency	{Population:113179,	Seats;4, Name: "Dublin West"}),
(DunL:Constituency	{Population:118791,	Seats:4, Name: "Dún Laoghaire"}),
(GE:Constituency	{Population:89564,	Seats:3, Name: "GalwayEast"}),
(GW:Constituency	{Population:150874,	Seats:5, Name: "GalwayWest"}),
(Kerry:Constituency	{Population:145502, Seats:5, Name: "Kerry"})
(KN:Constituency	{Population:115350,	Seats:4, Name: "Kildare North"}),
(KS:Constituency	{Population:115350,	Seats:3, Name: "Kildare South"}),
(Laois:Constituency	{Population:87745,	Seats:3, Name: "Laois"}),
(LIM:Constituency	{Population:113835, Seats:4, Name: "Limerick City"}),
(LC:Constituency	{Population:83834,	Seats:3, Name: "Limerick County"}),
(LW:Constituency	{Population:116802,	Seats:4, Name: "Longford Westmeath"}),
(Louth:Constituency	{Population:143272,	Seats:5, Name: "Louth"}),
(Mayo:Constituency	{Population:120332,	Seats:4, Name: "Mayo"}),
(ME:Constituency	{Population:86572,	Seats:3, Name: "Meath East"}),
(MW:Constituency	{Population:85550,	Seats:3, Name: "Meath West"}),
(OY:Constituency	{Population:87640,	Seats:3, Name: "Offaly"}),
(RG:Constituency	{Population:84586,	Seats:3, Name: "Roscommon Galway"}),
(SL:Constituency	{Population:119153,	Seats:4, Name: "Sligo Leitrim"}),
(TIP:Constituency	{Population:147801,	Seats:5, Name: "Tipperary"}),
(WTD:Constituency	{Population:113795,	Seats:4, Name: "Waterford"}),
(WXD:Constituency	{Population:145320,	Seats:5, Name: "Wexford"}),
(WW:Constituency	{Population:141012,	Seats:5, Name: "Wicklow"});
