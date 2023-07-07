local attStyle = 2; --attraction box style, max 4 (unless edited)
local attTitleStyle = 2; --attraction box title style, max 3 (unless edited)
local charStyle = 2; --character name style, max 2 (unless edited)
local levelNum = 1; --max 5 (unless edited)

function onCreate()
    --hide stuff during the title card
	setProperty('healthBar.y', (downscroll and -1000 or 1000))
	setProperty('healthBarBG.y', (downscroll and -1000 or 1000))
	setProperty('iconP1.y', (downscroll and -1000 or 1000))
	setProperty('iconP2.y', (downscroll and -1000 or 1000))
	setProperty('scoreTxt.y', (downscroll and -1000 or 1000))
	setProperty('timeBarBG.y', (downscroll and 1000 or -1000))
	setProperty('timeBar.y', (downscroll and 1000 or -1000))
	setProperty('timeTxt.y', (downscroll and 1000 or -1000))
	setProperty('introSoundsSuffix', '-muted')
	
	--sprite stuff
	makeLuaSprite('blockAsset1', 'chaotixScreen/block1', -165, 546);
	setObjectCamera('blockAsset1', 'other')
	scaleObject('blockAsset1', 3, 3);
	setProperty('blockAsset1.antialiasing', false)
	
	makeLuaSprite('blockAsset2', 'chaotixScreen/block2', 1140, 0);
	setObjectCamera('blockAsset2', 'other')
	scaleObject('blockAsset2', 3, 3);
	setProperty('blockAsset2.antialiasing', false)

	makeLuaSprite('blockAsset3', 'chaotixScreen/block3', 0, 329);
	setObjectCamera('blockAsset3', 'other')
	scaleObject('blockAsset3', 5.73, 3);
	setProperty('blockAsset3.antialiasing', false)

	makeLuaSprite('blockAsset4', 'chaotixScreen/block4', 0, 0);
	setObjectCamera('blockAsset4', 'other')
	scaleObject('blockAsset4', 3, 3);
	setProperty('blockAsset4.antialiasing', false)

	makeLuaSprite('blockAsset5', 'chaotixScreen/block5', 690, 168);
	setObjectCamera('blockAsset5', 'other')
	scaleObject('blockAsset5', 3, 3);
	setProperty('blockAsset5.antialiasing', false)

	makeLuaSprite('blockAsset6', 'chaotixScreen/block6', 1138, 384);
	setObjectCamera('blockAsset6', 'other')
	scaleObject('blockAsset6', 3, 3);
	setProperty('blockAsset6.antialiasing', false)
	
	makeLuaSprite('blockAsset7', 'chaotixScreen/block7', 690, 264);
	setObjectCamera('blockAsset7', 'other')
	scaleObject('blockAsset7', 3, 3);
	setProperty('blockAsset7.antialiasing', false)
	
	makeLuaSprite('blockAsset8', 'chaotixScreen/block8', 809, 264);
	setObjectCamera('blockAsset8', 'other')
	scaleObject('blockAsset8', 3, 3);
	setProperty('blockAsset8.antialiasing', false)

	makeLuaSprite('tempAttraction', 'chaotixScreen/attractionTemplate'..attStyle, -25, 384);
	setObjectCamera('tempAttraction', 'other')
	scaleObject('tempAttraction', 3, 3);
	setProperty('tempAttraction.antialiasing', false)

	makeLuaSprite('tempAttractionTITLE', 'chaotixScreen/attractionTemplateTitle'..attTitleStyle, 392, 405);
	setObjectCamera('tempAttractionTITLE', 'other')
	scaleObject('tempAttractionTITLE', 3, 3);
	setProperty('tempAttractionTITLE.antialiasing', false)

	makeLuaSprite('attLevel', 'chaotixScreen/attLevel'..levelNum, 930, 168);
	setObjectCamera('attLevel', 'other')
	scaleObject('attLevel', 3, 3);
	setProperty('attLevel.antialiasing', false)
	
	makeLuaSprite('attLevelTitleBox', 'chaotixScreen/attLevelTitle', 930, -2);
	setObjectCamera('attLevelTitleBox', 'other')
	scaleObject('attLevelTitleBox', 3, 3);
	setProperty('attLevelTitleBox.antialiasing', false)
	
	makeLuaSprite('barNames', 'chaotixScreen/characterNames'..charStyle, 930, 384);
	setObjectCamera('barNames', 'other')
	scaleObject('barNames', 3, 3);
	setProperty('barNames.antialiasing', false)
	
	makeLuaSprite('blackShadow', 'chaotixScreen/blackAsset', 0, 0);
	setObjectCamera('blackShadow', 'other')
	scaleObject('blackShadow', 3, 3);
	setProperty('blackShadow.antialiasing', false)
	
    makeLuaText('attLevelName', songName, 1280, -128, 425)
    setTextSize('attLevelName', 60)
	setProperty('attLevelName.color', getColorFromHex('08FC08'))
    setObjectCamera('attLevelName', 'other')
    setTextAlignment('attLevelName', 'center')
	setTextFont('attLevelName', 'sonic-1-hud-font.ttf')

	addLuaSprite('blockAsset1', false)
	addLuaSprite('blockAsset2', false)
	addLuaSprite('blockAsset7', false)
	addLuaSprite('blockAsset3', false)
	addLuaSprite('blockAsset4', false)
	addLuaSprite('blockAsset5', false)
	addLuaSprite('blockAsset6', false)
	addLuaSprite('blockAsset8', false)
	addLuaSprite('tempAttraction', false)
	addLuaSprite('tempAttractionTITLE', false)
	addLuaSprite('barNames', false)
	addLuaSprite('attLevel', false)
	addLuaSprite('attLevelTitleBox', false)
	addLuaSprite('blackShadow', false)
	addLuaText('attLevelName')

    --start the title card animation
    runTimer('start', 3.5)
	runTimer('countdown', 4)
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown then
		allowCountdown = true;
		--startCountdown()
		return Function_Stop;
	end
	return Function_Continue;
