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

# Set dimension
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] if data entity @s {Dimension: "minecraft:overworld"} if entity @a[team=Runner,gamemode=!spectator,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", count: 1, components: {"minecraft:custom_name": '{"text":"Tracker Compass","color": "dark_red","italic": false}', "minecraft:lodestone_tracker": {target: {pos: [0,0,0], dimension: "minecraft:overworld"}, tracked: 0b}}}
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] if data entity @s {Dimension: "minecraft:the_end"} if entity @a[team=Runner,gamemode=!spectator,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", count: 1, components: {"minecraft:custom_name": '{"text":"Tracker Compass","color": "dark_red","italic": false}', "minecraft:lodestone_tracker": {target: {pos: [0,0,0], dimension: "minecraft:the_end"}, tracked: 0b}}}
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] if data entity @s {Dimension: "minecraft:the_nether"} if entity @a[team=Runner,gamemode=!spectator,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", count: 1, components: {"minecraft:custom_name": '{"text":"Tracker Compass","color": "dark_red","italic": false}', "minecraft:lodestone_tracker": {target: {pos: [0,0,0], dimension: "minecraft:the_nether"}, tracked: 0b}}}

# Set position by player
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s if entity @a[team=Runner,gamemode=!spectator,distance=0..] store result storage manhunt:test Item.components."minecraft:lodestone_tracker".target.pos[0] int 1 run data get entity @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Pos[0]
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s if entity @a[team=Runner,gamemode=!spectator,distance=0..] store result storage manhunt:test Item.components."minecraft:lodestone_tracker".target.pos[1] int 1 run data get entity @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Pos[1]
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s if entity @a[team=Runner,gamemode=!spectator,distance=0..] store result storage manhunt:test Item.components."minecraft:lodestone_tracker".target.pos[2] int 1 run data get entity @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Pos[2]

# If endgame and no players in dimension, attempt to set by portal location
execute if score .endgame manhunt-options matches 1 if score .endgame-active manhunt-options matches 1 as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] if entity @e[type=marker,tag=manhunt.end-portal,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", count: 1, components: {"minecraft:custom_name": '{"text":"Tracker Compass","color": "dark_red","italic": false}', "minecraft:lodestone_tracker": {target: {pos: [0,0,0], dimension: "minecraft:overworld"}, tracked: 0b}}}

# ......if endgame option is enabled................if endgame is active...............................as hunters who are holding compass..........................................................................................................................unless there is a runner in this dimension.....................if end portal marker exists
execute if score .endgame manhunt-options matches 1 if score .endgame-active manhunt-options matches 1 as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] if entity @e[type=marker,tag=manhunt.end-portal,distance=0..] store result storage manhunt:test Item.components."minecraft:lodestone_tracker".target.pos[0] int 1 run data get entity @e[type=marker,tag=manhunt.end-portal,limit=1,sort=nearest] Pos[0]
execute if score .endgame manhunt-options matches 1 if score .endgame-active manhunt-options matches 1 as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] if entity @e[type=marker,tag=manhunt.end-portal,distance=0..] store result storage manhunt:test Item.components."minecraft:lodestone_tracker".target.pos[1] int 1 run data get entity @e[type=marker,tag=manhunt.end-portal,limit=1,sort=nearest] Pos[1]
execute if score .endgame manhunt-options matches 1 if score .endgame-active manhunt-options matches 1 as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] if entity @e[type=marker,tag=manhunt.end-portal,distance=0..] store result storage manhunt:test Item.components."minecraft:lodestone_tracker".target.pos[2] int 1 run data get entity @e[type=marker,tag=manhunt.end-portal,limit=1,sort=nearest] Pos[2]

execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] in minecraft:overworld run data modify block 0 0 0 Items append from storage manhunt:test Item
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] in minecraft:the_nether run data modify block 0 0 0 Items append from storage manhunt:test Item
execute as @a[nbt={SelectedItem: {id:"minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}'}}}] in minecraft:the_end run data modify block 0 0 0 Items append from storage manhunt:test Item
