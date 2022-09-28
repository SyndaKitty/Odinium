//+build js wasm32, js wasm64
package ium

foreign import "odinium"

@(default_calling_convention="contextless")
foreign odinium {
    load_sound :: proc(url: string) -> i32 ---
}