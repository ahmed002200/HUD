/*
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
*/

/*this has been edited and re-uploaded by ahmed002200.
discord: ★彡 𝘾𝙡𝙮𝙙𝙚 彡★#9915
*/

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
        $(".container-fluid").css("display",data.show? "none":"block");
        $("#hunger").css("width", data.hunger + "%");
        $("#thirst").css("width", data.thirst + "%");
        $("#drunk").css("width", data.drunk + "%");
    });
});
