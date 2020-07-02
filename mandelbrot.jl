module Mandelbrot
using Plots, GR

function iter_count(c::Complex, max_iter=1000)
    bound = 4
    z = zero(c)
    n = 0
    #if the magnitude of z exceeds two we know we are done.
    while abs2(z)<bound && n<max_iter
        z = z^2 + c
        n += 1
    end
    if n == 1000
        n = 0
    end
    return n
end

function mandelbrot(reals,imags, r_min = -2, r_max = 1, i_min = -1, i_max = 1)
    r = LinRange(r_min, r_max, reals)
    i = LinRange(i_min, i_max, imags)
    master_list = zeros(Complex{Float64}, reals*imags, 1)
    #color_assign = Array{RGB{Float64}}(undef, reals*imags, 1)
    color_assign = zeros(Float64, reals*imags, 1)
    #initiate threading for total number of real numbers stated
    Threads.@threads for a in 1:reals
        #the real number we are using is indexed
        real_num = r[a]
            #enumeration is used so we can get the iterator and the value
            for (b, imaginary_num) in enumerate(i)
                #we create a unique index [n] for every permutation of the numbers that exists
                n = (a-1)*imags + b
                master_list[n] = complex(real_num, imaginary_num)
                color_assign[n,1] = iter_count(complex(real_num, imaginary_num))
            end
        end
        return master_list, color_assign
    end

function mandelplot(master_list, n)
    gr(seriesalpha = .8, markerstrokewidth = 0, markerstrokealpha = 0, markersize = .01, legend = false, background_color = RGB(0,0,0))
    Plots.scatter(real.(master_list),imag.(master_list), zcolor = n, m = :thermal,  aspect_ratio = :equal)
end

function make_image(master_list,n)
end

function add2mandelplot(master_list, n)
    Plots.scatter!(real.(master_list), imag.(master_list), zcolor = n, m = :thermal, aspect_ratio = :equal)
end

end     #end statement for the module