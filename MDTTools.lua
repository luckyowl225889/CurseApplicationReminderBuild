local MDT = MDT

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

function MDT.createMobDropdown(mobInfo, standardValues)
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
        content = content .. MDT.createIndentation(depth + 1) .. MDT.createTableString(value, depth + 1) .. ", -- [" .. index .. "]\n"
      else
        content = content .. MDT.createIndentation(depth + 1) .. "[\"" .. key .. "\"] = " .. MDT.createTableString(value, depth + 1) .. ",\n"
      end
      
      index = index + 1;
    end
    
    content = content .. MDT.createIndentation(depth) .. "}"
  else
    if type(table) == "boolean" then
      content = content .. (table and "true" or "false");
    elseif type(table) == "string" then
      content = content .. "\"" .. table .. "\"";
    else
      content = content .. table;
    end
  end
  
  return content;
end
