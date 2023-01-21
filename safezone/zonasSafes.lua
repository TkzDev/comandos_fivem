--[[
    PARA MAIS INFORMAÇÕES UTILIZEM O README
    DISCORD DA MINHA LOJA ==> https://discord.gg/EXhUK9mzXn
--]]

local Zones = {
    -- [CONCESSIONARIA] --
    [1] = { -38.72, -1094.21, 26.43 },
}


Citizen.CreateThread(function()
    while true do
        local tkz = 1000
        local ped = PlayerPedId()
        for k,v in pairs(Zones) do
            local coords = GetEntityCoords(ped)
            local distance = #(coords - vector3(v[1],v[2],v[3]))
            tkz = 1
            if distance < 40 and GetCurrentPedWeapon(ped) ~= 'weapon_unarmed' then
                SetPedConfigFlag(ped,186,true)
                GiveWeaponToPed(ped,'weapon_unarmed',0,false,true)
                DisableControlAction(0,37,true)
            end
        end
        Citizen.Wait(tkz)
    end
end)