--[[
    PARA MAIS INFORMAÇÕES UTILIZEM O README
    DISCORD DA MINHA LOJA ==> https://discord.gg/EXhUK9mzXn
--]]


RegisterCommand('godarea', function(source, args, rawCmd)
	local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "staff.permissao") then
		if args[1] == nil then
			return TriggerClientEvent("Notify",source,"negado","Você precisa digitar uma quantidade em <b>RAIOS</b>")
		end
        if args[1] then
			local area = parseInt(args[1])
			local playerss = vRPclient.getNearestPlayers(source,area)
			for k, v in pairs(playerss) do
				vRPclient.killGod(k)
				vRPclient.setHealth(k,400)
			end
			vRPclient.killGod(source)
			vRPclient.setHealth(source,400)
			return TriggerClientEvent("Notify",source,"sucesso","Você reviveu todos que estava no PERIMETRO de "..args[1].." <b>METROS</b>")
        end
    end
end)