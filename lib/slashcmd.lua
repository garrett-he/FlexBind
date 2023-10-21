local _, FlexBind = ...

FlexBind.slashCmds = {}

local slashCmds = FlexBind.slashCmds

_G["SLASH_FLEXBIND1"] = "/flexbind"

--- Runs the given slash command.
-- @param str slash command and parameters
--
function FlexBind_RunSlashCmd(str)
    local cmd, params = str:match("([^ ]+) *(.*)")

    if not cmd then
        cmd = "help"
    end

    if not slashCmds[cmd] then
        FlexBind_LogError(string.format("Command '%s' not registered yet.", string.lower(cmd)))
        return
    end

    slashCmds[cmd]["handler"](params)
end

SlashCmdList["FLEXBIND"] = FlexBind_RunSlashCmd
