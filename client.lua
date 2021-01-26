vRPfirsttimeconnectingC = {}
Tunnel.bindInterface("vRP_firsttimeconnecting",vRPfirsttimeconnectingC)
Proxy.addInterface("vRP_firsttimeconnecting",vRPfirsttimeconnectingC)
vRP = Proxy.getInterface("vRP")
vRPSfirsttimeconnecting = Tunnel.getInterface("vRP_firsttimeconnecting","vRP_firsttimeconnecting")
local fontId
Citizen.CreateThread(function()
	RegisterFontFile('lemonmilk')
	fontId = RegisterFontId('Lemon Milk')
end)
local identitate = true
local alege = true
function KeyboardInput(TextEntry, ExampleText, MaxStringLenght, NoSpaces)
	AddTextEntry(GetCurrentResourceName() .. '_KeyboardHead', TextEntry)
	DisplayOnscreenKeyboard(1, GetCurrentResourceName() .. '_KeyboardHead', '', ExampleText, '', '', '', MaxStringLenght)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		if NoSpaces == true then
			ShowNotification('~y~No Spaces!')
		end
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return result
	else
		Citizen.Wait(500)
		return nil
	end
end

function isCursorInPosition(x,y,width,height)
	local sx, sy = GetActiveScreenResolution()
  local cx, cy = GetNuiCursorPosition ( )
  local cx, cy = (cx / sx), (cy / sy)
  
	local width = width / 2
	local height = height / 2
  
  if (cx >= (x - width) and cx <= (x + width)) and (cy >= (y - height) and cy <= (y + height)) then
	  return true
  else
	  return false
  end
end

function drawtxt(text,font,centre,x,y,scale,r,g,b,a)
    y = y - 0.010
    scale = scale/2
    y = y + 0.002
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(fontId)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function vRPfirsttimeconnectingC.stopcamera()
    local player = GetPlayerPed(-1)
    local coords    = GetEntityCoords(player)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    DoScreenFadeIn(800) --- Fade In Showing the Screen
    FreezeEntityPosition(player, false) -- unfreeze
    DestroyCam(createdCamera, 0)
    DestroyCam(createdCamera, 0)
    RenderScriptCams(0, 0, 1, 1, 1)
    createdCamera = 0
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    SetEntityVisible(PlayerPedId(), true, false)
end

function vRPfirsttimeconnectingC.startcamera(x,y,z)
    local pos = GetPlayerPed(-1)
    local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",27.933570861816,-773.64837646484,47.977676391602 + 400.0, 270.00, 0.00, 0.00, 80.00, 0, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false, false)
end

