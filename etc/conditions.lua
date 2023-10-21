FlexBind_RegisterCondition("__nil", { "PLAYER_LOGIN" }, function()
    return true
end)

FlexBind_RegisterCondition("classes", { "PLAYER_LOGIN" }, function(params)
    return tContains(params, UnitClass("player"))
end)

FlexBind_RegisterCondition("characters", { "PLAYER_LOGIN" }, function(params)
    return tContains(params, UnitName("player"))
end)

FlexBind_RegisterCondition("equipmentSets", { "PLAYER_LOGIN", "EQUIPMENT_SWAP_FINISHED" }, function()
    for i = 1, select("#", params) do
        local _, _, _, isEquipped = GetEquipmentSetInfo(params[i])

        if isEquipped then
            return true
        end
    end

    return false
end)

FlexBind_RegisterCondition("instances", { "PLAYER_LOGIN", "PARTY_LEADER_CHANGED", "PLAYER_ENTERING_WORLD" }, function(params)
    local _, instanceType = IsInInstance()
    return tContains(params, instanceType)
end)

FlexBind_RegisterCondition("races", { "PLAYER_LOGIN" }, function(params)
    return tContains(params, UnitRace("player"))
end)

FlexBind_RegisterCondition("realms", { "PLAYER_LOGIN" }, function(params)
    return tContains(params, GetRealmName())
end)

FlexBind_RegisterCondition("talents", { "PLAYER_LOGIN", "ACTIVE_TALENT_GROUP_CHANGED" }, function(params)
    local _, name = GetSpecializationInfo(GetSpecialization())
    return tContains(params, name)
end)
