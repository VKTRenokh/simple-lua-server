local function maybe(from)
	return {
		value = function()
			return from
		end,
		map = function(fn)
			return from == nil and maybe(nil) or maybe(fn(from))
		end,
		flatMap = function(fn)
			return from == nil and maybe(nil) or fn(from)
		end,
		getOrElse = function(value)
			return from == nil and value or from
		end,
		merge = function(otherMaybe)
			return maybe(from).flatMap(function(value)
				return otherMaybe.map(function(otherValue)
					return { left = value, right = otherValue }
				end)
			end)
		end,
		equals = function(otherMaybe)
			return otherMaybe.value() == from
		end,
	}
end

return maybe
