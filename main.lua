local _, FlexBind = ...

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, _, addon)
    if addon == "FlexBind" then
        for name, scheme in pairs(FlexBind.schemes) do
            -- Creates runtime context
            scheme["__runtime"] = {
                enabled = false
            }

            if not scheme["conditions"] then
                scheme["conditions"] = { __nil = true }
            end

            if scheme["autoload"] then
                FlexBind_LogDebug(string.format("Registering scheme '%s'.", name))

                for condName, _ in pairs(scheme["conditions"]) do
                    FlexBind_RegisterBindingScheme(condName, scheme)
                end
            end
        end
    end
end)
