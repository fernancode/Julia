#so the file name can be named anything, and you use include("filename.jl") to get the module in there
#all the functions and stuff will be MyModuleName.x()

#the module will retain this name unless you do something like mod = include("filename.jl")
#then you'll have a mod.x() function AND MyModule.x(), so its probably faster to not have the former at all
module MyModule

export x, y, p, n #this is necessary when doing the "using MyModule" method

x() = "x"
y() = "y"
p() = "p"
n() = println(Threads.nthreads())

function thread_check()
    a = zeros(40)
    Threads.@threads for i = 1:40
        a[i] = Threads.threadid()
        println(Threads.threadid())
    end
    end
end

# just in case you forget the timing macro is @time func()
# it times the execution of that function or line of code
# im making a change