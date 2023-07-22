version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Survival Stranded V2",
    description = "",
    preview = '',
    map_version = 1,
    AdaptiveMap = true,
    type = 'skirmish',
    starts = true,
    size = {1024, 1024},
    reclaim = {966005.3, 53380},
    map = '/maps/Survival_Stranded_V2.v0001/Survival_Stranded_V2.scmap',
    save = '/maps/Survival_Stranded_V2.v0001/Survival_Stranded_V2_save.lua',
    script = '/maps/Survival_Stranded_V2.v0001/Survival_Stranded_V2_script.lua',
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
