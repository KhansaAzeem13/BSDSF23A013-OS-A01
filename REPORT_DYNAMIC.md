# Dynamic Library Build Report

## 1. What is Position-Independent Code (-fPIC) and why is it required?

Position-Independent Code (-fPIC) allows the code in a shared library to be loaded at any memory address at runtime.  
This is required for dynamic libraries because multiple programs may load the library at different addresses in memory.

## 2. Difference in file size between static and dynamic clients

- client_static: larger because all library code is copied into the executable.  
- client_dynamic: smaller because it only contains references to the shared library; the OS loads the library at runtime.

## 3. What is LD_LIBRARY_PATH and why is it necessary?

LD_LIBRARY_PATH is an environment variable that tells the dynamic linker where to look for shared libraries.  
It was necessary to run client_dynamic because the OS could not find libmyutils.so in the default system library paths.
