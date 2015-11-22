--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_PapalDecisions.lua');
--==========================================================================================================================	
-- Building_ResourcePerEra
--==========================================================================================================================		
CREATE TABLE IF NOT EXISTS Building_ResourcePerEra (
  BuildingType text,
  ResourceType text,
  Quantity integer default 0,
  InitialQuantity integer default 0
);

INSERT INTO Building_ResourcePerEra 	
			(BuildingType, 						ResourceType,	Quantity, 	InitialQuantity)
SELECT		('BUILDING_JFD_APOSTOLIC_PALACE'), 	Type,			0, 			2
FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES';
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,								Description) 
VALUES		('POLICY_JFD_PAPAL_SOCIETAS_JESU',	'TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU');
--==========================================================================================================================
--==========================================================================================================================

