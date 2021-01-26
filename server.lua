local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_firsttimeconnecting")
vRPCfirsttimeconnecting = Tunnel.getInterface("vRP_firsttimeconnecting","vRP_firsttimeconnecting")

vRPfirsttimeconnecting = {}
Tunnel.bindInterface("vRP_firsttimeconnecting",vRPfirsttimeconnecting)
Proxy.addInterface("vRP_firsttimeconnecting",vRPfirsttimeconnecting)

function checkName(theText)
	local foundSpace, valid = false, true
	local spaceBefore = false
	local current = ''
	for i = 1, #theText do
		local char = theText:sub( i, i )
		if char == ' ' then 
			if i == #theText or i == 1 or spaceBefore then 
				valid = false
				break
			end
			current = ''
			spaceBefore = true
		elseif ( char >= 'a' and char <= 'z' ) or ( char >= 'A' and char <= 'Z' ) then 
			current = current .. char
			spaceBefore = false
		else 
			valid = false
			break
		end
	end
	
	if (valid == true)  then
		return true
	else
		return false
	end
end

function vRPfirsttimeconnecting.checkdetailts(nume,nume2,varsta)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	nume = tostring(nume)
	nume2 = tostring(nume2)
	varsta = tonumber(varsta)
	if user_id ~=nil then
		if varsta >= 16 and varsta <= 90 then
			if (checkName(nume)) then
				if (checkName(nume2)) then
					vRP.generateRegistrationNumber({function(registration)
						vRP.generatePhoneNumber({function(phone)
							exports.ghmattimysql:execute("UPDATE vrp_user_identities SET firstname = @firstname, name = @name, age = @age, registration = @registration, phone = @phone WHERE user_id = @user_id",{["user_id"] = user_id,["firstname"] = nume,["name"] = nume2,["age"] = varsta,["registration"] = registration,["phone"] = phone}, function(data)end)
							exports.ghmattimysql:execute("UPDATE vrp_users SET firsttimenume = @firsttimenume WHERE id = @user_id",{["@firsttimenume"] = 1, ["@user_id"] = user_id}, function(data)end)
							vRPclient.notify(player,{"Ti-ai facut o identitate","success"})
							vRPCfirsttimeconnecting.alegeundetespawnezi(player,{})
						end})
					end})
				else
					vRPCfirsttimeconnecting.faidentitate(player,{})
					vRPclient.notify(player,{"Valoare invalida","error"})
				end
			else
				vRPCfirsttimeconnecting.faidentitate(player,{})
				vRPclient.notify(player,{"Valoare invalida","error"})
			end
		else
			vRPCfirsttimeconnecting.faidentitate(player,{})
			vRPclient.notify(player,{"Minim 16 ani maxim 90","error"})
		end
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,player,first_spawn)
	if first_spawn then
		exports.ghmattimysql:execute("SELECT * FROM vrp_users WHERE id = @user_id",{["user_id"] = user_id}, function(rows)
			if rows[1].firsttimenume == 0 then
				vRPCfirsttimeconnecting.faidentitate(player,{true})
			elseif rows[1].firsttimenume == 1 then
				local faction = vRP.getUserFaction({user_id})
				if faction == 'Politie' then
					vRPclient.teleport(player,{453.02841186523,-1013.9036865234,28.463966369629})
				elseif faction == 'Smurd' then
					vRPclient.teleport(player,{362.82293701172,-590.45196533203,28.675359725952})
				else
					vRPCfirsttimeconnecting.alegeundetespawnezi(player,{})
				end
			end
		end)
	end
end)