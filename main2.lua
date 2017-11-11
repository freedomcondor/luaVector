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

print("+-")
print(a+b)
print(a-b)

print("*")

a = Mat:create(2,3,{{2,3},{3}})
b = Vec:create{3,4,5}
c = a * b
print("a=",a)
print("b=",b)
print("c=",c)

a = Mat:create(2,3,{{2,3},
					{3}})
b = Mat:create(3,3,{{1},
					{0,2},
					{0,0,2}})
c = a * b
print(a)
print(b)
print(c)

c = c * 3
print(c)
c = 2 * c
print(c)

----------
print("transpose")
c = c:T()
print(c)

----------
print("add and take vec")
print("before add",c)
c = c:addVec(Vec:create{1,1,1},2,"col")
print("after add",c)
print(c)

print("before take",c)
d = c:takeVec(2,"col")
print("after take",c)
print(c)
print(d)

c = c:link(d,"col")
print(c)

c = c:link(Mat:create(3,3,"I"),"col")
print(c)

c[3][3] = 2
print("tri")
--c = c:T()
d = c:tri()
print("after tri",d)

print("diag")
print("c = ",c)
--d = c:T():dia()
d = c:tri()
print("d = ",d)

d = c:dia()
print("d = ",d)

d = d:exc(2,3,"col")
print("d = ",d)
print("d = ",d:tri())
