version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Survival Stranded V2",
    description = "Version 2 Of the Survival Stranded Series, Made by GaryTheGoat. This is a very early release, very unbalanced and unfinished but is playable, Feedback Welcome. ",
    preview = '',
    map_version = 2,
    AdaptiveMap = true,
    type = 'skirmish',
    starts = true,
    size = {1024, 1024},
    reclaim = {2075068, 46739.08},
    map = '/maps/survival_stranded_v2.v0002/survival_stranded_v2.scmap',
    save = '/maps/survival_stranded_v2.v0002/survival_stranded_v2_save.lua',
    script = '/maps/survival_stranded_v2.v0002/survival_stranded_v2_script.lua',
    norushradius = 40,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'ARMY_2', 'ARMY_3', 'ARMY_4', 'ARMY_5', 'ARMY_6'}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'ARMY_ENEMY ARMY_ALLY' ),
            },
        },
    },
}
