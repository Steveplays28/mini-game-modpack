function mini_game_modpack:manhunt/initialize
function mini_game_modpack:end_mini_game

$execute as @a[sort=random,limit=$(hunter_count)] run team join Hunter
execute as @a[team=] run team join Runner

globalspawnpoint remove
execute in minecraft:overworld run teleport @a 0.0 320.0 0.0
gamemode survival @a
effect give @a resistance 30 5
effect give @a saturation 30 5

tellraw @a {"text":"Manhunt mini-game","color":"gold","bold":true}
tellraw @a {"text":""}

tellraw @a[team=Hunter] ["",{"text":"You are a ","bold":true},{"text":"Hunter","bold":true,"color":"dark_red"},{"text":".","bold":true},{"text":"\nEliminate all "},{"text":"Runners","color":"aqua"},{"text":" before they defeat the "},{"text":"Ender Dragon","color":"yellow"},{"text":".\nYou can respawn "},{"text":"infinitely","color":"green"},{"text":". You have a "},{"text":"Tracker Compass","color":"dark_red"},{"text":" in your inventory that tracks the nearest "},{"text":"Runner","color":"aqua"},{"text":"."}]
tellraw @a[team=Runner] ["",{"text":"You are a ","bold":true},{"text":"Runner","bold":true,"color":"aqua"},{"text":".","bold":true},{"text":"\nDefeat the "},{"text":"Ender Dragon","color":"yellow"},{"text":" and avoid being eliminated by a "},{"text":"Hunter","color":"dark_red","hoverEvent":{"action":"show_text","contents":["",{"text":"Hunters","color":"dark_red"},{"text":" have a "},{"text":"Tracker Compass","color":"dark_red"},{"text":" that tracks the nearest "},{"text":"Runner","color":"aqua"},{"text":" and can respawn "},{"text":"infinitely","color":"green"},{"text":"."}]}},{"text":".\nYou have "},{"text":"1","color":"green"},{"text":" life."}]
$tellraw @a ["",{"text":"---------------------","color":"gray"},{"text":"\n"},{"text":"There are ","bold":true},{"text":"$(hunter_count)","bold":true,"color":"dark_red"},{"text":" Hunters","bold":true,"color":"dark_red"},{"text":".","bold":true},{"text":"\n"},{"text":"---------------------","color":"gray"},{"text":"\n\nGood luck!"}]

function mini_game_modpack:notification/notify_mini_game_started

function manhunt:start
