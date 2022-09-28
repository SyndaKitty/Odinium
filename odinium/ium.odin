package ium

// import js "../dummy"
import js "vendor:wasm/js"
// import "core:fmt"

@(export)
load_sound_success :: proc(id: i32) {
    js.evaluate("console.log('success');")
}

@(export)
load_sound_error :: proc(id: i32) {
    js.evaluate("console.log('error');")
}