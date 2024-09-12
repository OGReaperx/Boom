fx_version 'cerulean'
game 'gta5'

description 'Make people go boom'
author 'OGReaper'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/server.lua',
    'server/discord_logger.lua',
}

dependencies {
    'ox_lib'
}

lua54 'yes'
