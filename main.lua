
MDT = {
  ["L"] = {},
  ["mapInfo"] = {},
  ["scaleMultiplier"] = {},
  ["dungeonTotalCount"] = {},
  ["mapPOIs"] = {},
  ["dungeonEnemies"] = {},
};

require('locale-enUS');
require("MDTTools");

local expansionInfo = {
  ["general"] = {
    ["collapse"] = false,
    ["name"] = "General"
  },
  ["shadowlands"] = {
    ["collapse"] = false,
    ["name"] = "Shadowlands"
  },
  ["bfa"] = {
    ["collapse"] = true,
    ["name"] = "Battle for Azeroth"
  },
  ["legion"] = {
    ["collapse"] = true,
    ["name"] = "Legion"
  }
};

local expansionOrder = {
  "general",
  "shadowlands",
  "bfa",
  "legion"
};

local dungeonInformations = {
  -- [[ General
  [ -2 ] = { -- Testing
    ["name"] = "Testing",
    ["key"] = "testing",
    ["file"] = "General/Testing",
    ["expansion"] = "general"
  },
  [ -1 ] = { -- Affixes
    ["name"] = "Affixes",
    ["key"] = "affixes",
    ["file"] = "General/Affixes",
    ["expansion"] = "general"
  },
  --]]--
  --[[ Legion
  [  1 ] = {
    ["name"] = "Black Rook Hold",
    ["key"] = "black-rook-hold",
    ["file"] = "Legion/BlackRookHold",
    ["expansion"] = "legion"
  },
  [  2 ] = {
    ["name"] = "Cathedral Of Eternal Night",
    ["key"] = "cathedral-of-eternal-night",
    ["file"] = "Legion/CathedralOfEternalNight",
    ["expansion"] = "legion"
  },
  [  3 ] = {
    ["name"] = "Court Of Stars",
    ["key"] = "cour-of-stars",
    ["file"] = "Legion/CourtOfStars",
    ["expansion"] = "legion"
  },
  [  4 ] = {
    ["name"] = "Darkheart Thicket",
    ["key"] = "darkheart-thicket",
    ["file"] = "Legion/DarkheartThicket",
    ["expansion"] = "legion"
  },
  [  5 ] = {
    ["name"] = "Eye Of Azshara",
    ["key"] = "eye-of-azshara",
    ["file"] = "Legion/EyeOfAzshara",
    ["expansion"] = "legion"
  },
  [  6 ] = {
    ["name"] = "Halls Of Valor",
    ["key"] = "halls-of-valor",
    ["file"] = "Legion/HallsOfValor",
    ["expansion"] = "legion"
  },
  [  7 ] = {
    ["name"] = "Maw Of Souls",
    ["key"] = "maw-of-souls",
    ["file"] = "Legion/MawOfSouls",
    ["expansion"] = "legion"
  },
  [  8 ] = {
    ["name"] = "Neltharions Lair",
    ["key"] = "neltharions-lair",
    ["file"] = "Legion/NeltharionsLair",
    ["expansion"] = "legion"
  },
  [  9 ] = {
    ["name"] = "Return to Karazhan Lower",
    ["key"] = "return-to-karazhan-lower",
    ["file"] = "Legion/ReturntoKarazhanLower",
    ["expansion"] = "legion"
  },
  [ 10 ] = {
    ["name"] = "Return to Karazhan Upper",
    ["key"] = "return-to-karazhan-upper",
    ["file"] = "Legion/ReturntoKarazhanUpper",
    ["expansion"] = "legion"
  },
  [ 11 ] = {
    ["name"] = "Seat of the Triumvirate",
    ["key"] = "seat-of-the-triumvirate",
    ["file"] = "Legion/SeatoftheTriumvirate",
    ["expansion"] = "legion"
  },
  [ 12 ] = {
    ["name"] = "The Arcway",
    ["key"] = "the-arcway",
    ["file"] = "Legion/TheArcway",
    ["expansion"] = "legion"
  },
  [ 13 ] = {
    ["name"] = "Vault of the Wardens",
    ["key"] = "vault-of-the-wardens",
    ["file"] = "Legion/VaultoftheWardens",
    ["expansion"] = "legion"
  },
  --]]--
  -- [[ Battle for Azeroth
  [ 15 ] = { -- Atal'Dazar
    ["name"] = "Atal'Dazar",
    ["key"] = "atal-dazar",
    ["file"] = "BattleForAzeroth/AtalDazar",
    ["expansion"] = "bfa"
  },
  [ 16 ] = { -- Freehold
    ["name"] = "Freehold",
    ["key"] = "freehold",
    ["file"] = "BattleForAzeroth/Freehold",
    ["expansion"] = "bfa"
  },
  [ 17 ] = { -- King's Rest
    ["name"] = "King's Rest",
    ["key"] = "kings-rest",
    ["file"] = "BattleForAzeroth/KingsRest",
    ["expansion"] = "bfa"
  },
  [ 18 ] = { -- Shrine of the Storm
    ["name"] = "Shrine of the Storm",
    ["key"] = "shrine-of-the-storm",
    ["file"] = "BattleForAzeroth/ShrineoftheStorm",
    ["expansion"] = "bfa"
  },
  [ 19 ] = { -- Siege of Boralus
    ["name"] = "Siege of Boralus",
    ["key"] = "siege-of-boralus",
    ["file"] = "BattleForAzeroth/SiegeofBoralus",
    ["expansion"] = "bfa"
  },
  [ 20 ] = { -- Temple of Sethraliss
    ["name"] = "Temple of Sethraliss",
    ["key"] = "temple-of-sethraliss",
    ["file"] = "BattleForAzeroth/TempleofSethraliss",
    ["expansion"] = "bfa"
  },
  [ 21 ] = { -- The MOTHERLODE!!
    ["name"] = "The MOTHERLODE!!",
    ["key"] = "the-motherlode",
    ["file"] = "BattleForAzeroth/TheMotherlode",
    ["expansion"] = "bfa"
  },
  [ 22 ] = { -- The Underrot
    ["name"] = "The Underrot",
    ["key"] = "the-underrot",
    ["file"] = "BattleForAzeroth/TheUnderrot",
    ["expansion"] = "bfa"
  },
  [ 23 ] = { -- Tol Dagor
    ["name"] = "Tol Dagor",
    ["key"] = "tol-dagor",
    ["file"] = "BattleForAzeroth/TolDagor",
    ["expansion"] = "bfa"
  },
  [ 24 ] = { -- Waycrest Manor
    ["name"] = "Waycrest Manor",
    ["key"] = "maycrest-manor",
    ["file"] = "BattleForAzeroth/WaycrestManor",
    ["expansion"] = "bfa"
  },
  [ 25 ] = { -- Operation: Mechagon - Junkyard
    ["name"] = "Operation: Mechagon - Junkyard",
    ["key"] = "operation-mechagon-junkyard",
    ["file"] = "BattleForAzeroth/MechagonIsland",
    ["expansion"] = "bfa"
  },
  [ 26 ] = { -- Operation Mechagon - Workshop
    ["name"] = "Operation: Mechagon - Workshop",
    ["key"] = "operation-mechagon-workshop",
    ["file"] = "BattleForAzeroth/MechagonCity",
    ["expansion"] = "bfa"
  },
  --]]--
  -- [[ Shadowlands
  [ 29 ] = { -- De Other Side
    ["name"] = "De Other Side",
    ["key"] = "de-other-side",
    ["file"] = "Shadowlands/DeOtherSide",
    ["expansion"] = "shadowlands"
  },
  [ 30 ] = { -- Halls of Atonement
    ["name"] = "Halls of Atonement",
    ["key"] = "halls-of-atonement",
    ["file"] = "Shadowlands/HallsOfAtonement",
    ["expansion"] = "shadowlands"
  },
  [ 31 ] = { -- Mists of Tirna Scithe
    ["name"] = "Mists of Tirna Scithe",
    ["key"] = "mists-of-tirna-scithe",
    ["file"] = "Shadowlands/MistsOfTirnaScithe",
    ["expansion"] = "shadowlands"
  },
  [ 32 ] = { -- Plaguefall
    ["name"] = "Plaguefall",
    ["key"] = "plaguefall",
    ["file"] = "Shadowlands/Plaguefall",
    ["expansion"] = "shadowlands"
  },
  [ 33 ] = { -- Sanguine Depths
    ["name"] = "Sanguine Depths",
    ["key"] = "sanguine-depths",
    ["file"] = "Shadowlands/SanguineDepths",
    ["expansion"] = "shadowlands"
  },
  [ 34 ] = { -- Spires of Ascension
    ["name"] = "Spires of Ascension",
    ["key"] = "spires-of-ascension",
    ["file"] = "Shadowlands/SpiresOfAscension",
    ["expansion"] = "shadowlands"
  },
  [ 35 ] = { -- The Necrotic Wake
    ["name"] = "The Necrotic Wake",
    ["key"] = "the-necrotic-wake",
    ["file"] = "Shadowlands/TheNecroticWake",
    ["expansion"] = "shadowlands"
  },
  [ 36 ] = { -- Theater of Pain
    ["name"] = "Theater of Pain",
    ["key"] = "theater-of-pain",
    ["file"] = "Shadowlands/TheaterOfPain",
    ["expansion"] = "shadowlands"
  },
  --]]--
};

