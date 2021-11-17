# Basic Usage
Using the service is the easy part, it's easier than walking forward, here we just need to be creating connections and using them however you want, whether in multiple scripts or individually.

We will be visualizing 2 scripts that carry different functions but work together.

!!! warning 
	The services have a small issue at hand when using the same connection in multiple scripts, it is necessary to make the script that will fire the connection to wait until the script that will receive the connection fire loads its function completely or it may happen that script fires and not load any functions as the script failed to load your connection in time.

## Script - 1
```lua
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
```

## Script - 2
```lua
--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder')
local Parallel = SignalsService.new('Parallel')

--// Functions
Adder:ConnectParallel(function(A, B) -- It will connect parallel to a connection and send a callback function for when the parallel connection is fired.
	Parallel:Wait() -- It will wait until the 'Parallel' connection is fired.
	print('Parallel: '..A..' + '..B..' = '..A + B)
end)

task.wait(5) -- It will wait 5 seconds after the game starts to fire a connection.

Adder:Fire(5, 6) -- It will fire the 'Adder' connection.
```

!!! notice
	It is noticed that one script acts by loading a connection calculating the arguments passed by the fires and the other script acts with parallel functions that also calculate the fires arguments but wait in parallel until the fire of the previous script is performed first. If the parallel connection for script-2 was not used, the code would not work as it would not be able to trigger and load the code at the same time.