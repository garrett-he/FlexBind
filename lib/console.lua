local _, FlexBind = ...

local console = CreateFrame("Frame", nil, UIParent)

local font = CreateFont("FlexBindConsoleFont")
font:SetFont(FlexBind.config["consoleFont"]["file"], FlexBind.config["consoleFont"]["size"])

local width, height = UIParent:GetWidth() * .5, UIParent:GetHeight() * .5

console:SetSize(width, height)
console:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", })
console:SetBackdropColor(0, 0, 0, .5)
console:SetMovable(true)
console:SetResizable(true)
console:SetClampedToScreen(true)
console:SetPoint("CENTER", UIParent, "CENTER")

local header = CreateFrame("Frame", nil, console)
header:SetSize(width, 22)
header:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", })
header:SetBackdropColor(0, 0, 0, .5)
header:SetPoint("TOP", console, "TOP")
console.header = header

local title = header:CreateFontString()
title:SetFontObject(font)
title:SetPoint("TOPLEFT", header, "TOPLEFT", 5, -5)
title:SetText("FlexBind Console")
header.title = title

local position = header:CreateFontString()
position:SetFontObject(font)
position:SetPoint("TOPRIGHT", header, "TOPRIGHT", -5, -5)
position:SetText("0%")
header.position = position

local scroller = CreateFrame("ScrollFrame", nil, console)
scroller:SetSize(width, height - 22 * 2)
scroller:SetPoint("TOP", header, "BOTTOM")

local output = CreateFrame("EditBox", nil, console)
output:SetFontObject(font)
output:SetSize(scroller:GetWidth(), scroller:GetHeight())
output:SetPoint("TOP", header, "BOTTOM")
output:SetTextInsets(5, 5, 5, 5)
output:SetMultiLine(true)
output:SetEnabled(false)
console.output = output

local input = CreateFrame("EditBox", nil, console)
input:SetFontObject(font)
input:SetSize(width, 22)
input:SetPoint("TOP", scroller, "BOTTOM")
input:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", })
input:SetBackdropColor(0, 0, 0, .7)
input:SetTextInsets(5, 5, 5, 5)
console.input = input

scroller:SetScrollChild(output)

--- Prints a line in console.
-- @param str string to print
--
function FlexBind_Console_PrintLn(str)
    console.output:Insert(str .. "\n")
end

--- Shows console frame.
--
function FlexBind_Console_Show()
    console:Show()
end

--- Hides console frame.
--
function FlexBind_Console_Hide()
    input:SetText("")
    console:Hide()
end

--- Returns whether console frame is shown.
-- @return whether console frame is shown.
function FlexBind_Console_IsShown()
    return console:IsShown()
end

output:SetScript("OnTextChanged", function (self)
    scroller:SetVerticalScroll(scroller:GetVerticalScrollRange())
end)

scroller:SetScript("OnMouseWheel", function(self, delta)
    local value = self:GetVerticalScroll() - (delta * 10)

    if value < 0 then
        self:SetVerticalScroll(0)
    elseif value > self:GetVerticalScrollRange() then
        self:SetVerticalScroll(self:GetVerticalScrollRange())
    else
        self:SetVerticalScroll(value)
    end

    local percent = self:GetVerticalScroll() / self:GetVerticalScrollRange() * 100

    if percent < 0 then
        percent = 0
    elseif percent > 100 then
        percent = 100
    end
    position:SetText(string.format("%d%%", percent))
end)

output:SetScript("OnMouseUp", function(self, button)
    if button == "RightButton" then
        self:SetEnabled(true)
        self:SetFocus(true)
        self:HighlightText(0, self:GetNumLetters())
    end
end)

output:SetScript("OnEscapePressed", function(self)
    self:ClearFocus()
    input:SetFocus(true)
end)

output:SetScript("OnEditFocusLost", function(self)
    self:HighlightText(0, 0)
    self:SetEnabled(false)
end)

input:SetScript("OnEscapePressed", function()
    FlexBind_Console_Hide()
end)

input:SetScript("OnEnterPressed", function(self)
    FlexBind_RunSlashCmd(self:GetText())
    self:SetText("")
end)

-- Hide console by default
FlexBind_Console_Hide()
