--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder') -- Creates a connection.
local Parallel = SignalsService.new('Parallel')

--// Functions
Adder:Connect(function(A, B) -- It will connect with a connection and send a callback function for when the connection is fired.
	print(A..' + '..B..' = '..A + B)
end)

Adder:Wait() -- It will wait until the 'Adder' connection is fired.

Parallel:Fire() -- It will fire the 'Parallel' connection. 