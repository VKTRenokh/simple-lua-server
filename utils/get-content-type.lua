local content_types = {
	["html"] = "text/html",
	["js"] = "application/js",
	["json"] = "application/json",
	["css"] = "text/css",
	["jpg"] = "image/jpeg",
	["png"] = "image/png",
	["gif"] = "image/gif",
	["txt"] = "text/plain",
}

local function get_content_type(file_extension)
	return content_types[file_extension] or content_types["txt"]
end

return get_content_type
