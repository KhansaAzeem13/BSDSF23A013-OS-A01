---

## Feature-5: Creating and Accessing Man Pages

### What I did
- Created `man/man1/client.1` for the client program and `man/man3/mystrlen.3`, `man/man3/wordCount.3` for library functions.
- Used groff formatting with sections: `.TH`, `.SH NAME`, `.SH SYNOPSIS`, `.SH DESCRIPTION`, `.SH AUTHOR`.
- Updated the Makefile with `install` and `uninstall` targets to copy the binary to `/usr/local/bin` and man pages to `/usr/local/share/man/`.
- Verified installation with:
  - `client` runs globally
  - `man client` shows program documentation
  - `man 3 mystrlen` and `man 3 wordCount` show library function documentation
- Tagged and released `v0.4.1-final` with assets uploaded on GitHub.

### Q1: What are the important sections of a man page and why are they required?
**Answer:**  
The sections are standardized:
- `.TH` — Title, section number, date, version.  
- `.SH NAME` — Program/function name and short description.  
- `.SH SYNOPSIS` — Usage or function prototype.  
- `.SH DESCRIPTION` — Detailed explanation.  
- `.SH AUTHOR` — Author information.  
They ensure consistency and readability across Linux documentation.

### Q2: What does the Makefile install target do and why compress man pages?
**Answer:**  
The `install` target copies the compiled binary to `/usr/local/bin` and documentation to `/usr/local/share/man/`. Man pages are compressed to save space (`.gz` format) and because the `man` program can read them directly.

### Q3: How can a user view man page for a program vs a library function?
**Answer:**  
- Program man page (section 1): `man client`  
- Library man page (section 3): `man 3 mystrlen` or `man 3 wordCount`
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
