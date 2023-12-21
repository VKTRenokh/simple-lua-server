local get_headers = require("utils.get-headers")
local get_content_type = require("utils.get-content-type")
local get_path = require("utils.get-path")
local get_file_extension = require("utils.get-file-extension")
local io = require("io")
local os = require("os")

local function server(socket)
	local client = socket:accept()

	if not client then
		return
	end

	local request = client:receive()

	local path = get_path(request)
	local extension = get_file_extension(path)
	local content_type = get_content_type(extension)

	local public_dir = os.getenv("PUBLIC_DIR")

	local file = io.open(public_dir .. path)

	if not file then
		client:close()
		return
	end

	local content = file:read("*a")

	local headers = get_headers("200 OK", content_type, content:len())

	local response = headers .. content

	client:send(response)

	client:close()
end

return server
