--- === cmdMate ===
---
--- Use cmd + `h/l/j/k` as arrow keys, `y/u/i/o` as mouse wheel, `,/.` as left/right click.
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/cmdMate.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/cmdMate.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "cmdMate"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
    local function catcher(event)
        local flags = event:getFlags()
        local char = event:getCharacters()
        local shiftHeld = flags['shift']
        local cmdHeld = flags['cmd']

        local keyMap = {
            h = "left",
            l = "right",
            j = "down",
            k = "up"
        }

        if cmdHeld and keyMap[char] then
            return true, {hs.eventtap.event.newKeyEvent(shiftHeld and {"shift"} or {}, keyMap[char], true)}
        end
    end

    cmd_tapper = hs.eventtap.new({hs.eventtap.event.types.keyDown}, catcher):start()
end

return obj
