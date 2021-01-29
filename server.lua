ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)



-- Codigo para agregar item y vender
RegisterServerEvent('esx_venta:selltarjetablanca')
AddEventHandler('esx_venta:selltarjetablanca', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local blindfold = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "tarjetablanca" then
			blindfold = item.count
		end
	end
    
    if blindfold > 0 then
        xPlayer.removeInventoryItem('tarjetablanca', 1)
		--Cantidad de dinero por objeto
        xPlayer.addMoney(1000)
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'cajaroja', text = 'No tenes una targeta para vender!',})
    end
end)
