module MandelBrot
using Plots
#make some functions for mandelbrot stuff
#find out if a number is part of the set
#remember the mandelbrot is symmetrical about the real number plane

function mandel(c)
    #determine if a number is in the set or not in the set - 
    max_iter = 1000;
    bound = 2
    z = 0
    n = 0
    #if the magnitude of z exceeds two we know we are done.
    while abs(z)<bound && n<max_iter
        z = z^2+c
        n+=1
    end
    return n #if n is 1000 assume c is good, else not of the set
end

#map n to a color
function brot(n)
    rgb = 250
    m = (n%rgb) /rgb#divide 250
    if 0< n <= 250
        c = RGB(1,m,0)
    elseif 250<n<=500
        c = RGB(1-m,1,0)
    elseif 500<n<=750
        c = RGB(0,1,m)
    elseif 750<n<=999
        c = RGB(0,1-m,1)
    else
        c=RGB(0,0,0)
    end
    return c
    #TODO: append this c to an array of color values
end
#mrandom


function mandelbrot(reals,imags)
    #generate #real amount of points between -2 and 1
    #and #imag amount of points between 0 and i
    #determine if any of those combinations are in the mandelbrot set
    r = LinRange(-2,1,reals)
    i = LinRange(-1,1,imags)
    master_list = zeros(Complex{Float64},reals*imags,1)
    color_assign = Array{RGB{Float64}}(undef,reals*imags,1)
    #n = Threads.Atomic{Int64}(1)
    n = 1
        Threads.@threads for real_num in r
            for imaginary_num in i
                #z = complex(real_num, imaginary_num) #create the number
                #master_list[n] = z                      #add it to the list
                #color_assign[n,1] = (brot ∘ mandel)(z) #function of function! \circ + tab

                #or would this be faster? since we dont change z all the time?
                master_list[n] = complex(real_num, imaginary_num)
                color_assign[n,1] = (brot ∘ mandel)(complex(real_num, imaginary_num))
                n+=1
                #Threads.atomic_add!(n,1)
            end
        end
        gr(markerstrokewidth=0,markerstrokealpha=0,markersize=.5,legend=false)
        scatter(master_list,markerstrokecolor=color_assign,color=color_assign,aspect_ratio=:equal)
    end

#end statement for the module
end