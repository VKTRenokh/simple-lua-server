local function get_path(request)
	local init = request:sub(request:find("/"), -1)

	return init:sub(1, init:find(" ") - 1)
end

return get_path
