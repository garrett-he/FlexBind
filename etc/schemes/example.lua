local _, FlexBind = ...

-- Example for all characters
FlexBind.schemes["example-common"] = {
    autoload = false,
    description = "Binding settings for all characters",

    -- "conditions" is missing, therefore this scheme is enabled for all characters

    bindings = {
        -- Use "E", "D", "S", "F" to move your character
        { key = "E", action = "MOVEFORWARD" },
        { key = "D", action = "MOVEBACKWARD" },
        { key = "S", action = "STRAFELEFT" },
        { key = "F", action = "STRAFERIGHT" },

        -- Use "I" to open all bags
        { key = "I", action = "OPENALLBAGS", description = "Open all bags when press 'I'" },
    }
}

-- Example for traits, FlexBind binds "G" to spell "Quaking Palm" for all your panadren characters
FlexBind.schemes["example-trait-pandaren"] = {
    autoload = false,
    description = "Bindings for all panadren characters",
    conditions = {
        races = { "Pandaren" }
    },
    bindings = {
        {
            key = "G",
            action = { attributes = { type = "spell", spell = "Quaking Palm" } }
        }
    }
}

-- Example for priest common bindings
FlexBind.schemes["example-priest-common"] = {
    autoload = false,
    description = "Common bindings for priest",
    conditions = {
        classes = { "Priest" },
    },
    bindings = {
        {
            key = "1",
            action = { attributes = { type = "spell", spell = "Flash Heal" } },
            description = "Cast 'Flash Heal' to target"
        },
        {
            key = "SHIFT-1",
            action = { attributes = { type = "spell", spell = "Flash Heal", unit = "player" } },
            description = "Cast 'Flash Heal' to player regardless current target"
        },
        {
            key = "2",
            action = { attributes = { type = "macro", macrotext = "/say I'm FlexBind :)" } },
            description = "Run standard macro"
        },
        {
            action = {
                frame = PlayerFrame,
                attributes = {
                    -- Left button
                    type1 = "spell",
                    spell1 = "Flash Heal",

                    -- Right button
                    type2 = "spell",
                    spell2 = "Power Word: Shield",
                }
            },
            description = "Cast 'Flash Heal' to player when left click on player frame (avatar), cast 'Power Word: Shield' on right click"
        }
    }
}

-- Example for discipline and holy priest
FlexBind.schemes["example-priest-shadow"] = {
    autoload = false,
    description = "Bindings for discipline and holy priest",
    conditions = {
        classes = { "Priest" },
        talents = { "Discipline", "Holy" }
    },
    -- Binding settings
    bindings = {}
}

-- Example for rogue
FlexBind.schemes["example-rogue"] = {
    autoload = false,
    description = "Bindings for rogue",
    conditions = {
        classes = { "Rogue" },
        talents = { "Subtlety" }
    },
    bindings = {
        {
            key = "A",
            action = {
                attributes = {
                    type = "macro",
                    macrotext = "/cast [stealth] Ambush; [nostealth] Backstab"
                }
            },
            description = "Cast 'Ambush' in stealth, 'Backstab' not in stealth"
        }
    }
}