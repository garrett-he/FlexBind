local _, FlexBind = ...

local registeredConditions = {}
local conditionEventFrame = CreateFrame("Frame")
conditionEventFrame:SetScript("OnEvent", function(self, event, ...)
    if self[event] == nil then
        return
    end

    for _, condition in pairs(self[event]) do
        for _, scheme in pairs(condition["schemes"]) do
            local result = true
            for key, params in pairs(scheme["conditions"]) do
                result = result and registeredConditions[key]["validator"](params)
            end

            if result then
                FlexBind_EnableBindingScheme(scheme)
            else
                FlexBind_DisableBindingScheme(scheme)
            end
        end
    end
end)
 
--- Registers a binding scheme condition.
-- @param name name of condition
-- @param events trigger events
-- @param validator validator function of condition
--
function FlexBind_RegisterCondition(name, events, validator)
    if registeredConditions[name] then
        FlexBind_LogError(string.format("Condition '%s' is already registered.", name))
        return
    end

    local condition = {
        validator = validator,
        schemes = {}
    }

    for _, event in pairs(events) do
        if not conditionEventFrame[event] then
            conditionEventFrame:RegisterEvent(event)
            conditionEventFrame[event] = {}
        end

        table.insert(conditionEventFrame[event], condition)
    end

    registeredConditions[name] = condition
end

--- Registers a binding scheme to condition.
-- @param condName condition name
-- @param scheme binding scheme
--
function FlexBind_RegisterBindingScheme(condName, scheme)
    if not registeredConditions[condName] then
        FlexBind_LogError(string.format("Condition '%s' is not registered yet.", condName))
    end

    if not tContains(registeredConditions[condName]["schemes"], scheme) then
        table.insert(registeredConditions[condName]["schemes"], scheme)
    end
end
