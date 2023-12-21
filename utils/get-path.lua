local function get_path(request_init)
	local init = request_init:sub(request_init:find("/"), -1)

	return init:sub(1, init:find(" ") - 1)
end

return get_path
