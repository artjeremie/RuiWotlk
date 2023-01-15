local g = CreateFrame("Frame")
g:RegisterEvent("MERCHANT_SHOW")
g:SetScript("OnEvent", function()
    totalPrice = 0
    for bags = 0,4 do
        for slots = 1, GetContainerNumSlots(bags) do
            CurrentItemLink = GetContainerItemLink(bags, slots)
            if CurrentItemLink then
                _, _, itemRarity, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(CurrentItemLink)
                _, itemCount = GetContainerItemInfo(bags, slots)

                if itemRarity == 0 and itemSellPrice ~= 0 then
                    totalPrice = totalPrice + (itemSellPrice * itemCount)
                    UseContainerItem(bags, slots)
                    PickupMerchantItem()
                end
            end
        end
    end

    if totalPrice ~= 0 then
        print('|cffFFC125Sold all items for:|r ' .. GetCoinTextureString(totalPrice))
    end
end)