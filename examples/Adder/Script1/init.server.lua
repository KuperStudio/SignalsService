--// Services
local SignalsService = require(game:GetService('ReplicatedStorage'):FindFirstChild('SignalsService'))

--// Signals
local Adder = SignalsService.new('Adder')

--// Functions
Adder:Connect(function(A, B)
	print(A..' + '..B..' = '..A + B)
end)