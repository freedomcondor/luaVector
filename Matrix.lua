Vec = require("Vector")
local Matrix = {CLASS = "Matrix"}
Matrix.__index = Matrix

function Matrix:create(x,y,z)
	local instance = {}
	setmetatable(instance, self)
	self.__index = self

		--the metatable of instance would be whoever owns this create
			--so you can :  a = State:create();  b = a:create();  grandfather-father-son
	
	-- Asserts
	-- to be filled
		--[[			m
					-------------
					|			|	n
					|			|
					-------------

		--]] 

	if type(x) == "table" and x.CLASS == "Matrix" then
		instance.n = x.n	
		instance.m = x.m
		for i = 1,instance.n do
			instance[i] = {}
			for j = 1,instance.m do
				instance[i][j] = x[i][j] or 0
			end
		end
		return instance
	end

	if type(x) == "number" and type(y) == "number" then
		instance.n = x
		instance.m = y
		local temp = z or {}
		for i = 1,instance.n do
			instance[i] = {}
			local temp1 = temp[i] or {}
			for j = 1,instance.m do
				instance[i][j] = temp1[j] or 0
			end
		end
		return instance
	end

	if type(x) == "table" and type(x[1]) == "table" then
		local n = 0
		local m = 0
		for i,vi in ipairs(x) do
			n = i
			local mm = 0
			for j,vj in ipairs(vi) do
				mm = j
			end
			if mm > m then m = mm end
		end
		instance.n = n
		instance.m = m

		for i = 1,instance.n do
			instance[i] = {}
			for j = 1,instance.m do
				instance[i][j] = x[i][j] or 0
			end
		end
		return instance
	end

	print("matrix create: makes no sence")
	return nil
end

function Matrix.__add(a,b)
	if a.n ~= b.n or a.m ~= b.m then
		print("in Matrix + : makes no sense")
		return nil
	end
	local c = Matrix:create(a.n,a.m)
	for i = 1,a.n do
		for j = 1,a.m do
			c[i][j] = a[i][j] + b[i][j]
		end
	end

	return c
end

function Matrix.__unm(b)
	local c = Matrix:create(b.n,b.m)
	for i = 1,b.n do
		for j = 1,b.m do
			c[i][j] = -b[i][j]
		end
	end

	return c
end

function Matrix.__sub(a,b)
	if a.n ~= b.n or a.m ~= b.m then
		print("in Matrix + : makes no sense")
		return nil
	end
	local c = Matrix:create(-b)
	c = c + a

	return c
end

---------------------------------------  TO DO
function Matrix.__mul(a,b)
	if 	type(a) == "table" and a.CLASS == "Matrix" and 
		type(b) == "table" and b.CLASS == "Vector3" then
		local c = Vec:create()
		c.x = a[1][1] * b.x + a[1][2] * b.y + a[1][3] * b.z
		c.y = a[2][1] * b.x + a[2][2] * b.y + a[2][3] * b.z
		c.z = a[3][1] * b.x + a[3][2] * b.y + a[3][3] * b.z
		return c
	end

	if type(a) == "table" and a.CLASS == "Matrix" and 
		type(b) == "table" and b.CLASS == "Matrix" then
		local c = Matrix:create()
		for i = 1,3 do
			for j = 1,3 do
				c[i][j] = 0
				for k = 1,3 do
					c[i][j] = c[i][j] + a[i][k] * b[k][j]
				end
			end
		end
		return c
	end

	if type(a) == "number" then
		local c = Matrix:create(b)
		for i = 1,3 do
			for j = 1,3 do
				c[i][j] = b[i][j] * a
			end
		end
		return c
	end

	if type(b) == "number" then
		local c = Matrix:create(a)
		for i = 1,3 do
			for j = 1,3 do
				c[i][j] = a[i][j] * b
			end
		end
		return c
	end

	return Matrix.create()
end

function Matrix.__eq(a,b)
	if a.n ~= b.n or a.m ~= b.m then
		return false
	end

	local T = true
	for i = 1,a.n do
		for j = 1,b.n do
			if a[i][j] ~= b[i][j] then
				T = false
				return false
			end
		end
	end

	return T
end

---------------------------------------  TO DO
-- |A|
function Matrix:determinant()
	local A = 0;
	A = A + self[1][1] * (self[2][2] * self[3][3] - self[2][3] * self[3][2])
	A = A + self[1][2] * (self[2][3] * self[3][1] - self[3][2] * self[2][1])
	A = A + self[1][3] * (self[2][1] * self[3][2] - self[2][2] * self[3][1])
	return A
end
function Matrix:A()
	return self:determinant()
end

-- to be filled:
-- function reverse
-- function A*

function Matrix:__tostring()
	local str = ""
	for i = 1, self.n do
		if i == 1 then str = str .. "[[" else str = str .. " [" end
		for j = 1, self.m do
			str = str .. self[i][j]
			if j ~= self.m  then str = str .. ","
							else str = str .. "]" end
		end
		if i == self.n then str = str .. "]" else str = str .. " \n" end
	end
	local str = str .. " n = " .. self.n .. "," .. "m = " .. self.m .. "\n"

	return str
end

return Matrix