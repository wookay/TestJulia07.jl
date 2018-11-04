using Test
using WAV

wavfile = normpath(@__DIR__, "ae.wav")
samples, samplerate1, nbits1, opt1 = wavread(wavfile)
@test (samplerate1, nbits1) == (16000.0f0, 0x0010)

buf = IOBuffer()
Fs = 16000
nbits = 16
wavwrite(samples, buf, Fs=Fs, nbits=nbits, compression=WAVE_FORMAT_PCM)
audio = reinterpret(Int16, buf.data)
close(buf)

@test [5279, 10602, 5301] == length.([samples, buf.data, audio])
