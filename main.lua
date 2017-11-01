Vec3 = require("Vector3")
Mat3 = require("Matrix3")

Qua = require("Quaternion")

---vec test----------------------------
print("-----vec3 test------------------")
a = Vec3:create(14,2,3)
print(a * 5)
print(5 * a)
b = Vec3:create(1,2,3)
c = a + b
print(-c)
d = a - b
print(-d)
c = a * b
print("a*b=",c)
print(a * b)
a = Vec3:create(b)
print(a == b)
a = Vec3:create(b + Vec3:create(1,0,0))
print(a == b)
print("a = ",a)
print("b = ",b)
c = a ^ b
print("c = ",c)
c = a ^ 2
print("c = ",c)
c = a ^ 3
print("c = ",c)
print(a:len())
---Mat test---------------------------
print("-----Mat3 test------------------")
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

---Mat and Vec multi----------------
print("-----multi test------------------")
a = Vec3:create(1,2,3)
b = Mat3:create(1,1,0,
				0,1,0,
				0,0,1)

c = b * a
print(type(c))
print(b * a)

c = a * b

---Quaternion ------------------
print("-----Qua test------------------")
a = Qua:create(1,1,1,1)
b = Qua:create(2,2,2,2)
print("a = ",a)
print("b = ",b)
print("a + b = ",a+b)
print("- b = ",-b)
print("a - b = ",a-b)
print("squlen a = ",a:squlen())
print("squlen b = ",b:squlen())
print("len a = ",a:len())
print("len b = ",b:len())
print("inv a = ",a:inv())
print("a * b = ",a * b)

print("a = ",a)
print("b = ",b)
---Qua Rotation ------------------
print("-----rotation test------------------")
th = math.pi
axis = Vec3:create(0,0,2)

aa = Qua:createFromRotation(axis,th)

a = Qua:create(axis * math.sin(th/2),math.cos(th/2))
print(a)
b = Vec3:create(1,0,0)

b = b:rotate(aa)
print(b)
