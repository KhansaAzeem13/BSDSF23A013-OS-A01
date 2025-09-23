# 📄 REPORT.md  

## Feature 2: Multi-file Project
**Q1. Explain the linking rule in this part's Makefile: `$(TARGET): $(OBJECTS)`. How does it differ from a Makefile rule that links against a library?**  
- `$(TARGET): $(OBJECTS)` means the final executable (`TARGET`) is built by linking together all object files (`OBJECTS`).  
- Here, all `.o` files are directly combined into the executable.  
- If we link against a library, we use flags like `-L` (path) and `-l` (library name). In that case, instead of including all `.o` files, we link the executable to a **precompiled library file** (`.a` or `.so`).  

**Q2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?**  
- A **git tag** is a label that marks a specific commit, usually for a release version.  
- Useful because it freezes the code at a known stable state.  
- **Simple tag:** Just points to a commit, lightweight.  
- **Annotated tag:** Contains extra info (tagger’s name, date, message, GPG signature). It is preferred for releases.  

**Q3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?**  
- A **Release** provides a packaged, stable version of the project.  
- Attaching binaries means users can directly download and run the program without compiling it themselves.  

---

## Feature 3: Static Library
**Q1. Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?**  
- In Part 2, object files are directly linked into the final executable.  
- In Part 3, object files are first archived into a static library (`libmyutils.a`) using `ar`. Then the executable is linked against this `.a` file.  

**Q2. What is the purpose of the `ar` command? Why is `ranlib` often used immediately after it?**  
- `ar` (archiver) bundles multiple `.o` files into a static library (`.a`).  
- `ranlib` generates an index inside the library, so the linker can quickly find symbols.  

**Q3. When you run `nm` on your `client_static` executable, are the symbols for functions like `mystrlen` present? What does this tell you about how static linking works?**  
- Yes, the symbols are present inside the executable.  
- This shows that **static linking copies the function code from the library into the final executable**, making the binary self-contained.  

---

## Feature 4: Dynamic Library
**Q1. What is Position-Independent Code (`-fPIC`) and why is it a fundamental requirement for creating shared libraries?**  
- **PIC** means the code can run at any memory address.  
- Required for shared libraries because the OS may load the `.so` file at different addresses in different programs.  

**Q2. Explain the difference in file size between your static and dynamic clients. Why does this difference exist?**  
- The **static client** is larger because all library code is copied into the executable.  
- The **dynamic client** is smaller because it only stores references to the shared library, which is loaded at runtime.  

**Q3. What is the `LD_LIBRARY_PATH` environment variable? Why was it necessary to set it for your program to run, and what does this tell you about the responsibilities of the OS’s dynamic loader?**  
- `LD_LIBRARY_PATH` tells the OS where to search for shared libraries at runtime.  
- It was needed because the loader didn’t know where to find `libmyutils.so`.  
- This shows that the **dynamic loader is responsible for locating and loading shared libraries into memory** before program execution.  

---

## Feature 5: Man Pages & Installation
**Q1. What is the standard structure of a man page?**  
- A man page usually contains these sections:  
  - `.TH` → Title/Header  
  - `.SH NAME` → Function/Program name + one-line description  
  - `.SH SYNOPSIS` → How to call it (syntax)  
  - `.SH DESCRIPTION` → Detailed explanation  
  - `.SH AUTHOR` → Author information  

**Q2. What is the role of the `install` target in the Makefile?**  
- The `install` target copies the executable into a standard system directory (e.g., `/usr/local/bin`) and installs the man page into `/usr/local/man/`.  
- This allows the program to run from anywhere (`client`) and documentation to be accessed with `man mycat`.  
