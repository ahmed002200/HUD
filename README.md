# HUD
# hunger, thirst and drunk bar
**Credits: Marmota#2533**
**Credits: Ahmed S.#9915**

https://i.imgur.com/VpduplX.png

**How to install:**

 - Put the folder "redesigned-hud" inside your resources folder and start it on your server.cfg!
 
 * Add TriggerEvent in (resources\[esx]\esx_status\client\main.lua `esx_status:load`) 
 ```lua
 TriggerEvent('esx_ladderhud:updateBasics', GetStatusData(true))
 ```
 to look like this
 ```lua
 RegisterNetEvent('esx_status:load')
 AddEventHandler('esx_status:load', function(status)
 
 	for i=1, #Status, 1 do
 		for j=1, #status, 1 do
 			if Status[i].name == status[j].name then
 				Status[i].set(status[j].val)
 			end
 		end
 	end
 
 	Citizen.CreateThread(function()
 	  while true do
 
 	  	for i=1, #Status, 1 do
 	  		Status[i].onTick()
 	  	end
 
 			SendNUIMessage({
 				update = true,
 				status = GetStatusData()
 			})
 	
 		TriggerEvent('esx_ladderhud:updateBasics', GetStatusData(true))
 	    Citizen.Wait(Config.TickTime)
 	  end
 	end)
 
 end)
 ```
* Disabling Basic Needs Bars (resources\[esx]\esx_basicneeds\client\main.lua `esx_status:loaded`)
```lua
AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#FFFF00', -- amarelo
	--TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', -- GOLD
		function(status)
			return false -- Change to true to show hunger bar | false to hide hunger bar
		end, function(status)
			status.remove(100)
		end
	)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0099FF', -- azul
	--TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', -- CYAN
		function(status)
			return false -- Change to true to show thirst bar | false to hide thirst bar
		end, function(status)
			status.remove(75)
		end
	)
```
  
if you wanna disable the default drunk bar that comes with esx_optionalneeds you should go to "esx_optionalneeds/client/main.lua" go to line 93 and change true to false :

```
     if status.val > 0 then
        return true <-- change this to false to hide the default drunk bar
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )
```
