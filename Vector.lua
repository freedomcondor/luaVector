local Vector = {}
Vector.__index = Vector

function Vector:create(x,y,z)
	local instance = {}
	setmetatable(instance,self)
	self.__index = self
		--the metatable of instance would be whoever owns this create
	      --so you can :  a = State:create();  b = a:create();  grandfather-father-son
	-- Asserts
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

function Vector.__add(a,b)
	local c = Vector:create()
	c.x = a.x + b.x
	c.y = a.y + b.y
	c.z = a.z + b.z
	return c
end

function Vector.__unm(b)
	local c = Vector:create(-b.x,-b.y,-b.z)
	return c
end

function Vector.__sub(a,b)
	local c = Vector:create(-b.x,-b.y,-b.z)
	c = c + a
	return c
end

function Vector.__mul(a,b)
	return a.x * b.x + a.y * b.y + a.z * b.z
end

function Vector:__tostring()
	return "(" .. self.x .. "," .. self.y .. "," .. self.z .. ")"
end

return Vector
