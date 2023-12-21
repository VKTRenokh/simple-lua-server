local function get_headers(status, content_type, content_length)
	local headers = "HTTP/1.1 %s\r\nContent-Type: %s\r\nContent-Length: %s\r\n\r\n"

	return (string.format(headers, status, content_type, content_length))
end

return get_headers
