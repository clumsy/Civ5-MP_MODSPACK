ALTER TABLE Traits
	ADD HighestTourismCulture integer DEFAULT -1;

CREATE TABLE IF NOT EXISTS Building_YieldFromMusic (
  BuildingType text,
  YieldType text,
  Yield integer default 0
);

CREATE TABLE IF NOT EXISTS Building_YieldFromOthersGreatWorks (
  BuildingType text,
  YieldType text,
  Yield integer default 0
);