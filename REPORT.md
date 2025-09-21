## Feature-3: Static Library Build

### What I did
- Merged branch `multifile-build` into `main` and created branch `static-build`.
- Implemented a static library `lib/libmyutils.a` containing `mystrfunctions.o` and `myfilefunctions.o` using the `ar` utility.
- Modified the Makefile to archive object files into the static library and link `bin/client_static` against it.
- Verified functionality by running `./bin/client_static` with correct outputs.
- Analyzed the library using `ar -t` and `nm` to confirm symbols.
- Created annotated tag `v0.2.1-static` and GitHub release with `client_static` and `libmyutils.a` attached.

---

### Q1: Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?

**Answer:**  
In Part 2 (multi-file build), the Makefile directly compiled and linked all `.o` files into a single executable (`client`).  
In Part 3, new variables and rules were introduced:  
- `LIB = lib/libmyutils.a` to represent the static library.  
- A rule using `ar rcs` to archive multiple `.o` files into `libmyutils.a`.  
- The executable rule (`bin/client_static`) links only `main.o` against the static library (`-Llib -lmyutils`), instead of all `.o` files directly.  
This change modularizes the build process and makes the utility functions reusable.

---

### Q2: What is the purpose of the `ar` command? Why is `ranlib` often used immediately after it?

**Answer:**  
The `ar` command creates and maintains archives, which are used for static libraries in C (`.a` files). It bundles multiple `.o` files into a single archive.  
`ranlib` generates an index of the archive’s contents, which helps the linker quickly locate symbols inside the library.  
On many systems, `ar rcs` already updates the symbol index, so a separate `ranlib` step is not always required, but historically it was needed.

---

### Q3: When you run `nm` on your `client_static` executable, are the symbols for functions like `mystrlen` present? What does this tell you about how static linking works?

**Answer:**  
Yes, the symbols of utility functions (e.g., `mystrlen`, `mystrcpy`, `wordCount`) appear directly inside the `client_static` binary.  
This shows that static linking copies the required object code from the library into the executable itself. As a result, the executable is larger in size but self-contained and does not depend on external libraries at runtime.
