module test_julia_error

using Test

@test (try
          error()
      catch e
          e
      end) isa ErrorException
@test_throws ErrorException error()

end # module test_julia_error
