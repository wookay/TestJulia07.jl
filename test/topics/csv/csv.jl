using Test

path = normpath(@__DIR__, "sample.csv")

using DelimitedFiles: readdlm
(data, hdr) = readdlm(path, header=true)
@test data == [1 23 456; -10 -99 0]
@test hdr == ["col1" "col2" "col3";]

using TableReader: readcsv
df1 = readcsv(path, delim='\t')

using CSV
using DataFrames: DataFrame
df2 = CSV.File(path, delim='\t') |> DataFrame

@test df1 == df2
