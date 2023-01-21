--[[
    PARA MAIS INFORMAÇÕES UTILIZEM O README
    DISCORD DA MINHA LOJA ==> https://discord.gg/EXhUK9mzXn
--]]

vRP._prepare("verificar/verificarvipcolum", "SELECT * FROM vrp_users WHERE id = @id AND vip = 1")
vRP._prepare("verificar/setarvip", "UPDATE vrp_users SET vip = 1 WHERE id = @id")
vRP._prepare("setarcarrovip/add_vehicle_vip","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")


RegisterCommand("vipgratis",function(source,rawCommand,args)
    local id = vRP.getUserId(source)
    local permissao = 'vipbronze' -- SET DO GROUP DE VIP
    local valordinheiro = 150000 -- QUANTIDADE DO DINHEIRO QUE VAI DAR
    local spawnvehicle = 'neon' -- SPAWN DO VEÍCULO QUE VAI DAR
    local verificarvip = vRP.execute("verificar/verificarvipcolum",{ id = id })
    if id then
        if #verificarvip > 0 then
            TriggerClientEvent("Notify",source,"Negado",'Você já possui')
        else
            local setarvip = vRP.execute("verificar/setarvip",{ id = id })
            vRP.execute("setarcarrovip/add_vehicle_vip",{ user_id = id, vehicle = spawnvehicle, ipva = parseInt(os.time())  })
            vRP.addUserGroup(id,permissao)
            vRP.giveBankMoney(id,valordinheiro)
            TriggerClientEvent("Notify",source,"Sucesso",'Você resgatou Vip Gratis')

        end
    end
end)