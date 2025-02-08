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

# Initialize
team add Runner
team modify Runner color white
team modify Runner seeFriendlyInvisibles false
team add Hunter
team modify Hunter color white
team modify Hunter seeFriendlyInvisibles false
scoreboard objectives add Dimension dummy
scoreboard objectives add Deaths deathCount
scoreboard objectives add RemainingLives dummy
scoreboard objectives add Time dummy
scoreboard objectives add manhunt-options trigger
scoreboard objectives add Countdown trigger
scoreboard objectives add Lives trigger
scoreboard players set @a Countdown -1
scoreboard players set @a Lives -1
scoreboard players set .countdown manhunt-options 0
scoreboard players set .lives manhunt-options 1
scoreboard players set .compass-feedback manhunt-options 1
scoreboard players enable @a manhunt-options
scoreboard players enable @a Countdown
scoreboard players enable @a Lives
bossbar add countdown {"text":"Countdown"}
bossbar set countdown visible false

execute in minecraft:overworld run forceload add 0 0
execute in minecraft:the_nether run forceload add 0 0
execute in minecraft:the_end run forceload add 0 0

execute in minecraft:overworld run setblock 0 0 0 yellow_shulker_box
execute in minecraft:the_nether run setblock 0 0 0 yellow_shulker_box
execute in minecraft:the_end run setblock 0 0 0 yellow_shulker_box

data modify storage manhunt:test Item set value {id: "minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"dark_red","italic":false,"text":"Tracker Compass"}',"minecraft:lodestone_tracker":{target:{dimension:"minecraft:overworld",pos:[0,0,0]},tracked:0b}}}

execute in minecraft:overworld run data modify block 0 0 0 Items append from storage manhunt:test Item
execute in minecraft:the_nether run data modify block 0 0 0 Items append from storage manhunt:test Item
execute in minecraft:the_end run data modify block 0 0 0 Items append from storage manhunt:test Item

# Loop
schedule function manhunt:loop-core 1t
schedule function manhunt:load/recover-compass 1t

# Hello World
function manhunt:load/hw
