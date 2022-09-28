package ium

import js "vendor:wasm/js"

@(export)
load_sound_success :: proc(id: i32) {
    js.evaluate("console.log('success');")
}

@(export)
load_sound_error :: proc(id: i32) {
    js.evaluate("console.log('error');")
}