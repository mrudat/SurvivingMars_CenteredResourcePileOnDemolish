local orig_print = print
if Mods.mrudat_TestingMods then
  print = orig_print
else
  print = empty_func
end

local CurrentModId = rawget(_G, 'CurrentModId') or rawget(_G, 'CurrentModId_X')
local CurrentModDef = rawget(_G, 'CurrentModDef') or rawget(_G, 'CurrentModDef_X')
if not CurrentModId then

  -- copied shamelessly from Expanded Cheat Menu
  local Mods, rawset = Mods, rawset
  for id, mod in pairs(Mods) do
    rawset(mod.env, "CurrentModId_X", id)
    rawset(mod.env, "CurrentModDef_X", mod)
  end

  CurrentModId = CurrentModId_X
  CurrentModDef = CurrentModDef_X
end

orig_print("loading", CurrentModId, "-", CurrentModDef.title)

--local orig_Building_PlaceReturnStockpile = Building.PlaceReturnStockpile

function Building:PlaceReturnStockpile(resource, amount)
  if amount <= 0 then return end

  -- TODO only for domes?

  PlaceResourceStockpile_Delayed(self:GetVisualPos(), resource, amount, self:GetAngle(), true)
end

orig_print("loaded", CurrentModId, "-", CurrentModDef.title)
