--==========================================================================================================================
-- Decisions Addin Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support (
	FileName text default null
);
--==========================================================================================================================
-- Events Addin Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support (
	FileName text default null
);
--==========================================================================================================================
-- Other Tables
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Building_YieldFromCityStates (
	BuildingType text,
	YieldType text,
	Yield integer default 0,
	IncludeFriendly boolean default false
);

CREATE TABLE IF NOT EXISTS Building_ResourcePerEra (
	BuildingType text,
	ResourceType text,
	Quantity integer default 0,
	InitialQuantity integer default 0
);