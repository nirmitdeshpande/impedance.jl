#module preprocessing
    
#export readCSV, cellSelect


using DataFrames, Queryverse, DelimitedFiles, CSV, Plots

#add library function here

#function dictionary(cellno, )


function readCSV()
    #function should eventually take file as argument while calling


    f=open("/Users/nirmitdeshpande/.julia/dev/impedance/src/EIS1.txt")
   

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


#end
