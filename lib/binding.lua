local nextButtonIndex = 1

--- Creates a action button frame for binding.
-- @return created action button frame
--
local function CreateButtonFrame()
    local frame = CreateFrame("Button", "FlexBindActionButton" .. nextButtonIndex, UIParent, "SecureActionButtonTemplate")
    nextButtonIndex = nextButtonIndex + 1
    return frame
end

--- Enables the given binding scheme.
-- @param scheme binding scheme
--
function FlexBind_EnableBindingScheme(scheme)
    local error = false

    -- Creates owner frame for override bindings
    local owner = CreateFrame("Frame")
    scheme["__runtime"]["bindingOwner"] = owner

    for _, binding in pairs(scheme["bindings"]) do
        local key, action = binding["key"], binding["action"]

        if type(action) == "string" then
            if key then
                SetOverrideBinding(owner, true, key, action)
                FlexBind_LogDebug(string.format("Bind command: '%s'->'%s'.", key, action))
            else
                FlexBind_LogError(string.format("Key name missed for command '%s' binding.", action))
                ClearOverrideBindings(owner)
                error = true
                break
            end
        elseif type(action) == "table" then
            if not action["frame"] then
                action["frame"] = CreateButtonFrame()
            end

            local frameName = action["frame"]:GetName()

            if key then
                SetOverrideBindingClick(owner, true, key, frameName)
                FlexBind_LogDebug(string.format("Bind action: '%s'->'%s'.", key, frameName))
            end

            for attrName, attrValue in pairs(action["attributes"]) do
                action["frame"]:SetAttribute(attrName, attrValue)
                FlexBind_LogDebug(string.format("Set button '%s' attribute: '%s'->'%s'.", frameName, attrName, attrValue))
            end
        else
            FlexBind_LogError(string.format("Unknown action type of '%s'.", type(action)))
            error = true
            break
        end
    end

    scheme["__runtime"]["enabled"] = not error
end

--- Disables the given binding scheme.
-- @param scheme binding scheme
--
function FlexBind_DisableBindingScheme(scheme)
    if scheme["__runtime"]["bindingOwner"] then
        ClearOverrideBindings(scheme["__runtime"]["bindingOwner"])
    end

    scheme["__runtime"]["enabled"] = false
end
