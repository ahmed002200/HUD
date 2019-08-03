
--[[
    esx_ladderhud
    Copyright C 2018  MarmotaGit
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--[[ this has been edited and re-uploaded by ahmed002200.
discord: ★彡 𝘾𝙡𝙮𝙙𝙚 彡★#9915

]]


local thirst, hunger, drunk = 0, 0, 0

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(250)
        SendNUIMessage({
            show = IsPauseMenuActive(),
            thirst = thirst,
            hunger = hunger,
            drunk = drunk
        })
    end
end)

AddEventHandler("esx_ladderhud:updateBasics", function(basics)
    hunger, thirst, drunk = basics[1].percent, basics[2].percent, basics[3].percent
end)
