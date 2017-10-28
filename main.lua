Vector = require("Vector")

a = Vector:create(14,2,3)
b = Vector:create(1,2,3)
c = a + b
print(-c)
d = a - b
print(-d)
c = a * b
print(c)
print(a * b)
a = Vector:create(b)
print(a == b)
a = Vector:create(b + Vector:create(1,0,0))
print(a == b)
