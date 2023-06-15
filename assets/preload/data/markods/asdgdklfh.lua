-- script by Betopia#5677 !!!!!!!!!!!! dont remove this line or i will find where you live

-- internal shit, dont touch
local didcoolthing = false
local position = -1
local gaming = false

-- ok now you cna touch
local length = 4

-- function so you can call it anywhere you want
function startTheFucking()
    setProperty('strumsBlocked', {true, true, true, true})
    generateShit()
    position = -1
end







































function onCreatePost()
    runHaxeCode([[
        grpNotes = [];
        randArray = [];
        daCoolTween = null;
    ]])
end
function onBeatHit()
    if not gaming and not mustHitSection and getRandomBool(10) then startTheFucking() end
end
function generateShit()
    addHaxeLibrary('StrumNote')
    addHaxeLibrary('Note')
    addHaxeLibrary('Std')
    runHaxeCode([=[
        randArray = [for (i in 0...]=]..tostring(length)..[=[) FlxG.random.int(0, 3)];

        for (i in grpNotes) { i.kill(); game.remove(i); i.destroy(); }

        grpNotes = [];

        var colArray = ['purple', 'blue', 'green', 'red'];

        for (i in 0...randArray.length) {
            cool = new StrumNote(0, 0, randArray[i], 0);
            if (!PlayState.isPixelStage) cool.animation.addByPrefix('color', colArray[cool.noteData] + '0', 24, true);
            cool.playAnim('static');
            cool.ID = i;
            cool.scrollFactor.set(1, 1);
            cool.x = game.boyfriend.x + (game.boyfriend.width / 2) - ((Note.swagWidth * randArray.length) / 2);
            cool.x += Note.swagWidth * i;
            cool.y = game.boyfriend.y - Note.swagWidth - 5;
            game.add(cool);
            grpNotes[i] = cool;
        }

        var tag = 'ajgnaidngkjsfohijaoihjpdafgnadjoiashmfmhiobad';

        daCoolTween = FlxTween.num(6.1, 0, 2, { ease: FlxEase.expoOut, onComplete: function(_) {
            if(game.modchartTweens.exists(tag)) {
                game.callOnLuas('onTweenCompleted', [tag]);
                game.modchartTweens.remove(tag);
            } } }, function(num) {
                for (j in grpNotes) {
                    j.x = game.boyfriend.x + (game.boyfriend.width / 2) - ((Note.swagWidth * randArray.length) / 2);
                    j.x += Note.swagWidth * j.ID;
                    j.y = game.boyfriend.y - Note.swagWidth - 5;
                    j.x += FlxG.random.float(-num, num);
                    j.y += FlxG.random.float(-num, num);
                    j.angle = FlxG.random.float(-num / 2, num / 2);
                }
            });

        if(game.modchartTweens.exists(tag)) {
            game.modchartTweens.get(tag).cancel();
            game.modchartTweens.get(tag).destroy();
            game.modchartTweens.remove(tag);
        }
        game.modchartTweens.set(tag, daCoolTween);
        for (j in 0...grpNotes.length) {
            var strum = grpNotes[j];
            strum.playAnim('confirm', true);
            strum.animation.finishCallback = function() {
                if (PlayState.isPixelStage) strum.playAnim(colArray[strum.noteData]);
                else strum.playAnim('color', true);
            }
        }
        game.playerStrums.forEach(function(str) { str.alpha = 0.35; });
        game.moveCamera(false);
        game.isCameraOnForcedPos = true;
        game.setOnLuas('randArray', randArray);
    ]=])
    playSound('ANGRY')
    didcoolthing = false
    gaming = true
end
function onKeyPress(k)
    if randArray ~= nil and #randArray > 0 and gaming then
        if k == randArray[1] then
            position = position + 1
            runHaxeCode([[
                var strum = grpNotes[]]..tostring(position)..[[];
                strum.playAnim('pressed', true);
                strum.resetAnim = 0.15;
            ]])
            table.remove(randArray, 1)
            if #randArray < 1 and not didcoolthing then
                runHaxeCode([[
                    if (daCoolTween != null) daCoolTween.cancel();
                    for (j in grpNotes) {
                        j.acceleration.y = FlxG.random.float(300, 600);
                        j.velocity.y = FlxG.random.float(-200, -300);
                        j.velocity.x = FlxG.random.float(-10, 10);
                        j.angularVelocity = FlxG.random.float(-15, 15);
                        FlxTween.tween(j, { alpha: 0 }, 0.2 / game.playbackRate, {
                            onComplete: function(tween:FlxTween)
                            {
                                j.kill();
                                game.remove(j);
                            },
                            startDelay: Conductor.crochet * 0.002 / game.playbackRate
                        });
                    }
                    game.playerStrums.forEach(function(str) { str.alpha = 1; });
                    game.isCameraOnForcedPos = false;
                    game.moveCameraSection();
                ]])
                setProperty('strumsBlocked', {false, false, false, false})
                playSound('ANGRY_TEXT_BOX')
                didcoolthing = true
                gaming = false
            end
        else
            startTheFucking()
        end
    end
end
function onUpdatePost()
    if botPlay and getRandomBool(4) then onKeyPress(randArray[1]) end
end