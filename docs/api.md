# API

## SignalsService

### SignalsService.new()
```lua
local Signal = SignalsService.new('Signal')
```
It will return a signal/connection that will provide access to the signal's functions.

!!! note
    Even though the name of the function is `new`, the function is also used to obtain signals that already exist.

!!! warning
    To create or get a signal, you must pass the name you want to the signal or the service will fail.

## Signal

### Signal:Connect()
```lua
Signal:Connect(function(A, B)
    print(A + B)
end)
```
It will connect to the signal and if there is any trigger from the signal it will load the function passed as argument.

### Signal:ConnectParallel()
```lua
Signal:ConnectParallel(function(A, B)
    print(A + B)
end)
```
It works similarly to the 'Connect' function, but being a parallel connection, so you don't have to worry about loops, wait, or any other functions that interrupt code loading.

### Signal:Wait()
```lua
Signal:Wait()
```
This function will commonly be used in multiple scripts or parallel functions in an individual script as this function pauses the code until there is a fired on the signal.

### Signal:Fire()
```lua
Signal:Fire(5, 5)
```
Fire the signal passing the necessary arguments of your connections.