using Test

@test try
          error()
      catch e
          e
      end isa ErrorException
