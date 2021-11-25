--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local GetVar = SignalsService.new('GetVar')

--// Variables
local Variable

--// Functions
Variable = GetVar:Invoke()
print(Variable)