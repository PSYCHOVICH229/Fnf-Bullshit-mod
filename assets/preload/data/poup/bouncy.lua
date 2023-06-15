-- Script by GatitoDev

scroll = 0

function onUpdate()

    if getPropertyFromClass('ClientPrefs', 'downScroll', false) then
        scroll = 0
    end

    if getPropertyFromClass('ClientPrefs', 'downScroll', true) then
        scroll = 1
    end
    
end

function onUpdatePost()

    if scroll == 0 then

        -- Size
        setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1 + 1)
        setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1 + 1)
        
        --Position
        setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
        setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))

    end

    if scroll == 1 then

        -- Size
        setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -1 + 1)
        setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -1 + 1)

        --Position
        setProperty("iconP1.y", -65 + (getProperty("iconP1.scale.y") * 75))
        setProperty("iconP2.y", -65 + (getProperty("iconP2.scale.y") * 75))

    end
    
end