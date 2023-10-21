local _, FlexBind = ...

FlexBind.slashCmds["help"] = {
    description = "Show help information",
    handler = function()
        local slashCmds = FlexBind.slashCmds

        FlexBind_PrintLn("FlexBind commands:")
        for name, cmd in pairs(slashCmds) do
            FlexBind_PrintLn(string.format("  %s: %s", name, cmd["description"]))
        end
    end
}

FlexBind.slashCmds["list-schemes"] = {
    description = "Lists all binding schemes",
    handler = function()
        local schemes = FlexBind.schemes
        local description

        FlexBind_PrintLn("FlexBind binding schemes:")
        for name, scheme in pairs(schemes) do
            if type(scheme["description"]) == "string" then
                description = scheme["description"]
            else
                description = "[No description]"
            end

            FlexBind_PrintLn(string.format("  %s[%s]: %s", name, scheme["__runtime"]["enabled"] and "enabled" or "disabled", description))
        end
    end
}

FlexBind.slashCmds["enable-scheme"] = {
    description = "Enable the given scheme by name",
    handler = function(name)
        FlexBind_EnableBindingScheme(FlexBind.schemes[name])
        FlexBind_LogInfo(string.format("Binding scheme '%s' enabled.", name))
    end
}

FlexBind.slashCmds["disable-scheme"] = {
    description = "Disable the given scheme by name",
    handler = function(name)
        FlexBind_DisableBindingScheme(FlexBind.schemes[name])
        FlexBind_LogInfo(string.format("Binding scheme '%s' disabled.", name))
    end
}

FlexBind.slashCmds["show-console"] = {
    description = "Show FlexBind console frame",
    handler = function ()
        FlexBind_Console_Show()
    end
}
