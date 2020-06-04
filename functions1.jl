function f(x,y)     #my function
    x-y
end                 #default returns last line of function if "return" is not used
z = f(2,3)          #also requires an end statement


function g(x,y)
    z = x+y
    return z*2
    x-y             #this is never evaluated cause return is in front of it
end
z = g(4,5)

function r(x,y)::Int8
    x+y             #I can declare that the function always return a value that is an Int8 type
end
z = r(2,1)

function h(x,y)
    x+y,x*y         #again more arguments returned here
end
u = h(3,4)
v,w = h(3,4)
u,v,w

array = (1,2,3)
println(typeof(array))
array1 = (1,2,3,4,5)
println(typeof(array1))

tuple1 = (a = 1, b = 2, c = 3)
println(tuple1.a)       # can access by element name
println(tuple1[2])      # or can access by index
println(tuple1.c)

