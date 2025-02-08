# Compass Tracker
# https://github.com/Stonley890/Compass-Tracker
#
# Licensed under the MIT License
# Copyright (c) 2023-2024 Stonley890
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Update the dimension scoreboard to reflect the current dimension
execute as @a store result score @s Dimension run data get entity @s Dimension

# Check if Hunter is in the same dimension as a runner and update compass
execute as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s if score @s Dimension = @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Dimension run function manhunt:loop/locate
execute as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s if score .endgame manhunt-options matches 1 if score .endgame-active manhunt-options matches 1 run function manhunt:loop/locate

# Report success or failure to player if enabled
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s if score @s Dimension = @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Dimension run title @s actionbar [{"text":"Compass Refreshed","color":"green"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] run title @s actionbar [{"text":"No player to track","color":"red"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] if entity @e[type=marker,tag=manhunt.end-portal,distance=0..] if score .endgame-active manhunt-options matches 1 run title @s actionbar [{"text":"Compass Refreshed","color":"yellow"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] unless entity @e[type=marker,tag=manhunt.end-portal,distance=0..] if score .endgame-active manhunt-options matches 1 run title @s actionbar [{"text":"No player to track","color":"red"}]


# Update the dimension scoreboard to reflect the current dimension
execute as @a store result score @s Dimension run data get entity @s Dimension
