--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local GetVar = SignalsService.new('GetVar')

--// Variables
local Variable = 'Hello World!'

--// Functions
GetVar:OnInvoke(function()
	return Variable
end)