local _, FlexBind = ...

FlexBind.schemes["default"] = {
    autoload = false,
    description = 'System default binding settings',
    bindings = {
        -- Movement
        { key = "BUTTON3", action = "MOVEANDSTEER" },
        { key = "W", action = "MOVEFORWARD" },
        { key = "S", action = "MOVEBACKWARD" },
        { key = "A", action = "TURNLEFT" },
        { key = "D", action = "TURNRIGHT" },
        { key = "Q", action = "STRAFELEFT" },
        { key = "E", action = "STRAFERIGHT" },
        { key = "SPACE", action = "JUMP" },
        { key = "X", action = "SITORSTAND" },
        { key = "Z", action = "TOGGLESHEATH" },
        { key = "NUMLOCK", action = "TOGGLEAUTORUN" },
        { key = "INSERT", action = "PITCHUP" },
        { key = "DELETE", action = "PITCHDOWN" },
        { key = "NUMPADDIVIDE", action = "TOGGLERUN" },

        -- Chat
        { key = "ENTER", action = "OPENCHAT" },
        { key = "/", action = "OPENCHATSLASH" },
        { key = "PAGEUP", action = "CHATPAGEUP" },
        { key = "PAGEDOWN", action = "CHATPAGEDOWN" },
        { key = "SHIFT-PAGEDOWN", action = "CHATBOTTOM" },
        { key = "R", action = "REPLY" },
        { key = "SHIFT-R", action = "REPLY2" },
        { key = "CTRL-PAGEUP", action = "COMBATLOGPAGEUP" },
        { key = "CTRL-PAGEDOWN", action = "COMBATLOGPAGEDOWN" },
        { key = "CTRL-SHIFT-PAGEDOWN", action = "COMBATLOGBOTTOM" },

        -- Action Bar
        { key = "1", action = "ACTIONBUTTON1" },
        { key = "2", action = "ACTIONBUTTON2" },
        { key = "3", action = "ACTIONBUTTON3" },
        { key = "4", action = "ACTIONBUTTON4" },
        { key = "5", action = "ACTIONBUTTON5" },
        { key = "6", action = "ACTIONBUTTON6" },
        { key = "7", action = "ACTIONBUTTON7" },
        { key = "8", action = "ACTIONBUTTON8" },
        { key = "9", action = "ACTIONBUTTON9" },
        { key = "0", action = "ACTIONBUTTON10" },
        { key = "-", action = "ACTIONBUTTON11" },
        { key = "=", action = "ACTIONBUTTON12" },
        { key = "CTRL-F1", action = "SHAPESHIFTBUTTON1" },
        { key = "CTRL-F2", action = "SHAPESHIFTBUTTON2" },
        { key = "CTRL-F3", action = "SHAPESHIFTBUTTON3" },
        { key = "CTRL-F4", action = "SHAPESHIFTBUTTON4" },
        { key = "CTRL-F5", action = "SHAPESHIFTBUTTON5" },
        { key = "CTRL-F6", action = "SHAPESHIFTBUTTON6" },
        { key = "CTRL-F7", action = "SHAPESHIFTBUTTON7" },
        { key = "CTRL-F8", action = "SHAPESHIFTBUTTON8" },
        { key = "CTRL-F9", action = "SHAPESHIFTBUTTON9" },
        { key = "CTRL-F10", action = "SHAPESHIFTBUTTON10" },
        { key = "CTRL-1", action = "BONUSACTIONBUTTON1" },
        { key = "CTRL-2", action = "BONUSACTIONBUTTON2" },
        { key = "CTRL-3", action = "BONUSACTIONBUTTON3" },
        { key = "CTRL-4", action = "BONUSACTIONBUTTON4" },
        { key = "CTRL-5", action = "BONUSACTIONBUTTON5" },
        { key = "CTRL-6", action = "BONUSACTIONBUTTON6" },
        { key = "CTRL-7", action = "BONUSACTIONBUTTON7" },
        { key = "CTRL-8", action = "BONUSACTIONBUTTON8" },
        { key = "CTRL-9", action = "BONUSACTIONBUTTON9" },
        { key = "CTRL-0", action = "BONUSACTIONBUTTON10" },
        { key = "SHIFT-1", action = "ACTIONPAGE1" },
        { key = "SHIFT-2", action = "ACTIONPAGE2" },
        { key = "SHIFT-3", action = "ACTIONPAGE3" },
        { key = "SHIFT-4", action = "ACTIONPAGE4" },
        { key = "SHIFT-5", action = "ACTIONPAGE5" },
        { key = "SHIFT-6", action = "ACTIONPAGE6" },
        { key = "SHIFT-UP", action = "PREVIOUSACTIONPAGE" },
        { key = "SHIFT-DOWN", action = "NEXTACTIONPAGE" },

        -- Targeting
        { key = "TAB", action = "TARGETNEARESTENEMY" },
        { key = "SHIFT-TAB", action = "TARGETPREVIOUSENEMY" },
        { key = "CTRL-TAB", action = "TARGETNEARESTFRIEND" },
        { key = "CTRL-SHIFT-TAB", action = "TARGETPREVIOUSFRIEND" },
        { key = "F1", action = "TARGETSELF" },
        { key = "F2", action = "TARGETPARTYMEMBER1" },
        { key = "F3", action = "TARGETPARTYMEMBER2" },
        { key = "F4", action = "TARGETPARTYMEMBER3" },
        { key = "F5", action = "TARGETPARTYMEMBER4" },
        { key = "SHIFT-F1", action = "TARGETPET" },
        { key = "SHIFT-F2", action = "TARGETPARTYPET1" },
        { key = "SHIFT-F3", action = "TARGETPARTYPET2" },
        { key = "SHIFT-F4", action = "TARGETPARTYPET3" },
        { key = "SHIFT-F5", action = "TARGETPARTYPET4" },
        { key = "G", action = "TARGETLASTHOSTILE" },
        { key = "V", action = "NAMEPLATES" },
        { key = "SHIFT-V", action = "FRIENDNAMEPLATES" },
        { key = "CTRL-V", action = "ALLNAMEPLATES" },
        { key = "F", action = "ASSISTTARGET" },
        { key = "SHIFT-T", action = "PETATTACK" },

        -- Interface
        { key = "ESCAPE", action = "TOGGLEGAMEMENU" },
        { key = "SHIFT-B", action = "TOGGLEBACKPACK" },
        { key = "F8", action = "TOGGLEBAG1" },
        { key = "F9", action = "TOGGLEBAG2" },
        { key = "F10", action = "TOGGLEBAG3" },
        { key = "F11", action = "TOGGLEBAG4" },
        { key = "B", action = "OPENALLBAGS" },
        { key = "C", action = "TOGGLECHARACTER0" },
        { key = "U", action = "TOGGLECHARACTER2" },
        { key = "P", action = "TOGGLESPELLBOOK" },
        { key = "K", action = "TOGGLEPROFESSIONBOOK" },
        { key = "SHIFT-I", action = "TOGGLEPETBOOK" },
        { key = "N", action = "TOGGLETALENTS" },
        { key = "Y", action = "TOGGLEACHIEVEMENT" },
        { key = "SHIFT-Y", action = "TOGGLESTATISTICS" },
        { key = "L", action = "TOGGLEQUESTLOG" },
        { key = "M", action = "TOGGLEWORLDMAP" },
        { key = "SHIFT-M", action = "TOGGLEBATTLEFIELDMINIMAP" },
        { key = "SHIFT-SPACE", action = "TOGGLEWORLDSTATESCORES" },
        { key = "J", action = "TOGGLEGUILDTAB" },
        { key = "O", action = "TOGGLESOCIAL" },
        { key = "SHIFT-O", action = "TOGGLECHANNELPULLOUT" },
        { key = "I", action = "TOGGLEGROUPFINDER" },
        { key = "CTRL-I", action = "TOGGLEDUNGEONSANDRAIDS" },
        { key = "H", action = "TOGGLECHARACTER4" },
        { key = "SHIFT-P", action = "TOGGLECOLLECTIONS" },
        { key = "SHIFT-J", action = "TOGGLEENCOUNTERJOURNAL" },

        -- Miscellaneous
        { key = "NUMPADPLUS", action = "MINIMAPZOOMIN" },
        { key = "NUMPADMINUS", action = "MINIMAPZOOMOUT" },
        { key = "CTRL-M", action = "TOGGLEMUSIC" },
        { key = "CTRL-S", action = "TOGGLESOUND" },
        { key = "CTRL-=", action = "MASTERVOLUMEUP" },
        { key = "CTRL--", action = "MASTERVOLUMEDOWN" },
        { key = "ALT-Z", action = "TOGGLEUI" },
        { key = "CTRL-R", action = "TOGGLEFPS" },
        { key = "PRINTSCREEN", action = "SCREENSHOT" },
        { key = "SHIFT-C", action = "ITEMCOMPARISONCYCLING" },

        -- Camera
        { key = "END", action = "NEXTVIEW" },
        { key = "HOME", action = "PREVVIEW" },
        { key = "MOUSEWHEELUP", action = "CAMERAZOOMIN" },
        { key = "MOUSEWHEELDOWN", action = "CAMERAZOOMOUT" },

        -- Vehicle
        { key = "NUMPAD5", action = "VEHICLEEXIT" },
        { key = "NUMPAD1", action = "VEHICLEPREVSEAT" },
        { key = "NUMPAD3", action = "VEHICLENEXTSEAT" },
        { key = "CTRL-MOUSEWHEELUP", action = "VEHICLEAIMINCREMENT" },
        { key = "CTRL-MOUSEWHEELDOWN", action = "VEHICLEAIMDECREMENT" },
    }
}
