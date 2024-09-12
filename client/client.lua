-- Client-side event to handle the thunderbolt effect
RegisterNetEvent('triggerThunderbolt')
AddEventHandler('triggerThunderbolt', function(coords)
    -- Extract coordinates from the table
    local x, y, z = coords.x, coords.y, coords.z

    -- Load particle dictionary
    UseParticleFxAssetNextCall("scr_apartment")
    -- Create a particle effect at the target's position to simulate lightning
    StartParticleFxNonLoopedAtCoord("scr_ambient_wall_bang", x, y, z + 1.0, 0.0, 0.0, 0.0, 2.0, false, false, false)

    -- Force a lightning flash in the game (visual only, does not have an exact position)
    ForceLightningFlash()

    -- Wait for a moment to simulate a delay before the explosion
    Citizen.Wait(1000)

    -- Create an explosion at the target's position with damage
    AddExplosion(x, y, z, 2, 5.0, true, false, 1.0)  -- Small explosion that causes damage
end)

