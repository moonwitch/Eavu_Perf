------------------------------------------------------------------------
-- Namespaceing
------------------------------------------------------------------------
local addonName, ns = ...
local buttons = {}

------------------------------------------------------------------------
-- Main Catefgory Frame
-- Register in the Interface Addon Options GUI
-- Set the name for the Category for the Options Panel
------------------------------------------------------------------------
local Panel = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer)
Panel.name = addonName
Panel:Hide()

------------------------------------------------------------------------
-- Child Frame
------------------------------------------------------------------------
Panel.childpanel = CreateFrame( "Frame", nil, Panel)
Panel.childpanel.name = addonName..' Text'
Panel.childpanel:Hide()

-- Specify childness of this panel
Panel.childpanel.parent = Panel.name

-----------------------------
-- Populating the panel itself (main panel)
Panel:SetScript('OnShow', function(self)
  local Title = self:CreateFontString(nil, nil, 'GameFontNormalLarge')
  Title:SetPoint('TOPLEFT', 16, -16)
  Title:SetText(addonName)

  local Author = self:CreateFontString(nil, nil, 'GameFontNormal')
  Author:SetPoint('TOPLEFT', Title, 'BOTTOMLEFT', 0, -8)
  Author:SetPoint('RIGHT', -32, 0)
  Author:SetJustifyH('LEFT')
  Author:SetText(GetAddOnMetadata(addonName, "Author"))
  -- self.Author = Author

  local Description = self:CreateFontString(nil, nil, 'GameFontNormal')
  Description:SetPoint('TOPLEFT', Author, 'BOTTOMLEFT', 0, -8)
  Description:SetPoint('RIGHT', -32, 0)
  Description:SetJustifyH('LEFT')
  Description:SetText(GetAddOnMetadata(addonName, "Notes"))
  -- self.Description = Description

  self:SetScript('OnShow', nil)
end)

-----------------------------
-- Add the panel to the Interface Options
InterfaceOptions_AddCategory(Panel)

-----------------------------
-- Add the child to the Interface Options
InterfaceOptions_AddCategory(Panel.childpanel)

-----------------------------
-- Adding a SlashCommand to open the correct Panel
-- SLASH_${4:Addonname}1 = '/${4}'
-- SlashCmdList[${4}] = function()
--   InterfaceOptionsFrame_OpenToCategory(addonName)
-- end
