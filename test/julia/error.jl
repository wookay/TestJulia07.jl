module test_julia_error

using Test

@test (try
          error()
      catch e
          e
      end) isa ErrorException
@test_throws ErrorException error()


struct AError <: Exception
end

struct BError <: Exception
end

@test_throws Union{AError, BError} throw(rand([AError, BError])())

end # module test_julia_error
