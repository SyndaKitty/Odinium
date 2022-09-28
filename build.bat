@echo off
odin build game -target:js_wasm32 -o:size -vet
robocopy game public *.wasm /NJH /NJS /NDL