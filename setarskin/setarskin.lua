--[[
    PARA MAIS INFORMAÇÕES UTILIZEM O README
    DISCORD DA MINHA LOJA ==> https://discord.gg/EXhUK9mzXn
--]]

if nameItem == "nomeitem" then
    activeItens[user_id] = 15
    vRPC.stopActived(source)
    TriggerClientEvent("Progress",source,15000)
    TriggerClientEvent("inventory:Close",source)
    TriggerClientEvent("inventory:blockButtons",source,true)

    repeat
        if activeItens[user_id] == 0 then
            activeItens[user_id] = nil
            vRPC.removeObjects(source,"one")
            TriggerClientEvent("inventory:blockButtons",source,false)
            if vRP.getInventoryItemAmount(user_id,totalName,1,true,slot) then
                local user_id = vRP.getUserId(source)
                local ped = GetPlayerPed(user_id)
                local nomedaskin = 's_m_m_highsec_01'  -- COLOCAR O NOME DA SKIN QUE QUER SETAR
                if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") or GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
                    vRPC.applySkin(user_id,GetHashKey(nomedaskin))
                    vRP.updateSelectSkin(user_id,GetHashKey(nomedaskin))
                elseif GetEntityModel(ped) == GetHashKey(nomedaskin) then
                    local sexo = vRP.prompt(source,"Digite seu sexo:","M | F","")
                    if sexo == 'm' then
                        vRPC.applySkin(user_id,GetHashKey('mp_m_freemode_01')) 
                        vRP.updateSelectSkin(user_id,GetHashKey('mp_m_freemode_01'))
                    elseif sexo == 'f' then
                        vRPC.applySkin(user_id,GetHashKey('mp_f_freemode_01')) 
                        vRP.updateSelectSkin(user_id,GetHashKey('mp_f_freemode_01'))
                    end
                end
            end
            
        end
        Citizen.Wait(100)
    until activeItens[user_id] == nil
return end