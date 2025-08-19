# Makefile for building and running a TinyGo WebAssembly project
TG_ROOT=$(shell tinygo env TINYGOROOT)

# Build and run all in one step
run: get_wasm_exec build host

# Build the WASM module
build:
	@tinygo build -o main.wasm -target wasm ./main.go
	@echo "WASM module built successfully."

# Get the wasm_exec.js file from tinygo installation
get_wasm_exec:
	@echo tinygo root: ${TG_ROOT}
	@- cp ${TG_ROOT}/targets/wasm_exec.js .
	@echo "wasm_exec.js copied successfully."

# Run http server to serve the page
host:
	@http-server ./ -p 8080