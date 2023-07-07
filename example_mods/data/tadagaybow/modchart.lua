function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)



--All Arrows moving Left and Right

--Player Notes

noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)

--Opponent Notes

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)



--Arrows Floating
    
--Player Notes
    
noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 20*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 20*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 20*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 20*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
    
--Opponent Notes
    
noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 + 20*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 + 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 + 20*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 + 20*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
end