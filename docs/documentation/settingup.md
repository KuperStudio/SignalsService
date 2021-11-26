# Setting up
SignalsService is a module, this means that to use the service you will need to request the module. For the required module we will have different options to do this.

## Requiring module
### 1. Getting by service ID
* Create a module in ReplicatedStorage

![Module In ReplicatedStorage](../images/ModuleInReplicatedStorage.png)

* Rename the module to **SignalsService**

![Rename The Module To SignalsService](../images/RenameTheModuleToSignalsService.png)

* Insert a return with the require by service ID (7715453598) inside the module

```lua
return require(7715453598)
```

### 2. Get it from the Roblox Library
* Get the [library model](https://www.roblox.com/library/7715453598)

![Get The Library Model](../images/GetTheLibraryModel.png)

* Put the model inside ReplicatedStorage

![Module In ReplicatedStorage](../images/ModuleInReplicatedStorage.png)

* Rename the module to **SignalsService**

![Rename The Module To SignalsService](../images/RenameTheModuleToSignalsService.png)

### 3. Get from GitHub
[SignalsService Repository](https://github.com/KuperStudio/SignalsService)

* Create a module in ReplicatedStorage

![Module In ReplicatedStorage](../images/ModuleInReplicatedStorage.png)

* Rename the module to **SignalsService**

![Rename The Module To SignalsService](../images/RenameTheModuleToSignalsService.png)

* You must insert into the module the code mentioned below.

```lua
return loadstring(game:GetService('HttpService'):GetAsync('https://raw.githubusercontent.com/KuperStudio/SignalsService/main/SignalsService.lua', true))()
```
