/*
 * Author: esteldunedain
 * Make the player check the temperature of his spare barrels
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

// Check canInteractWith:
if (!([_player, objNull, ["isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))) exitWith {};

// Make the unit go kneeling
[_unit] call EFUNC(common,goKneeling);

// Spawn a progress bar
[
    5.0,
    [_player],
    {
        // Time has enlapsed, ask the server to send the hint
        ['spareBarrelsSendTemperatureHint', [_unit, _unit]] call EFUNC(common,serverEvent);
    },
    {},
    (localize LSTRING(CheckingSpareBarrelsTemperatures)),
    {true},
    ["isNotInside", "isNotSitting"]
] call EFUNC(common,progressBar);
