package game

// import "vendor:wasm"
// import js "vendor:wasm/js"
import gl "vendor:wasm/WebGL"
import "../odinium"

import "core:mem"

HeapMemory := [4 * 1024]u8 {}
HeapArena: mem.Arena
HeapAllocator: mem.Allocator

TempMemory := [4 * 1024]u8 {}
TempArena: mem.Arena
TempAllocator: mem.Allocator

spell1: i32

main :: proc() {
    mem.arena_init(&HeapArena, HeapMemory[:])
    HeapAllocator = mem.arena_allocator(&HeapArena)
    context.allocator = HeapAllocator

    mem.arena_init(&TempArena, TempMemory[:])
    TempAllocator = mem.arena_allocator(&TempArena)
    context.temp_allocator = TempAllocator

    spell1 = odinium.load_sound("http://localhost:8080/Spell1.wav")
    gl.CreateCurrentContextById("game-canvas", {})
}

@(export)
step :: proc(dt: f64) {
    if gl.SetCurrentContextById("game-canvas") {
        width, height := gl.DrawingBufferWidth(), gl.DrawingBufferHeight()
        gl.Viewport(0, 0, width, height)
        gl.ClearColor(0.5, 0.5, 0.5, 1.0)
        gl.Clear(gl.COLOR_BUFFER_BIT)
    }
}

@(export)
load_sound_success :: proc(id: i32) {
    
}

@(export)
load_sound_error :: proc(id: i32) {
    
}