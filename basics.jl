print("hello world")    #double quotes for strings
println(" more hello")  #continue printing on that line but start a new one
x = 5                   #comments

                        #can do all kinds of updating operators
x += 5                  #add equal operation
x /= 2                  #divide equal operation
x %= 2                  #remainder operation with update operator
println("remainder of 5 divided by 2 is ", x)

α = "alpha"             #alpha character can be used as a variable
η = "eta"               # as well as other characters by doing \eta then tab

array = [1,2,3].^3      #dotwise operation as well as printing 
array .+= 1             #dot wise combined with update equal operator
println(array[1])       #print the first value from the array (arrays start at 1!)
println(array)