module MandelBrot
using Plots, GR
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

function mandelbrot(reals,imags,r_min=-2,r_max=1,i_min=-1,i_max=1)
    #generate #real amount of points between -2 and 1
    #and #imag amount of points between -i and i
    #determine if any of those combinations are in the mandelbrot set and color map it accordingly
    r = LinRange(r_min,r_max,reals)
    i = LinRange(i_min,i_max,imags)
    master_list = zeros(Complex{Float64},reals*imags,1)
    color_assign = Array{RGB{Float64}}(undef,reals*imags,1)
    #initiate threading for total number of real numbers stated
    Threads.@threads for a in 1:reals
        #the real number we are using is indexed
        real_num = r[a]
            #enumeration is used so we can get the iterator and the value
            for (b, imaginary_num) in enumerate(i)
                #we create a unique index [n] for every permutation of the numbers that exists
                n = (a-1)*imags + b
                master_list[n] = complex(real_num, imaginary_num)
                color_assign[n,1] = (brot ∘ mandel)(complex(real_num, imaginary_num))
                n+=1
            end
        end
        gr(markerstrokewidth=0,markerstrokealpha=0,markersize=.05,legend=false)
        Plots.scatter(master_list,markerstrokecolor=color_assign,color=color_assign,aspect_ratio=:equal)
    end

#end statement for the module
end