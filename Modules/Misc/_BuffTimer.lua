-- Credits to: https://www.curseforge.com/wow/addons/rougeui
-- Remove gap in buff timers & color the format
local function TimeFormat(button, time)
    local duration = _G[button:GetName() .. "Duration"]
    local floor, fmod = math.floor, math.fmod
    local h, m, s, text

    if time <= 0 then
        text = ""
    elseif time < 3600 and time > 60 then
        h = floor(time / 3600)
        m = floor(fmod(time, 3600) / 60 + 1)
        s = fmod(time, 60)
        text = duration:SetFormattedText("|r%d|rm", m)
    elseif time < 60 then
        m = floor(time / 60)
        s = fmod(time, 60)
        text = m == 0 and duration:SetFormattedText("|r%d|rs", s)
    else
        h = floor(time / 3600 + 1)
        text = duration:SetFormattedText("|r%d|rh", h)
    end
    return text
end

hooksecurefunc("AuraButton_UpdateDuration", TimeFormat)