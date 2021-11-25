--// Types
type table = {[any]: any}
type Function = (...any) -> (...any)
type Connection = {
	Disconnect: Function,
	disconnect: Function,
}
type Wait = () -> (...any)

--// SignalsService
local Signals = {} do
	Signals.Connections = {}
	

	local Signal = {} do
		Signal.__index = Signal
		
		function Signal:destroy()
			Signals.Connections[self.Name] = nil
		end

		function Signal:Destroy()
			self:destroy()
		end

		function Signal:connect(Callback: Function): Connection?
			local Head = 'C'..Signals.Connections[self.Name].Listening
			Signals.Connections[self.Name].Listening+=1
			Signals.Connections[self.Name][Head] = Callback

			local function disconnect()
				Signals.Connections[self.Name][Head] = nil
			end

			return {disconnect = disconnect, Disconnect = disconnect}
		end

		function Signal:Connect(Callback: Function): Connection
			return self:connect(Callback)
		end

		function Signal:connectParallel(Callback: Function): Connection
			return self:connect(function(...) 
				task.desynchronize()
				return Callback(...)
			end)
		end

		function Signal:ConnectParallel(Callback: Function): Connection
			return self:connectParallel(Callback)
		end

		function Signal:wait(): Wait
			local Result, WaitSignal
			WaitSignal = self:connect(function(...)
				Result = ...
				WaitSignal:disconnect()
			end)

			repeat task.wait() until Result
			return Result
		end

		function Signal:Wait(): Wait
			return self:wait()
		end

		function Signal:fire(...)
			for _, v in next, Signals.Connections[self.Name] do
				if typeof(v) ~= 'function' then continue end
				v(...)
			end
		end

		function Signal:Fire(...)
			self:fire(...)
		end
		
		function Signal:onInvoke(Callback: Function)
			Signals.Connections[self.Name].OnInvoke = Callback
		end
		
		function Signal:OnInvoke(Callback: Function)
			self:onInvoke(Callback)
		end

		function Signal:invoke(...)
			repeat task.wait() until typeof(Signals.Connections[self.Name].OnInvoke) == 'function'
			return Signals.Connections[self.Name].OnInvoke(...)
		end

		function Signal:Invoke(...): Function
			return self:invoke(...)
		end
	end

	function Signals.new(Name: string)
		local self = setmetatable({}, Signal)
		self.Name = Name
		Signals.Connections[Name] = Signals.Connections[Name] or {
			Listening = 0,
			OnInvoke = nil,
		}
		return self
	end
end

return Signals 