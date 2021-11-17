--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder') -- Creates a connection.
local Parallel = SignalsService.new('Parallel')

--// Functions
Adder:ConnectParallel(function(A, B) -- It will connect parallel to a connection and send a callback function for when the parallel connection is fired.
	Parallel:Wait() -- It will wait until the 'Parallel' connection is fired.
	print('Parallel: '..A..' + '..B..' = '..A + B)
end)

task.wait(5) -- It will wait 5 seconds after the game starts to fire a connection.

Adder:Fire(5, 6) -- It will fire the 'Adder' connection.