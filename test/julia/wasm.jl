using Test

s = """
0000000: 0061 736d                                 ; WASM_BINARY_MAGIC
0000004: 0100 0000                                 ; WASM_BINARY_VERSION
; section "Type" (1)
0000008: 01                                        ; section code
0000009: 00                                        ; section size (guess)
000000a: 01                                        ; num types
; type 0
000000b: 60                                        ; func
000000c: 02                                        ; num params
000000d: 7e                                        ; i64
000000e: 7e                                        ; i64
000000f: 01                                        ; num results
0000010: 7e                                        ; i64
0000009: 07                                        ; FIXUP section size
; section "Function" (3)
0000011: 03                                        ; section code
0000012: 00                                        ; section size (guess)
0000013: 01                                        ; num functions
0000014: 00                                        ; function 0 signature index
0000012: 02                                        ; FIXUP section size
; section "Code" (10)
0000015: 0a                                        ; section code
0000016: 00                                        ; section size (guess)
0000017: 01                                        ; num functions
; function body 0
0000018: 00                                        ; func body size (guess)
0000019: 00                                        ; local decl count
000001a: 20                                        ; get_local
000001b: 00                                        ; local index
000001c: 20                                        ; get_local
000001d: 01                                        ; local index
000001e: 7c                                        ; i64.add
000001f: 0f                                        ; return
0000020: 0b                                        ; end
0000018: 08                                        ; FIXUP func body size
0000016: 0a                                        ; FIXUP section size
"""

function wasm_bytes(s)
    bytes = UInt8[]
    pat = r"[0-9a-f]{2}"
    for line in split(s, '\n')
        isempty(line) && continue
        line[1] == ';' && continue
        hex = line[9:51]
        bs = parse.(UInt8, base=16, [m.match for m in eachmatch(pat, hex)])
        push!(bytes, bs...)
    end
    bytes
end

@test wasm_bytes(s)[1:4] == UInt8[0x00, 0x61, 0x73, 0x6d]
