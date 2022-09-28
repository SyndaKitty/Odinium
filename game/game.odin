package game

// import "vendor:wasm"
// import js "vendor:wasm/js"
// import js "../dummy"
// import gl "vendor:wasm/WebGL"
import "../ium"

import "core:mem"

HeapMemory := [4 * 1024]u8 {}
HeapArena: mem.Arena
HeapAllocator: mem.Allocator

TempMemory := [4 * 1024]u8 {}
TempArena: mem.Arena
TempAllocator: mem.Allocator

main :: proc() {
    mem.arena_init(&HeapArena, HeapMemory[:])
    HeapAllocator = mem.arena_allocator(&HeapArena)
    context.allocator = HeapAllocator

    mem.arena_init(&TempArena, TempMemory[:])
    TempAllocator = mem.arena_allocator(&TempArena)
    context.temp_allocator = TempAllocator

    ium.load_sound("http://localhost:8080/Spell1.wav")
}

@(export)
step :: proc(dt: f64) {
    
}