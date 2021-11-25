--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder')

--// Functions
task.wait(2)

Adder:Fire(5, 5)