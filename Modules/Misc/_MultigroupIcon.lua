-- Hide MultiGroupFrame icons showing as Party(+BG) leader
local mg = PlayerPlayTime:GetParent().MultiGroupFrame
hooksecurefunc(mg, "Show", mg.Hide)