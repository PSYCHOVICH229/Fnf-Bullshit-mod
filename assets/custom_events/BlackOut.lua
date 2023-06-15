function onEvent(name, value1, value2)
	if name == 'BlackOut' then
		if value1 == 'true' then
		makeLuaSprite('Black', 'Black', -1800, -800);
		scaleObject('Black', 100000, 1000000);
		addLuaSprite('Black', true)
		setProperty('Black.visible', true);
		elseif value1 == 'false' then
		setProperty('Black.visible', false)
			end
		end
	end