--[[
    PARA MAIS INFORMAÇÕES UTILIZEM O README
    DISCORD DA MINHA LOJA ==> https://discord.gg/EXhUK9mzXn
--]]


RegisterCommand("item", function(source, args, rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    local nsource = vRP.getUserSource(parseInt(args[2]))
    local nuser_id = vRP.getUserId(nsource)
    if vRP.hasPermission(user_id, "staff.permissao") then
        if not nsource then
            TriggerClientEvent("Notify",source,"importante","Esse jogador não esta <b>ONLINE</b>")
            return
        end
        if nuser_id then
            if args[1] == 'add' and args[2] and vRP.itemNameList(args[3]) ~= nil and parseInt(args[4]) then
                vRP.giveInventoryItem(nuser_id,args[3],parseInt(args[4]))
                if user_id then
                    TriggerClientEvent("Notify",source,'sucesso',"Você adicionou "..parseInt(args[4]).."x "..args[3].. " na mochila do ID "..nuser_id.."")
                end
            elseif args[1] == 'rem' and args[2] and vRP.itemNameList(args[3]) ~= nil and parseInt(args[4]) then
                vRP.tryGetInventoryItem(nuser_id,args[3],parseInt(args[4]))
                if user_id then
                    TriggerClientEvent("Notify",source,'sucesso',"Você removeu "..parseInt(args[4]).."x "..args[3].. " da mochila do ID "..nuser_id.."")
                end
            end
        end
    end
end)