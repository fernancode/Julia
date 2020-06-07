module MandelBrot

#make some functions for mandelbrot stuff
#find out if a number is part of the set
#remember the mandelbrot is symmetrical about the real number plane

function mandel(c)
    const max_iter = 1000
    const bound = 2
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
    const rgb = 250
    m = (n%rgb) /rgb#divide 250
    if 0< n <= 250
        c = (1,m,0)
    elseif 250<n<=500
        c = (1-m,1,0)
    elseif 500<n<=750
        c = (0,1,m)
    elseif 750<n<=999
        c = (0,1-m,1)
    else
        c=(0,0,0)
    end
end
#mrandom
