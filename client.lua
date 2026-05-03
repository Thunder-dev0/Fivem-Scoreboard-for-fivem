local isOpen = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        -- ID 56 is the standard Control ID for F9
        if IsControlJustPressed(0, 56) then
            if not isOpen then
                print("F9 Pressed - Requesting data...")
                TriggerServerEvent('scoreboard:getData')
            end
        end
    end
end)

-- 2. The Receiver
RegisterNetEvent('scoreboard:receiveData')
AddEventHandler('scoreboard:receiveData', function(playerList)
    if not isOpen then
        print("Data received - Opening UI")
        isOpen = true
        SetNuiFocus(true, true)
        
        SendNUIMessage({
            action = "open",
            players = playerList
        })
    end
end)

-- 3. The Closer (Triggered by the ESC key in your index.html)
RegisterNUICallback('close', function(data, cb)
    print("Closing UI and hiding cursor")
    isOpen = false
    SetNuiFocus(false, false)
    cb('ok')
end)

-- 4. Keep your test command just in case
RegisterCommand('testui', function()
    isOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        players = {{id = 99, name = "Debug_Test"}}
    })
end)