end

function onCountdownTick(counter)
    if counter == 1 then
        setProperty('countdownReady.visible', false);
    end
    if counter == 2 then
        setProperty('countdownSet.visible', false);
    end
    if counter == 3 then
        setProperty('countdownGo.visible', false);
    end
end

function onTimerCompleted(tag)
    --tween stuff
	if tag == 'start' then
		doTweenY('byebyeblock1', 'blockAsset1', 1000, 1, 'linear')
		doTweenY('byebyeblock2', 'blockAsset2', 1000, 2, 'linear')
		doTweenY('block2gowoosh', 'blockAsset2'..'.scale', -4, 0.23, 'linear')
		setProperty('blockAsset2.angle', -168)
		doTweenY('byebyeblock4', 'blockAsset4', -500, 1.2, 'linear')
		doTweenY('byebyeblock5', 'blockAsset5', 1000, 1, 'linear')
		doTweenY('block5gowoosh', 'blockAsset5'..'.scale', -4, 0.2, 'linear')
		doTweenX('byebyeblock6', 'blockAsset6', 2000, 2, 'linear')
		doTweenX('byebyeblock7', 'blockAsset7', 820, 0.35, 'linear')
		doTweenX('byebyeblock8', 'blockAsset8', 935, 0.35, 'linear')
		doTweenY('byebyeshadow', 'blackShadow', -500, 0.3, 'linear')
		doTweenAngle('shadowgospeen', 'blackShadow', -1000, 2, 'linear')
		runTimer('block7godown', 0.3)
		runTimer('somegobye', 0.1)
		runTimer('block3gobye', 0.25)
		runTimer('leveltitlegobye', 0.7)
		runTimer('block2changeangle', 0.6)
		runTimer('end', 2.5)
	end
	if tag == 'countdown' then
	    startCountdown()
	end
    if tag == 'block7godown' then
	    doTweenY('byebyeblock7', 'blockAsset7', 1000, 1.2, 'linear')
		doTweenAngle('block7gospeen', 'blockAsset7', -1000, 1.2, 'linear')
	end
    if tag == 'somegobye' then
	    doTweenY('byebyebarnames', 'barNames', 1000, 2, 'linear')
	end
    if tag == 'block3gobye' then
	    doTweenX('byebyeblock3', 'blockAsset3', -2000, 3, 'linear')
		doTweenY('block3gowoosh', 'blockAsset3'..'.scale', -4, 0.5, 'linear')
	end
    if tag == 'block2changeangle' then
		setProperty('blockAsset2.angle', 168)
	end
    if tag == 'leveltitlegobye' then
	    doTweenY('byebyeattleveltitlebox', 'attLevelTitleBox', -500, 1.2, 'linear')
	    doTweenX('byebyeattlevel', 'attLevel', 2000, 2, 'linear')
        doTweenX('byebyeblock8', 'blockAsset8', 2000, 2, 'linear')
	end
    if tag == 'end' then
	    doTweenX('byebyetemp', 'tempAttraction', -2000, 1.5, 'linear')
        doTweenX('byebyetemptitle', 'tempAttractionTITLE', -2002, 1.79, 'linear')
	    doTweenX('byebyeattlevelname', 'attLevelName', -2001, 1.4, 'linear')
        doTweenY('healthbarBGmoveY', 'healthBarBG', (downscroll and 83 or 644), 2, 'quintInOut')
	    doTweenY('healthbarmoveY', 'healthBar', (downscroll and 83 or 644), 2, 'quintInOut')
	    doTweenY('iconP1moveY', 'iconP1', (downscroll and 8 or 569), 2, 'quintInOut')
	    doTweenY('iconP2moveY', 'iconP2', (downscroll and 8 or 569), 2, 'quintInOut')
	    doTweenY('scoreTxtmoveY', 'scoreTxt', (downscroll and 115 or 688), 2, 'quintInOut')
	    doTweenY('timeBarmoveY', 'timeBar', (downscroll and 688 or 31), 2, 'quintInOut')
	    doTweenY('timeBarBGmoveY', 'timeBarBG', (downscroll and 684 or 27), 2, 'quintInOut')
	    doTweenY('timeTxtmoveY', 'timeTxt', (downscroll and 676 or 19), 2, 'quintInOut')
        runTimer('gone', 2.5)
		counter = 4
	end
    if tag == 'gone' then
	    --remove everything after finishing the animation
		cancelTween('block2gounwoosh')
		cancelTween('block2gowoosh')
		cancelTween('block3gowoosh')
		cancelTween('block3gounwoosh')
		cancelTween('block5gowoosh')
		cancelTween('block5gounwoosh')
	    removeLuaSprite('blockAsset1')
	    removeLuaSprite('blockAsset2')
	    removeLuaSprite('blockAsset7')
	    removeLuaSprite('blockAsset3')
	    removeLuaSprite('blockAsset4')
	    removeLuaSprite('blockAsset5')
	    removeLuaSprite('blockAsset6')
	    removeLuaSprite('blockAsset8')
	    removeLuaSprite('tempAttraction')
	    removeLuaSprite('tempAttractionTITLE')
	    removeLuaSprite('barNames')
	    removeLuaSprite('attLevel')
	    removeLuaSprite('attLevelTitleBox')
	    removeLuaSprite('blackShadow')
	    removeLuaText('attLevelName')
	end
end

function onTweenCompleted(tag)
    --block speen
    if tag == 'block2gowoosh' then
	    doTweenY('block2gounwoosh', 'blockAsset2'..'.scale', 4, 0.23, 'linear')
	end
	if tag == 'block2gounwoosh' then
	    doTweenY('block2gowoosh', 'blockAsset2'..'.scale', -4, 0.23, 'linear')
	end
	if tag == 'block3gowoosh' then
	    doTweenY('block3gounwoosh', 'blockAsset3'..'.scale', 4, 0.5, 'linear')
	end
	if tag == 'block5gowoosh' then
	    doTweenY('block5gounwoosh', 'blockAsset5'..'.scale', 4, 0.2, 'linear')
	end
	if tag == 'block5gounwoosh' then
	    doTweenY('block5gowoosh', 'blockAsset5'..'.scale', -4, 0.2, 'linear')
	end
end