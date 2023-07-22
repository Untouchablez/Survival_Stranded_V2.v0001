--Possible OrderIds
-- 1 = FormAggressiveMove 
-- 2 = FormAttack
-- 3 = FormMove
-- 4 = FormPatrol
-- 5 = AggressiveMove
-- 6 = IssueAttack
-- 7 = IssueMove
-- 8 = IssuePatrol

--Possible Formations = 'AttackFormation', 'GrowthFormation',

Tables = { 
    {
        --Amount of Attack Locations that are generated. Code will make 1 extra location that is the Defence Object Location
        AttackLocations = 100,
        --Select a Table from Areas.lua or Markers.lua
        AreaOrMarkerCache = "dropAttackMarkers",
        --Specify if selected Table is a Area or Marker so code knows what .lua file it needs 
        CacheType = "Marker",
        --Give order to units See top for Possible OrderIds this is used in PlatoonOrders.lua
        OrderId = 1,
        --Select Formation for Group of units. Works only if you use "Form" Orders. 
        Formation = 'GrowthFormation',
        -- Add Unit Bp to make a group
        UnitIds = {
        --2* T1 Scout   
        'UAL0101', 'UAL0101', 
        --4* T1BOT
        'UAL0106', 'UAL0106', 'UAL0106', 'UAL0106',
        },
    },
    {
        AttackLocations = 100,
        AreaOrMarkerCache = "dropAttackMarkers",
        CacheType = "Marker",
        OrderId = 3,
        Formation = 'GrowthFormation',
        UnitIds = {
        --2* T1 Scout   
        'UAL0101', 'UAL0101', 
        --4* T1BOT
        'UAL0106', 'UAL0106', 'UAL0106', 'UAL0106',
        },
    },
    {
        AttackLocations = 100,
        AreaOrMarkerCache = "dropAttackMarkers",
        CacheType = "Marker",
        OrderId = 4,
        Formation = 'GrowthFormation',
        UnitIds = {
        --2* T1 Scout   
        'UAL0101', 'UAL0101', 
        --4* T1BOT
        'UAL0106', 'UAL0106', 'UAL0106', 'UAL0106',
        },
    },
    {
        AttackLocations = 100,
        AreaOrMarkerCache = "dropAttackMarkers",
        CacheType = "Marker",
        OrderId = 6,
        Formation = 'GrowthFormation',
        UnitIds = {
        --8* T1BOT
        'UAL0106', 'UAL0106', 'UAL0106', 'UAL0106',
        'UAL0106', 'UAL0106', 'UAL0106', 'UAL0106',
        },
    }
}