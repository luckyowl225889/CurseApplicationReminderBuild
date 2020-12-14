
MDT = {
  ["L"] = {},
  ["mapInfo"] = {},
  ["scaleMultiplier"] = {},
  ["dungeonTotalCount"] = {},
  ["mapPOIs"] = {},
  ["dungeonEnemies"] = {},
};

function MDT.createExpansionOptions(xpac, dung) 
  return {
    ["collapse"] = xpac[dung.expansion].collapse,
    ["groupType"] = "simple",
    ["hideReorder"] = true,
    ["key"] = dung.expansion,
    ["limitType"] = "none",
    ["name"] = xpac[dung.expansion].name,
    ["nameSource"] = 0,
    ["size"] = 10,
    ["subOptions"] = {
    },
    ["type"] = "group",
    ["useCollapse"] = xpac[dung.expansion].collapse,
    ["useDesc"] = false,
    ["width"] = 1
  };
end

function MDT.createDungeonOptions(dung)
  return {
    ["collapse"] = true,
    ["groupType"] = "simple",
    ["hideReorder"] = true,
    ["key"] = dung.key,
    ["limitType"] = "none",
    ["name"] = dung.name,
    ["nameSource"] = 0,
    ["size"] = 10,
    ["subOptions"] = {
    },
    ["type"] = "group",
    ["useCollapse"] = true,
    ["useDesc"] = false,
    ["width"] = 1
  };
end

function MDT.createMobToggle(mobInfo)
  return {
    ["default"] = false,
    ["key"] = "mob" .. mobInfo.id,
    ["name"] = mobInfo.name,
    ["type"] = "toggle",
    ["useDesc"] = false,
    ["width"] = 1
  };
end

function MDT.createMobDropdown(mobInfo)
  return {
    ["default"] = 1,
    ["key"] = "curse" .. mobInfo.id,
    ["name"] = mobInfo.name,
    ["type"] = "select",
    ["useDesc"] = false,
    ["values"] = standardValues,
    ["width"] = 1
  };
end

function MDT.createIndentation(depth, indents)
  local indents = indents or 4;
  local indentation = "";
  
  for i = 1, depth do
    for j = 1, indents do
      indentation = indentation .. " ";
    end
  end
  
  return indentation;
end

function MDT.createTableString(table, depth)
  local depth = depth or 0;
  local content = "";
  
  if type(table) == "table" then
    content = content .. "{\n";
    
    local index = 1;
    
    for key,value in pairs(table) do
      if index == key then
        content = content .. MDT.createIndentation(depth + 1) .. MDT.createTableString(value, depth + 1) .. " -- [" .. index .. "]\n"
      else
        content = content .. MDT.createIndentation(depth + 1) .. "[\"" .. key .. "\"] = " .. MDT.createTableString(value, depth + 1) .. "\n"
      end
      
      index = index + 1;
    end
    
    content = content .. MDT.createIndentation(depth) .. "},"
  else
    if type(table) == "boolean" then
      content = content .. (table and "true" or "false");
    else
      content = content .. table;
    end
  end
  
  return content;
end


local inspect = require('curse-application-reminder-build/inspect');
require('curse-application-reminder-build/locale-enUS');

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
  require('curse-application-reminder-build/' .. dungeonInfo.file);
  
  if expansionGroups[dungeonInfo.expansion] == nil then
    expansionGroups[dungeonInfo.expansion] = MDT.createExpansionOptions(expansionInfo, dungeonInfo);
  end
  local dungeonOptions = MDT.createDungeonOptions(dungeonInfo);
  
  for mobIndex,mobInfo in pairs(MDT.dungeonEnemies[dungeonId]) do
    table.insert(dungeonOptions, MDT.createMobToggle(mobInfo));
    table.insert(dungeonOptions, MDT.createMobDropdown(mobInfo));
  end
  
  print(MDT.createTableString(dungeonOptions));
  -- MDT.createDungeonOptions(dungeonInfo);
  -- print(inspect(MDT.dungeonEnemies[dungeonId]));
end

--[[ GROUP

{
  "collapse": <<collapse by default>>,
  "groupType": "simple",
  "hideReorder": true,
  "key": "<<key>>",
  "limitType": "none",
  "name": "<<Name>>",
  "nameSource": 0,
  "size": 10,
  "subOptions": [
    <<Options>>
  ],
  "type": "group",
  "useCollapse": <<collapse by default>>,
  "useDesc": false,
  "width": 1
}

]]--

