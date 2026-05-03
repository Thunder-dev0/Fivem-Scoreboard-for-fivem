RegisterNetEvent('scoreboard:getData') -- Register it first
AddEventHandler('scoreboard:getData', function() -- Then handle the logic
    local src = source -- This gets the ID of the person who hit F9
    local players = {}
    
    -- Get all players currently on the server
    local allPlayers = GetPlayers()

    for _, playerId in ipairs(allPlayers) do
        table.insert(players, {
            id = playerId,
            name = GetPlayerName(playerId)
        })
    end
    
    -- Send the list back ONLY to the person who asked for it
    TriggerClientEvent('scoreboard:receiveData', src, players)
end)