function vRPfirsttimeconnectingC.alegeundetespawnezi()
    vRPfirsttimeconnectingC.startcamera({-1348.3150634766,726.01037597656,186.24348449707})
    while true do
        Citizen.Wait(1)
        if alege then
            ShowCursorThisFrame()
            DisableControlAction(0,51,true)
            DisableControlAction(0,24,true)
            DisableControlAction(0,47,true)
            DisableControlAction(0,58,true)
            DisableControlAction(0,263,true)
            DisableControlAction(0,264,true)
            DisableControlAction(0,257,true)
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
            DisableControlAction(0,143,true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 27, true)
            DisableControlAction(0, 172, true)
            DisableControlAction(0, 173, true)
            DisableControlAction(0, 174, true)
            DisableControlAction(0, 175, true)
            DisableControlAction(0, 176, true)
            DisableControlAction(0, 177, true)
            DrawRect(0.5,0.5,0.75,0.60, 25,25,25,225) --chenar

            DrawRect(0.5,0.5,0.09,0.06, 255,255,255,120) 

            DrawRect(0.4,0.5,0.09,0.06, 255,255,255,120) 

            DrawRect(0.6,0.5,0.09,0.06, 255,255,255,120) 

            drawtxt("Alege unde vrei sa te spawnezi",1,1,0.5,0.35,2,255, 255, 255,255)

            drawtxt("DUST ROMANIA",1,1,0.5,0.25,2,244, 238, 255,255)
            DrawSprite("dustromania", "dustromania", 0.65, 0.28, 0.1, 0.10, 0.0, 255, 255, 255, 255)

            drawtxt("Los Santos",1,1,0.4,0.495,0.7,255,255,255,255)

            drawtxt("Sandy",1,1,0.5,0.495,0.7,255,255,255,255)
            
            drawtxt("Paleto",1,1,0.6,0.495,0.7,255,255,255,255)

            if isCursorInPosition(0.4,0.5, 0.1, 0.050) then
                SetCursorSprite(5)
                if(IsDisabledControlJustPressed(0, 24))then
                    alege = false
                    vRP.teleport({-51.462200164795,-789.38885498047,44.22509765625})
                    vRPfirsttimeconnectingC.stopcamera()
                end
            elseif isCursorInPosition(0.5,0.5, 0.1, 0.050) then
                SetCursorSprite(5)
                if(IsDisabledControlJustPressed(0, 24))then
                    alege = false
                    vRP.teleport({1608.0423583984,3594.1528320313,35.14624786377})
                    vRPfirsttimeconnectingC.stopcamera()
                end
            elseif isCursorInPosition(0.6,0.5, 0.1, 0.050) then
                SetCursorSprite(5)
                if(IsDisabledControlJustPressed(0, 24))then
                    alege = false
                    vRP.teleport({-143.09497070313,6307.0493164063,31.562030792236})
                    vRPfirsttimeconnectingC.stopcamera()
                end
            else
                SetCursorSprite(1)
            end
        else
            alege = false
        end
    end
end

function vRPfirsttimeconnectingC.faidentitate()
    vRPfirsttimeconnectingC.startcamera({-1348.3150634766,726.01037597656,186.24348449707})
    rgb = {a=11, b=228, c=22}
    while true do
        Citizen.Wait(1)
        if identitate then
            ShowCursorThisFrame()
            DisableControlAction(0,51,true)
            DisableControlAction(0,24,true)
            DisableControlAction(0,47,true)
            DisableControlAction(0,58,true)
            DisableControlAction(0,263,true)
            DisableControlAction(0,264,true)
            DisableControlAction(0,257,true)
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
            DisableControlAction(0,143,true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 27, true)
            DisableControlAction(0, 172, true)
            DisableControlAction(0, 173, true)
            DisableControlAction(0, 174, true)
            DisableControlAction(0, 175, true)
            DisableControlAction(0, 176, true)
            DisableControlAction(0, 177, true)
            DrawRect(0.5,0.5,0.75,0.60, 25,25,25,225) --chenar

            DrawRect(0.5,0.5,0.09,0.06, 255,255,255,120) 

            drawtxt("DUST ROMANIA",1,1,0.5,0.25,2,244, 238, 255,255)
            DrawSprite("dustromania", "dustromania", 0.65, 0.28, 0.1, 0.10, 0.0, 255, 255, 255, 255)

            drawtxt("Identitate noua",1,1,0.5,0.35,2,255, 255, 255,255)
            drawtxt("INCEPE",1,1,0.5,0.495,0.7,rgb.a,rgb.b,rgb.c,255)

            if isCursorInPosition(0.5,0.50, 0.1, 0.050) then
                SetCursorSprite(5)
                rgb = {a=255, b=0, c=0}
                if(IsDisabledControlJustPressed(0, 24))then
                    identitate = false
                    local nume = KeyboardInput("Nume: ", "", 15, false)
                    if (nume ~= nil) or (nume ~= "") then
                        local nume2 = KeyboardInput("Prenume: ", "", 15, false)
                        if (nume2 ~= nil) or (nume2 ~= "") then
                            local varsta = KeyboardInput("Varsta: ", "", 15, false)
                            if(tonumber(varsta) and (tonumber(varsta) > 0))then
                                print(nume)
                                print(nume2)
                                print(varsta)
                                vRPSfirsttimeconnecting.checkdetailts({nume,nume2,varsta})
                                identitate = false
                            end
                        end
                    end
                end
            else
                SetCursorSprite(1)
                rgb = {a=11, b=228, c=22}
            end
        else
            identitate = false
        end
    end
end