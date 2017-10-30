Vec3 = require("Vector3")
Mat3 = require("Matrix3")

------------------------------------
a = Vec3:create(14,2,3)
print(a * 5)
print(5 * a)
b = Vec3:create(1,2,3)
c = a + b
print(-c)
d = a - b
print(-d)
c = a * b
print(c)
print(a * b)
a = Vec3:create(b)
print(a == b)
a = Vec3:create(b + Vec3:create(1,0,0))
print(a == b)

-------------------------------------
a = Mat3:create(1,1,0,
				0,1,0,
				0,0,1)

b = Mat3:create(a)

print(a+b)
print(-b)
print(a-b)
print(a*b)
print(a == b)
b = a * b
print(a == b)
print(a:A())

--------------------------
print("vec mat test")
a = Vec3:create(1,2,3)
b = Mat3:create(1,1,0,
				0,1,0,
				0,0,1)

c = b * a
print(type(c))
print(b * a)

c = a * b
