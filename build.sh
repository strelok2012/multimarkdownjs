#!/bin/bash
git submodule update --init --recursive
args=("$@")
rm -rf dist
mkdir dist
cd MultiMarkdown-6
rm -rf build
emmake make shared
cd build
emmake make
if [[ ${args[0]} = "wasm" ]] 
then
emcc -Oz libMultiMarkdown.a -o libMultiMarkdown.js -s EXPORTED_FUNCTIONS="['_mmd_string_convert']" -s EXPORTED_RUNTIME_METHODS="['_mmd_string_convert','cwrap','UTF8ArrayToString','UTF8ToString','stringToUTF8Array','stringToUTF8','lengthBytesUTF8']" -s ASSERTIONS=1 -s OUTLINING_LIMIT=10000 --memory-init-file 0 -s NO_FILESYSTEM=1 --llvm-lto 3 -s WASM=1 -s NO_EXIT_RUNTIME=1
mv libMultiMarkdown.wasm ../../dist/multimarkdown.wasm
cat libMultiMarkdown.js ../../src/multimarkdown.js > ../../dist/multimarkdown.wasm.js
elif [[ ${args[0]} = "asm" ]]
then
emcc -Oz libMultiMarkdown.a -o libMultiMarkdown.js -s EXPORTED_FUNCTIONS="['_mmd_string_convert']" -s EXPORTED_RUNTIME_METHODS="['_mmd_string_convert','cwrap','UTF8ArrayToString','UTF8ToString','stringToUTF8Array','stringToUTF8','lengthBytesUTF8']" -s ASSERTIONS=1 -s OUTLINING_LIMIT=10000 --memory-init-file 0 -s NO_FILESYSTEM=1 --llvm-lto 3
cat libMultiMarkdown.js ../../src/multimarkdown.js > ../../dist/multimarkdown.asm.js
else
emcc -Oz libMultiMarkdown.a -o libMultiMarkdown.js -s EXPORTED_FUNCTIONS="['_mmd_string_convert']" -s EXPORTED_RUNTIME_METHODS="['_mmd_string_convert','cwrap','UTF8ArrayToString','UTF8ToString','stringToUTF8Array','stringToUTF8','lengthBytesUTF8']" -s ASSERTIONS=1 -s OUTLINING_LIMIT=10000 --memory-init-file 0 -s NO_FILESYSTEM=1 --llvm-lto 3 -s WASM=1 -s NO_EXIT_RUNTIME=1
mv libMultiMarkdown.wasm ../../dist/multimarkdown.wasm
cat libMultiMarkdown.js ../../src/multimarkdown.js > ../../dist/multimarkdown.wasm.js
emcc -Oz libMultiMarkdown.a -o libMultiMarkdown.js -s EXPORTED_FUNCTIONS="['_mmd_string_convert']" -s EXPORTED_RUNTIME_METHODS="['_mmd_string_convert','cwrap','UTF8ArrayToString','UTF8ToString','stringToUTF8Array','stringToUTF8','lengthBytesUTF8']" -s ASSERTIONS=1 -s OUTLINING_LIMIT=10000 --memory-init-file 0 -s NO_FILESYSTEM=1 --llvm-lto 3
cat libMultiMarkdown.js ../../src/multimarkdown.js > ../../dist/multimarkdown.asm.js
fi
cd ..
rm -rf build

