Vec = require("Vector")
Mat = require("Matrix")

a = Vec:create{5,6,7,8,8}
b = Vec:create{5,6,7,8,9}
c = Vec:create(b)
d = (a - b) * c
print("a = ",a)
print("b = ",b)
print("c = ",c)
print("d = ",d)

print("* test")
a = Vec:create{5,6,7}
b = Vec:create{5,6,6}
c = a * b
print("a = ",a)
print("b = ",b)
print("c = ",c)

print("^ test")
a = Vec:create{1,2,3,4}
b = Vec:create{1,2,3,4}
c = a ^ b
print("a = ",a)
print("b = ",b)
print("c = ",c)

print("==")
a = Vec:create{1,2,3,4}
b = Vec:create{1,1,3,4}
c = a == b
print("a = ",a)
print("b = ",b)
print("c = ",c)

print("len")
a = Vec:create{1,2,3,4}
b = Vec:create{1,1,3,4}
c = a + b
d = c:len()
print("a = ",a)
print("b = ",b)
print("c = ",c)
print("c = ",d)
c = c:nor()
print("c = ",c)
print("d = ",d)

-------------------------------------------
print("matrix")
print("create")
a = Mat:create(2,3,{{2,3},{3}})
print(a)

b = Mat:create{	
					{1,3,4},
					{1,3,4},
				}
print(b)

c = Mat:create(b)
print(c)

print("+")
print(a+b)
print(a-b)
