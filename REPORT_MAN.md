# Report: Feature-5 (Man Pages and Install Target)

## What I did
- Created directory `man/man1` for program man pages and `man/man3` for library man pages.
- Wrote `client.1` man page for the client program, and `mystrlen.3` / `wordCount.3` man pages for library functions.
- Used groff formatting with required sections: `.TH`, `.SH NAME`, `.SH SYNOPSIS`, `.SH DESCRIPTION`, `.SH AUTHOR`.
- Verified formatting with `man -l man/man1/client.1` and similar commands.
- Updated the Makefile with `install` and `uninstall` targets to copy binaries and man pages into `/usr/local/`.
- Successfully tested:
  - `client` runs globally
  - `man client` shows program documentation
  - `man 3 mystrlen` and `man 3 wordCount` show library documentation
- Tagged the final release as `v0.4.1-final` and published it on GitHub with assets.

---

## Q1: What are the important sections of a man page and why are they required?
**Answer:**  
The important sections are:
- `.TH` — Title header (name, section, date, version).  
- `.SH NAME` — Program/function name with one-line description.  
- `.SH SYNOPSIS` — Usage or function prototype.  
- `.SH DESCRIPTION` — Detailed explanation.  
- `.SH AUTHOR` — Author name and contact.  
These sections give a standard structure so users can easily understand commands and functions.

---

## Q2: What does the Makefile install target do and why compress man pages?
**Answer:**  
The `install` target copies the executable to `/usr/local/bin` and the man pages to `/usr/local/share/man/`.  
The man pages are compressed (`.gz`) to save space and because the `man` program can directly read compressed files.

---

## Q3: How can a user view man page for a program vs a library function?
**Answer:**  
- Program man page (section 1): `man client`  
- Library function man page (section 3): `man 3 mystrlen` or `man 3 wordCount`
