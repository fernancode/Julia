using Plots
# to install the package, in julia i had to run "julia> using Pkg", "julia>Pkg.add("Pkgnames")

x = LinRange(-pi, pi, 100)

#need the dot operator to get the sin of the entire array
y = sin.(x)

#print the imaginary component of n
n = 0 +2im
println(imag(n))

#plot x versus y
plot(x,y)