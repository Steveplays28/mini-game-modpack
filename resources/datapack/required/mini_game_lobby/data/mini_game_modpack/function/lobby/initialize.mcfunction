# Set the default game mode
defaultgamemode adventure

# Set the world spawn to 0 1 0 in the lobby dimension
function mini_game_modpack:lobby/set_global_spawn_point_to_lobby

# Force load the lobby spawn chunk
execute in mini_game_modpack:lobby run forceload add 0 0 0 0

# Create the spawn point
execute in mini_game_modpack:lobby run setblock 0 0 0 minecraft:smooth_quartz
execute in mini_game_modpack:lobby run setblock 1 0 0 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock -1 0 0 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock 1 0 1 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock -1 0 1 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock 0 0 1 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock 0 0 -1 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock 1 0 1 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock 1 0 -1 minecraft:copper_bulb[lit=true]
execute in mini_game_modpack:lobby run setblock -1 0 -1 minecraft:copper_bulb[lit=true]

# Create the lobby/welcome signs, attached to pillars
execute in mini_game_modpack:lobby run setblock 0 0 7 minecraft:smooth_quartz
execute in mini_game_modpack:lobby run setblock 0 1 7 minecraft:quartz_pillar
execute in mini_game_modpack:lobby run setblock 0 2 7 minecraft:quartz_pillar
execute in mini_game_modpack:lobby run setblock 0 2 6 oak_wall_sign{id:sign,front_text:{messages:['{"text":"Lobby","bold":true}','""','"Steve\'s"','"mini-game server"'],has_glowing_text:true},is_waxed:true}

execute in mini_game_modpack:lobby run setblock -1 0 7 minecraft:smooth_quartz
execute in mini_game_modpack:lobby run setblock -1 1 7 minecraft:quartz_pillar
execute in mini_game_modpack:lobby run setblock -1 2 7 minecraft:quartz_pillar
execute in mini_game_modpack:lobby run setblock -1 2 6 oak_wall_sign{id:sign,front_text:{messages:['{"text":"Game modes","bold":true}','{"text":"Manhunt","color":"gold"}','""','""'],has_glowing_text:true},is_waxed:true}

execute in mini_game_modpack:lobby run setblock 1 0 7 minecraft:smooth_quartz
execute in mini_game_modpack:lobby run setblock 1 1 7 minecraft:quartz_pillar
execute in mini_game_modpack:lobby run setblock 1 2 7 minecraft:quartz_pillar
execute in mini_game_modpack:lobby run setblock 1 2 6 oak_wall_sign{id:sign,front_text:{messages:['{"text":"Welcome!","bold":true}','""','"Good luck"','"have fun"'],has_glowing_text:true},is_waxed:true}

# Remove the lobby spawn chunk's force load ticket
execute in mini_game_modpack:lobby run forceload remove 0 0 0 0
