function onCreatePost()
   setProperty('debugKeysChart', null); -- prevents key from doing anything
end

function onUpdatePost()

if getPropertyFromClass('flixel.FlxG','keys.justPressed.SEVEN') then

  debugPrint("А не пойти ли тебе нахуй?.") -- type it :)
end
end