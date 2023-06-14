local shakePower = 4
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown then
    		playSound('johngutter', 1);
		runTimer('countdown', 3.2)
		allowCountdown = true;
		--startCountdown()
		return Function_Stop;
	end
	return Function_Continue;
end
function onCreate()
	makeLuaSprite('black', 'black', 0, 0);-- make it anything you want (IT MUST BE 960x540) --
	setObjectCamera('black', 'other')
	scaleObject('black', 1.333, 1.333);
	addLuaSprite('black', false);
	makeLuaSprite('bg', 'johngutterbg', 0, 0);
	setObjectCamera('bg', 'other')
	setProperty('bg.antialiasing', false);
	scaleObject('bg', 1.333, 1.333);
	addLuaSprite('bg', false);
	makeLuaSprite('name', 'johnguttername', 100, 100);
	setObjectCamera('name', 'other')
	setProperty('name.antialiasing', false);
	scaleObject('name', 1.333, 1.333);
	addLuaSprite('name', false);
	runTimer('wait', 3);
	runTimer('wait2', 3.5);
end
function onUpdate()
  setProperty('name.x', getRandomFloat(0,shakePower)) -- the image shakes like pizza tower title cards or pause screen --
  setProperty('name.y', getRandomFloat(0,shakePower))
end
function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'bg', 0, 0.3, 'linear');
		doTweenAlpha('byebye2', 'name', 0, 0.3, 'linear');
	elseif tag == 'wait2' then
		doTweenAlpha('byebye3', 'black', 0, 0.3, 'linear');
	elseif tag == 'countdown' then
		startCountdown()
	end
end
function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('bg', true);
	elseif tag == 'byebye2' then
		removeLuaSprite('name', true);
	elseif tag == 'byebye3' then
		removeLuaSprite('black', true);
	end
end