-- ref Naoya-san's blog
-- http://qiita.com/naoya@github/items/8001027083aeb70b309c14

local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()      
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

-- cursor control
remapKey({'cmd', 'shift'}, 'h', keyCode('home'))
remapKey({'cmd', 'shift'}, 'l', keyCode('end'))
remapKey({'cmd'}, 'h', keyCode('left'))
remapKey({'cmd'}, 'j', keyCode('down'))
remapKey({'cmd'}, 'k', keyCode('up'))
remapKey({'cmd'}, 'l', keyCode('right'))

-- delete/forwaddelete
remapKey({'cmd'}, ';', keyCode('forwarddelete'))
remapKey({'cmd'}, 'i', keyCode('delete'))

