#some basic stuff
tellraw @a[tag=!joined] {"text":"Thanks for downloading the datapack! Hope you will enjoy!!"}
title @a[tag=!joined] title {"text":"Lights Out","color":"dark_gray"}
title @a[tag=!joined] subtitle {"text":"Good luck surviving this.","color":"dark_gray"}
scoreboard players set @a[tag=!joined] sanity 150
give @a[tag=!joined] written_book{pages:['["",{"text":"You need to know few things:\\n\\n"},{"text":"1.","bold":true},{"text":" Your sanity drops ","color":"dark_gray"},{"text":"-1 per 4 seconds","bold":true,"color":"dark_gray"},{"text":", to avoid losing it, you need to hold ","color":"dark_gray"},{"text":"torch","bold":true,"color":"dark_gray"},{"text":", or to stop losing, stand on any ","color":"dark_gray"},{"text":"light source","bold":true,"color":"dark_gray","hoverEvent":{"action":"show_text","contents":"Any type of: Lantern, Torch, Campfire and also beacon"}},{"text":"\\n\\n","color":"reset"},{"text":"2. ","bold":true},{"text":"After respawning, your sanity will be 90.","color":"dark_gray"}]','["",{"text":"3. ","bold":true},{"text":"\\u200bThere are few bad sanity effects.","color":"dark_gray"},{"text":"\\n\\n","color":"reset"},{"text":"4. ","bold":true,"color":"black"},{"text":"Golden apples and g carrots gives you sanity","color":"dark_gray"}]'],title:Instructions,author:FogiPL,display:{Lore:["few tips I think you need to know"]}}
tag @a[tag=!joined] add joined
scoreboard players add %time daytime 1
time set 18000t
gamerule doDaylightCycle false
scoreboard players enable @a music

#days
execute if score %time daytime matches 24000.. run scoreboard players add %daycounter days 1
execute if score %time daytime matches 24000.. run title @a title [{"text":"Day "},{"score":{"name":"%daycounter","objective":"days"}}]
execute if score %time daytime matches 24000.. run execute as @a at @s run playsound minecraft:ambient.warped_forest.mood master @s ~ ~ ~ 1 2

execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 1 run title @a subtitle {"text":"Wow, you survived... The first day."}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 2 run title @a subtitle {"text":"How long do you want to play this?."}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 3 run title @a subtitle {"text":"How much food do you have?"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 4 run title @a subtitle {"text":"Crops can't grow in dark"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 5 run title @a subtitle {"text":"Hope that beds don't works"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 6 run title @a subtitle {"text":"Don't you think it's dark here?"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 7 run title @a subtitle {"text":"I'm bored of writing these messages"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 8 run title @a subtitle {"text":"Sooo, maybe I will just stop?"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 9 run title @a subtitle {"text":"Yea, that's cool decision. no more info"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 10 run title @a subtitle {"text":"I was joking!!!!"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 11 run title @a subtitle {"text":""}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 15 run title @a subtitle {"text":"it was a lie"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 16..25 run title @a subtitle {"text":"next day"}
execute if score %time daytime matches 24000.. run execute if score %daycounter days matches 26 run title @a subtitle {"text":""}

execute if score %time daytime matches 24000.. run scoreboard players set %time daytime 0

#sanity
execute as @a[gamemode=survival,nbt=!{SelectedItem:{id:"minecraft:torch"}},scores={sanitytimer=80..,sanity=1..}] at @s run execute if block ~ ~ ~ #fun:notlight run execute if block ~ ~1 ~ #fun:notlight run execute if block ~ ~-1 ~ #fun:notlight run scoreboard players remove @s sanity 1
execute as @a[gamemode=survival,nbt=!{SelectedItem:{id:"minecraft:torch"}},scores={sanitytimer=80..,sanity=1..}] at @s run execute if block ~ ~ ~ #fun:notlight run execute if block ~ ~1 ~ #fun:notlight run execute if block ~ ~-1 ~ #fun:notlight run scoreboard players set @s sanitytimer 0
execute as @a[gamemode=survival,nbt={SelectedItem:{id:"minecraft:torch"}},scores={sanitytimer=60..,sanity=..199}] run scoreboard players add @s sanity 1
execute as @a[gamemode=survival,nbt={SelectedItem:{id:"minecraft:torch"}},scores={sanitytimer=60..,sanity=..199}] run scoreboard players set @s sanitytimer 0
execute as @a[gamemode=survival,scores={sanitytimer=60..,sanity=..199}] at @s run execute if block ~ ~ ~ #fun:light run scoreboard players add @s sanity 1
execute as @a[gamemode=survival,scores={sanitytimer=60..,sanity=..199}] at @s run execute if block ~ ~ ~ #fun:light run scoreboard players set @s sanitytimer 0
execute as @a[gamemode=survival,scores={sanitytimer=60..,sanity=..199}] at @s run execute if block ~ ~1 ~ #fun:light run scoreboard players add @s sanity 1
execute as @a[gamemode=survival,scores={sanitytimer=60..,sanity=..199}] at @s run execute if block ~ ~1 ~ #fun:light run scoreboard players set @s sanitytimer 0
execute as @a[gamemode=survival,scores={sanitytimer=60..,sanity=..199}] at @s run execute if block ~ ~-1 ~ #fun:light run scoreboard players add @s sanity 1
execute as @a[gamemode=survival,scores={sanitytimer=60..,sanity=..199}] at @s run execute if block ~ ~-1 ~ #fun:light run scoreboard players set @s sanitytimer 0

execute as @a run title @s actionbar [{"text":"Sanity: ","color":"dark_green","bold":true},{"score":{"name":"@s","objective":"sanity"},"color":"green","bold":false}]

#sanity reset
execute as @a[scores={sanityreset=1..}] run scoreboard players set @s sanity 90
execute as @a[scores={sanityreset=1..}] run scoreboard players set @s sanityreset 0
#sanity food
execute as @a[scores={sanity.golden_apple=1..}] run scoreboard players add @s sanity 100
execute as @a[scores={sanity.golden_apple=1..}] run scoreboard players set @s sanity.golden_apple 0
execute as @a[scores={sanity.golden_carrot=1..}] run scoreboard players add @s sanity 15
execute as @a[scores={sanity.golden_carrot=1..}] run scoreboard players set @s sanity.golden_carrot 0
execute as @a[scores={sanity.rotten_flesh=1..}] run scoreboard players remove @s sanity 15
execute as @a[scores={sanity.rotten_flesh=1..}] run scoreboard players set @s sanity.rotten_flesh 0
execute as @a[scores={sanity.spider_eye=1..}] run scoreboard players remove @s sanity 100
execute as @a[scores={sanity.spider_eye=1..}] run scoreboard players set @s sanity.spider_eye 0

#sanity effects
execute as @a[scores={sanity=..80},tag=!music] run playsound minecraft:ambient.warped_forest.loop master @s
execute as @a[scores={sanity=..80},tag=!music] run tag @s add music
execute as @a[scores={sanity=81..},tag=music] run stopsound @s master minecraft:ambient.warped_forest.loop
execute as @a[scores={sanity=81..},tag=music] run tag @s remove music
execute as @a[scores={sanity=..10},tag=!music2] run playsound minecraft:ambient.basalt_deltas.loop master @s
execute as @a[scores={sanity=..10},tag=!music2] run tag @s add music2
execute as @a[scores={sanity=11..},tag=music2] run stopsound @s master minecraft:ambient.basalt_deltas.loop
execute as @a[scores={sanity=11..},tag=music2] run tag @s remove music2
execute as @a[scores={sanity=..25},tag=!nausea] run effect give @s nausea 999999 255 true
execute as @a[scores={sanity=..25},tag=!nausea] run tag @s add nausea
execute as @a[scores={sanity=26..},tag=nausea] run effect clear @s nausea
execute as @a[scores={sanity=26..},tag=nausea] run tag @s remove nausea
execute as @a[scores={sanity=201..}] run scoreboard players set @s sanity 200
execute as @a[scores={sanity=..0}] run scoreboard players set @s sanity 0
execute as @a[scores={sanity=0,sanitydamage=60..}] run effect give @s instant_damage
execute as @a[scores={sanity=0,sanitydamage=60..}] run scoreboard players set @s sanitydamage 0