# Connections
Connections are the simplest functions when it comes to events/signals, because connections offer a fast and easy-to-use system that with just a single call you can activate over a hundred functions at the same time. 

The two scripts below showed an example connection that will occur between them and that one needs the other to complete, a very interesting romance story!

## Script-1
```lua
--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder')

--// Functions
Adder:Connect(function(A, B)
	print(A + B)
end)
```

The current script is receiving the 'Adder' signal and is connecting to that signal by asking for 2 arguments that will be summed and printed.

## Script-2
```lua
--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder')

--// Functions
task.wait(2)

Adder:Fire(5, 5)
```

The second script has the same characteristics as the first, but this one, instead of connecting to the signal, is firing the signal and inserting two numeric arguments into the signal connections.