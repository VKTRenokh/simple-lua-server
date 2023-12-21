local get_headers = require("utils.get-headers")
local get_content_type = require("utils.get-content-type")
local get_path = require("utils.get-path")
local get_file_extension = require("utils.get-file-extension")

local function server(socket)
	local client = socket:accept()

	if not client then
		return
	end

	local request = client:receive()

	local path = get_path(request)
	local extension = get_file_extension(path)
	local content_type = get_content_type(extension)

	print(content_type)

	local body = "Hello World!"

	local headers = get_headers("200 OK", "text/plain", body:len())

	local response = headers .. body

	client:send(response)

	client:close()
end

return server
