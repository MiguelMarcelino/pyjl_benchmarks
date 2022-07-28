abstract type AbstractMandelbrotComplex end
mutable struct MandelbrotComplex <: AbstractMandelbrotComplex
    z::Complex
    MandelbrotComplex(z::Complex = 0 + 0im) = new(z)
end

function mandelbrot(limit, c)::Int64
    mc = MandelbrotComplex()
    i = 0
    for _i = 0:limit
        i = _i
        if abs(mc.z) > 2
            return i
        end
    end
    mc.z = mc.z * mc.z + c
    return i + 1
end

if abspath(PROGRAM_FILE) == @__FILE__
    println(mandelbrot(1000000, 0.2 + 0.3im))
end
