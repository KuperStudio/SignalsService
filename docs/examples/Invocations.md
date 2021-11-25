# Invocations
Invocations are very important when dealing with return methods for multiple scripts, an example of this would be to collect a local variable from a secondary script where I have access only through the signals service.

## Script-1
```lua
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
```

The current script gets the 'GetVar' signal and sets a variable called 'Variable' with its value being 'Hello World!', right after these two calls, it takes the 'OnInvoke' variable from the 'GetVar' signal and sets it to be a function that returns the local variable defined earlier.

## Script-2
```lua
--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local GetVar = SignalsService.new('GetVar')

--// Variables
local Variable

--// Functions
Variable = GetVar:Invoke()
print(Variable)
```

The second script does the same as the first script, but it does not set the variable 'Variable' directly, it makes an 'Invoke' call to the 'GetVar' signal which sets the variable and then prints it.