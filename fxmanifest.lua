fx_version 'cerulean'
game 'gta5'

author 'Thunder'
description 'Scoreboard with scaling'
version '1.0.0'

-- This tells FiveM WHERE the UI is
ui_page 'html/index.html'

-- This tells FiveM to actually LOAD these files into the game's memory
files {
    'html/index.html',
    'html/style.css'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}