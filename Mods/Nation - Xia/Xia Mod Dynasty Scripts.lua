print ("Xia Scripts")

--Set to true to move your capital whenever you change dynasties; i.e. your new dyanstic capital also becomes your empire's capital.
local MoveCapitalWithDynasty = false;

--Set to true to alternate city styles during the Yuan and Qing Dynasties; only works if you have the Polynesia DLC installed.
local AlternateCityStyles = true;

--SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Xia";

--Typhlomence Diplomacy
include("UniqueDiplomacyUtils.lua")

--Stuff
local speed = Game.GetGameSpeedType();

local AssimilateDynasty = 3;

local uKhan = GameInfoTypes.UNIT_MONGOLIAN_KHAN;
local uCargo = GameInfoTypes.UNIT_CARGO_SHIP;
local uShangChariot = GameInfoTypes.UNIT_SHANG_CHARIOT_MOD;
local uMissionary = GameInfoTypes.UNITCLASS_MISSIONARY;

local bcBarracks = GameInfoTypes.BUILDINGCLASS_BARRACKS;
local bcZhou = GameInfoTypes.BUILDINGCLASS_ZHOU_DYNASTY_DUMMY;

local bFoundry = GameInfoTypes.BUILDING_XIA_MOD_BRONZE_WOKRSHOP;
local bCourthouse = GameInfoTypes.BUILDING_COURTHOUSE;
local bXia = GameInfoTypes.BUILDING_XIA_DYNASTY_DUMMY;
local bShang = GameInfoTypes.BUILDING_SHANG_DYNASTY_DUMMY;
local bZhou = GameInfoTypes.BUILDING_ZHOU_DYNASTY_DUMMY;
local bSui = GameInfoTypes.BUILDING_SUI_DYNASTY_DUMMY;
local bTang = GameInfoTypes.BUILDING_TANG_DYNASTY_DUMMY;
local bSong = GameInfoTypes.BUILDING_SONG_DYNASTY_DUMMY;

local bEverOwned = GameInfoTypes.BUILDING_CHINA_EVER_OWNED_DUMMY;
local bEverOwned2 = GameInfoTypes.BUILDING_CHINA_EVER_OWNED_DUMMY_TWO;
local bBarracksPressure = GameInfoTypes.BUILDING_XIA_RITUAL_BRONZE_DUMMY;

local pZhou = GameInfoTypes.POLICY_ZHOU_DYNASTY_DUMMY;
local pHan = GameInfoTypes.POLICY_HAN_DYNASTY_DUMMY;
local pQing = GameInfoTypes.POLICY_QING_DYNASTY_DUMMY;
local pChina = GameInfoTypes.POLICY_CHINA_DYNASTY_DUMMY;

local fTradition = GameInfoTypes.POLICY_TRADITION_FINISHER;
local fLiberty = GameInfoTypes.POLICY_LIBERTY_FINISHER;
local fHonor = GameInfoTypes.POLICY_HONOR_FINISHER;
local fPiety = GameInfoTypes.POLICY_PIETY_FINISHER;
local fPatronage = GameInfoTypes.POLICY_PATRONAGE_FINISHER;
local fAesthetics = GameInfoTypes.POLICY_AESTHETICS_FINISHER;
local fCommerce = GameInfoTypes.POLICY_COMMERCE_FINISHER;
local fExploration = GameInfoTypes.POLICY_EXPLORATION_FINISHER;
local fRationalism = GameInfoTypes.POLICY_RATIONALISM_FINISHER;

local pShangPatronage = GameInfoTypes.PROMOTION_SHANG_NOBLE_BIRTH;
local pQingBanners = GameInfoTypes.PROMOTION_XIA_BANNER_ARMY;

local iAICivilService = GameInfo.Technologies["TECH_CIVIL_SERVICE"].ID

local rPorcelain = GameInfoTypes.RESOURCE_PORCELAIN;

local isDynastySplit = (GameInfoTypes.CIVILIZATION_JFD_QING ~= nil)
local isPolynesia = (GameInfoTypes.CIVILIZATION_POLYNESIA ~= nil)
local isCulDiv = false
local CulDivID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"

for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == CulDivID) then
		isCulDiv = true
		break
	end
end

if not isPolynesia then
	AlternateCityStyles = false
end

function ErlitouGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

function xDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function xCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

--Store Plots
local xCapitalPlots = {}
local xDynasticCapitals = {}

--Get Original Capital Plots at Game Start or Capital Settle
for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[oPlayer];
		if oPlayer:IsAlive() then
			for oCity in oPlayer:Cities() do
				if oCity:IsOriginalCapital() then
					if not Players[oCity:GetOriginalOwner()]:IsMinorCiv() then
						local oPlot = oCity:Plot();
						if pPlot == oPlot then
							local sKey = xCompilePlotID(pPlot)
							xCapitalPlots[sKey] = -1
						end
					end
				end
			end
		end
    end
	for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
		local mPlayer = Players[i];
		if mPlayer:IsAlive() then
			for mCity in mPlayer:Cities() do
				if mCity:IsOriginalCapital() then
					if not Players[mCity:GetOriginalOwner()]:IsMinorCiv() then
						local mPlot = mCity:Plot();
						if pPlot == mPlot then
							local sKey = xCompilePlotID(pPlot)
							xCapitalPlots[sKey] = -1
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if pCity:IsOriginalCapital() then
			if not pPlayer:IsMinorCiv() then
				local sKey = xCompilePlotID(pPlot)
				xCapitalPlots[sKey] = -1
			end
		end
	end
end)

--Store Dynastic Capitals for Sui
for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[oPlayer];
		if oPlayer:IsAlive() then
			for oCity in oPlayer:Cities() do
				if oCity:IsHasBuilding(bXia) then	
					local oPlot = oCity:Plot();
					if pPlot == oPlot then
						local sKey = xCompilePlotID(pPlot)
						xDynasticCapitals[sKey] = -1
					end
				end
			end
		end
	end
	for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
		local mPlayer = Players[i];
		if mPlayer:IsAlive() then
			for mCity in mPlayer:Cities() do
				if mCity:IsHasBuilding(bXia) then	
					local mPlot = mCity:Plot();
					if pPlot == mPlot then
						local sKey = xCompilePlotID(pPlot)
						xDynasticCapitals[sKey] = -1
					end
				end
			end
		end
	end
end

function CheckDyCapitalstoPlots(pPlot)
	DyCapCheck = 0;
	for sKey, tTable in pairs(xDynasticCapitals) do
		local dPlot = xDecompilePlotID(sKey)
		if pPlot == dPlot then
			DyCapCheck = 1;
			break
		end
	end
	return DyCapCheck
end

