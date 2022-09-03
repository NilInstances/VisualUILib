-- // Variables
local Cache = {}
local MissingFunctions = {}
local Methods = {
    debug.getconstant,
    debug.getconstants,
    debug.getinfo,
    debug.getproto,
    debug.getprotos,
    debug.getstack,
    debug.getupvalue,
    debug.getupvalues,
    debug.setconstant,
    debug.setstack,
    debug.setupvalue,
    getcallingscript,
    getconnections,
    getgc,
    getgenv,
    getloadedmodules,
    getnamecallmethod,
    getrawmetatable,
    getsenv,
    hookfunction,
    hookmetamethod,
    newcclosure,
    setclipboard,
    setreadonly,
    checkcaller
}

-- // Check Exploit Compatibility
local MethodsAmount = #Methods
local CheckedAmount = 0

for Index, _ in next, Methods do
    CheckedAmount += 1
end

if CheckedAmount < MethodsAmount then
    error('Your Exploit Is Not Supported')
end

-- // Environment
local Environment = getgenv

-- // Functions
function Environment.Import(URL)
    if Cache[URL] then
        return table.unpack(Cache[URL])
    end

    local BaseURL = 'https://raw.githubusercontent.com/VisualRoblox/Roblox/main/Utilities/Visual/'
    local Imported = loadstring(game:HttpGet(BaseURL .. URL))
    Cache[URL] = Imported

    return table.unpack(Imported)
end

-- // Imports
Import('UI/UIHandler.lua')