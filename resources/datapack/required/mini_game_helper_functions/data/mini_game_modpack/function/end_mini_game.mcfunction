function mini_game_modpack:lobby/set_global_spawn_point_to_lobby
execute in mini_game_modpack:lobby run teleport @a 0.5 1.0 0.5 0 0
kill @e[type=item]
gamemode adventure @a
clear @a
effect clear @a
team leave @a

function mini_game_modpack:notification/notify_mini_game_ended
