# Binding Scheme

**Binding Scheme** represents a plan of your binding settings. All the scheme
files are placed in `/schemes` (recommended).

You can create a binding scheme file with any plaintext editor, and modify the FlexBind.toc
or `etc/schemes/manifest.xml` file (recommended) to let FlexBind load it.

An example of binding scheme file looks like:

```
local _, FlexBind = ...

-- Binding scheme example
FlexBind.schemes["example"] = {
    -- Whether load this binding scheme automatically
    -- optional, defaults to false
    autoload = false,

    -- Description of this binding setting
    -- optional, defaults to nil
    description = "descriptionText",

    -- Enable this binding set if the following conditions are matched.
    -- optional, defaults to nil
    -- Each condition is optional as well and treated as true if any item in parameters is matched.
    -- e.g. Instance = { "arena", "raid" } returns true if player in PvP arena OR a raid group.
    conditions = {
        -- Class names
        classes = { "className1", "className2" },

        -- Character names
        characters = { "characterName1", "characterName2" },

        -- Equipment set IDs
        equipmentSets = { 1, 2 },

        -- Instances
        -- @see http://wowprogramming.com/docs/api/IsInInstance
        instances = { "arena", "none" },

        -- Race names
        races = { "raceName1", "raceName2" },

        -- Realm names
        realms = { "realmName1", "realmName2" },

        -- Talent names
        talents = { "talentName1", "talentName2" },
    },

    -- Binding settings
    bindings = {
        -- Binding setting
        {
            -- Name of key which should be bound with the following action
            -- optional, defaults to nil
            key = "keyName",

            -- Binding action, can be a string, which means a COMMAND or a table means a button frame
            action = {
                -- Button frame, FlexBind will create a new action button if frame is missed
                -- optional, defaults to nil
                frame = ButtonFrame,

                -- Attributes of the button frame to be updated
                -- @see http://wowprogramming.com/docs/secure_template/SecureActionButtonTemplate
                attributes = {}
            },

            -- State driver of the action
            state = {
                attributes = {}
            },

            -- Description of this binding setting
            -- optional, defaults to nil
            description = "descriptionText",
        },

        -- Other binding settings
        -- ...
    }
}
```