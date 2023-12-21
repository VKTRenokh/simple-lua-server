local function get_file_extension(path)
	return path:sub(path:match(".*()%.") + 1)
end

return get_file_extension
