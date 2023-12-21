local lua_socket = require("socket")
local server = require("server.server")

local function main()
	local socket = assert(lua_socket.bind("*", 8080))

	while true do
		server(socket)
	end
end

main()
