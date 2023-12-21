local get_headers = require("utils.get-headers")
local get_path = require("utils.get-path")

local function server(socket)
	local client = socket:accept()

	if not client then
		return
	end

	local request = client:receive()

	local path = get_path(request)

	print(path:sub(path:match(".*()%.") + 1))

	local body = "Hello World!"

	local headers = get_headers("200 OK", "text/plain", body:len())

	local response = headers .. body

	client:send(response)

	client:close()
end

return server
