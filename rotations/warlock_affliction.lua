--[[[
@module Warlock Affliction Rotation
@author Kirk24788
@version 6.2.2
]]--
local spells = kps.spells.warlock
local env = kps.env.warlock


kps.rotations.register("WARLOCK","AFFLICTION",
{
    -- Deactivate Burning Rush if not moving for 1 second
    env.deactivateBurningRushIfNotMoving(1),

    -- Cooldowns
    {{"nested"}, 'kps.cooldowns', {
        {spells.darkSoulMisery, 'not player.hasBuff(spells.darkSoulMisery) and spells.darkSoulMisery.cooldown == 0 and player.soulShards >= 2'},
        {spells.darkSoulMisery, 'player.hasBuff(spells.darkSoulMisery).charges == 2 and player.soulShards >= 1'},
    }},
    {spells.haunt, 'not spells.haunt.isRecastAt("target") and player.soulShards >= 1 and player.hasBuff(spells.soulburn)'},
 
    {spells.agony, 'target.myDebuffDuration(spells.agony) <= 7.2'},
    {spells.corruption, 'target.myDebuffDuration(spells.corruption) <= 5.4'},
    {spells.unstableAffliction, 'target.myDebuffDuration(spells.unstableAffliction) <= 4.2'},
    {spells.agony, 'focus.myDebuffDuration(spells.agony) <= 7.2', 'focus'},
    {spells.corruption, 'focus.myDebuffDuration(spells.corruption) <= 5.4', 'focus'},
    {spells.unstableAffliction, 'focus.myDebuffDuration(spells.unstableAffliction) <= 4.2', 'focus'},
    {spells.agony, 'mouseover.myDebuffDuration(spells.agony) <= 7.2', 'mouseover'},
    {spells.corruption, 'mouseover.myDebuffDuration(spells.corruption) <= 5.4', 'mouseover'},
    {spells.unstableAffliction, 'mouseover.myDebuffDuration(spells.unstableAffliction) <= 4.2', 'mouseover'},
    --{spells.haunt, '(target.myDebuffDuration(spells.haunt) <= 0.5 or player.souldShards>=4) and (player.hasProc or player.hasBuff(spells.darkSoulMisery) or player.soulShards >= 3)'},
    {spells.soulburn, 'not player.hasBuff(spells.soulburn) and player.soulShards>=2 and player.buffDuration(spells.hauntingSpirits) < 9'},
    {spells.haunt, 'not spells.haunt.isRecastAt("target") and (player.hasProc or player.hasBuff(spells.darkSoulMisery)) and player.soulShards >= 3'},
    {spells.haunt, 'not spells.haunt.isRecastAt("target") and player.soulShards >= 4'},
    {spells.lifeTap, 'player.mana < 0.4 and not player.hasBuff(spells.darkSoulMisery)'},
    {spells.drainSoul}, -- drain_soul,interrupt=1,chain=1
}
,"Icy Veins")
