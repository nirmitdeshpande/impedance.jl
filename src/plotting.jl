#module plotting
#(for future dev)

#export plotBode, plotNyquist



using DataFrames, Queryverse, DelimitedFiles, CSV, Plots
include("/Users/nirmitdeshpande/.julia/dev/impedance/src/preprocessing.jl")



function plotNyquist()
    cyc1=100.0
    cyc2=103.0

    df = cellSelect(cyc1, cyc2)
   #since plottingbasic() will be in an independant file, add parameters here
   

    #add plot variation and 
    plot(df[!,4], df[!,3], title= "Nyquist Plot", xlabel = "Re(Z)",ylabel="Im(Z)", label="/")
    #savefig("testerplot.png")

    #use DF plotting instead of basic array
end

function plotBode()
    cyc1=100.0
    cyc2=103.0

    df= cellSelect(cyc1, cyc2)
    
    dff= DataFrame(a=Float64)
    dfa= DataFrame(a=Float64)
    dfb= DataFrame(b=Float64)

    dfa= angle.(df[!,3]+ (df[!,4])im)
    dff= log.(abs.(df[!,2]))
    
    plot(dfa, dff, title= "Bode Plot (phase)", xlabel = "log(f)",ylabel="phase", label="/")
    #savefig("testerplot.png")
    #dfb= log.(abs.(df[!,3]+ (df[!,4])im))

   #plot(dfb,dff, title= "Bode Plot (magnitude)", xlabel = "log(f)",ylabel="log(magnitude)", label="abc")
    #savefig("testerplot.png")
end

#end