local standardValues = {
  "Curse of Weakness",
  "Curse of Tongues",
  "Curse of Exhaustion"  
};

local expansionGroups = {};

for dungeonId,dungeonInfo in pairs(dungeonInformations) do
  require(dungeonInfo.file);
  
  if expansionGroups[dungeonInfo.expansion] == nil then
    expansionGroups[dungeonInfo.expansion] = MDT.createExpansionOptions(expansionInfo, dungeonInfo);
  end
  local dungeonOptions = MDT.createDungeonOptions(dungeonInfo);
  
  for mobIndex,mobInfo in pairs(MDT.dungeonEnemies[dungeonId]) do
    table.insert(dungeonOptions.subOptions, MDT.createMobToggle(mobInfo));
    table.insert(dungeonOptions.subOptions, MDT.createMobDropdown(mobInfo, standardValues));
  end
  
  table.insert(expansionGroups[dungeonInfo.expansion].subOptions, dungeonOptions);
end

local curseMobsOptions = {
  ["collapse"] = false,
  ["groupType"] = "simple",
  ["hideReorder"] = true,
  ["key"] = "curse-mobs",
  ["limitType"] = "none",
  ["name"] = "Mob Options",
  ["nameSource"] = 0,
  ["size"] = 10,
  ["subOptions"] = {
  },
  ["type"] = "group",
  ["useCollapse"] = true,
  ["useDesc"] = false,
  ["width"] = 1
};

for i = 1, #expansionOrder do
  if expansionGroups[expansionOrder[i]] ~= nil then
    table.insert(curseMobsOptions.subOptions, expansionGroups[expansionOrder[i]]);
  end
end

print(MDT.createTableString(curseMobsOptions));
