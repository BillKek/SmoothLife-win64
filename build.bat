
SET PATH=C:\msys64\clang64\bin;C:\msys64\usr\bin
pkg-config --cflags --static raylib > cflags111.txt
if errorlevel 1 goto errors
pkg-config --libs --static raylib > libs111.txt
if errorlevel 1 goto errors
clang -O3 -Wall -Wextra -o smoothlife_term smoothlife_term.c -lm
if errorlevel 1 goto errors
clang -O3 -Wall -Wextra @cflags111.txt -o smoothlife_gpu smoothlife_gpu.c -lm @libs111.txt -ldl -lglfw3 -lpthread
if errorlevel 1 goto errors

goto exit0

:errors

echo installing addidtional msys2 packages
pacman -S mingw-w64-clang-x86_64-dlfcn mingw-w64-clang-x86_64-glfw mingw-w64-clang-x86_64-pkg-config mingw-w64-clang-x86_64-raylib mingw-w64-clang-x86_64-clang-tools-extra


:exit0