--Get Xia
function GetErlitouPlayer()		
	local ePlayer = 0;
	for xPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local xPlayer = Players[xPlayer];
		if xPlayer:IsEverAlive() then
			if (xPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
				ePlayer = xPlayer;
				break
			end
		end
	end
	return ePlayer;
end

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
--Get Current Dynasty Count
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
function xGetDynastyCount(pPlayer)	
	local xDynastyCount = 0;

	local pTeam = pPlayer:GetTeam();

	for sKey, tTable in pairs(xCapitalPlots) do
		local pPlot = xDecompilePlotID(sKey)
		xDynastyX = pPlot:GetX()
		xDynastyY = pPlot:GetY()
		if (load(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool") == true) then
			xDynastyCount = xDynastyCount + 1;
		end
    end

	if pPlayer:HasPolicy(fTradition) and (load(pPlayer, "Tradition Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fLiberty) and (load(pPlayer, "Liberty Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fHonor) and (load(pPlayer, "Honor Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fPiety) and (load(pPlayer, "Piety Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fPatronage) and (load(pPlayer, "Patronage Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fAesthetics) and (load(pPlayer, "Aesthetics Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fCommerce) and (load(pPlayer, "Commerce Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fExploration) and (load(pPlayer, "Exploration Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if pPlayer:HasPolicy(fRationalism) and (load(pPlayer, "Rationalism Finished") == true) then
		xDynastyCount = xDynastyCount + 1;
	end
	if not pPlayer:IsHuman() then
		if (Teams[pTeam]:IsHasTech(iAICivilService)) and (load(pPlayer, "AI Civil Service Settle") == true) then
			xDynastyCount = xDynastyCount + 1;
		end
	end

	return xDynastyCount;

end
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

--Dynasty Names
function xGetDynasty(xCount)
	local xDynastyName = "";
	if xCount == 0 then
		xDynastyName = "Xia";
	elseif xCount == 1 then
		xDynastyName = "Shang";
	elseif xCount == 2 then
		xDynastyName = "Zhou";
	elseif xCount == 3 then
		xDynastyName = "Qin";
	elseif xCount == 4 then
		xDynastyName = "Han";
	elseif xCount == 5 then
		xDynastyName = "Sui";
	elseif xCount == 6 then
		xDynastyName = "Tang";
	elseif xCount == 7 then
		xDynastyName = "Song";
	elseif xCount == 8 then
		xDynastyName = "Yuan";
	elseif xCount == 9 then
		xDynastyName = "Ming";
	elseif xCount == 10 then
		xDynastyName = "Qing";
	elseif xCount >= 11 then
		xDynastyName = "China";
	end
	return xDynastyName;
end

function WesternTest(xTextCheck)
	local mWest = "";
	if xTextCheck == 0 then
		mWest = "Western ";
	elseif xTextCheck >= 1 then
		mWest = "W. ";
	end
	return mWest;
end

--City Lists
local XiaCities = {
	"Chu",
	"Qiongshi",
	"Zhenxun",
	"Diqiu",
	"Jiyuan",
	"Laoqiu",
	"Xihe",
	"Zhen",
	"Anyi",
	"Song",
	"Zhenguan",
	"Pinyang",
	"Kuaiji",
	"Beifudi",
	"Chong",
	"Tu",
	"Bing",
	"Yang",
	"You",
	"Qi",
	"Beichuan",
	"Weizhou",
	"Xuan",
	"Tai",
	"Yushan",
	"Kaifeng",
	"Xichuan",
	}

local ShangCities = {
	"Bo",
	"Fan",
	"Xiao",
	"Dishi",
	"Bi",
	"Yanshi",
	"Xiang",
	"Shangqiu",
	"Pugu",
	"Ao",
	"Geng",
	"Beimeng",
	"Mo",
	"Chaoge",
	"Shixianggou",
	"Yan",
	"Panlongcheng",
	"Huanbei",
	"Zhengzhou",
	"Xingan",
	"Danshan",
	"Mingtiao",
	"Muye",
	}

local ZhouCities = {
	"Hao",
	"Chengzhou",
	"Gong",
	"Henan",
	"Muye",
	"Qin",
	"Yangzhai",
	"Daliang",
	"Handan",
	"Linzi",
	"Shouchun",
	"Ji",
	"Wu",
	"Guangfulin",
	"Qingzhou",
	"Fangmatan",
	"Jinsha",
	"Xiadu",
	"Chengziya",
	}

local QinCities = {
	"Xiquanqiu",
	"Pingyang",
	"Yong",
	"Jinyang",
	"Yueyang",
	"Lintong",
	"Tianshui",
	"Zou",
	"Liaoxi",
	"Chen",
	"Liaodong",
	"Hengshan",
	"Shang",
	"Dang",
	"Jiaodong",
	"Minzhong",
	"Shu",
	"Nanhai",
	}

local HanCities = {
	"Xu",
	"Ye",
	"Sanyangzhuang",
	"Jingjue",
	"Mawangdui",
	"Jiaoxi",
	"Zichuan",
	"Zhao",
	"Huainan",
	"Lujiang",
	"Jibei",
	"Mayi",
	"Yiwulu",
	"Panyu",
	"Nanning",
	"Rinan",
	"Daner",
	"Cangwu",
	"Hepu",
	}

local SuiCities = {
	"Dongdu",
	"Lingwu",
	"Baotou",
	"Tanzhou",
	"Long Bien",
	"Heijan",
	"Su",
	"Jiangling",
	"Xiangyang",
	"Qinhuangdao",
	"Salsu",
	}

local TangCities = {
	"Dihua",
	"Kashgar",
	"Yanqi",
	"Kucha",
	"Ordos",
	"Lop Nur",
	"Congling",
	"Kuch'eng",
	"Shule",
	"Yutian",
	"Gaochang",
	}

local SongCities = {
	"Dongjing",
	"Zhenjiang",
	"Linan",
	"Yuezhou",
	"Mingzhou",
	"Dinghai",
	"Taizhou",
	"Wenzhou",
	"Zhangan",
	"Guanfuchang",
	"Yashan",
	}

local YuanCities = {
	"Shangdu",
	"Dadu",
	"Xapxopym",
	"Yingchang",
	"Kaiping",
	"Yaozhou",
	"Tokmok",
	"Xingqing",
	"Zhongdu",
	"Yamen",
	"Haozhou",
	}

local MingCities = {
	"Yingtian",
	"Shuntian",
	"Zhaoqing",
	"Fuzhou",
	"Yunnan",
	"Guiyang",
	"Jinan",
	"Guilin",
	"Nanchang",
	"Qinghe",
	}

local QingCities = {
	"Changchun",
	"Anda",
	"Daqing",
	"Fushun",
	"Anshan",
	"Sichang",
	"Nanking",
	"Wuhan",
	"Zhunbu",
	"Huijiang",
	}

local ChinaCities = {
	"Chengdu",
	"Shantou",
	"Qingdao",
	"Shenzhen",
	"Shijiazhuang",
	"Benxi",
	"Hangzhou",
	"Qiqihar",
	"Fuqing",
	"Ningbo",
	"Tianjin",
	"Quanzhou",
	"Shandong",
	"Zibo",
	"Aksu",
	"Harbin",
	"Xiamen",
	"Hefei",
	"Changsha",
	"Rugao",
	"Karamay",
	"Pingdingshan",
	"Dongguan",
	"Kaifeng",
	"Yangzhou",
	"Harbin",
	"Bengbu",
	"Huludao",
	"Chongqing",
	"Boading",
	"Loyang",
	"Kunming",
	"Shenyang",
	"Taiyuan",
	"Tainan",
	"Dalian",
	"Lijiang",
	"Wuxi",
	"Suzhou",
	"Maoming",
	"Shaoguan",
	"Yangjing",
	"Heyuan",
	"Liaoning",
	"Hubei",
	"Gansu",
	"Huangshi",
	"Yichang",
	"Yingtan",
	"Xinyu",
	"Xinzheng",
	"Handan",
	"Dunhuang",
	"Gaoyu",
	"Nantong",
	"Weifang",
	"Xikang",
	"Yiwu",
	"Guangzhou",
	"Nanjing",
	"Cixi",
	"Xi'an",
	"Shanghai",
	"Macau",
	"Taipei",
	}

--Check/Save Doubles
for dPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
	local dPlayer = Players[dPlayer];
	if dPlayer:IsEverAlive() then
		local pPlayer = GetErlitouPlayer();
		if (dPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Shang" then
				if (load(pPlayer, "Dynasty Shang") ~= true) then
					save(pPlayer, "Dynasty Shang", true)
				end
			end
			if Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Zhou" then
				if (load(pPlayer, "Dynasty Zhou") ~= true) then
					save(pPlayer, "Dynasty Zhou", true)
				end
			end
			if (Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Qin") or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_QIN_LS_MOD) then		
				if (load(pPlayer, "Dynasty Qin") ~= true) then
					save(pPlayer, "Dynasty Qin", true)
				end
			end
			if (Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Han") or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_JFD_HAN) then
				if (load(pPlayer, "Dynasty Han") ~= true) then
					save(pPlayer, "Dynasty Han", true)
				end
			end
			if Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Sui" then
				if (load(pPlayer, "Dynasty Sui") ~= true) then
					save(pPlayer, "Dynasty Sui", true)
				end
			end
			if (Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Tang") or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CHINA) then
				if (load(pPlayer, "Dynasty Tang") ~= true) then
					save(pPlayer, "Dynasty Tang", true)
				end
			end
			if Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Song" or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TCM_SONG) then
				if (load(pPlayer, "Dynasty Song") ~= true) then
					save(pPlayer, "Dynasty Song", true)
				end
			end
			if (Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Yuan") or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_LITE_YUAN) then
				if (load(pPlayer, "Dynasty Yuan") ~= true) then
					save(pPlayer, "Dynasty Yuan", true)
				end
			end
			if (Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Ming") or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_JFD_MING) then
				if (load(pPlayer, "Dynasty Ming") ~= true) then
					save(pPlayer, "Dynasty Ming", true)
				end
			end
			if (Locale.ConvertTextKey(dPlayer:GetCivilizationShortDescription()) == "Qing") or (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_JFD_QING) then
				if (load(pPlayer, "Dynasty Qing") ~= true) then
					save(pPlayer, "Dynasty Qing", true)
				end
			end
			if (dPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
				if (load(pPlayer, "Dynasty PRC") ~= true) then
					save(pPlayer, "Dynasty PRC", true)
				end
			end
		end
	end
end

--Double Dynasties
function xGetDynastyCheck(pPlayer, xCount, xTextCheck)
	
	local xDynastyCheck = "";

	if xCount == 1 then
		if (load(pPlayer, "Dynasty Shang") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 2 then
		if (load(pPlayer, "Dynasty Zhou") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 3 then
		if (load(pPlayer, "Dynasty Qin") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 4 then
		if (load(pPlayer, "Dynasty Han") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 5 then
		if (load(pPlayer, "Dynasty Sui") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 6 then
		if (load(pPlayer, "Dynasty Tang") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 7 then
		if (load(pPlayer, "Dynasty Song") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 8 then
		if (load(pPlayer, "Dynasty Yuan") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 9 then
		if (load(pPlayer, "Dynasty Ming") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	elseif xCount == 10 then
		if (load(pPlayer, "Dynasty Qing") == true) then
			xDynastyCheck = WesternTest(xTextCheck);
		end
	end

	return xDynastyCheck;

end

--Dynasty Capitals
function xGetDynastyCapital(xCount)	
	local xDynastyCapital = "";
	if xCount == 0 then
		xDynastyCapital = "Yangcheng";
	elseif xCount == 1 then
		xDynastyCapital = "Yin";
	elseif xCount == 2 then
		xDynastyCapital = "Feng";
	elseif xCount == 3 then
		xDynastyCapital = "Xianyang";
	elseif xCount == 4 then
		xDynastyCapital = "Luoyang";
	elseif xCount == 5 then
		xDynastyCapital = "Daxing";
	elseif xCount == 6 then
		xDynastyCapital = "Chang'an";
	elseif xCount == 7 then
		xDynastyCapital = "Bianjing";
	elseif xCount == 8 then
		xDynastyCapital = "Khanbaliq";
	elseif xCount == 9 then
		xDynastyCapital = "Nanjing";
	elseif xCount == 10 then
		xDynastyCapital = "Shengjing";
	elseif xCount >= 11 then
		xDynastyCapital = "Beijing";
	end
	return xDynastyCapital;
end

--Double Cities
function DynastyDoubleCities(DyCityName)
	local XinCity = "";
	for nPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local nPlayer = Players[nPlayer];
		if (nPlayer:IsAlive()) then
			for nCity in nPlayer:Cities() do
				local OldCityName = nCity:GetName();
				if DyCityName == OldCityName then
					XinCity = "Xin ";
					break
				end
			end
		end
	end
	return XinCity;
end

function xGetDynastyTest(xCount)	
	local DyCityName = xGetDynastyCapital(xCount);
	local xDynastyTest = DynastyDoubleCities(DyCityName);
	return xDynastyTest;
end

--Name
function xDoNameCity(xCount, pPlayer, pCity)

	local CurDynastyCities;

	if xCount == 0 then
		CurDynastyCities = XiaCities;
	elseif xCount == 1 then
		CurDynastyCities = ShangCities;
	elseif xCount == 2 then
		CurDynastyCities = ZhouCities;
	elseif xCount == 3 then
		CurDynastyCities = QinCities;
	elseif xCount == 4 then
		CurDynastyCities = HanCities;
	elseif xCount == 5 then
		CurDynastyCities = SuiCities;
	elseif xCount == 6 then
		CurDynastyCities = TangCities;
	elseif xCount == 7 then
		CurDynastyCities = SongCities;
	elseif xCount == 8 then
		CurDynastyCities = YuanCities;
	elseif xCount == 9 then
		CurDynastyCities = MingCities;
	elseif xCount == 10 then
		CurDynastyCities = QingCities;
	elseif xCount >= 11 then
		CurDynastyCities = ChinaCities;
	end

	local CityCount = 0;
	for _, CityNames in pairs(CurDynastyCities) do
		if (load(pPlayer, "CityNames:" .. CityNames .. "bool") ~= true) then
			CityCount = CityCount + 1;
		end
	end
	if CityCount >= 1 then
		for _, CityNames in pairs(CurDynastyCities) do
			if (load(pPlayer, "CityNames:" .. CityNames .. "bool") ~= true) then
				local DyCityName = "" .. CityNames .. "";
				XinCity = DynastyDoubleCities(DyCityName);
				pCity:SetName("" .. XinCity .. "" .. CityNames .. "")
				save(pPlayer, "CityNames:" .. CityNames .. "bool", true)
				break
			end
		end
	elseif CityCount == 0 then
		for _, CityNames in pairs(ChinaCities) do
			if (load(pPlayer, "CityNames:" .. CityNames .. "bool") ~= true) then
				local DyCityName = "" .. CityNames .. "";
				XinCity = DynastyDoubleCities(DyCityName);
				pCity:SetName("" .. XinCity .. "" .. CityNames .. "")
				save(pPlayer, "CityNames:" .. CityNames .. "bool", true)
				break
			end
		end
	end

end

--Pop-Up Bonuses
function xGetDynastyBonus(xCount)	
	local xDynastyBonus = "";
	if xCount == 0 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Xia (Dynastic Cycle)[ENDCOLOR][NEWLINE]Losing your [ICON_CAPITAL] Capital, constructing a Courthouse in a conquered foreign [ICON_CAPITAL] Capital, or completing a Social Policy tree starts a new Dynasty.";	
	elseif xCount == 1 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Shang (Oracle Bones)[ENDCOLOR][NEWLINE]+2 [ICON_RESEARCH] Science on sources of [ICON_RES_HORSE] Horse [ICON_RES_SHEEP] Sheep and [ICON_RES_COW] Cattle.";	
	elseif xCount == 2 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Zhou (Hundred Schools of Thought)[ENDCOLOR][NEWLINE]Specialists generate +1 [ICON_GOLDEN_AGE] Golden Age Points. +10% [ICON_GREAT_PEOPLE] Great People generation.";	
	elseif xCount == 3 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Qin (Heirloom Seal of the Realm)[ENDCOLOR][NEWLINE]Annexed Cities (excluding [ICON_CAPITAL] Capitals) are assimilated into your empire once out of [ICON_RESISTANCE] Resistance.";
	elseif xCount == 4 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Han (People of Han)[ENDCOLOR][NEWLINE]Cities Settled by Xia generate +2 [ICON_CULTURE] Culture for the current City owner.";
	elseif xCount == 5 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Sui (Three Departments and Six Ministries)[ENDCOLOR][NEWLINE][ICON_CAPITAL] Dynastic Capitals reduce the total Building Maintenance of nearby Annexed Cities by 20%.";	
	elseif xCount == 6 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Tang (Three Teachings)[ENDCOLOR][NEWLINE]Cities earn +1 [ICON_PEACE] Faith for each Religion that has at least 1 follower in the City.";
	elseif xCount == 7 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Song (Four Great Inventions)[ENDCOLOR][NEWLINE]1 Free Technology.";
	elseif xCount == 8 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Yuan (Great Mongol State)[ENDCOLOR][NEWLINE]A Khan with the [COLOR_PLAYER_LIGHT_GREEN]Mobile Command[ENDCOLOR] promotion appears near your [ICON_CAPITAL] Dynastic Capital.";
	elseif xCount == 9 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Ming (Treasure Voyages)[ENDCOLOR][NEWLINE]+2 [ICON_RES_PORCELAIN] Porcelain. Cargo Ships generate [ICON_TOURISM] Tourism when in Foreign Territory.";	
	elseif xCount == 10 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]Qing (Banner Armies)[ENDCOLOR][NEWLINE]8 Units are maintenance free. All current Units gain +15 XP.";	
	elseif xCount >= 11 then
		xDynastyBonus = "[NEWLINE][COLOR_POSITIVE_TEXT]China (The People's Republic)[ENDCOLOR][NEWLINE]+10% [ICON_PRODUCTION] Production in all Cities. Dynasties will no longer change.";
	end
	return xDynastyBonus;
end

--Top Panel Bonuses
function xGetTopPanelBonus(xCount)	

	local XiaBonus = "";
	local ShangBonus = "";
	local ZhouBonus = "";
	local QinBonus = "";
	local HanBonus = "";
	local SuiBonus = "";
	local TangBonus = "";
	local SongBonus = "";
	local YuanBonus = "";
	local MingBonus = "";
	local QingBonus = "";
	local ChinaBonus = "";

	if xCount >= 0 then
		XiaBonus = "[COLOR_POSITIVE_TEXT]Xia (Dynastic Cycle)[ENDCOLOR][NEWLINE]Losing your [ICON_CAPITAL] Capital, constructing a Courthouse in a conquered foreign [ICON_CAPITAL] Capital, or completing a Social Policy tree starts a new Dynasty.";
	end
	if xCount >= 1 then
		ShangBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Shang (Oracle Bones)[ENDCOLOR][NEWLINE]+2 [ICON_RESEARCH] Science on sources of [ICON_RES_HORSE] Horse [ICON_RES_SHEEP] Sheep and [ICON_RES_COW] Cattle.";
	end
	if xCount >= 2 then
		ZhouBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Zhou (Hundred Schools of Thought)[ENDCOLOR][NEWLINE]Specialists generate +1 [ICON_GOLDEN_AGE] Golden Age Points. +10% [ICON_GREAT_PEOPLE] Great People generation.";
	end
	if xCount >= 3 then
		QinBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Qin (Heirloom Seal of the Realm)[ENDCOLOR][NEWLINE]Annexed Cities (excluding [ICON_CAPITAL] Capitals) are assimilated into your empire once out of [ICON_RESISTANCE] Resistance.";
	end
	if xCount >= 4 then
		HanBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Han (People of Han)[ENDCOLOR][NEWLINE]Cities Settled by Xia generate +2 [ICON_CULTURE] Culture for the current City owner.";
	end
	if xCount >= 5 then
		SuiBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Sui (Three Departments and Six Ministries)[ENDCOLOR][NEWLINE][ICON_CAPITAL] Dynastic Capitals reduce the total Building Maintenance of nearby Annexed Cities by 20%.";
	end
	if xCount >= 6 then
		TangBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Tang (Three Teachings)[ENDCOLOR][NEWLINE]Cities earn +1 [ICON_PEACE] Faith for each Religion that has at least 1 follower in the City.";
	end
	if xCount >= 7 then
		SongBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Song (Four Great Inventions)[ENDCOLOR][NEWLINE]1 Free Technology.";
	end
	if xCount >= 8 then
		YuanBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Yuan (Great Mongol State)[ENDCOLOR][NEWLINE]A Khan with the [COLOR_PLAYER_LIGHT_GREEN]Mobile Command[ENDCOLOR] promotion appears near your [ICON_CAPITAL] Dynastic Capital.";
	end
	if xCount >= 9 then
		MingBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Ming (Treasure Voyages)[ENDCOLOR][NEWLINE]+2 [ICON_RES_PORCELAIN] Porcelain. Cargo Ships generate [ICON_TOURISM] Tourism when in Foreign Territory.";
	end
	if xCount >= 10 then
		QingBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Qing (Banner Armies)[ENDCOLOR][NEWLINE]8 Units are maintenance free. All current Units gain +15 XP.";
	end
	if xCount >= 11 then
		ChinaBonus = "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]China (The People's Republic)[ENDCOLOR][NEWLINE]+10% [ICON_PRODUCTION] Production in all Cities. Dynasties will no longer change.";
	end

	local TotalBonus = "" .. XiaBonus .. "" .. ShangBonus .. "" .. ZhouBonus .. "" .. QinBonus .. "" .. HanBonus .. "" .. SuiBonus .. "" .. TangBonus .. "" .. SongBonus .. "" .. YuanBonus .. "" .. MingBonus .. "" .. QingBonus .. "" .. ChinaBonus .. "";
	return TotalBonus;

end

--Pop-up Text
function xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew)	
	local xDynastyMessage = "";
	if xCount >= 0 and xCount <= 10 then
		if xWestern == "" then
			xDynastyMessage = "A new Dynasty has been established at the City of " .. xCapital .. "! As your people continue to grow and prosper they acquire new skills and traditions.[NEWLINE]";
		elseif xWestern ~= "" then
			xDynastyMessage = "A new Dynasty has been established at the City of Xin " .. xCapital .. "! However, a split in our house long ago has led there to be pretenders to the name " .. xDynasty .. " in the East![NEWLINE]";
		end
	elseif xCount >= 11 then
		xDynastyMessage = "The Dynastic Cycle has come to an end as our people attempt to establish themselves as a true global superpower![NEWLINE]";
	end
	return xDynastyMessage;
end

--Re-Name
for pPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
	local pPlayer = Players[pPlayer];
	if pPlayer:IsEverAlive() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then

			local xCount = xGetDynastyCount(pPlayer);

			if xCount >= 1 then

				local xTextCheck = 0;
				local xDynasty = xGetDynasty(xCount);
				local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)

				local xChinaDesc = 0;
				if xCount <= 10 then
					xChinaDesc = xDynasty
				elseif xCount >= 11 then
					xChinaDesc = "Chinese"
				end
				local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
				for i,iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
				local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
				for i, iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

			end

			if (isCulDiv == false) then
				if xCount >= 9 then
					pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_XIA_MING_DYNASTY_CARGO")
				end
			end

		end
	end
end

--Found Cities
for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
	local mPlayer = Players[mPlayer];
	if (mPlayer:IsAlive()) then
		if (mPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then

			if (mPlayer:IsHuman()) then

				local xMisc = ""
				local tquery = {"UPDATE Language_en_US SET Text = '".. xMisc .."' WHERE Tag = 'TXT_KEY_MISC_CITY_HAS_BEEN_FOUNDED'"}
				for i,iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

			end
		end
	end
end

--Re-Name China if AI
for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
	local oPlayer = Players[oPlayer];
	if oPlayer:IsEverAlive() then
		if not (oPlayer:IsHuman()) then	
			if (oPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CHINA) then		
				if not isDynastySplit then
					local xChinaDesc = "Tang"
					local tquery = {"UPDATE Language_en_US SET Text = '".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_CIV_CHINA_SHORT_DESC'"}
					for i,iQuery in pairs(tquery) do
						for result in DB.Query(iQuery) do
						end
					end
					Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
					local tquery = {"UPDATE Language_en_US SET Text = '".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_CIV_CHINA_ADJECTIVE'"}
					for i, iQuery in pairs(tquery) do
						for result in DB.Query(iQuery) do
						end
					end
					Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
				end
			end
			if (oPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then		
				local xPRCDesc = "The People''s Republic"
				local tquery = {"UPDATE Language_en_US SET Text = '".. xPRCDesc .."' WHERE Tag = 'TXT_KEY_CIV_OW_PRC_MAO_SHORTDESC'"}
				for i,iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
			end
		end
	end
end

--Move Capital
local bcPalace = GameInfoTypes.BUILDINGCLASS_PALACE;
local bPalace = GameInfoTypes.BUILDING_PALACE;

function XiaMoveCapital(pPlayer, pCity)

	local playerID = pPlayer:GetID();
	local cityID = pCity:GetID();
	local oldCapital = pPlayer:GetCapitalCity();
	--local GWIndex = oldCapital:GetBuildingGreatWork(bcPalace, 0);
	--local bcArtHolder = GameInfoTypes.BUILDINGCLASS_XIA_TEMP_ART;
	--local bArtHolder = GameInfoTypes.BUILDING_XIA_TEMP_ART;
	
	--local bSwap = false
	--if (GWIndex > -1) then
	--	pCity:SetNumRealBuilding(bArtHolder, 1)
	--	Network.SendMoveGreatWorks(playerID, oldCapital:GetID(), bcPalace, 0, cityID, bcArtHolder, 0)
	--	bSwap = true
	--end

	oldCapital:SetNumRealBuilding(bPalace, 0)
	pCity:SetNumRealBuilding(bPalace, 1)

	--if bSwap then
	--	Network.SendMoveGreatWorks(playerID, cityID, bcArtHolder, 0, cityID, bcPalace, 0)
	--	pCity:SetNumRealBuilding(bArtHolder, 0)
	--end

end

local disableCityCapturePopup = 0;
local isXiaCapLost = false

--Xia Capital Lost
function XiaCapitalLost(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest, disableCityCapturePopup)
	local pPlot = Map.GetPlot(iX, iY);	
	local cCity = pPlot:GetPlotCity();
	local iNewOwner = cCity:GetOwner();
	local iFirstOwner = cCity:GetOriginalOwner();
	local iPreviousOwner = cCity:GetPreviousOwner();
	local oPlayer = Players[iNewOwner];
	local pPlayer = Players[iFirstOwner];
	local lPlayer = Players[iPreviousOwner];
	
	if cCity:IsOriginalCapital() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if (oPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
				
				if pPlayer:IsAlive() then

					local xDynastyX = pPlot:GetX();
					local xDynastyY = pPlot:GetY();
				
					if (load(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool") ~= true) then

						save(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool", true)

						local xCount = xGetDynastyCount(pPlayer);

						if xCount <= 11 then

							local xTextCheck = 0;
							local xDynasty = xGetDynasty(xCount);
							local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
							local xCapital = xGetDynastyCapital(xCount);
							local xNew = xGetDynastyTest(xCount);
							local xBonus = xGetDynastyBonus(xCount);
							local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

							for pCity in pPlayer:Cities() do
								if pCity:IsCapital() then

									pCity:SetName("" .. xNew .. "" .. xCapital .. "")
									pCity:SetNumRealBuilding(bXia, 1);
							
									local pPlot = pCity:Plot();
									local DyCapCheck = CheckDyCapitalstoPlots(pPlot);
									if DyCapCheck == 0 then
										local sKey = xCompilePlotID(pPlot)
										xDynasticCapitals[sKey] = -1
									end

									if not (pCity:IsHasBuilding(bEverOwned)) then			
										pCity:SetNumRealBuilding(bEverOwned, 1);
									end

									local title = 0;
									local descr = 0;

									if xCount <= 10 then
										title = "New Dynasty!";
										descr = "A new dynasty has been established at the City of " .. xNew .. "" .. xCapital .. "!";
									elseif xCount >= 11 then
										title = "People's Republic!";
										descr = "The People's Republic has been established at the City of " .. xNew .. "" .. xCapital .. "!";
									end
									
									local XiaDummyID = GameInfo.Units["UNIT_XIA_DYNASTY_DUMMY"].ID;
									pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), XiaDummyID, -1);

									xDoDynastyBonus(xCount, pPlayer, pCity)
	
								end
							end

							--New Dynasty Pop-Up
							local CurDynasty;
							if xCount <= 10 then
								CurDynasty = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
							elseif xCount >= 11 then
								CurDynasty = "China"
							end

							if (pPlayer:IsHuman()) then
								isXiaCapLost = true
							end

							--Change Short Desc / Adj
							local xChinaDesc = 0;
							if xCount <= 10 then
								xChinaDesc = xDynasty
							elseif xCount >= 11 then
								xChinaDesc = "Chinese"
							end
							local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
							for i,iQuery in pairs(tquery) do
								for result in DB.Query(iQuery) do
								end
							end
							Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
							local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
							for i, iQuery in pairs(tquery) do
								for result in DB.Query(iQuery) do
								end
							end
							Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

						end

					end
				end
			end
		end
	end

end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			
			if isXiaCapLost == true then

				local xCount = xGetDynastyCount(pPlayer);
				local xTextCheck = 0;
				local xDynasty = xGetDynasty(xCount);
				local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
				local xCapital = xGetDynastyCapital(xCount);
				local xNew = xGetDynastyTest(xCount);
				local xBonus = xGetDynastyBonus(xCount);
				local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

				local CurDynasty;
				if xCount <= 10 then
					CurDynasty = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
				elseif xCount >= 11 then
					CurDynasty = "China"
				end

				local pID = pPlayer:GetID()
				if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
					LuaEvents.ShowXiaDynastyPopup(CurDynasty, xMessage, xBonus)
				end

				isXiaCapLost = false

			end
		end
	end
end)

--Xia AI Handle
function XiaAIHandle(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest, disableCityCapturePopup)
	local pPlot = Map.GetPlot(iX, iY);	
	local pCity = pPlot:GetPlotCity();
	local iNewOwner = pCity:GetOwner();
	local pPlayer = Players[iNewOwner];
	
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
		if not (pPlayer:IsHuman()) then
			local oPlayer = Players[pCity:GetOriginalOwner()];
			if not oPlayer:IsMinorCiv() then
				if pPlayer ~= oPlayer then
					if pCity:IsPuppet() then

						if pCity:IsOriginalCapital() then
							pCity:SetPuppet(false);
							pCity:SetOccupied(true);								
						elseif not pCity:IsOriginalCapital() then
							if ErlitouGetRandom(1,2) == 2 then
								pCity:SetPuppet(false);
								pCity:SetOccupied(true);
							end
						end

					end
				end
			end
		end
	end

end

--City Capture Handle
function XiaCaptureFunctions(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pPlot = Map.GetPlot(iX, iY);	
	local pCity = pPlot:GetPlotCity();
	local pPlayer = Players[pCity:GetOwner()];
	local oPlayer = Players[pCity:GetOriginalOwner()];
	local lPlayer = Players[pCity:GetPreviousOwner()];
	
	XiaCapitalLost(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest);
	XiaAIHandle(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest);

end

GameEvents.CityCaptureComplete.Add(XiaCaptureFunctions)

--Xia Capital Settled
GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if pCity:IsOriginalCapital() then

				pCity:SetName("Yangcheng")

				if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
					Events.GameplayAlertMessage("Yangcheng has been founded.");
				end

				local XiaDummyID = GameInfo.Units["UNIT_XIA_DYNASTY_DUMMY"].ID;
				local title = "New Dynasty!";
				local descr = "A new dynasty has been established at the city of Yangcheng!";		
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), XiaDummyID, -1);

				local xTextCheck = 0;
				local xCount = xGetDynastyCount(pPlayer);
				local xDynasty = xGetDynasty(xCount);
				local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
				local xCapital = xGetDynastyCapital(xCount);
				local xNew = xGetDynastyTest(xCount);
				local xBonus = xGetDynastyBonus(xCount);
				local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

				--New Dynasty Pop-Up
				local CurDynasty;
				if xCount <= 10 then
					CurDynasty = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
				elseif xCount >= 11 then
					CurDynasty = "China"
				end
			
				local pID = pPlayer:GetID()
				if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
					LuaEvents.ShowXiaDynastyPopup(CurDynasty, xMessage, xBonus)
				end

			end
		end
	end
end)

--Foriegn Capital Courthouse Constructed
GameEvents.CityConstructed.Add(
function(player, city, building)
	local pPlayer = Players[player]
	local pCity = pPlayer:GetCityByID(city)
	if (building == bCourthouse) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if pCity:IsOriginalCapital() then
				local oPlayer = Players[pCity:GetOriginalOwner()];
				if not oPlayer:IsMinorCiv() then
					if pPlayer ~= oPlayer then
						xDynastyX = pCity:GetX()
						xDynastyY = pCity:GetY()

						if (load(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool") ~= true) then

							save(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool", true)

							local xCount = xGetDynastyCount(pPlayer);
							if xCount <= 11 then

								local xTextCheck = 0;
								local xDynasty = xGetDynasty(xCount);
								local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
								local xCapital = xGetDynastyCapital(xCount);
								local xNew = xGetDynastyTest(xCount);
								local xBonus = xGetDynastyBonus(xCount);
								local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

								pCity:SetName("" .. xNew .. "" .. xCapital .. "")
								pCity:SetNumRealBuilding(bXia, 1);
								
								local pPlot = pCity:Plot();
								local DyCapCheck = CheckDyCapitalstoPlots(pPlot);
								if DyCapCheck == 0 then
									local sKey = xCompilePlotID(pPlot)
									xDynasticCapitals[sKey] = -1
								end

								if not (pCity:IsHasBuilding(bEverOwned)) then			
									pCity:SetNumRealBuilding(bEverOwned, 1);
								end

								if (MoveCapitalWithDynasty == true) then
									XiaMoveCapital(pPlayer, pCity)
								end

								local title = 0;
								local descr = 0;

								if xCount <= 10 then
									title = "New Dynasty!";
									descr = "A new dynasty has been established at the city of " .. xNew .. "" .. xCapital .. "!";
								elseif xCount >= 11 then
									title = "People's Republic!";
									descr = "The People's Republic has been established at the city of " .. xNew .. "" .. xCapital .. "!";
								end
				
								local XiaDummyID = GameInfo.Units["UNIT_XIA_DYNASTY_DUMMY"].ID;
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), XiaDummyID, -1);

								xDoDynastyBonus(xCount, pPlayer, pCity)

								--New Dynasty Pop-Up
								local CurDynasty;
								if xCount <= 10 then
									CurDynasty = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
								elseif xCount >= 11 then
									CurDynasty = "China"
								end

								local pID = pPlayer:GetID()
								if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
									LuaEvents.ShowXiaDynastyPopup(CurDynasty, xMessage, xBonus)
								end

								--Change Short Desc / Adj
								local xChinaDesc = 0;
								if xCount <= 10 then
									xChinaDesc = xDynasty
								elseif xCount >= 11 then
									xChinaDesc = "Chinese"
								end
								local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
								for i,iQuery in pairs(tquery) do
									for result in DB.Query(iQuery) do
									end
								end
								Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
								local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
								for i, iQuery in pairs(tquery) do
									for result in DB.Query(iQuery) do
									end
								end
								Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

							end
						end
					end
				end
			end
		end
	end
end)

--Social Policy Stuff
local RenameAfterPolicy = false;

function xFreeCityCheck(pPlayer)
	local CityCheck = 0;
	for pCity in pPlayer:Cities() do
		if not (pCity:IsHasBuilding(bXia)) and not pCity:IsOriginalCapital() and not pCity:IsPuppet() and not pCity:IsRazing() and not pCity:IsResistance() then
			CityCheck = 1;
		end
	end
	if CityCheck == 0 then
		if not (pPlayer:IsHuman()) then
			for pCity in pPlayer:Cities() do
				if not (pCity:IsHasBuilding(bXia)) and not pCity:IsOriginalCapital() and not pCity:IsRazing() and not pCity:IsResistance() and not pCity:IsOccupied() then
					if pCity:IsPuppet() then
						pCity:SetPuppet(false);
						pCity:SetOccupied(false);
						pCity:SetNeverLost(false);				
						if not (pCity:IsHasBuilding(bEverOwned)) then
							pCity:SetNumRealBuilding(bEverOwned, 1);
						end
						CityCheck = 1;
						break
					end
				end
			end		
		end
	end
	return CityCheck;
end

function PolicyDynastyChange(pPlayer, CityCheck, pCity)

	if pCity:IsOccupied() then
		if (pCity:IsHasBuilding(bCourthouse)) then
			local CourtRefund = pCity:GetSellBuildingRefund(bCourthouse);
			pCity:SetNumRealBuilding(bCourthouse, 0);
			pPlayer:ChangeGold(CourtRefund);
		end
		pCity:SetPuppet(false);
		pCity:SetOccupied(false);
		pCity:SetNeverLost(false);				
		if not (pCity:IsHasBuilding(bEverOwned)) then			
			pCity:SetNumRealBuilding(bEverOwned, 1);
		end
	end

	xDynastyX = pCity:GetX()					
	xDynastyY = pCity:GetY()

	local xCount = xGetDynastyCount(pPlayer);
	if xCount <= 11 then

		local xTextCheck = 0;
		local xDynasty = xGetDynasty(xCount);
		local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
		local xCapital = xGetDynastyCapital(xCount);
		local xNew = xGetDynastyTest(xCount);
		local xBonus = xGetDynastyBonus(xCount);
		local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

		pCity:SetName("" .. xNew .. "" .. xCapital .. "")
		pCity:SetNumRealBuilding(bXia, 1);

		local pPlot = pCity:Plot();
		local DyCapCheck = CheckDyCapitalstoPlots(pPlot);
		if DyCapCheck == 0 then
			local sKey = xCompilePlotID(pPlot)
			xDynasticCapitals[sKey] = -1
		end

		if not (pCity:IsHasBuilding(bEverOwned)) then			
			pCity:SetNumRealBuilding(bEverOwned, 1);
		end

		if (MoveCapitalWithDynasty == true) then
			XiaMoveCapital(pPlayer, pCity)
		end

		local title = 0;
		local descr = 0;

		if xCount <= 10 then
			title = "New Dynasty!";
			descr = "A new dynasty has been established at the city of " .. xNew .. "" .. xCapital .. "!";
		elseif xCount >= 11 then
			title = "People's Republic!";
			descr = "The People's Republic has been established at the city of " .. xNew .. "" .. xCapital .. "!";
		end
				
		local XiaDummyID = GameInfo.Units["UNIT_XIA_DYNASTY_DUMMY"].ID;
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), XiaDummyID, -1);

		xDoDynastyBonus(xCount, pPlayer, pCity)

		--New Dynasty Pop-Up
		local CurDynasty;
		if xCount <= 10 then
			CurDynasty = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
		elseif xCount >= 11 then
			CurDynasty = "China"
		end

		local pID = pPlayer:GetID()
		if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
			LuaEvents.ShowXiaDynastyPopup(CurDynasty, xMessage, xBonus)
		end

		if (pPlayer:IsHuman()) then
			RenameAfterPolicy = true;
		elseif not (pPlayer:IsHuman()) then
			if xCount >= 1 then
				local xTextCheck = 0;
				local xDynasty = xGetDynasty(xCount);
				local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)

				local xChinaDesc = 0;
				if xCount <= 10 then
					xChinaDesc = xDynasty
				elseif xCount >= 11 then
					xChinaDesc = "Chinese"
				end
				local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
				for i,iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
				local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
				for i, iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			end
		end
	end
end

--Policy Tree Completed
function PolicyDynastyAnnex(pPlayer, CityCheck)
	local pCity = 0;
	for bCity in pPlayer:Cities() do
		if not (bCity:IsHasBuilding(bXia)) and not bCity:IsOriginalCapital() and not bCity:IsPuppet() and not bCity:IsRazing() and not bCity:IsResistance() then
			pCity = bCity
			break
		end
	end
	PolicyDynastyChange(pPlayer, CityCheck, pCity);
end

function XiaAnnexDynastyCap(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then

			local pTeam = pPlayer:GetTeam();

			local xCount = xGetDynastyCount(pPlayer);
			if xCount < 11 then

				if pPlayer:HasPolicy(fTradition) and (load(pPlayer, "Tradition Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Tradition Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);				
					end
				end
				if pPlayer:HasPolicy(fLiberty) and (load(pPlayer, "Liberty Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Liberty Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);					
					end
				end
				if pPlayer:HasPolicy(fHonor) and (load(pPlayer, "Honor Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Honor Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);						
					end
				end
				if pPlayer:HasPolicy(fPiety) and (load(pPlayer, "Piety Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Piety Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);						
					end
				end
				if pPlayer:HasPolicy(fPatronage) and (load(pPlayer, "Patronage Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Patronage Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);						
					end
				end
				if pPlayer:HasPolicy(fAesthetics) and (load(pPlayer, "Aesthetics Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Aesthetics Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);					
					end
				end
				if pPlayer:HasPolicy(fCommerce) and (load(pPlayer, "Commerce Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Commerce Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);					
					end
				end
				if pPlayer:HasPolicy(fExploration) and (load(pPlayer, "Exploration Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Exploration Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);						
					end
				end
				if pPlayer:HasPolicy(fRationalism) and (load(pPlayer, "Rationalism Finished") ~= true) then
					local CityCheck = xFreeCityCheck(pPlayer);
					if CityCheck == 1 then
						save(pPlayer, "Rationalism Finished", true)
						PolicyDynastyAnnex(pPlayer, CityCheck);	
					end
				end
				if not pPlayer:IsHuman() then
					if (Teams[pTeam]:IsHasTech(iAICivilService)) and (load(pPlayer, "AI Civil Service Settle") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "AI Civil Service Settle", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);	
						end
					end
				end

			end
		end
	end
end

--Founded
GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
		
			if not (pCity:IsHasBuilding(bEverOwned)) then
				pCity:SetNumRealBuilding(bEverOwned, 1);
			end

			if not (pCity:IsHasBuilding(bEverOwned2)) then
				pCity:SetNumRealBuilding(bEverOwned2, 1);
			end

			if not pCity:IsOriginalCapital() then

				local xCount = xGetDynastyCount(pPlayer);
				xDoNameCity(xCount, pPlayer, pCity);

				if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
					Events.GameplayAlertMessage("" .. Locale.ConvertTextKey(pCity:GetName()) .. " has been founded.");
				end

			end
		end
	end
end)

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then

			local xCount = xGetDynastyCount(pPlayer);
			if xCount < 11 then

				local CityCheck = 0;
				if pPlayer:HasPolicy(fTradition) and (load(pPlayer, "Tradition Finished") ~= true) then
					save(pPlayer, "Tradition Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);			
				elseif pPlayer:HasPolicy(fLiberty) and (load(pPlayer, "Liberty Finished") ~= true) then
					save(pPlayer, "Liberty Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);				
				elseif pPlayer:HasPolicy(fHonor) and (load(pPlayer, "Honor Finished") ~= true) then
					save(pPlayer, "Honor Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);					
				elseif pPlayer:HasPolicy(fPiety) and (load(pPlayer, "Piety Finished") ~= true) then
					save(pPlayer, "Piety Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);						
				elseif pPlayer:HasPolicy(fPatronage) and (load(pPlayer, "Patronage Finished") ~= true) then
					save(pPlayer, "Patronage Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);						
				elseif pPlayer:HasPolicy(fAesthetics) and (load(pPlayer, "Aesthetics Finished") ~= true) then
					save(pPlayer, "Aesthetics Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);					
				elseif pPlayer:HasPolicy(fCommerce) and (load(pPlayer, "Commerce Finished") ~= true) then
					save(pPlayer, "Commerce Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);					
				elseif pPlayer:HasPolicy(fExploration) and (load(pPlayer, "Exploration Finished") ~= true) then
					save(pPlayer, "Exploration Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);						
				elseif pPlayer:HasPolicy(fRationalism) and (load(pPlayer, "Rationalism Finished") ~= true) then
					save(pPlayer, "Rationalism Finished", true)
					PolicyDynastyChange(pPlayer, CityCheck, pCity);
				end

			end
		end
	end
end)

--Adopt Policy
local pAristocracy = GameInfo.Policies["POLICY_ARISTOCRACY"].ID
local pLanded = GameInfo.Policies["POLICY_LANDED_ELITE"].ID
local pMonarch = GameInfo.Policies["POLICY_MONARCHY"].ID

local pMerit = GameInfo.Policies["POLICY_MERITOCRACY"].ID
local pCollective = GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID
local pRepresent = GameInfo.Policies["POLICY_REPRESENTATION"].ID

local pMilitary = GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID
local pProfessional = GameInfo.Policies["POLICY_PROFESSIONAL_ARMY"].ID

local pTheocracy = GameInfo.Policies["POLICY_THEOCRACY"].ID
local pMandate = GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID
local pReformation = GameInfo.Policies["POLICY_REFORMATION"].ID

local pCDiplomacy = GameInfo.Policies["POLICY_CULTURAL_DIPLOMACY"].ID
local pMConfederacy = GameInfo.Policies["POLICY_MERCHANT_CONFEDERACY"].ID

local pAGenius = GameInfo.Policies["POLICY_ARTISTIC_GENIUS"].ID
local pEthics = GameInfo.Policies["POLICY_ETHICS"].ID

local pProtection = GameInfo.Policies["POLICY_PROTECTIONISM"].ID

local pSciRev = GameInfo.Policies["POLICY_SCIENTIFIC_REVOLUTION"].ID
local pFreeThought = GameInfo.Policies["POLICY_FREE_THOUGHT"].ID

local pTreasureFleets = GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID
local pNavigationSchool = GameInfo.Policies["POLICY_NAVIGATION_SCHOOL"].ID

function XiaCompleteTree(playerID, policyID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then

			local xCount = xGetDynastyCount(pPlayer);
			if xCount < 11 then

				local pID = pPlayer:GetID();
				local BodyText = "You have completed a Social Policy tree and your people wish to establish a new Dynasty![NEWLINE][NEWLINE]Settle or Annex a City to establish a new [ICON_CAPITAL] Dynastic Capital.";
				local Button1 = "";
				if (policyID == pAristocracy) or (policyID == pLanded) or (policyID == pMonarch) then
					if pPlayer:HasPolicy(fTradition) and (load(pPlayer, "Tradition Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Tradition Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pMerit) or (policyID == pCollective) or (policyID == pRepresent) then
					if pPlayer:HasPolicy(fLiberty) and (load(pPlayer, "Liberty Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Liberty Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pMilitary) or (policyID == pProfessional) then
					if pPlayer:HasPolicy(fHonor) and (load(pPlayer, "Honor Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Honor Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pTheocracy) or (policyID == pMandate) or (policyID == pReformation) then
					if pPlayer:HasPolicy(fPiety) and (load(pPlayer, "Piety Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Piety Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pCDiplomacy) or (policyID == pMConfederacy) then
					if pPlayer:HasPolicy(fPatronage) and (load(pPlayer, "Patronage Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Patronage Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pAGenius) or (policyID == pEthics) then
					if pPlayer:HasPolicy(fAesthetics) and (load(pPlayer, "Aesthetics Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Aesthetics Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pProtection) then
					if pPlayer:HasPolicy(fCommerce) and (load(pPlayer, "Commerce Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Commerce Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pSciRev) or (policyID == pFreeThought) then
					if pPlayer:HasPolicy(fRationalism) and (load(pPlayer, "Rationalism Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Rationalism Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end
				if (policyID == pTreasureFleets) or (policyID == pNavigationSchool) then
					if pPlayer:HasPolicy(fExploration) and (load(pPlayer, "Exploration Finished") ~= true) then
						local CityCheck = xFreeCityCheck(pPlayer);
						if CityCheck == 1 then
							save(pPlayer, "Exploration Finished", true)
							PolicyDynastyAnnex(pPlayer, CityCheck);				
						elseif CityCheck == 0 then
							if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
								LuaEvents.ShowXiaCapturePopup(BodyText, Button1)
							end
						end
					end
				end

			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(XiaCompleteTree)

function XiaPolicyRenameStart(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			if (RenameAfterPolicy == true) then
				local xCount = xGetDynastyCount(pPlayer);
				if xCount >= 1 then

					local xTextCheck = 0;
					local xDynasty = xGetDynasty(xCount);
					local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)

					local xChinaDesc = 0;
					if xCount <= 10 then
						xChinaDesc = xDynasty
					elseif xCount >= 11 then
						xChinaDesc = "Chinese"
					end
					local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
					for i,iQuery in pairs(tquery) do
						for result in DB.Query(iQuery) do
						end
					end
					Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
					local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
					for i, iQuery in pairs(tquery) do
						for result in DB.Query(iQuery) do
						end
					end
					Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

					RenameAfterPolicy = false;

				end
			end
		end
	end
end

--Banners
function XiaAwardBanners(pPlayer)
	local BannerCheck = 0;
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(pQingBanners) then
			BannerCheck = BannerCheck + 1;
		end
	end
	if BannerCheck < 8 then
		local BannerCount = BannerCheck;
		for pUnit in pPlayer:Units() do
			if BannerCount < 8 then
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and pUnit:IsCombatUnit() then
					if not pUnit:IsHasPromotion(pQingBanners) then
						pUnit:SetHasPromotion(pQingBanners,true);
						BannerCount = BannerCount + 1;
					end
				end
			end
		end
	elseif BannerCheck > 8 then
		local BandCheck = BannerCheck;
		for pUnit in pPlayer:Units() do
			if BandCheck > 8 then
				if pUnit:IsHasPromotion(pQingBanners) then
					pUnit:SetHasPromotion(pQingBanners,false);
					BandCheck = BandCheck - 1;
				end
			end
		end
	end
end

--Award Bonus on Dynasty Change
function xDoDynastyBonus(xCount, pPlayer, pCity)

	local pcCity = pPlayer:GetCapitalCity();

	local DynastyEventMessage = 0;
	for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[oPlayer];
		if (oPlayer:IsAlive()) and (oPlayer:IsHuman()) then
			if oPlayer ~= pPlayer then
				local oTeam = oPlayer:GetTeam();
				local pTeam = pPlayer:GetTeam();
				if Teams[oTeam]:IsHasMet(pTeam) then
					DynastyEventMessage = 1;
					break
				end
			end
		end
	end

	if DynastyEventMessage == 1 then
		Events.GameplayAlertMessage("A new Dynasty has emerged in the East!")
	end

	if xCount == 1 then
		for bCity in pPlayer:Cities() do
			if not (bCity:IsHasBuilding(bShang)) then
				bCity:SetNumRealBuilding(bShang, 1);
			end
		end
		local pID = pPlayer:GetID()
		for bcCity in pPlayer:Cities() do
			if bcCity:IsOriginalCapital() and (bcCity:GetOriginalOwner() == pID) then
				if not (bcCity:IsHasBuilding(bXia)) then
					bcCity:SetNumRealBuilding(bXia, 1);

					local pPlot = bcCity:Plot();
					local DyCapCheck = CheckDyCapitalstoPlots(pPlot);
					if DyCapCheck == 0 then
						local sKey = xCompilePlotID(pPlot)
						xDynasticCapitals[sKey] = -1
					end

					if not (bcCity:IsHasBuilding(bEverOwned)) then			
						bcCity:SetNumRealBuilding(bEverOwned, 1);
					end

				end
			end
		end
	elseif xCount == 2 then		
		pcCity:SetNumRealBuilding(bZhou, 1);
		if not pPlayer:HasPolicy(pZhou) then
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(pZhou, true);
		end
	elseif xCount == 3 then
		local ChangeCount = 0;
		for qCity in pPlayer:Cities() do
			if not qCity:IsOriginalCapital() then
				if (qCity:IsHasBuilding(bCourthouse)) then
					local CourtRefund = qCity:GetSellBuildingRefund(bCourthouse);
					if qCity:IsResistance() then
						local tResistance = (qCity:GetResistanceTurns());
						qCity:ChangeResistanceTurns(-tResistance);
					end
					qCity:SetNumRealBuilding(bCourthouse, 0);
					pPlayer:ChangeGold(CourtRefund);
				end
			end
			if not qCity:IsOriginalCapital() and not qCity:IsPuppet() and not qCity:IsRazing() and not qCity:IsResistance() then
				if qCity:IsOccupied() then
					qCity:SetPuppet(false);
					qCity:SetOccupied(false);
					qCity:SetNeverLost(false);				
					if not (qCity:IsHasBuilding(bEverOwned)) then			
						local XiaCount = 0;
						xDoNameCity(XiaCount, pPlayer, qCity);
						ChangeCount = ChangeCount + 1;
						qCity:SetNumRealBuilding(bEverOwned, 1);
					end
				end
			end
		end
		if ChangeCount >= 1 then
			local pID = pPlayer:GetID()
			if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
				Events.GameplayAlertMessage("Foreign Cities have been assimilated into your empire and no longer suffer [ICON_OCCUPIED] Occupation!");
			end
		end
	elseif xCount == 4 then
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer:IsAlive() then
				if not oPlayer:HasPolicy(pHan) then
					oPlayer:SetNumFreePolicies(1)
					oPlayer:SetNumFreePolicies(0)
					oPlayer:SetHasPolicy(pHan, true);
				end
			end
		end
	elseif xCount == 6 then
		for bCity in pPlayer:Cities() do
			if not (bCity:IsHasBuilding(bTang)) then
				bCity:SetNumRealBuilding(bTang, 1);
			end
		end
	elseif xCount == 7 then
		pcCity:SetNumRealBuilding(bSong, 1);
	elseif xCount == 8 then
		pUnit = pPlayer:InitUnit(uKhan, pCity:GetX(), pCity:GetY(), UNITAI_GENERAL);
		pUnit:JumpToNearestValidPlot()
		pUnit:SetName("Nomukhan");
		if not pUnit:IsHasPromotion(pShangPatronage) then
			pUnit:SetHasPromotion(pShangPatronage, true)
		end
	elseif xCount == 9 then
		pPlayer:ChangeNumResourceTotal(rPorcelain, 2)
		if (isCulDiv == false) then
			pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_XIA_MING_DYNASTY_CARGO")
		end
	elseif xCount == 10 then
		XiaAwardBanners(pPlayer)
		if not pPlayer:HasPolicy(pQing) then
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(pQing, true);
		end
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then
				local BaseXP = pUnit:GetExperience()
				local QingXP = BaseXP + 15;
				pUnit:SetExperience(QingXP);
			end
		end
	elseif xCount == 11 then
		if not pPlayer:HasPolicy(pChina) then
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(pChina, true);
		end
	end

end

--Award Dynasty Bonuses on Turn
local sArtist = GameInfo.Specialists.SPECIALIST_ARTIST.ID
local sScientist = GameInfo.Specialists.SPECIALIST_SCIENTIST.ID
local sMerchant = GameInfo.Specialists.SPECIALIST_MERCHANT.ID
local sEngineer = GameInfo.Specialists.SPECIALIST_ENGINEER.ID
local sWriter = GameInfo.Specialists.SPECIALIST_WRITER.ID
local sMusician = GameInfo.Specialists.SPECIALIST_MUSICIAN.ID
local sMonk = GameInfoTypes.SPECIALIST_JFD_MONK;

local bDummy1 = GameInfoTypes.BUILDING_TOURISMHANDLER_1 
local bDummy2 = GameInfoTypes.BUILDING_TOURISMHANDLER_2 
local bDummy4 = GameInfoTypes.BUILDING_TOURISMHANDLER_4 
local bDummy8 = GameInfoTypes.BUILDING_TOURISMHANDLER_8 
local bDummy16 = GameInfoTypes.BUILDING_TOURISMHANDLER_16
local bDummy32 = GameInfoTypes.BUILDING_TOURISMHANDLER_32
local bDummy64 = GameInfoTypes.BUILDING_TOURISMHANDLER_64
local bDummy128 = GameInfoTypes.BUILDING_TOURISMHANDLER_128

function toBits(num)
	t={}
    while num>0 do
        local rest=math.fmod(num,2)
        t[#t+1]=rest
        num=(num-rest)/2
    end
    return t
end

function AddTourism(pcCity, iNum)
	local num = iNum
	toBits(num)
	pcCity:SetNumRealBuilding(bDummy, num);
	pcCity:SetNumRealBuilding(bDummy1, t[1]);
	pcCity:SetNumRealBuilding(bDummy2, t[2]);
	pcCity:SetNumRealBuilding(bDummy4, t[3]);
	pcCity:SetNumRealBuilding(bDummy8, t[4]);
	pcCity:SetNumRealBuilding(bDummy16, t[5]);
	pcCity:SetNumRealBuilding(bDummy32, t[6]);
	pcCity:SetNumRealBuilding(bDummy64, t[7]);
	pcCity:SetNumRealBuilding(bDummy128, t[8]);				
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then

			local xCount = xGetDynastyCount(pPlayer);
			local pcCity = pPlayer:GetCapitalCity();

			if xCount >= 1 then
				for bCity in pPlayer:Cities() do
					if not (bCity:IsHasBuilding(bShang)) then
						bCity:SetNumRealBuilding(bShang, 1);
					end
				end
			end
			if xCount >= 2 then		
				local pcZhou = pPlayer:GetBuildingClassCount(bcZhou)
				if pcZhou >= 2 then
					for bCity in pPlayer:Cities() do
						if (bCity:IsHasBuilding(bZhou)) then
							bCity:SetNumRealBuilding(bZhou, 0);
						end
					end
					pcCity:SetNumRealBuilding(bZhou, 1);
				end
				if pcZhou <= 0 then
					pcCity:SetNumRealBuilding(bZhou, 1);
				end
				local xZhouSpecialists = 0;
				for bCity in pPlayer:Cities() do
					local Artist = bCity:GetSpecialistCount(sArtist);
					local Scientist = bCity:GetSpecialistCount(sScientist);
					local Merchant = bCity:GetSpecialistCount(sMerchant);
					local Engineer = bCity:GetSpecialistCount(sEngineer);
					local Writer = bCity:GetSpecialistCount(sWriter);
					local Musician = bCity:GetSpecialistCount(sMusician);
					local Monk = bCity:GetSpecialistCount(sMonk);
					local cSpecialists = (Artist + Scientist + Merchant + Engineer + Writer + Musician + Monk);
					xZhouSpecialists = xZhouSpecialists + cSpecialists;
				end
				pPlayer:ChangeGoldenAgeProgressMeter(xZhouSpecialists);
			end
			if xCount >= 5 then
				local Maintenance = 0;
				for sCity in pPlayer:Cities() do
					if (sCity:IsHasBuilding(bSui)) then
						sCity:SetNumRealBuilding(bSui, 0);
					end
					if not (sCity:IsPuppet()) and (sCity:GetOriginalOwner() ~= iPlayer) then
						if (sCity:IsHasBuilding(bXia)) then
							local BuildingCost = sCity:GetTotalBaseBuildingMaintenance();
							Maintenance = (Maintenance + BuildingCost)
						elseif not (sCity:IsHasBuilding(bXia)) then
							local NearCap = 0;
							for sKey, tTable in pairs(xDynasticCapitals) do
								local dPlot = xDecompilePlotID(sKey)
								if (dPlot:IsCity()) then
									local dCity = dPlot:GetPlotCity();
									if (dCity:GetOwner() == iPlayer) then
										if Map.PlotDistance(sCity:GetX(), sCity:GetY(), dCity:GetX(), dCity:GetY()) < 8 then
											NearCap = 1;
										end
									end
								end
							end
							if NearCap == 1 then
								local BuildingCost = sCity:GetTotalBaseBuildingMaintenance();
								Maintenance = (Maintenance + BuildingCost)
							end
						end
					end
				end
				local Discount = math.ceil(Maintenance / 5)
				pPlayer:ChangeGold(Discount);
				pcCity:SetNumRealBuilding(bSui, Discount);
			end
			if xCount >= 6 then
				for bCity in pPlayer:Cities() do
					if not (bCity:IsHasBuilding(bTang)) then
						bCity:SetNumRealBuilding(bTang, 1);
					end
				end
			end
			if xCount >= 9 then
				local cTourism = 0;
				for pUnit in pPlayer:Units() do			
					if pUnit:GetUnitType() == uCargo then
						local uPlot = pUnit:GetPlot()
						if uPlot:GetOwner() ~= -1 then
							if (Players[uPlot:GetOwner()] ~= pPlayer) then
								cTourism = cTourism + 1;
							end
						end
					end
				end
				local iNum = (cTourism * 2);
				AddTourism(pcCity, iNum)
				if iNum > 0 then
					if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then	
						Events.GameplayAlertMessage("Your Cargo Ships have generated " .. iNum .. "  [ICON_TOURISM] Tourism!");
					end
				end
			end
			if xCount >= 10 then
				XiaAwardBanners(pPlayer)
			end
		end
	end
end)

--Conquest Dynasties
function xConquestDynSwitch(vHexPos, iPlayer, iCity, artStyle, eraType, continent, population, size, fogState) 
	local pPlot = Map.GetPlot(ToGridFromHex(vHexPos.x, vHexPos.y));
	local pCity = pPlot:GetPlotCity();
	local pPlayer = GetErlitouPlayer();
	local XiaArt = pPlayer:GetArtStyleType();
	local xCount = xGetDynastyCount(pPlayer);
	if (AlternateCityStyles == true) then		
		local PolyArt = GameInfo.ArtStyleTypes.ARTSTYLE_POLYNESIAN.ID
		if (Players[pCity:GetPreviousOwner()] == nil) then
			if (Players[pCity:GetOwner()]) == pPlayer then
				if (xCount == 8) or (xCount == 10) then
					if artStyle ~= PolyArt then
						Events.SerialEventCityCreated(vHexPos, iPlayer, iCity, PolyArt, eraType, continent, population, size, fogState)
					end
				end
			end
		elseif (Players[pCity:GetPreviousOwner()] ~= nil) then		
			if (Players[pCity:GetPreviousOwner()] ~= pPlayer) then
				if (Players[pCity:GetOwner()]) == pPlayer then											
					if (Players[pCity:GetOriginalOwner()]:IsMinorCiv()) then										
						if (xCount == 8) or (xCount == 10) then
							if artStyle ~= PolyArt then
								Events.SerialEventCityCreated(vHexPos, iPlayer, iCity, PolyArt, eraType, continent, population, size, fogState)
							end
						end
					elseif not (Players[pCity:GetOriginalOwner()]:IsMinorCiv()) then							
						if pCity:IsOriginalCapital() then
							if (xCount == 7) or (xCount == 9) then
								local xDynastyX = pPlot:GetX();
								local xDynastyY = pPlot:GetY();
								if (load(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool") ~= true) then
									if artStyle ~= PolyArt then
										Events.SerialEventCityCreated(vHexPos, iPlayer, iCity, PolyArt, eraType, continent, population, size, fogState)
									end
								end
							end
						elseif not pCity:IsOriginalCapital() then				
							if (xCount == 8) or (xCount == 10) then
								if artStyle ~= PolyArt then
									Events.SerialEventCityCreated(vHexPos, iPlayer, iCity, PolyArt, eraType, continent, population, size, fogState)
								end
							end
						end
					end
				end
			end
		end
	end
end
Events.SerialEventCityCreated.Add(xConquestDynSwitch)

--Sinicization
function XiaAnnexRename(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			local xCount = xGetDynastyCount(pPlayer);

			if xCount >= AssimilateDynasty then

				for pCity in pPlayer:Cities() do
					local iFirstOwner = pCity:GetOriginalOwner();
					local oPlayer = Players[iFirstOwner];
	
					if not oPlayer:IsMinorCiv() then
						if not pCity:IsOriginalCapital() and not pCity:IsPuppet() and not pCity:IsRazing() and not pCity:IsResistance() then
							if pCity:IsOccupied() then

								if (pCity:IsHasBuilding(bCourthouse)) then
									pCity:SetNumRealBuilding(bCourthouse, 0);
								end

								pCity:SetPuppet(false);
								pCity:SetOccupied(false);
								pCity:SetNeverLost(false);
					
								if not (pCity:IsHasBuilding(bEverOwned)) then

									local oldName = Locale.ConvertTextKey(pCity:GetName())
									xDoNameCity(xCount, pPlayer, pCity);
									local newName = Locale.ConvertTextKey(pCity:GetName())

									if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
										Events.GameplayAlertMessage("The City of " .. oldName .. " has been reclaimed from the barbarian tribes under the name " .. newName .. ".");
									end

								end

								pCity:SetNumRealBuilding(bEverOwned, 1);

							end
						end
					end
				end
			end

		end
	end
end

--Iron Curtain
local pIronCurtain = GameInfoTypes.POLICY_IRON_CURTAIN;

function XiaIronCurtain(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			--if pPlayer:HasPolicy(pIronCurtain) then
				for sKey, tTable in pairs(xCapitalPlots) do
					local pPlot = xDecompilePlotID(sKey)
					xDynastyX = pPlot:GetX()
					xDynastyY = pPlot:GetY()
					if (pPlot:IsCity()) then
						local pCity = pPlot:GetPlotCity();
						if pCity:GetOwner() == iPlayer then
							if (pCity:GetNumFreeBuilding(bCourthouse) >= 1) or (pCity:GetNumBuilding(bCourthouse) >= 1) then
								if not pCity:IsPuppet() and not pCity:IsRazing() then
								
									if (load(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool") ~= true) then

										save(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool", true)

										local xCount = xGetDynastyCount(pPlayer);
										if xCount <= 11 then

											local xTextCheck = 0;
											local xDynasty = xGetDynasty(xCount);
											local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
											local xCapital = xGetDynastyCapital(xCount);
											local xNew = xGetDynastyTest(xCount);
											local xBonus = xGetDynastyBonus(xCount);
											local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

											pCity:SetName("" .. xNew .. "" .. xCapital .. "")
											pCity:SetNumRealBuilding(bXia, 1);
								
											local pPlot = pCity:Plot();
											local DyCapCheck = CheckDyCapitalstoPlots(pPlot);
											if DyCapCheck == 0 then
												local sKey = xCompilePlotID(pPlot)
												xDynasticCapitals[sKey] = -1
											end

											if not (pCity:IsHasBuilding(bEverOwned)) then			
												pCity:SetNumRealBuilding(bEverOwned, 1);
											end

											if (MoveCapitalWithDynasty == true) then
												XiaMoveCapital(pPlayer, pCity)
											end

											local title = 0;
											local descr = 0;

											if xCount <= 10 then
												title = "New Dynasty!";
												descr = "A new dynasty has been established at the city of " .. xNew .. "" .. xCapital .. "!";
											elseif xCount >= 11 then
												title = "People's Republic!";
												descr = "The People's Republic has been established at the city of " .. xNew .. "" .. xCapital .. "!";
											end
				
											local XiaDummyID = GameInfo.Units["UNIT_XIA_DYNASTY_DUMMY"].ID;
											pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), XiaDummyID, -1);

											xDoDynastyBonus(xCount, pPlayer, pCity)

											--New Dynasty Pop-Up
											local CurDynasty;
											if xCount <= 10 then
												CurDynasty = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
											elseif xCount >= 11 then
												CurDynasty = "China"
											end

											local pID = pPlayer:GetID()
											if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
												LuaEvents.ShowXiaDynastyPopup(CurDynasty, xMessage, xBonus)
											end

											--Change Short Desc / Adj
											local xChinaDesc = 0;
											if xCount <= 10 then
												xChinaDesc = xDynasty
											elseif xCount >= 11 then
												xChinaDesc = "Chinese"
											end
											local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
											for i,iQuery in pairs(tquery) do
												for result in DB.Query(iQuery) do
												end
											end
											Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
											local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
											for i, iQuery in pairs(tquery) do
												for result in DB.Query(iQuery) do
												end
											end
											Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

										end
									end
								end
							end
						end
					end
				end
			--end
		end
	end
end

--PlayerTurn
function XiaCapOrRename(iPlayer)
	XiaAnnexRename(iPlayer);
	XiaAnnexDynastyCap(iPlayer);
	XiaPolicyRenameStart(iPlayer);
	XiaIronCurtain(iPlayer);
end
GameEvents.PlayerDoTurn.Add(XiaCapOrRename)

--Foundry Culture
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			local pcCity = pPlayer:GetCapitalCity();
			local xCount = xGetDynastyCount(pPlayer);
			if xCount <= 11 then
				for pCity in pPlayer:Cities() do
					if (pCity:IsHasBuilding(bBarracksPressure)) then
						pCity:SetNumRealBuilding(bBarracksPressure, 0);
					end
					if pCity:GetNumGreatWorksInBuilding(bcBarracks) >= 1 then
						pCity:SetNumRealBuilding(bBarracksPressure, xCount);
					end
					if not (pPlayer:IsHuman()) then
						if pCity == pcCity then 
							if (pCity:IsHasBuilding(bFoundry)) then
								if pCity:GetNumGreatWorksInBuilding(bcBarracks) <= 0 then
									pCity:SetNumRealBuilding(bBarracksPressure, xCount);
								end
							end
						end
					end
				end
			elseif xCount > 11 then
				for pCity in pPlayer:Cities() do
					if (pCity:IsHasBuilding(bBarracksPressure)) then
						pCity:SetNumRealBuilding(bBarracksPressure, 0);
					end
					if pCity:GetNumGreatWorksInBuilding(bcBarracks) >= 1 then
						pCity:SetNumRealBuilding(bBarracksPressure, 11);
					end
					if not (pPlayer:IsHuman()) then
						if pCity == pcCity then 
							if (pCity:IsHasBuilding(bFoundry)) then
								if pCity:GetNumGreatWorksInBuilding(bcBarracks) <= 0 then
									pCity:SetNumRealBuilding(bBarracksPressure, 11);
								end
							end
						end
					end
				end
			end
		end
	end
end)

--AI Handle
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];	
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			if not (pPlayer:IsHuman()) then
				for pCity in pPlayer:Cities() do
					if pCity:IsOriginalCapital() then
						if not pCity:IsRazing() and not pCity:IsResistance() and not pCity:IsPuppet() then
							local oPlayer = Players[pCity:GetOriginalOwner()];
							if not oPlayer:IsMinorCiv() then
								if pPlayer ~= oPlayer then

									if pCity:CanConstruct(bCourthouse) then

										xDynastyX = pCity:GetX()
										xDynastyY = pCity:GetY()

										if (load(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool") ~= true) then

											pCity:SetNumRealBuilding(bCourthouse, 1);
											save(pPlayer, "XiaDynastyCount" .. xDynastyX .. "xy" .. xDynastyY .. "bool", true)

											local xCount = xGetDynastyCount(pPlayer);
											if xCount <= 11 then

												local xTextCheck = 0;
												local xDynasty = xGetDynasty(xCount);
												local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
												local xCapital = xGetDynastyCapital(xCount);
												local xNew = xGetDynastyTest(xCount);
												local xBonus = xGetDynastyBonus(xCount);
												local xMessage = xGetDynastyMessage(xCount, xDynasty, xCapital, xWestern, xBonus, xNew);

												pCity:SetName("" .. xNew .. "" .. xCapital .. "")
												pCity:SetNumRealBuilding(bXia, 1);

												local pPlot = pCity:Plot();
												local DyCapCheck = CheckDyCapitalstoPlots(pPlot);
												if DyCapCheck == 0 then
													local sKey = xCompilePlotID(pPlot)
													xDynasticCapitals[sKey] = -1
												end

												if not (pCity:IsHasBuilding(bEverOwned)) then			
													pCity:SetNumRealBuilding(bEverOwned, 1);
												end

												if (MoveCapitalWithDynasty == true) then
													XiaMoveCapital(pPlayer, pCity)
												end

												xDoDynastyBonus(xCount, pPlayer, pCity)

												--Change Short Desc / Adj
												local xChinaDesc = 0;
												if xCount <= 10 then
													xChinaDesc = xDynasty
												elseif xCount >= 11 then
													xChinaDesc = "Chinese"
												end
												local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xDynasty .."' WHERE Tag = 'TXT_KEY_XIA_MOD_SHORT_DESC'"}
												for i,iQuery in pairs(tquery) do
													for result in DB.Query(iQuery) do
													end
												end
												Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
												local tquery = {"UPDATE Language_en_US SET Text = '" .. xWestern .. "".. xChinaDesc .."' WHERE Tag = 'TXT_KEY_XIA_MOD_ADJECTIVE'"}
												for i, iQuery in pairs(tquery) do
													for result in DB.Query(iQuery) do
													end
												end
												Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

local iTechWheel = GameInfo.Technologies["TECH_THE_WHEEL"].ID
local iTechHorseback = GameInfo.Technologies["TECH_HORSEBACK_RIDING"].ID

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTech == iTechWheel) or (iTech == iTechHorseback) then
		local gPlayer = 0;
		local pTeam = 0;
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:IsAlive()) and not (pPlayer:IsHuman()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
					gPlayer = pPlayer;
					pTeam = pPlayer:GetTeam();
				end
			end
		end
		if pTeam == iTeam then
			local pcCity = gPlayer:GetCapitalCity();
			pUnit = gPlayer:InitUnit(uShangChariot, pcCity:GetX(), pcCity:GetY(), UNITAI_RANGED);
			pUnit:JumpToNearestValidPlot();
		end
	end
end)

--Cleanup
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then			
			for pCity in pPlayer:Cities() do
				if (pCity:IsHasBuilding(bShang)) then	
					pCity:SetNumRealBuilding(bShang, 0);
				end
				if (pCity:IsHasBuilding(bZhou)) then	
					pCity:SetNumRealBuilding(bZhou, 0);
				end
				if (pCity:IsHasBuilding(bSui)) then
					pCity:SetNumRealBuilding(bSui, 0);
				end
				if (pCity:IsHasBuilding(bTang)) then	
					pCity:SetNumRealBuilding(bTang, 0);
				end
				if (pCity:IsHasBuilding(bSong)) then	
					pCity:SetNumRealBuilding(bSong, 0);
				end
				if (pCity:IsHasBuilding(bBarracksPressure)) then	
					pCity:SetNumRealBuilding(bBarracksPressure, 0);
				end
			end
		end
	end
end)

--JFD: UI
include("EUI_utilities")
local bEUI = false
local eUIOffset = -40
local dynastyText;
local dynastyTooltip;
 
function OnEnterCityScreen()

		local iPlayer = Game.GetActivePlayer()
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if (pPlayer:IsHuman()) then
				Controls.MainGrid:SetHide(true)
			end
		end

end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen)
 
function OnExitCityScreen()

		local iPlayer = Game.GetActivePlayer()
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if (pPlayer:IsHuman()) then
				Controls.MainGrid:SetHide(false)
			end
		end

end
Events.SerialEventExitCityScreen.Add(OnExitCityScreen)
 
function JFD_XiaDynastyDisplay()
        local player = Players[Game.GetActivePlayer()]

        if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"] then return end

		if not (player:IsHuman()) then return end			
      
        if player:GetNumCities() == 0 then return end

		local xTextCheck = 1;
		local pPlayer = player;
		local xCount = xGetDynastyCount(pPlayer);
		local xDynasty = xGetDynasty(xCount);
		local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
		local xTotal = xGetTopPanelBonus(xCount);

		if xCount <= 10 then					
			dynastyText = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
		elseif xCount >= 11 then
			dynastyText = "" .. xWestern .. "" .. xDynasty .. ""
		end
		dynastyTooltip = "" .. xTotal .. "";

        local hidden = Controls.MainGrid:IsHidden()
        local currentText = Controls.LabelText:GetText()
        local currentTooltip = Controls.LabelText:GetToolTipString()
        local currentOffset = Controls.MainGrid:GetOffsetY()
        if bEUI and currentOffset ~= eUIOffset then
                Controls.MainGrid:SetOffsetY(eUIOffset)
        end
 
        if hidden then
                Controls.MainGrid:SetHide(false)
        end
 
        Controls.LabelText:LocalizeAndSetText(dynastyText)
     
        Controls.LabelText:LocalizeAndSetToolTip(dynastyTooltip)
          
end
Events.ActivePlayerTurnStart.Add(JFD_XiaDynastyDisplay)

Events.SequenceGameInitComplete.Add(
function()
	if ContextPtr:LookUpControl("/InGame/TopPanel/ClockOptionsPanel") then
  
		bEUI = true

		local pPlayer = GetErlitouPlayer();

		local xTextCheck = 1;
		local xCount = xGetDynastyCount(pPlayer);
		local xDynasty = xGetDynasty(xCount);
		local xWestern = xGetDynastyCheck(pPlayer, xCount, xTextCheck)
		local xTotal = xGetTopPanelBonus(xCount);

		if xCount <= 10 then					
			dynastyText = "" .. xWestern .. "" .. xDynasty .. " Dynasty"
		elseif xCount >= 11 then
			dynastyText = "" .. xWestern .. "" .. xDynasty .. ""
		end
		dynastyTooltip = "" .. xTotal .. "";

		Controls.MainGrid:SetOffsetY(eUIOffset)
		Controls.LabelText:LocalizeAndSetText(dynastyText)
		Controls.LabelText:LocalizeAndSetToolTip(dynastyTooltip)

	end
end)

--Typhlomence: Diplomacy
local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]
local isCivErlitouActivePlayer = activePlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]

local civilizationQing = GameInfoTypes["CIVILIZATION_JFD_QING"]
local civilizationMing = GameInfoTypes["CIVILIZATION_JFD_MING"]
local civilizationYuan = GameInfoTypes["CIVILIZATION_LITE_YUAN"]
local civilizationSong = GameInfoTypes["CIVILIZATION_TCM_SONG"]
local civilizationTang = GameInfoTypes["CIVILIZATION_CHINA"]
local civilizationHan = GameInfoTypes["CIVILIZATION_JFD_HAN"]
local civilizationQin = GameInfoTypes["CIVILIZATION_QIN_LS_MOD"]
local civilizationPRC = GameInfoTypes["CIVILIZATION_OW_PRC_MAO"]

function XiaDynastyResponses()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			if ((civilizationID == civilizationQing) or (civilizationID == civilizationMing) or (civilizationID == civilizationYuan) or (civilizationID == civilizationSong) or (civilizationID == civilizationTang) or (civilizationID == civilizationHan) or (civilizationID == civilizationQin) or (civilizationID == civilizationPRC)) then
				ChangeDiplomacyResponse("LEADER_XIA_YU_MOD", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_XIA_YU_MOD_FIRST_GREETING_%", "TXT_KEY_LEADER_CHINA_YU_MOD_FIRST_GREETING_DYNASTY_%", 500)
				ChangeDiplomacyResponse("LEADER_XIA_YU_MOD", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_XIA_YU_MOD_DEFEATED_%", "TXT_KEY_LEADER_CHINA_YU_MOD_DEFEATED_DYNASTY_%", 500)
				break
			end
		end
	end
end
if not isCivErlitouActivePlayer then
	Events.SequenceGameInitComplete.Add(XiaDynastyResponses)
end