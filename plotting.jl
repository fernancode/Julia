using Plots
# to install the package, in julia i had to run "julia> using Pkg", "julia>Pkg.add("Pkgnames")

x = LinRange(-pi, pi, 10)

#need the dot operator to get the sin of the entire array
y = sin.(x)*im

a = RGB{Float64}(0,1,0)
b = RGB{Float64}(1,0,0)
c = RGB{Float64}(0,0,1)
z = Array{RGB{Float64}}(undef,3,1)
z[1] = a
z[2] = b
z[3] = c

#scatter(y,markersize=5,markerstrokewidth=0,color= RGB(0,1,0))
scatter(y,markersize=5,markerstrokewidth=0,markerstrokecolor = Colors.RGBA(0, 0, 0, 0),color=z,aspect_ratio=:equal)