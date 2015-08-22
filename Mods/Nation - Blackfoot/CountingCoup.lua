-- CountingCoup -- Author: Neirai -- DateCreated: 5/8/2014 1:40:33 PM
-- Allows Counting Coup to be a big part of playing the Blackfoot --
--------------------------------------------------------------------
function CheckBravery(pPlayer, pUnit)
	--local pPlayer = Players[player]
	--local pUnit = pPlayer:GetUnitByID(unit)
	local pPlot = pUnit:GetPlot()
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	print(x .. ", " .. y)
	local range = 1
	for dx = -range, range do
		for dy = -range, range do
			local plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if plot then
				local pOther = plot:GetUnit()
				if pOther ~= nil then
					local pTeam = pPlayer:GetTeam()
					local oTeam = pOther:GetTeam()
					if Teams[pTeam]:IsAtWar(Teams[oTeam]) then
						print("We're at war")
						return true
					end
				end
			end
		end
	end
	return false
end

function CountSomeCoup(PlayerID)
	local pPlayer = Players[PlayerID]
	local pCiv = pPlayer:GetCivilizationType()
	if (pCiv == GameInfoTypes.CIVILIZATION_BLACKFOOTFIRSTNATION) then
		print ("I'm gonna count me some coup")
  		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP1) then --has this unit triggered counting coup?
				if CheckBravery(pPlayer, pUnit) then
					local pExp = (pUnit:GetLevel() * 0.4)
					if pExp > 2 then
						print("Big Extra XP")
						pUnit:ChangeExperience(pExp, -1, true)
					else
						print("Little Extra XP")
						pUnit:ChangeExperience(2, -1, true)
					end
				end
				local pPlot = pUnit:GetPlot()
				if pPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_BISON then
					print("Bison Dollars!")
					pUnit:ChangeExperience(2)
					pUnit:SetDamage((100 - (pUnit:GetCurrHitPoints() - 5)))
				end
			end
		end
	else
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			local pOwner = Players[pPlot:GetOwner()]
			if pOwner == pPlayer then
				if pPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_BISON then
					print("Bison Damage!")
					local BisonDamage = pUnit:GetCurrHitPoints() - 25
					if BisonDamage > 0 then
						pUnit:SetDamage(25)
					else
						pUnit:Kill(true, -1)
					end
				end
			end
		end
	end
end

--				if pUnit:GetLevel() > 0 then
	--				if CheckBravery(pPlayer, pUnit, 1) == true then
		---				iEXP = (pUnit:GetExperience() + 10)
			--			pUnit:SetExperience(iEXP)
				--		local pTitle = "Counting Coup"
					--	local pDescA = "One of our "  
						--local pDescB = " units have proven themselves to be both cunning and brave, earning a place in the Warrior Society of the Blackfoot."
--						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_VICTORY, (pDescA .. pUnit:GetName() .. pDescB), pTitle)
	--					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY1, false)
	--					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP2, true)
	--				else
		--				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY1, false)
			--			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP1, true)
				--	end
--				end
	--		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY2) then --has this unit triggered counting coup?
		--		if pUnit:GetLevel() > 1 then
			--		if CheckBravery(pPlayer, pUnit, 1) == true then
				--		local pCulture = (pUnit:GetBaseCombatStrength() * 0.5)
					--	pPlayer:ChangeJONSCulture(pCulture)
--						local pTitle = "Counting Coup"
	--					local pDescA = "One of our "  
		--				local pDescB = " units has made heroes of themselves. Their story is now being told at campfires, adding a burst to our culture."
			--			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_VICTORY, (pDescA .. pUnit:GetName() .. pDescB), pTitle)
				--		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY2, false)
					--	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP3, true)
--					else
	--					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY2, false)
		---				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP2, true)
			--		end
				--end
--			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY3) then --has this unit triggered counting coup?
	--			if pUnit:GetLevel() > 2 then
	--				if CheckBravery(pPlayer, pUnit, 2) == true then
		--				pPlayer:ChangeJONSCulture(pUnit:GetBaseCombatStrength())
			--			local pTitle = "Counting Coup"
				--		local pDescA = "One of our "  
					--	local pDescB = "s has proven himself to be a great leader. Now he will become a commander of the battlefield and his story will bring culture to our people."
						--pPlayer:AddNotification(NotificationTypes.NOTIFICATION_VICTORY, (pDescA .. pUnit:GetName() .. pDescB), pTitle)
--						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_GREAT_GENERAL, true)
	--					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY3, false)
		--				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP4, true)
			--		else
				--		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY3, false)
					--	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP3, true)
--					end
	--			end
		--	elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY4) then --has this unit triggered counting coup?
			--	if pUnit:GetLevel() > 3 then
--					if CheckBravery(pPlayer, pUnit, 2) == true then
	--					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_LEGENDARYBLACKFOOT, true)
		--				local pTitle = "Great Honor"
			--			local pDescA = "Our "  
				--		local pDescB = "s have made yet another honorable exploit. All of our people feel joy and honor, and they will always be a legend among our people."
					--	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_VICTORY, (pDescA .. pUnit:GetName() .. pDescB), pTitle)
--						pPlayer:ChangeGoldenAgeProgressMeter((pUnit:GetBaseCombatStrength() / 2))
	--					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY4, false)
		--				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP4, true)
			--		else
				--		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHECKINGBRAVERY4, false)
					--	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP4, true)
--					end
	--			end
		--	end
--		end
	--end
--end
GameEvents.PlayerDoTurn.Add(CountSomeCoup)