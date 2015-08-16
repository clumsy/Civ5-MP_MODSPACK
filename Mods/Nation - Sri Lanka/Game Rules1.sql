INSERT OR REPLACE INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 											 Description)
VALUES		('BUILDINGCLASS_SRI_LANKA_PRODUCTION', 			'BUILDING_SRI_LANKA_PRODUCTION', 			'Sri Lanka Production Dummy');

INSERT OR REPLACE INTO Buildings 	
			(Type, 						 					BuildingClass, 								Description,						GreatWorkCount,		Cost,	FaithCost,		PrereqTech, 	NeverCapture,	NukeImmune,		IconAtlas,		 PortraitIndex)
VALUES		('BUILDING_SRI_LANKA_PRODUCTION', 	 			'BUILDINGCLASS_SRI_LANKA_PRODUCTION', 		'Sri Lanka Production Dummy',		-1, 				-1,		-1, 			null,			1,				1,				'BW_ATLAS_1',				63);

INSERT INTO Building_YieldChanges 
			(BuildingType, 							YieldType,				Yield)
VALUES		('BUILDING_SRI_LANKA_PRODUCTION', 		'YIELD_PRODUCTION',			1);-- Insert SQL Rules Here 