--[[ MOB
{
  "default": false,
  "key": "mob<<id>>",
  "name": "<<name>>",
  "type": "toggle",
  "useDesc": false,
  "width": 1
},
{
  "default": 2,
  "key": "curse<<id>>",
  "name": "<<name>>",
  "type": "select",
  "useDesc": false,
  "values": <<standardValues>>,
  "width": 1
}
]]--

--[[
local mobOptionsStructure = {
    ["key"] = "curse-mobs",
    ["name"] = "Mob Options",
    ["subOptions"] = [
      {
        ["key"] = "bfa",
        ["name"] = "Battle for Azeroth",
        ["subOptions"] = [
          {
            ["key"] = "affix",
            ["name"] = "Affixes"
          },
          {
            ["key"] = "siege-of-boralus",
            ["name"] = "Siege of Boralus",
          }
        ]
      }
    ];
};
]]--


--[[
{
  "d": {
    "authorOptions": [
      {
        "collapse": false,
        "groupType": "simple",
        "hideReorder": true,
        "key": "curse-mobs",
        "limitType": "none",
        "name": "Mob Options",
        "nameSource": 0,
        "size": 10,
        "subOptions": [
          {
            "collapse": true,
            "groupType": "simple",
            "hideReorder": true,
            "key": "bfa",
            "limitType": "none",
            "name": "Battle for Azeroth",
            "nameSource": 0,
            "size": 10,
            "subOptions": [
              {
                "collapse": true,
                "groupType": "simple",
                "hideReorder": true,
                "key": "affix",
                "limitType": "none",
                "name": "Affixes",
                "nameSource": 0,
                "size": 10,
                "subOptions": [
                  {
                    "default": true,
                    "key": "mob161244",
                    "name": "Blood of the Corruptor",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 3,
                    "key": "curse161244",
                    "name": "Blood of the Corruptor",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": true,
                    "key": "mob161243",
                    "name": "Samh'rek, Beckoner of Chaos",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse161243",
                    "name": "Samh'rek, Beckoner of Chaos",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": true,
                    "key": "mob161124",
                    "name": "Urg'roth, Breaker of Heroes",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse161124",
                    "name": "Urg'roth, Breaker of Heroes",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": true,
                    "key": "mob161241",
                    "name": "Voidweaver Mal'thir",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 2,
                    "key": "curse161241",
                    "name": "Voidweaver Mal'thir",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  }
                ],
                "type": "group",
                "useCollapse": true,
                "useDesc": false,
                "width": 1
              },
              {
                "collapse": true,
                "groupType": "simple",
                "hideReorder": true,
                "key": "siege-of-boralus",
                "limitType": "none",
                "name": "Siege of Boralus",
                "nameSource": 0,
                "size": 10,
                "subOptions": [
                  {
                    "default": false,
                    "key": "mob129372",
                    "name": "Blacktar Bomber",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129372",
                    "name": "Blacktar Bomber",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob128650",
                    "name": "Chopper Redhook (First Boss)",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse128650",
                    "name": "Chopper Redhook (First Boss)",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129373",
                    "name": "Dockhound Packmaster",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129373",
                    "name": "Dockhound Packmaster",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129879",
                    "name": "Irontide Cleaver (First Boss)",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129879",
                    "name": "Irontide Cleaver (First Boss)",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129369",
                    "name": "Irontide Raider",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129369",
                    "name": "Irontide Raider",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob137521",
                    "name": "Irontide Powdershot",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse137521",
                    "name": "Irontide Powdershot",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129928",
                    "name": "Irontide Powdershot (First Boss)",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129928",
                    "name": "Irontide Powdershot (First Boss)",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129370",
                    "name": "Irontide Waveshaper",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 2,
                    "key": "curse129370",
                    "name": "Irontide Waveshaper",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129371",
                    "name": "Riptide Shredder",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129371",
                    "name": "Riptide Shredder",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129374",
                    "name": "Scrimshaw Enforcer",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129374",
                    "name": "Scrimshaw Enforcer",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob133990",
                    "name": "Scrimshaw Gutter",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse133990",
                    "name": "Scrimshaw Gutter",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob129640",
                    "name": "Snarling Dockhound",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse129640",
                    "name": "Snarling Dockhound",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  },
                  {
                    "default": false,
                    "key": "mob138002",
                    "name": "Scrimshaw Gutter (Fighting)",
                    "type": "toggle",
                    "useDesc": false,
                    "width": 1
                  },
                  {
                    "default": 1,
                    "key": "curse138002",
                    "name": "Scrimshaw Gutter (Fighting)",
                    "type": "select",
                    "useDesc": false,
                    "values": [
                      "Curse of Weakness",
                      "Curse of Tongues",
                      "Curse of Exhaustion"
                    ],
                    "width": 1
                  }
                ],
                "type": "group",
                "useCollapse": true,
                "useDesc": false,
                "width": 1
              }
            ],
            "type": "group",
            "useCollapse": true,
            "useDesc": false,
            "width": 1
          },
          {
            "collapse": true,
            "groupType": "simple",
            "hideReorder": true,
            "key": "testing",
            "limitType": "none",
            "name": "Testing",
            "nameSource": 0,
            "size": 10,
            "subOptions": [
              {
                "default": false,
                "key": "mob131989",
                "name": "Small Training Dummy",
                "type": "toggle",
                "useDesc": false,
                "width": 1
              },
              {
                "default": 1,
                "key": "curse131989",
                "name": "Small Training Dummy",
                "type": "select",
                "useDesc": false,
                "values": [
                  "Curse of Weakness",
                  "Curse of Tongues",
                  "Curse of Exhaustion"
                ],
                "width": 1
              },
              {
                "default": false,
                "key": "mob126781",
                "name": "Bigger Training Dummy",
                "type": "toggle",
                "useDesc": false,
                "width": 1
              },
              {
                "default": 3,
                "key": "curse126781",
                "name": "Bigger Training Dummy",
                "type": "select",
                "useDesc": false,
                "values": [
                  "Curse of Weakness",
                  "Curse of Tongues",
                  "Curse of Exhaustion"
                ],
                "width": 1
              }
            ],
            "type": "group",
            "useCollapse": true,
            "useDesc": false,
            "width": 1
          }
        ],
        "type": "group",
        "useCollapse": true,
        "useDesc": false,
        "width": 1
      }
    ],
    "color": [
      1,
      1,
      1,
      1
    ],
    "conditions": [],
    "config": {
      "curse-mobs": {
        "bfa": {
          "affix": {
            "curse161124": 1,
            "curse161241": 2,
            "curse161243": 1,
            "curse161244": 3,
            "mob161124": true,
            "mob161241": true,
            "mob161243": true,
            "mob161244": true
          },
          "siege-of-boralus": {
            "curse128650": 1,
            "curse129369": 1,
            "curse129370": 2,
            "curse129371": 1,
            "curse129372": 1,
            "curse129373": 1,
            "curse129374": 1,
            "curse129640": 1,
            "curse129879": 1,
            "curse129928": 1,
            "curse133990": 1,
            "curse137521": 1,
            "curse138002": 1,
            "mob128650": false,
            "mob129369": false,
            "mob129370": false,
            "mob129371": false,
            "mob129372": false,
            "mob129373": false,
            "mob129374": false,
            "mob129640": false,
            "mob129879": false,
            "mob129928": false,
            "mob133990": false,
            "mob137521": false,
            "mob138002": false
          }
        },
        "testing": {
          "curse126781": 3,
          "curse131989": 1,
          "mob126781": false,
          "mob131989": false
        }
      }
    },
    "cooldown": false,
    "cooldownEdge": false,
    "cooldownSwipe": true,
    "cooldownTextDisabled": false,
    "customText": "function()\n    \n    if aura_env.state then\n        \n        if aura_env.state.nameplate_unit then\n            \n            local plate = C_NamePlate.GetNamePlateForUnit(aura_env.state.nameplate_unit)\n            \n            if plate then\n                \n                aura_env.region:ClearAllPoints()\n                aura_env.region:SetPoint(\"RIGHT\", plate, \"LEFT\", 0, 0)\n                \n            end\n            \n        end\n    end\n    \n    return ''\n    \nend\n\n\n\n",
    "desaturate": false,
    "desc": "A reminder to put your curses onto certain mobs. This WeakAura will mark the specified mobs with the icon of the curse to apply to the given mob.",
    "displayIcon": "136140",
    "frameStrata": 1,
    "height": 24,
    "icon": true,
    "iconSource": -1,
    "id": "Curse Application Reminder",
    "ignoreOptionsEventErrors": true,
    "internalVersion": 39,
    "inverse": false,
    "keepAspectRatio": false,
    "load": {
      "class": {
        "multi": {
          "WARLOCK": true
        },
        "single": "WARLOCK"
      },
      "size": {
        "multi": []
      },
      "spec": {
        "multi": []
      },
      "use_never": false
    },
    "regionType": "icon",
    "selfPoint": "BOTTOM",
    "semver": "1.0.5",
    "subRegions": [
      {
        "anchorXOffset": 0,
        "anchorYOffset": 0,
        "rotateText": "NONE",
        "text_anchorPoint": "CENTER",
        "text_automaticWidth": "Auto",
        "text_color": [
          1,
          1,
          1,
          1
        ],
        "text_fixedWidth": 64,
        "text_font": "Friz Quadrata TT",
        "text_fontSize": 12,
        "text_fontType": "OUTLINE",
        "text_justify": "CENTER",
        "text_selfPoint": "AUTO",
        "text_shadowColor": [
          0,
          0,
          0,
          1
        ],
        "text_shadowXOffset": 0,
        "text_shadowYOffset": 0,
        "text_text": "%c",
        "text_text_format_p_format": "timed",
        "text_text_format_p_time_dynamic": false,
        "text_text_format_p_time_precision": 1,
        "text_visible": true,
        "text_wordWrap": "WordWrap",
        "type": "subtext"
      }
    ],
    "tocversion": 90001,
    "triggers": {
      "1": {
        "trigger": {
          "check": "event",
          "custom": "\nfunction( allstates, event, ... )\n    \n    if (event == 'NAME_PLATE_UNIT_ADDED' or event == 'UNIT_AURA') and ... then\n        \n        local unit = ...\n        \n        if not string.startswith(unit, 'nameplate') then\n            return true\n        end\n        \n        local guid = UnitGUID( unit )\n        local _,_,_,_,_, npc_id,_ = strsplit(\"-\",guid)\n        \n        if aura_env.units[npc_id] then -- see if unit should be cursed\n            \n            if not aura_env.unitIsCursed(unit, aura_env.units[npc_id][1]) then\n                allstates[ unit ] = { -- show icon if not cursed\n                    show = true,\n                    changed = true,\n                    icon = aura_env.units[npc_id][2],\n                    nameplate_unit = ...\n                }\n            else\n                allstates[ unit ] = { -- hide icon if cursed\n                    show = false,\n                    changed = true\n                }\n            end\n        end\n        \n    elseif event == 'NAME_PLATE_UNIT_REMOVED' and ... then\n        \n        local unit = ...\n        \n        allstates[ unit ] = { -- hide icon if nameplate not visible anymore\n            show = false,\n            changed = true\n        }\n        \n    elseif event == 'UNIT_HEALTH' and ... then\n        \n        local unit = ...\n        \n        if UnitHealth(unit) == 0 then\n            allstates[ unit ] = { -- hide icon if dead/non-existent\n                show = false,\n                changed = true\n            }\n            \n        end\n    end\n    \n    return true\nend\n\n\n\n",
          "custom_hide": "timed",
          "custom_type": "stateupdate",
          "debuffType": "HELPFUL",
          "event": "Health",
          "events": "NAME_PLATE_UNIT_ADDED, NAME_PLATE_UNIT_REMOVED,UNIT_AURA,UNIT_HEALTH",
          "names": [],
          "spellIds": [],
          "subeventPrefix": "SPELL",
          "subeventSuffix": "_CAST_START",
          "type": "custom",
          "unit": "player"
        },
        "untrigger": []
      },
      "activeTriggerMode": -10,
      "customTriggerLogic": "function(trigger)\n    return trigger[2]\nend",
      "disjunctive": "any"
    },
    "uid": "kIIstiryx7H",
    "url": "https://wago.io/VbzgWM3Jj/6",
    "version": 6,
    "width": 24,
    "xOffset": 0,
    "yOffset": 0,
    "zoom": 0.3
  },
  "m": "d",
  "s": "3.0.6",
  "v": 1421,
  "wagoID": "VbzgWM3Jj"
}
]]--
