using DataFrames, Queryverse, DelimitedFiles, CSV, Plots

#add library function here

#function dictionary(cellno, )


function readCSV()
    #function should eventually take file as argument while calling


    f=open("impedance.jl/EIS1.txt")
   

    #splitting the text file into an array with cyc, f, Re(Z) and Im(Z)
    df=CSV.read(f, DataFrame; delim = '\t', type=Float64, header =1, select=[2,3,5,6])

    #df is [cycle number, frequency, Re(Z), Im(Z)]
    


    close(f)
    return df
    
end


function cellSelect(cyc1, cyc2)
    #read the entire CSV and split into select range, then return df subset
    df=readCSV()
    
   #df=df[(df[!,1] .> (cyc1)) .& (df[!,1] .< (cyc2)), :]
   df=df[(df[!,1] .== (cyc1)), :]

    #println(df)
    return df
end

#move plots to plotting.jl eventually
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


plotBode()



