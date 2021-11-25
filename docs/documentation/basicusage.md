# Basic Usage
After setting up the service, we can now learn more about our service and put each system into practice.

## Requiring
To get started we will be calling our module depending on how we set it up.

```lua
--// Services
local ReplicatedStorage = game:GetService('ReplicatedStorage')

--// SignalsService
local SignalsService = require(ReplicatedStorage.SignalsService)
```

For the require we are calling the service **ReplicatedStorage** and after that requiring the module **SignalsService** that we insert in ReplicatedStorage.

## Creating Signals
Creation is the most important part when it comes to our events, because creation allows us to manipulate events in the way we want and when we want.

```lua
local Event = SignalsService.new('Event')
```

To create an event we just need to make our service call with **.new** and insert the argument in **string** format to declare the name of our event.

## Use of Signals
After the creation of our signals we can start using them the way we want, an example of this would be to make an event that every time it is loaded it will give a response that will be the sum of the first two arguments.

```lua
Event:Connect(function(A: number, B: number)
	print(A + B)
end)
```

To fire the connection made above, we need to use the **Fire** function which will trigger all connections present in the current signal.

```lua
Event:Fire(5, 5)
```

If we just want a firing check, we can use **Wait** which will interrupt the script until there is a firing of the current signal connections.

```lua
Event:Wait()
```

!!! warning
	This function will stop your current code until there is an event firing. Use it very carefully and usually in multiple script signals, so that there are no future problems with your code.

---

In addition to connections, there are also invocations that can only be set once and when invoked, the invoker will receive the return function of the current invocation.

```lua
Event:OnInvoke(function(A + B)
	return A + B
end)

local Result = Event:Invoke(5, 5)
print(Result) -- 10
```

This example shows that **Result** is the result of the value **A + B** received as a return from the function entered in **OnInvoke**.