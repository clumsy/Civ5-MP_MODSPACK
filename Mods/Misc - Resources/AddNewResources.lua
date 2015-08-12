-- Resource Generator V4.0
-- Author: Deep_Blue
--------------------------------------------------------------
include("ResNewGenerator.lua")

function PlaceModResources()
	
	OnMapResourceGenerator("RESOURCE_SUNFLOWER", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_PINE", {"TERRAIN_DESERT", "TERRAIN_PLAINS", "TERRAIN_GRASS"} );
	OnMapResourceGenerator("RESOURCE_APPLE", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_EMERALD", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_BLUEBERRY", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_SOYBEAN", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_SAPPHIRE", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_RUBY", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_POTATOE", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_PLATINUM", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_PINEAPPLE", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_PEANUT", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_OATS", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_NICKEL", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_LEAD", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_LAVENDER", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_HOPS", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_RUBBER", {"TERRAIN_PLAINS", "TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_COCONUT", {"TERRAIN_PLAINS", "TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_MARSH"} );
	OnMapResourceGenerator("RESOURCE_TEA", {"TERRAIN_PLAINS", "TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_FLAX", {"FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_CACAO", {"TERRAIN_PLAINS", "TERRAIN_DESERT", "TERRAIN_TUNDRA", "FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_TIN", {"FEATURE_OASIS"});
	--OnMapResourceGenerator("RESOURCE_CLAY", {"FEATURE_OASIS", "FEATURE_FOREST", "FEATURE_JUNGLE"});
	OnMapResourceGenerator("RESOURCE_AMBER", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_MANGANESE", {"TERRAIN_PLAINS", "TERRAIN_GRASS", "FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_ALOE_VERA", {"TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_OASIS"} );
	OnMapResourceGenerator("RESOURCE_TITANIUM", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_POPPY", {"FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_COFFEE", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_MAHOGANY", {"TERRAIN_PLAINS", "TERRAIN_DESERT", "TERRAIN_TUNDRA", "FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_LUMBER", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_BARLEY", {"TERRAIN_GRASS", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS", "FEATURE_MARSH"});
	OnMapResourceGenerator("RESOURCE_MANGO", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW","FEATURE_OASIS"});
	OnMapResourceGenerator("RESOURCE_CORN", {"TERRAIN_PLAINS", "FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS", "FEATURE_MARSH"});
	OnMapResourceGenerator("RESOURCE_TOBACCO", {"TERRAIN_PLAINS", "FEATURE_FOREST"});
	
end

--[[ 

this function will automatically spread the resource on the map according to:
1) map size
2) number of civilizations in the game
3) Pre-game resource options (sparse,standard,..)
4) defined terrain&feature Booleans in resource xml file.
You can add as many resources as you want, example:
OnMapResourceGenerator("RESOURCE_MyResource1");
OnMapResourceGenerator("RESOURCE_MyResource2");

Advanced Options: 
----------------
you can use additional option with the function:

OnMapResourceGenerator("RESOURCE_MyResource" , Excludes )

Excludes is a table containing any Terrain or feature you do not want, put them in any order but 
they must have exact Type string in Civ5Terrains.xml and Civ5Features.xml otherwise they will be igonred.

Example:

OnMapResourceGenerator("RESOURCE_COPPER" , {"TERRAIN_DESERT", "TERRAIN_PLAINS"} )

--]]