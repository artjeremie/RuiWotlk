-- Class colored scoreboard
local function ColorScoreBoard()
    local inInstance, instanceType = IsInInstance()
    if (instanceType ~= "pvp") then
        return
    end
    for i = 1, 22 do
        local ScoreBoard = _G["WorldStateScoreButton" .. i]

        if ScoreBoard and ScoreBoard.index then
            local _, _, _, _, _, _, _, _, _, filename = GetBattlefieldScore(ScoreBoard.index)
            local text = ScoreBoard.name.text:GetText()

            if text and filename then
                local color = GetClassColorObj(filename)
                ScoreBoard.name.text:SetText(color:WrapTextInColorCode(text))
            end
        end
    end
end

hooksecurefunc("WorldStateScoreFrame_Update", ColorScoreBoard)