--// Types
type table = {[any]: any}
type Callback = (...any) -> (...any)
type Connection = {
	Disconnect: (self: any) -> nil
}
type Signal = {
	Connect: (self: any, Callback: Callback) -> Connection,
	ConnectParallel: (self: any, Callback: Callback) -> Connection,
	Wait: () -> nil,
	Fire: (...any) -> nil
}

--// SignalsService
local Signals = {} do
	Signals.Connections = {}
	local Signal = {} do
		Signal.__index = Signal
		
		function Signal:Destroy()
			if not self.Name then return end
			Signals.Connections[self.Name] = nil
		end

		function Signal:Connect(Callback: Callback): Connection?
			if not self.Name then return end
			local Head = 'C'..Signals.Connections[self.Name].Listening
			Signals.Connections[self.Name].Listening+=1
			Signals.Connections[self.Name][Head] = Callback

			local function Disconnect()
				Signals.Connections[self.Name][Head] = nil
			end

			return {Disconnect = Disconnect}
		end

		function Signal:ConnectParallel(Callback: Callback): Connection?
			return self:Connect(function(...) 
				task.desynchronize()
				Callback(...)
			end)
		end

		function Signal:Wait()
			if not self.Name then return end
			local Result
			local WaitSignal = self:Connect(function()
				Result = true
			end)

			repeat task.wait()  until Result
			WaitSignal:Disconnect()

			return
		end

		function Signal:Fire(...)
			if not self.Name then return end
			for i, v in next, Signals.Connections[self.Name] do
				if typeof(v) ~= 'function' then continue end
				v(...)
			end
		end
	end

	function Signals.new(ConnectionName: string): Signal
		local self = setmetatable({}, Signal)
		self.Name = ConnectionName
		Signals.Connections[ConnectionName] = Signals.Connections[ConnectionName] or {
			Listening = 0
		}
		return self
	end
end

return Signals