# Set the default game mode
defaultgamemode adventure

# Set the world spawn to 0 1 0 in the lobby dimension
globalspawnpoint set mini_game_modpack:lobby 0 1 0 0 exact 0

# Create the lobby spawn point
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
