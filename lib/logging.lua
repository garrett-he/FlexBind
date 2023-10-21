local _, FlexBind = ...

local levelNames = { "ERROR", "WARNING", "INFO", "DEBUG" }

--- Prints a line in chat frame or console.
-- @param str string to print
--
function FlexBind_PrintLn(str)
    if FlexBind_Console_IsShown() then
        FlexBind_Console_PrintLn(str)
    else
        print(str)
    end
end

--- Prints log messages in game.
-- @param level log level
-- @param msg log message
--
local function LogMessage(level, msg)
    if level > FlexBind.config["logLevel"] then
        return
    end

    local str = string.format('[%s] %s', levelNames[level], msg)

    if not FlexBind_Console_IsShown() then
        str = "[FlexBind]" .. msg
    end

    FlexBind_PrintLn(str)
end


--- Logs error messages.
-- @param msg error message
--
function FlexBind_LogError(msg)
    LogMessage(1, "|cffff0000" .. msg .. "|r")
end

--- Logs warning messages.
-- @param msg warning message
--
function FlexBind_LogWarning(msg)
    LogMessage(2, "|cffff9900" .. msg .. "|r")
end

--- Logs information messages.
-- @param msg information message
--
function FlexBind_LogInfo(msg)
    LogMessage(3, "|cffffffff" .. msg .. "|r")
end

--- Logs debug messages.
-- @param msg debug message
--
function FlexBind_LogDebug(msg)
    LogMessage(4, "|cff00ffff" .. msg .. "|r")
end
