# API

## SignalsService

### SignalsService.new()
```lua
local Signal = SignalsService.new('Signal')
```
The function '.new' serves to connect to signals based on the some entered as argument.

!!! note
    The signal system will not work if you want to make a connection between server and client, because Roblox services do not allow this. 
    It is recommended that you use RemoteEvents or RemoteFunctions if you want to make a connection between server and client.

## Signal

### Signal:Connect()
```lua
Signal:Connect(function(A, B)
    print(A + B)
end)
```
Connects to the signal service waiting for a fire to load the callback function.

### Signal:ConnectParallel()
```lua
Signal:ConnectParallel(function(A, B)
    print(A + B)
end)
```
It connects to the signal service waiting for a fire to load the callback function in a parallel manner, thus not interfering with your current code.
!!! note
    This service will typically be used to load map chunks, visual effects, call waiting and so on.

### Signal:Wait()
```lua
local Result = Signal:Wait()
print(Result)
```
It waits for a connection fire and returns the received values.
!!! warning
    It should be noted that this function interrupts all loading of your current code.

### Signal:Fire()
```lua
Signal:Fire(5, 5)
```
Fires the current signal system connections.

### Signal:OnInvoke()
```lua
Signal:OnInvoke(function(A, B)
    return A + B
end)
```
Creates a callback function that will be activated after invoking the signal that will receive the function's callback.

### Signal:Invoke()
```lua
local Result = Signal:Invoke(5, 5)
print(Result)
```
Wait until the 'OnInvoke' function exists and then invoke it by entering the necessary arguments to the function and thus receiving the function's return.

### Signal:Destroy()
```lua
Signal:Destroy()
```
It will destroy all the connections in the signal system.

!!! warning
    This function can generate an error in your code if you exclude running functions like 'Wait' or 'Invoke'.
