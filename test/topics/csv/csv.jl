module test_topics_csv

using Test
path = normpath(@__DIR__, "sample.csv")

using DelimitedFiles: readdlm
(data, hdr) = readdlm(path, header=true)
@test data == [1 23 456; -10 -99 0]
@test hdr == ["col1" "col2" "col3";]

using CSV
using DataFrames: DataFrame
df2 = CSV.File(path, delim='\t') |> DataFrame
@test df2[!, :col1] == [1, -10]

end # module test_topics_csv


using Jive
@skip module test_topics_csv_tablereader

using ..test_topics_csv: df2, path
using Test
using TableReader: readcsv
df1 = readcsv(path, delim='\t')
@test df1 == df2

end # module test_topics_csv_tablereader
