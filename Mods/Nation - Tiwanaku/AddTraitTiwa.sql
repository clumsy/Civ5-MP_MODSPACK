ALTER TABLE Traits
	ADD FreeBuildingonTech text;

ALTER TABLE Traits
	ADD FreeBuildingTechPrereq text;

ALTER TABLE Traits
	ADD NumFreeBuildingonTech integer DEFAULT -1;
	