-- OnHALoad
-- Author: Pazyryk
-- DateCreated: 7/28/2013 3:16:16 PM
--------------------------------------------------------------
function OnLoadHNRMain()
	--check to make sure all expected SQL files were loaded to end of file
	local expectedSQLfiles = {'ArtDefines_Animals.sql',
					'ArtDefines_Cereals.sql',
					'ArtDefines_Flowers.sql',
					'ArtDefines_Gems.sql',
					'ArtDefines_Misc.sql',
					'ArtDefines_Ores.sql',
					'ArtDefines_Shrubs.sql',
					'ArtDefines_Trees.sql',
					'Update Buildings.sql',
					'Improvement_ResourceType_Yields.sql',
					'Improvement_ResourceTypes.sql',
					'Resource_FeatureBooleans.sql',
					'Resource_FeatureTerrainBooleans.sql',
					'Resource_Flavors.sql',
					'Resource_QuantityTypes.sql',
					'Resource_TerrainBooleans.sql',
					'Resource_YieldChanges.sql',
					'Resources.sql',
					'UpdateUnits.sql',
					'FontIconAtlas.xml',
					'ResourceIcons.xml',
					'BuildingsText.xml',
					'ResourceText.xml'}
	local bAnyErrors = false
	for i = 1, #expectedSQLfiles do
		local expectedFile = expectedSQLfiles[i]
		local bLoaded = false
		for row in GameInfo.HNRDebugTableCheck() do
			if expectedFile == row.FileName then
				bLoaded = true
				break
			end
		end
		if not bLoaded then
			bAnyErrors = true
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!! ERROR: "..expectedFile.." was not loaded to end of file !!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		end
	end
	if not bAnyErrors then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!! All expected SQL and XML files loaded to end of file...!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	end

end

--at end of file
OnLoadHNRMain()
