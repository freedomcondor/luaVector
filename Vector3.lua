--Mat3 = require("Matrix3")
local Vector3 = {CLASS = "Vector3"}
Vector3.__index = Vector3

function Vector3:create(x,y,z)
	local instance = {}
	setmetatable(instance,self)
	self.__index = self
		--the metatable of instance would be whoever owns this create
	      --so you can :  a = State:create();  b = a:create();  grandfather-father-son
	-- Asserts
	if type(x) == "table" and x.CLASS == "Vector3" then
		instance.x = x.x
		instance.y = x.y
		instance.z = x.z
		return instance
	end
	if 	type(x) ~= "number" or 
		type(y) ~= "number" or 
		type(z) ~= "number" then
		instance.x = 0
		instance.y = 0
		instance.z = 0
		return instance
	end
	
	-- add data
	instance.x = x
	instance.y = y
	instance.z = z
	return instance
end

function Vector3.__add(a,b)
	local c = Vector3:create()
	c.x = a.x + b.x
	c.y = a.y + b.y
	c.z = a.z + b.z
	return c
end

function Vector3.__unm(b)
	local c = Vector3:create(-b.x,-b.y,-b.z)
	return c
end

function Vector3.__sub(a,b)
	local c = Vector3:create(-b.x,-b.y,-b.z)
	c = c + a
	return c
end

function Vector3.__mul(a,b)
	if 	type(a) == "table" and a.CLASS == "Vector3" and
		type(b) == "table" and b.CLASS == "Vector3" then
		return a.x * b.x + a.y * b.y + a.z * b.z
	end
	if type(b) == "number" then
		local c = Vector3:create(a.x * b, a.y * b, a.z * b)
		return c
	end
	if type(a) == "number" then
		local c = Vector3:create(b.x * a, b.y * a, b.z * a)
		return c
	end
end

function Vector3.__eq(a,b)
	return a.x == b.x and a.y == b.y and a.z == b.z
end

--function Vector3.__lt(a,b)  <
--function Vector3.__le(a,b)  <=

function Vector3:__tostring()
	return "(" .. self.x .. "," .. self.y .. "," .. self.z .. ")"
end

return Vector3
